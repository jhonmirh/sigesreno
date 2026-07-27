import { Controller, Get, Post, Body, Param, UseGuards } from '@nestjs/common';
import { RepresentativesService } from './this.prisma.representative';
import { CreateRepresentativeDto } from './dto/create-representative.dto';
import { JwtAuthGuard } from '../auth/guards/jwt-auth.guard';
import { RolesGuard } from '../auth/guards/roles.guard';
import { Roles } from '../auth/decorators/roles.decorator';

@Controller('representatives')
@UseGuards(JwtAuthGuard, RolesGuard) // Seguridad activada para todas las rutas
export class RepresentativesController {
  constructor(private readonly representativesService: RepresentativesService) {}

  @Post()
  @Roles('ADMINISTRADOR', 'JEFE_CONTROL_ESTUDIO') // Solo ellos pueden registrar
  create(@Body() createRepresentativeDto: CreateRepresentativeDto) {
    return this.representativesService.create(createRepresentativeDto);
  }

  @Get()
  @Roles('ADMINISTRADOR', 'JEFE_CONTROL_ESTUDIO', 'DIRECTOR', 'PROFESOR')
  findAll() {
    return this.representativesService.findAll();
  }

  @Get(':id')
  @Roles('ADMINISTRADOR', 'JEFE_CONTROL_ESTUDIO', 'DIRECTOR', 'PROFESOR')
  findOne(@Param('id') id: string) {
    return this.representativesService.findOne(id);
  }
}