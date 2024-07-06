import { Test, TestingModule } from '@nestjs/testing';
import { ApiController } from './api.controller';
import { ApiService } from './api.service';
import { Abilities_Category } from './entities/categories.entity';
import { Abilities } from './entities/abilities.entity';
import { Characters } from './entities/characters.entity';

describe('ApiController', () => {
  let controller: ApiController;
  let service: ApiService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [ApiController],
      providers: [
        {
          provide: ApiService,
          useValue: {
            findAllAbilities: jest.fn().mockResolvedValue([]),
            findAllAbilitiesStore: jest.fn().mockResolvedValue([]),
            findOneAbility: jest.fn().mockResolvedValue({}),
            findAllWeapons: jest.fn().mockResolvedValue([]),
            findAllWeaponsCategory: jest.fn().mockResolvedValue([]),
            findAllAbilitiesCategory: jest.fn().mockResolvedValue([]),
            findAllShields: jest.fn().mockResolvedValue([]),
            getAll: jest.fn().mockResolvedValue({}),
          },
        },
      ],
    }).compile();

    controller = module.get<ApiController>(ApiController);
    service = module.get<ApiService>(ApiService);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });

  it('should return all abilities', async () => {
    const result = [];
    jest.spyOn(service, 'findAllAbilities').mockResolvedValue(result);
    expect(await controller.findAllAbilities()).toBe(result);
  });

  it('should return all abilities store', async () => {
    const result = [];
    jest.spyOn(service, 'findAllAbilitiesStore').mockResolvedValue(result);
    expect(await controller.findAllAbilitiesStore()).toBe(result);
  });

  it('should return one ability', async () => {
    const result: Abilities = {
      ability_id: 1,
      character: 'Character Name' as unknown as Characters,
      name: 'Ability Name',
      description: 'Ability Description',
      abilities_Category: 'Category Name' as unknown as Abilities_Category,
    };
    const ability_id = 1;
    jest.spyOn(service, 'findOneAbility').mockResolvedValue(result);
    expect(await controller.findOneAbility(ability_id)).toBe(result);
  });
  
  it('should return all weapons', async () => {
    const result = [];
    jest.spyOn(service, 'findAllWeapons').mockResolvedValue(result);
    expect(await controller.findAllWeapons()).toBe(result);
  });
  
  it('should return all weapons category', async () => {
    const result = [];
    jest.spyOn(service, 'findAllWeaponsCategory').mockResolvedValue(result);
    expect(await controller.findAllWeaponsCategory()).toBe(result);
  });
  
  it('should return all abilities category', async () => {
    const result = [];
    jest.spyOn(service, 'findAllAbilitiesCategory').mockResolvedValue(result);
    expect(await controller.findAllAbilitieCategory()).toBe(result);
  });
  
  it('should return all shields', async () => {
    const result = [];
    jest.spyOn(service, 'findAllShields').mockResolvedValue(result);
    expect(await controller.findAllShields()).toBe(result);
  });
  
  it('should return all', async () => {
    const result = {};
    jest.spyOn(service, 'getAll').mockResolvedValue(result);
    expect(await controller.findAll()).toBe(result);
  });
});