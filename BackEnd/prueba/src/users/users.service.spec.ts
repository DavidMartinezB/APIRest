import { Test, TestingModule } from "@nestjs/testing";
import { UsersService } from "./users.service";
import { AuthService } from "../auth/auth.service";
import { NotFoundException } from "@nestjs/common";

describe('UsersService', () => {
  let service: UsersService;
  let mockUserModel;
  let mockAuthService;

  beforeAll(async () => {
    mockUserModel = {
      find: jest.fn().mockImplementation(() => ({
        exec: jest.fn().mockResolvedValueOnce([{ _id: '1', email: 'test@test.com', password: 'password' }]),
      })),
      findOne: jest.fn().mockImplementation(() => ({
        exec: jest.fn().mockResolvedValueOnce({ _id: '1', email: 'test@test.com', password: 'password' }),
      })),
    };

    mockAuthService = {
      validateUser: jest.fn().mockResolvedValueOnce({ _id: '1', email: 'test@test.com', password: 'password' }),
    };

    const module: TestingModule = await Test.createTestingModule({
      providers: [
        UsersService,
        { provide: 'UserModel', useValue: mockUserModel },
        { provide: AuthService, useValue: mockAuthService },
      ],
    }).compile();

    service = module.get<UsersService>(UsersService);
  });

  it('should return an empty array when no users are found', async () => {
    mockUserModel.find.mockImplementation(() => ({
      exec: jest.fn().mockResolvedValueOnce([]),
    }));
  
    const result = await service.findAll();
    expect(result).toEqual([]);
    expect(mockUserModel.find).toHaveBeenCalled();
  });
  
  it('should throw an error when finding users fails', async () => {
    mockUserModel.find.mockImplementation(() => ({
      exec: jest.fn().mockRejectedValueOnce(new Error('Database error')),
    }));
  
    await expect(service.findAll()).rejects.toThrow('Database error');
    expect(mockUserModel.find).toHaveBeenCalled();
  });
  
  it('should throw an error when finding a user fails', async () => {
    mockUserModel.findOne.mockImplementation(() => ({
      exec: jest.fn().mockRejectedValueOnce(new Error('Database error')),
    }));
  
    await expect(service.findOne('invalid')).rejects.toThrow('Database error');
    expect(mockUserModel.findOne).toHaveBeenCalledWith({ email: 'invalid' });
  });
  
  it('should throw NotFoundException when no user is found', async () => {
    mockUserModel.findOne.mockImplementation(() => ({
      exec: jest.fn().mockResolvedValueOnce(null),
    }));
  
    await expect(service.findOne('nonexistent')).rejects.toThrow(new NotFoundException(`User with email: nonexistent not found`));
    expect(mockUserModel.findOne).toHaveBeenCalledWith({ email: 'nonexistent' });
  });
});