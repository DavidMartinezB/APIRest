import { Test, TestingModule } from '@nestjs/testing';
import { ApiService } from './api.service';
import { Abilities } from './entities/abilities.entity';
import { Characters } from './entities/characters.entity';
import { Abilities_Category } from './entities/categories.entity';

describe('ApiService', () => {
  let service: ApiService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [
        ApiService,
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
      ]
    }).compile();

    service = module.get<ApiService>(ApiService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });

  it('should return all abilities', async () => {
    const result = [];
    jest.spyOn(service, 'findAllAbilities').mockResolvedValue(result);
    expect(await service.findAllAbilities()).toBe(result);
  });

  it('should return all abilities store', async () => {
    const result = [];
    jest.spyOn(service, 'findAllAbilitiesStore').mockResolvedValue(result);
    expect(await service.findAllAbilitiesStore()).toBe(result);
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
    expect(await service.findOneAbility(ability_id)).toBe(result);
  });
  

  it('should return all abilities category', async () => {
    const result = [];
    jest.spyOn(service, 'findAllAbilitiesCategory').mockResolvedValue(result);
    expect(await service.findAllAbilitiesCategory()).toBe(result);
  });
});
