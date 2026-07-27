import { IsString, IsNotEmpty, IsEnum, IsUUID, IsOptional } from 'class-validator';
import { Modality } from '@prisma/client'; // Importamos el Enum directo de Prisma

export class CreateSectionDto {
  @IsEnum(Modality, { message: 'La modalidad debe ser MEDIA_GENERAL o MEDIA_TECNICA' })
  @IsNotEmpty()
  modality: Modality;

  @IsString()
    @IsNotEmpty({ message: 'El grado o año es obligatorio (Ej: 1er Año)' })
    grade!: string;

  @IsUUID('4', { message: 'El ID del nombre de sección debe ser un UUID válido' })
    @IsNotEmpty()
    sectionNameId!: string;

  @IsUUID('4', { message: 'El ID de la especialidad debe ser un UUID válido' })
  @IsOptional()
  specialtyId?: string; // Es opcional porque Media General no tiene especialidad
}