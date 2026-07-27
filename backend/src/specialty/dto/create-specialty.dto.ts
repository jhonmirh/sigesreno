import { IsString, IsNotEmpty, IsOptional } from 'class-validator';

export class CreateSpecialtyDto {
    @IsString()
    @IsNotEmpty({ message: 'El código de la especialidad es obligatorio' })
    code!: string;

    @IsString()
    @IsNotEmpty({ message: 'El nombre de la especialidad es obligatorio' })
    name!: string;

    @IsString()
    @IsOptional()
    description?: string;
}