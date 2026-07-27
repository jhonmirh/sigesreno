import { Injectable, NotFoundException, BadRequestException } from '@nestjs/common';
import { CreateEnrollmentDto } from './dto/create-enrollment.dto';
import { UpdateEnrollmentDto } from './dto/update-enrollment.dto';
import { PrismaService } from '../prisma/prisma.service';

@Injectable()
export class EnrollmentService {
  constructor(private prisma: PrismaService) {}

  async create(createEnrollmentDto: CreateEnrollmentDto) {
    // Regla: Evitar doble matrícula en el mismo año escolar
    const existingEnrollment = await this.prisma.enrollment.findFirst({
      where: {
        studentId: createEnrollmentDto.studentId,
        schoolYearId: createEnrollmentDto.schoolYearId,
      },
    });

    if (existingEnrollment) {
      throw new BadRequestException('Este estudiante ya se encuentra matriculado en el año escolar seleccionado.');
    }

    return this.prisma.enrollment.create({
      data: createEnrollmentDto,
      include: {
        student: true,
        schoolYear: true,
        section: {
          include: {
            sectionName: true,
            specialty: true,
          },
        },
      },
    });
  }

  async findAll() {
    return this.prisma.enrollment.findMany({
      include: {
        student: true,
        schoolYear: true,
        section: {
          include: {
            sectionName: true,
            specialty: true,
          },
        },
      },
    });
  }

  async findOne(id: string) {
    const enrollment = await this.prisma.enrollment.findUnique({
      where: { id },
      include: {
        student: true,
        schoolYear: true,
        section: {
          include: {
            sectionName: true,
            specialty: true,
          },
        },
      },
    });
    
    if (!enrollment) throw new NotFoundException('Matrícula no encontrada');
    return enrollment;
  }

  async update(id: string, updateEnrollmentDto: UpdateEnrollmentDto) {
    await this.findOne(id); // Validamos que exista
    return this.prisma.enrollment.update({
      where: { id },
      data: updateEnrollmentDto,
      include: {
        student: true,
        schoolYear: true,
        section: true,
      },
    });
  }

  async remove(id: string) {
    await this.findOne(id);
    return this.prisma.enrollment.delete({
      where: { id },
    });
  }
}