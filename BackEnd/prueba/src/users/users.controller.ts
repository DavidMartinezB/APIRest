// Importamos las dependencias necesarias
import { Body, Controller, Get,  NotFoundException,  Post, } from '@nestjs/common';
import { UsersService } from './users.service';
import { CreateUserDto } from './dto/CreateUserDto';
import { LoginDto } from './dto/loginDto';

// Definimos el controlador para la ruta 'users'
@Controller('users')
export class UsersController {
    // Inyectamos el servicio UsersService en el controlador
    constructor(private readonly usersService: UsersService) {}
  
    // Definimos la ruta POST para crear un nuevo usuario
    @Post()
    async create(@Body() createUserDto: CreateUserDto) {
      return await this.usersService.create(createUserDto);
    }

    // Definimos la ruta POST para el login de un usuario
    @Post('login')
    async login(@Body() loginDto: LoginDto) {
      // Extraemos el email y la contraseña del DTO recibido
      const { email, password } = loginDto;
      // Llamamos al método login del servicio con el email y la contraseña
      return this.usersService.login(email, password);
    }
    
    @Post('validate')
    async validate(@Body() body: {token: string}) {
      try {
        const {token} = body;
        const user = await this.usersService.validate(token);
        if (user) {
          return {valid: true, user}
        } else {
          throw new NotFoundException('Invalid token');
        }
      } catch (error) {
        return {valid: false}
      }
    }

    @Post('token')
    async token(@Body() body: {token: string}) {
      try {
        const {token} = body;
        const user = await this.usersService.validate(token);
        if (user) {
          return { user}
        } else {
          throw new NotFoundException('Invalid token');
        }
      } catch (error) {
        return {valid: false}
      }
    }


    // Definimos la ruta GET para obtener todos los usuarios
    @Get()
    findAll() {
      // Llamamos al método findAll del servicio
      return this.usersService.findAll();
    }
    
    // Definimos la ruta GET para obtener un usuario por su nombre de usuario
    // @Get(':username')
    // async findOne(@Param('username') username: string) {
    //   // Llamamos al método findOne del servicio con el nombre de usuario
    //   return this.usersService.findOne(username);
    // }
  }