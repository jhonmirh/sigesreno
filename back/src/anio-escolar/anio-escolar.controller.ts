import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { AnioEscolarService } from './anio-escolar.service';
import { CreateAnioEscolarDto } from './dto/create-anio-escolar.dto';
import { UpdateAnioEscolarDto } from './dto/update-anio-escolar.dto';

@Controller('anio-escolar')
export class AnioEscolarController {
  constructor(private readonly anioEscolarService: AnioEscolarService) {}

  @Post()
  create(@Body() createAnioEscolarDto: CreateAnioEscolarDto) {
    return this.anioEscolarService.create(createAnioEscolarDto);
  }

  @Get()
  findAll() {
    return this.anioEscolarService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.anioEscolarService.findOne(+id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateAnioEscolarDto: UpdateAnioEscolarDto) {
    return this.anioEscolarService.update(+id, updateAnioEscolarDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.anioEscolarService.remove(+id);
  }
}
