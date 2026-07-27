import { Injectable, NotFoundException } from '@nestjs/common';
import { CreateSectionDto } from './dto/create-section.dto';
import { UpdateSectionDto } from './dto/update-section.dto';
import { PrismaService } from '../prisma/prisma.service';

@Injectable()
export class SectionService {
  constructor(private prisma: PrismaService) {}

  async create(createSectionDto: CreateSectionDto) {
    return this.prisma.section.create({
      data: createSectionDto,
      include: {
        sectionName: true,
        specialty: true,
      },
    });
  }

  async findAll() {
    return this.prisma.section.findMany({
      include: {
        sectionName: true,
        specialty: true,
      },
      orderBy: [
        { grade: 'asc' },
        { sectionName: { name: 'asc' } },
      ],
    });
  }

  async findOne(id: string) {
    const section = await this.prisma.section.findUnique({
      where: { id },
      include: {
        sectionName: true,
        specialty: true,
      },
    });
    if (!section) throw new NotFoundException('Sección no encontrada');
    return section;
  }

  async update(id: string, updateSectionDto: UpdateSectionDto) {
    await this.findOne(id);
    return this.prisma.section.update({
      where: { id },
      data: updateSectionDto,
      include: {
        sectionName: true,
        specialty: true,
      },
    });
  }

  async remove(id: string) {
    await this.findOne(id);
    return this.prisma.section.delete({
      where: { id },
    });
  }
}