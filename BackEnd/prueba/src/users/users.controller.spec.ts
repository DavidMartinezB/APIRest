import { Test, TestingModule } from '@nestjs/testing';
import { UsersController } from './users.controller';
import { UsersService } from './users.service';
import { CreateUserDto } from './dto/CreateUserDto';
import { User } from './schemas/user.schema';
import { Document, ObjectId } from 'mongoose';

describe('UsersController', () => {
  let controller: UsersController;
  let service: UsersService;

  beforeEach(async () => {
    const mockUsersService = {
      findAll: jest.fn().mockResolvedValue([]),
      findOne: jest.fn().mockResolvedValue({}),
      create: jest.fn().mockResolvedValue({}),
      login: jest.fn().mockResolvedValue({}),
    };

    const module: TestingModule = await Test.createTestingModule({
      controllers: [UsersController],
      providers: [
        { provide: UsersService, useValue: mockUsersService },
      ],
    }).compile();

    controller = module.get<UsersController>(UsersController);
    service = module.get<UsersService>(UsersService);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });

  it('should return all users', async () => {
    const result = [];
    jest.spyOn(service, 'findAll').mockResolvedValue(result);
    expect(await controller.findAll()).toBe(result);
  });
  
  it('should return a user by email', async () => {
    const result:User = {
      username: '',
      password: '',
      firstName: '',
      lastName: '',
      email: ''
    };
    jest.spyOn(service, 'findOne').mockResolvedValue(result as unknown as Promise<User & Document<any, any, any> & { _id: ObjectId; }>);
    expect(await controller.findOne('test@test.com')).toBe(result);
  });
  
  it('should create a user', async () => {
    const result = {};
    const createUserDto: CreateUserDto = {
      username: 'Test',
      firstName: 'Test',
      lastName: 'User',
      email: 'test@test.com',
      password: 'test',
    };
    jest.spyOn(service, 'create').mockResolvedValue(result as User);
    expect(await controller.create(createUserDto)).toBe(result);
  });
  
  it('should login a user', async () => {
    const result = {};
    const loginUserDto = {
      email: 'test@test.com',
      password: 'test',
    };
    jest.spyOn(service, 'login').mockResolvedValue(result);
    expect(await controller.login(loginUserDto)).toBe(result);
  });
});