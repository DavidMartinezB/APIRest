// Importando los decoradores y tipos necesarios de 'typeorm'
import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  ManyToOne,
  JoinColumn
} from 'typeorm';
// Importando la entidad 'CategoriaTienda'
import { Category_Store } from './categories.entity';

// Definiendo la entidad 'Escudos' para la tabla 'Escudos'
@Entity('Shields')
export class Shields {
  // Columna generada automáticamente 'id_escudo'
  @PrimaryGeneratedColumn()
  shield_id: number;

  // Columna 'id_categoria' de tipo número
  @Column()
  category_id: number;

  // Columna 'nombre' de tipo string con una longitud de 100
  @Column({ length: 100 })
  name: string;

  // Columna 'descripcion' de tipo texto
  @Column('text')
  description: string;

  // Columna 'resistencia' de tipo entero
  @Column('int')
  resistance: number;

  // Columna 'precio' de tipo decimal con una precisión de 10 y una escala de 2
  @Column('decimal', { precision: 10, scale: 2 })
  price: number;

  // Columna 'imagen_url' de tipo string con una longitud de 255
  @Column({ length: 255 })
  url_image: string;

  // Relación muchos-a-uno con la entidad 'CategoriaTienda'
  @ManyToOne(() => Category_Store)
  @JoinColumn({ name: 'category_id' })
  category_Store: Category_Store;

  // Relación uno-a-muchos con la entidad 'ShieldsCategory'
  
}