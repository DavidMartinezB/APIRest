import { BadRequestException, ConflictException, Injectable, InternalServerErrorException, NotFoundException } from '@nestjs/common';
import { User, UserDocument } from './schemas/user.schema';
import { Model } from 'mongoose';
import { CreateUserDto } from './dto/CreateUserDto'; 
import { InjectModel } from '@nestjs/mongoose';
import * as bcrypt from 'bcrypt';
import { AuthService } from '../auth/auth.service';
import { MailService } from 'src/mail/mail.service';

@Injectable()
export class UsersService {

    constructor(
        private authService: AuthService,
        private mailService: MailService,
        @InjectModel(User.name) private userModel: Model<UserDocument>
    ) {}

    async create(createUserDto: CreateUserDto): Promise<User> {
        const { email, password } = createUserDto;
        try {
            const encrypted = await this.encryptPassword(password);
            const userValidate = await this.userModel.findOne({email});
            if (userValidate) {
                throw new ConflictException(`User with email: ${email} already exists`);
            }
            const token = await this.authService.token();
            this.mailService.sendConfirmationEmail(email, token);
            const createdUser = new this.userModel({
                ...createUserDto,
                password: encrypted,
                token: token
            });
            
            return createdUser.save();
        } catch (error) {
            console.error(error);
            throw new InternalServerErrorException('An error occurred while creating the user');
        }
    }

    async register(createUserDto: CreateUserDto): Promise<any> {
        const user = await this.create(createUserDto);
        if (user) {
            return this.login(createUserDto.email, createUserDto.password);
        }
        throw new InternalServerErrorException('An error occurred while registering the user');
    }

    async generateConfirmationToken() {
        const token = Math.random().toString(36).substring(4, 10) 
        return token;
    }

    async createDefaultAdminUser() {
        const adminEmail = 'admin@mail.com';
        const adminPassword = '12345'; // Considera usar una contraseña más segura y almacenarla de manera segura
        const adminUser = await this.userModel.findOne({ email: adminEmail });
    
        if (!adminUser) {
            const createUserDto = {
                email: adminEmail,
                password: adminPassword,
                firstName: 'Admin',
                lastName: 'Admin',
                username: 'admin',
                // Añade aquí cualquier otro campo necesario para el DTO
            };
            try {
                const encryptedPassword = await this.encryptPassword(createUserDto.password);
                const token = 'tokenforadmin'; // Define un token estático o genera uno
                const createdUser = new this.userModel({
                    ...createUserDto,
                    password: encryptedPassword,
                    token: token,
                    // Añade aquí cualquier otro campo necesario para el usuario
                });
                await createdUser.save();
                console.log('Admin user created successfully');
            } catch (error) {
                console.error('Error creating admin user:', error);
            }
        } else {
            console.log('Admin user already exists');
        }
    }


    async login(email: string, password: string): Promise<any> {
        try {
            const user = await this.userModel.findOne({ email });
            if (!user) {
                throw new BadRequestException('Invalid email or password');
            }

            const passwordMatch = await this.comparePasswords(password, user.password);
            if (!passwordMatch) {
                throw new BadRequestException('Invalid email or password');
            }

            return this.authService.generateToken(user);
        } catch (error) {
            console.error(error);
            throw new InternalServerErrorException('An error occurred while logging in');
        }
    }

    async findOne(email: string) {
        const query = await this.userModel.findOne({email}).exec();
        if (!query) {
            throw new NotFoundException(`User with email: ${email} not found`);
        }
        return query;
    }

    async validate(token: string) {
        try {
            const payload = await this.authService.validateUser(token);
            const user = await this.findOne(payload.username);
            return user; 
        } catch (error) {
            console.error(error);
        }
    }

    async validateDbToken(token: string) {
        try {
            const user = await this.userModel.findOne({token}).exec();
            return user;
        } catch (error) {
            console.error(error);
        }
    }

    async findAll() {
        return this.userModel.find().exec();
    }

    private async encryptPassword(password: string): Promise<string> {
        return bcrypt.hash(password, 10);
    }

    private async comparePasswords(password: string, hashedPassword: string): Promise<boolean> {
        return bcrypt.compare(password, hashedPassword);
    }
}