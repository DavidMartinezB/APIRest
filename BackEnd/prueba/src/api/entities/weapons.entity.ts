// Importando los decoradores y tipos necesarios de 'typeorm'
import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  ManyToOne,
  JoinColumn
} from 'typeorm';

// Importando las entidades 'CategoriaTienda' y 'CategoriaArmas'
import { Category_Store, Weapons_Category } from './categories.entity'; 

// Definiendo la entidad 'Armas' para la tabla 'Armas'
@Entity('Weapons')
export class Weapons {
  // Columna generada automáticamente 'id_arma'
  @PrimaryGeneratedColumn()
  weapon_id: number;

  // Columnas 'id_categoria' y 'id_categoria_arma' de tipo número
  @Column()
  category_id: number;

  @Column()
  weapon_category_id: number;

  // Columna 'nombre' de tipo string con una longitud de 100
  @Column({ length: 100 })
  name: string;

  // Columna 'descripcion' de tipo texto
  @Column('text')
  description: string;

  // Columna 'imagen_url' de tipo string con una longitud de 255
  @Column({ length: 255 })
  url_image: string;

  // Columna 'fire_rate' de tipo float
  @Column('float')
  fire_rate: number;

  // Columnas de daño de tipo entero
  @Column('int')
  close_body_damage: number;

  @Column('int')
  medium_body_damage: number;

  @Column('int')
  far_body_damage: number;

  @Column('int')
  close_head_damage: number;

  @Column('int')
  medium_head_damage: number;

  @Column('int')
  far_head_damage: number;

  // Columna 'precio' de tipo decimal con una precisión de 10 y una escala de 2
  @Column('decimal', { precision: 10, scale: 2 })
  price: number;

  // Relaciones muchos-a-uno con las entidades 'CategoriaTienda' y 'CategoriaArmas'
  @ManyToOne(() => Category_Store)
  @JoinColumn({ name: 'category_id' })
  category_Store: Category_Store;

  @ManyToOne(() => Weapons_Category)
  @JoinColumn({ name: 'category_id' })
  weapons_Category: Weapons_Category;
}