import { IsString, IsNotEmpty, IsOptional, IsEmail } from 'class-validator';

export class CreateRepresentativeDto {
    @IsString()
    @IsNotEmpty()
    cedula!: string;

    @IsString()
    @IsNotEmpty()
    firstName!: string;

    @IsString()
    @IsNotEmpty()
    lastName!: string;

    @IsString()
    @IsNotEmpty()
    phone!: string;

    @IsString()
    @IsOptional()
    altPhone?: string;

    @IsEmail()
    @IsOptional()
    email?: string;

    @IsString()
    @IsNotEmpty()
    address!: string;

    @IsString()
    @IsOptional()
    profession?: string;

    @IsString()
    @IsNotEmpty()
    kinship!: string; // Parentesco
}