// Importando los decoradores y tipos necesarios de 'typeorm'
import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  ManyToOne,
  JoinColumn,
  PrimaryColumn
} from 'typeorm';

// Importando las entidades necesarias
import { Abilities } from './abilities.entity';
import { Category_Store } from './categories.entity';
import { Weapons } from './weapons.entity';
import { Shields } from './shields.entity';

// Definiendo la entidad 'Habilidades_Tienda' para la tabla 'Habilidades_Tienda'
@Entity('Abilities_Store')
export class Abilities_Store {
  // Columna 'id_habilidad' que es una clave primaria
  @PrimaryColumn()
  ability_id: number;

  // Columna 'id_categoria_tienda' que es una clave primaria
  @PrimaryColumn()
  Category_Store_id: number;

  // Columna 'precio' de tipo decimal con una precisión de 10 y una escala de 2
  @Column('decimal', { precision: 10, scale: 2 })
  price: number;

  // Relación muchos-a-uno con la entidad 'Habilidades'
  @ManyToOne(() => Abilities)
  @JoinColumn({ name: 'ability_id' })
  abilities: Abilities;

  // Relación muchos-a-uno con la entidad 'CategoriaTienda'
  @ManyToOne(() => Category_Store)
  @JoinColumn({ name: 'Category_Store_id' })
  category_Store: Category_Store;
}

// Definiendo la entidad 'Objetos_Tienda' para la tabla 'Objetos_Tienda'
@Entity('Items_Store')
export class Items_Store {
  // Columna generada automáticamente 'id_objeto'
  @PrimaryGeneratedColumn()
  item_id: number;

  // Columnas 'id_arma', 'id_escudo', 'id_habilidad' y 'id_categoria_tienda' de tipo número
  @Column()
  weapon_id: number;

  @Column()
  shield_id: number;

  @Column()
  ability_id: number;

  @Column()
  category_store_id: number;

  // Columna 'precio' de tipo decimal con una precisión de 10 y una escala de 2
  @Column('decimal', { precision: 10, scale: 2 })
  price: number;

  // Relaciones muchos-a-uno con las entidades 'Armas', 'Escudos', 'Habilidades' y 'CategoriaTienda'
  @ManyToOne(() => Weapons)
  @JoinColumn({ name: 'weapon_id' })
  weapons: Weapons;

  @ManyToOne(() => Shields)
  @JoinColumn({ name: 'shield_id' })
  shields: Shields;

  @ManyToOne(() => Abilities)
  @JoinColumn({ name: 'ability_id' })
  abilities: Abilities;

  @ManyToOne(() => Category_Store)
  @JoinColumn({ name: 'Category_Store_id' })
  category_Store: Category_Store;
}