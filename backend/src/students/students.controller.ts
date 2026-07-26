import { Controller, Get, Post, Body, Param, UseGuards } from '@nestjs/common';
import { StudentsService } from './students.service';
import { CreateStudentDto } from './dto/create-student.dto';
import { JwtAuthGuard } from '../auth/guards/jwt-auth.guard';
import { RolesGuard } from '../auth/guards/roles.guard';
import { Roles } from '../auth/decorators/roles.decorator';

@Controller('students')
@UseGuards(JwtAuthGuard, RolesGuard) // Protege todas las rutas de este controlador
export class StudentsController {
  constructor(private readonly studentsService: StudentsService) {}

  @Post()
  @Roles('ADMINISTRADOR', 'JEFE_CONTROL_ESTUDIO') // Solo estos roles pueden crear
  create(@Body() createStudentDto: CreateStudentDto) {
    return this.studentsService.create(createStudentDto);
  }

  @Get()
  @Roles('ADMINISTRADOR', 'JEFE_CONTROL_ESTUDIO', 'DIRECTOR', 'PROFESOR') // Todos pueden ver la lista
  findAll() {
    return this.studentsService.findAll();
  }

  @Get(':id')
  @Roles('ADMINISTRADOR', 'JEFE_CONTROL_ESTUDIO', 'DIRECTOR', 'PROFESOR')
  findOne(@Param('id') id: string) {
    return this.studentsService.findOne(id);
  }
}