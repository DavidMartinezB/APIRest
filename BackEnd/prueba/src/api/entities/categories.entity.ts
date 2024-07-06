// Importando los decoradores y tipos necesarios de 'typeorm'
import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  OneToMany,
} from 'typeorm';

// Importando las entidades necesarias
import { Weapons } from './weapons.entity';
import { Abilities } from './abilities.entity';
import { Shields } from './shields.entity';

// Definiendo la entidad 'Categoria_Tienda' para la tabla 'Categoria_Tienda'
@Entity('Category_Store')
export class Category_Store {
  // Columna generada automáticamente 'id_categoria'
  @PrimaryGeneratedColumn()
  category_id: number;

  // Columna 'nombre' de tipo string con una longitud de 100
  @Column({ length: 100 })
  name: string;

  // Relación uno-a-muchos con la entidad 'Armas'
  @OneToMany(() => Weapons, weapons => weapons.category_Store)
  weapons: Weapons[];

  // Relación uno-a-muchos con la entidad 'Escudos'
  @OneToMany(() => Shields, shields => shields.category_Store)
  shields: Shields[];

  // Relación uno-a-muchos con la entidad 'Habilidades'
  @OneToMany(() => Abilities, abilities => abilities.category_Store)
  abilities: Abilities[];

}

// Definiendo la entidad 'Categoria_Armas' para la tabla 'Categoria_Armas'
@Entity('Weapons_Category')
export class Weapons_Category {
  // Columna generada automáticamente 'id_categoria_arma'
  @PrimaryGeneratedColumn()
  category_id: number;

  // Columna 'nombre' de tipo string con una longitud de 100
  @Column({ length: 100 })
  name: string;

  // Relación uno-a-muchos con la entidad 'Armas'
  @OneToMany(() => Weapons, weapons => weapons.weapons_Category)
  weapons: Weapons[];
}

// Definiendo la entidad 'Categoria_Habilidades' para la tabla 'Categoria_Habilidades'
@Entity('Abilities_Category')
export class Abilities_Category {
  // Columna generada automáticamente 'id_categoria_habilidad'
  @PrimaryGeneratedColumn()
  category_id: number;

  // Columna 'nombre' de tipo string con una longitud de 100
  @Column({ length: 100 })
  name: string;

  // Relación uno-a-muchos con la entidad 'Habilidades'
  @OneToMany(() => Abilities, abilities => abilities.abilities_Category)
  abilities: Abilities[];

  
}