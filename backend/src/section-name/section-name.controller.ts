import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { SectionNameService } from './section-name.service';
import { CreateSectionNameDto } from './dto/create-section-name.dto';
import { UpdateSectionNameDto } from './dto/update-section-name.dto';

@Controller('section-name')
export class SectionNameController {
  constructor(private readonly sectionNameService: SectionNameService) {}

  @Post()
  create(@Body() createSectionNameDto: CreateSectionNameDto) {
    return this.sectionNameService.create(createSectionNameDto);
  }

  @Get()
  findAll() {
    return this.sectionNameService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.sectionNameService.findOne(+id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateSectionNameDto: UpdateSectionNameDto) {
    return this.sectionNameService.update(+id, updateSectionNameDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.sectionNameService.remove(+id);
  }
}
