import { IsString, IsNotEmpty, IsBoolean, IsOptional } from 'class-validator';

export class CreateSchoolYearDto {
  @IsString()
    @IsNotEmpty({ message: 'El periodo escolar es obligatorio (Ej: 2026-2027)' })
    period!: string;

  @IsBoolean()
  @IsOptional()
  isActive?: boolean;
}