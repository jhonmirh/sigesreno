import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { GruposEstablesService } from './grupos-estables.service';
import { CreateGruposEstableDto } from './dto/create-grupos-estable.dto';
import { UpdateGruposEstableDto } from './dto/update-grupos-estable.dto';

@Controller('grupos-estables')
export class GruposEstablesController {
  constructor(private readonly gruposEstablesService: GruposEstablesService) {}

  @Post()
  create(@Body() createGruposEstableDto: CreateGruposEstableDto) {
    return this.gruposEstablesService.create(createGruposEstableDto);
  }

  @Get()
  findAll() {
    return this.gruposEstablesService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.gruposEstablesService.findOne(+id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateGruposEstableDto: UpdateGruposEstableDto) {
    return this.gruposEstablesService.update(+id, updateGruposEstableDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.gruposEstablesService.remove(+id);
  }
}
