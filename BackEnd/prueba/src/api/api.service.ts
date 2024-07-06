// Importamos las dependencias necesarias
import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';

// Importamos las entidades que vamos a utilizar
import { Characters } from './entities/characters.entity';
import { Weapons } from './entities/weapons.entity';
import { Weapons_Category, Abilities_Category, Category_Store } from './entities/categories.entity';
import { Abilities_Store, Items_Store } from './entities/store.entity'
import { Shields } from './entities/shields.entity'
import { Abilities } from './entities/abilities.entity';

// Decorador Injectable, indica que esta clase puede ser inyectada como dependencia en otras clases
@Injectable()
export class ApiService {
  // Inyectamos los repositorios de TypeORM para cada entidad que vamos a utilizar
  // Los repositorios son objetos que permiten interactuar con la base de datos
  constructor(
    @InjectRepository(Characters) private CharactersRepository: Repository<Characters>,
    @InjectRepository(Abilities) private AbilitiesRepository: Repository<Abilities>,
    @InjectRepository(Weapons) private WeaponsRepository: Repository<Weapons>,
    @InjectRepository(Weapons_Category) private WeaponsCategoryRepository: Repository<Weapons_Category>,
    @InjectRepository(Abilities_Category) private AbilitiesCategoryRepository: Repository<Abilities_Category>,
    @InjectRepository(Category_Store) private CategoryStoreRepository: Repository<Category_Store>,
    @InjectRepository(Abilities_Store) private AbilitiesStoreRepository: Repository<Abilities_Store>,
    @InjectRepository(Items_Store) private ItemsStoreRepository: Repository<Items_Store>,
    @InjectRepository(Shields) private ShieldsRepository: Repository<Shields>,
  ) {}

  // Método genérico para buscar entidades con relaciones. Puede buscar todas las entidades o una específica si se proporciona un id
  private async findWithRelations(repository: Repository<any>, alias: string, relations: string[], idField?: string, id?: number): Promise<any[] | any> {
    try {
      // Creamos un query builder con el alias proporcionado
      // El query builder es un objeto que permite construir consultas SQL de forma programática
      let query = repository.createQueryBuilder(alias);
      // Añadimos todas las relaciones proporcionadas al query builder
      // Esto se hace con un join a la tabla correspondiente
      relations.forEach(relation => {
        query = query.leftJoinAndSelect(`${alias}.${relation}`, relation);
      });
      // Si se proporcionó un id, añadimos una cláusula where al query builder y buscamos una sola entidad
      if (idField && id !== undefined) {
        query = query.where(`${alias}.${idField} = :id`, { id });
        const result = await query.getOne();
        // Si no se encontró la entidad, lanzamos una excepción
        if (!result) {
          throw new NotFoundException(`${alias.charAt(0).toUpperCase() + alias.slice(1)} Not Found`);
        }
        return result;
      } else {
        // Si no se proporcionó un id, buscamos todas las entidades
        const result = await query.getMany();
        // Eliminamos las relaciones vacías de cada entidad
        // Esto se hace para evitar enviar datos innecesarios al cliente
        result.forEach(item => {
          relations.forEach(relation => {
            if (item[relation].length === 0) {
              delete item[relation];
            }
          });
        });
        return result;
      }
    } catch (error) {
      // Si ocurre un error, lo manejamos con el método handleError
      if (error instanceof NotFoundException) {
        throw error;
      }
      this.handleError(`Error fetching ${alias}`, error);
    }
  }

  // Método para manejar errores. Imprime el error y lanza una excepción
  private handleError(message: string, error: any) {
    console.error(message, error);
    throw new Error(`${message}: ${error}`);
  }

  // Método para obtener todas las entidades
  // Este método llama a los métodos findAll de cada entidad y devuelve un objeto con los resultados
  async getAll(): Promise<any> {
    try {
      return {
        Characters: await this.findAllCharacters(),
        Abilities: await this.findAllAbilities(),
        Weapons: await this.findAllWeapons(),
        Shields: await this.findAllShields(),
        Weapons_Category: await this.findAllWeaponsCategory(),
        Abilities_Category: await this.findAllAbilitiesCategory(),
        Category_Store: await this.findAllCategoryStore(),
        // AbilitiesTienda: await this.findAllAbilitiesStore(),
        objetosTienda: await this.findAllItemsStore(),
      };
    } catch (error) {
      throw new Error(`Error fetching all elements: ${error}`);
    }
  }

  // Métodos para obtener todas las entidades de un tipo específico. Utilizan el método findWithRelations con las relaciones correspondientes
  async findAllCharacters(): Promise<Characters[]> {
    return this.findWithRelations(this.CharactersRepository, 'characters', ['abilities']);
  }

  async findAllAbilities(): Promise<Abilities[]> {
    return this.findWithRelations(this.AbilitiesRepository, 'abilities', ['abilities_Category']);
  }

  async findAllWeapons(): Promise<Weapons[]> {
    return this.findWithRelations(this.WeaponsRepository, 'weapons', ['weapons_Category']);
  }

  async findAllShields(): Promise<Shields[]> {
    return this.findWithRelations(this.ShieldsRepository, 'shields', ['category_Store']);
  }

  async findAllWeaponsCategory(): Promise<Weapons_Category[]> {
    return this.findWithRelations(this.WeaponsCategoryRepository, 'weapons_category', ['weapons']);
  }

  async findAllAbilitiesCategory(): Promise<Abilities_Category[]> {
    return this.findWithRelations(this.AbilitiesCategoryRepository, 'abilities_category', ['abilities']);
  }
  
  // async findAllAbilitiesStore(): Promise<Abilities_Store[]> {
  //   return this.findWithRelations(this.AbilitiesStoreRepository, 'abilities_store', ['category_store']);
  // }
  
  async findAllItemsStore(): Promise<Items_Store[]> {
    return this.findWithRelations(this.ItemsStoreRepository, 'items_store', ['category_Store']);
  }
  
  async findAllCategoryStore(): Promise<Category_Store[]> {
    return this.findWithRelations(this.CategoryStoreRepository, 'category_store', ['weapons', 'shields', ]);
  }

  // Métodos para obtener una entidad específica. Utilizan el método findWithRelations con un id
  async findOneCharacter(character_id: number): Promise<Characters> {
    return this.findWithRelations(this.CharactersRepository, 'characters', ['abilities'], 'character_id', character_id);
  }

  async findOneAbility(ability_id: number): Promise<Abilities> {
    return this.findWithRelations(this.AbilitiesRepository, 'abilities', ['abilities_Category'], 'ability_id', ability_id);
  }
}