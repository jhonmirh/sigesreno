import { IsString, IsNotEmpty } from 'class-validator';

export class CreateSectionNameDto {
  @IsString()
    @IsNotEmpty({ message: 'El nombre del prócer es obligatorio' })
    name!: string;
}