import { Test, TestingModule } from '@nestjs/testing';
import { AuthService } from './auth.service';
import { JwtService } from '@nestjs/jwt';

describe('AuthService', () => {
  let service: AuthService;
  let jwtService: JwtService;

  beforeEach(async () => {
    const jwtServiceMock = {
      sign: jest.fn().mockImplementation(() => 'testToken'),
    };

    const module: TestingModule = await Test.createTestingModule({
      providers: [
        AuthService,
        { provide: JwtService, useValue: jwtServiceMock },
      ],
    }).compile();

    service = module.get<AuthService>(AuthService);
    jwtService = module.get<JwtService>(JwtService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });

  it('should generate a token', async () => {
    const result = await service.generateToken({ email: 'test@test.com', _id: '1' });
    expect(result).toEqual({ access_token: 'testToken' });
    expect(jwtService.sign).toHaveBeenCalledWith({ username: 'test@test.com', sub: '1' });
  });

  it('should throw an error when validating a user', async () => {
    await expect(service.validateUser('testPayload')).rejects.toThrow('testPayload');
  });
});