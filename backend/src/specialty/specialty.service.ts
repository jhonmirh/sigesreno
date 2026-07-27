import { Injectable, NotFoundException } from '@nestjs/common';
import { CreateSpecialtyDto } from './dto/create-specialty.dto';
import { UpdateSpecialtyDto } from './dto/update-specialty.dto';
import { PrismaService } from '../prisma/prisma.service';

@Injectable()
export class SpecialtyService {
  constructor(private prisma: PrismaService) {}

  async create(createSpecialtyDto: CreateSpecialtyDto) {
    return this.prisma.specialty.create({
      data: createSpecialtyDto,
    });
  }

  async findAll() {
    return this.prisma.specialty.findMany({
      orderBy: { name: 'asc' },
    });
  }

  async findOne(id: string) {
    const specialty = await this.prisma.specialty.findUnique({
      where: { id },
    });
    if (!specialty) throw new NotFoundException('Especialidad no encontrada');
    return specialty;
  }

  async update(id: string, updateSpecialtyDto: UpdateSpecialtyDto) {
    await this.findOne(id);
    return this.prisma.specialty.update({
      where: { id },
      data: updateSpecialtyDto,
    });
  }

  async remove(id: string) {
    await this.findOne(id);
    return this.prisma.specialty.delete({
      where: { id },
    });
  }
}