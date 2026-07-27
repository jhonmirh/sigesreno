import { IsNotEmpty, IsUUID } from 'class-validator';

export class CreateEnrollmentDto {
  @IsUUID('4', { message: 'El ID del estudiante debe ser un UUID válido' })
  @IsNotEmpty({ message: 'El estudiante es obligatorio' })
  studentId!: string; // <-- Agrega el '!' aquí

  @IsUUID('4', { message: 'El ID de la sección debe ser un UUID válido' })
  @IsNotEmpty({ message: 'La sección es obligatoria' })
  sectionId!: string; // <-- Y aquí

  @IsUUID('4', { message: 'El ID del año escolar debe ser un UUID válido' })
  @IsNotEmpty({ message: 'El año escolar es obligatorio' })
  schoolYearId!: string; // <-- Y aquí
}