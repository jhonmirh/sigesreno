import { Injectable, NotFoundException } from '@nestjs/common';
import { CreateSectionNameDto } from './dto/create-section-name.dto';
import { UpdateSectionNameDto } from './dto/update-section-name.dto';
import { PrismaService } from '../prisma/prisma.service'; 

@Injectable()
export class SectionNameService {
  constructor(private prisma: PrismaService) {}

  async create(createSectionNameDto: CreateSectionNameDto) {
    return this.prisma.sectionName.create({
      data: createSectionNameDto,
    });
  }

  async findAll() {
    return this.prisma.sectionName.findMany({
      orderBy: { name: 'asc' } // Los ordenamos alfabéticamente
    });
  }

  async findOne(id: string) {
    const sectionName = await this.prisma.sectionName.findUnique({
      where: { id },
    });
    if (!sectionName) throw new NotFoundException('Nombre de sección no encontrado');
    return sectionName;
  }

  async update(id: string, updateSectionNameDto: UpdateSectionNameDto) {
    await this.findOne(id); // Verificamos que exista
    return this.prisma.sectionName.update({
      where: { id },
      data: updateSectionNameDto,
    });
  }

  async remove(id: string) {
    await this.findOne(id);
    return this.prisma.sectionName.delete({
      where: { id },
    });
  }
}