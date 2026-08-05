import { PartialType } from '@nestjs/mapped-types';
import { CreateGruposEstableDto } from './create-grupos-estable.dto';

export class UpdateGruposEstableDto extends PartialType(CreateGruposEstableDto) {}
