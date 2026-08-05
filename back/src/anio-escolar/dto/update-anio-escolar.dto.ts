import { PartialType } from '@nestjs/mapped-types';
import { CreateAnioEscolarDto } from './create-anio-escolar.dto';

export class UpdateAnioEscolarDto extends PartialType(CreateAnioEscolarDto) {}
