import { Injectable, NotFoundException } from '@nestjs/common';
import { CreateSchoolYearDto } from './dto/create-school-year.dto';
import { UpdateSchoolYearDto } from './dto/update-school-year.dto';
import { PrismaService } from '../prisma/prisma.service';

@Injectable()
export class SchoolYearService {
  constructor(private prisma: PrismaService) {}

  async create(createSchoolYearDto: CreateSchoolYearDto) {
    // Si este año se marca como activo, desactivamos todos los demás
    if (createSchoolYearDto.isActive) {
      await this.prisma.schoolYear.updateMany({
        where: { isActive: true },
        data: { isActive: false },
      });
    }

    return this.prisma.schoolYear.create({
      data: createSchoolYearDto,
    });
  }

  async findAll() {
    return this.prisma.schoolYear.findMany({
      orderBy: { period: 'desc' } // Los más recientes primero
    });
  }

  async findOne(id: string) {
    const schoolYear = await this.prisma.schoolYear.findUnique({
      where: { id },
    });
    if (!schoolYear) throw new NotFoundException('Año escolar no encontrado');
    return schoolYear;
  }

  async update(id: string, updateSchoolYearDto: UpdateSchoolYearDto) {
    await this.findOne(id);

    // Misma regla: si lo pasamos a activo, desactivamos los demás
    if (updateSchoolYearDto.isActive) {
      await this.prisma.schoolYear.updateMany({
        where: { id: { not: id }, isActive: true },
        data: { isActive: false },
      });
    }

    return this.prisma.schoolYear.update({
      where: { id },
      data: updateSchoolYearDto,
    });
  }

  async remove(id: string) {
    await this.findOne(id);
    return this.prisma.schoolYear.delete({
      where: { id },
    });
  }
}