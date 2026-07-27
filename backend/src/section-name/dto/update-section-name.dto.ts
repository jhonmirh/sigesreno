import { PartialType } from '@nestjs/mapped-types';
import { CreateSectionNameDto } from './create-section-name.dto';

export class UpdateSectionNameDto extends PartialType(CreateSectionNameDto) {}
