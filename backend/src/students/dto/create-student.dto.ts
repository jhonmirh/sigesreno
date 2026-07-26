import { IsString, IsNotEmpty, IsOptional, IsDateString, IsNumber, IsBoolean } from 'class-validator';

export class CreateStudentDto {
    @IsString()
    @IsOptional()
    cedula?: string;

    @IsString()
    @IsOptional()
    cedulaEscolar?: string;

    @IsString()
    @IsNotEmpty()
    firstName?: string;

    @IsString()
    @IsNotEmpty()
    lastName!: string;

    @IsDateString()
    @IsNotEmpty()
    birthDate!: string;

    @IsString()
    @IsOptional()
    placeOfBirth?: string;

    @IsString()
    @IsNotEmpty()
    gender!: string;

    @IsString()
    @IsOptional()
    address?: string;

    // --- Datos Antropométricos ---
    @IsNumber()
    @IsOptional()
    weight?: number;

    @IsNumber()
    @IsOptional()
    height?: number;

    @IsString()
    @IsOptional()
    shirtSize?: string;

    @IsString()
    @IsOptional()
    pantsSize?: string;

    @IsString()
    @IsOptional()
    shoeSize?: string;

    // --- Datos de Salud ---
    @IsString()
    @IsOptional()
    bloodType?: string;

    @IsString()
    @IsOptional()
    allergies?: string;

    @IsString()
    @IsOptional()
    chronicDiseases?: string;

    // --- Documentos ---
    @IsBoolean()
    @IsOptional()
    hasBirthCertificate?: boolean;

    @IsBoolean()
    @IsOptional()
    hasPhotos?: boolean;

    @IsBoolean()
    @IsOptional()
    hasPreviousGrades?: boolean;

    @IsBoolean()
    @IsOptional()
    hasIdCopy?: boolean;
}