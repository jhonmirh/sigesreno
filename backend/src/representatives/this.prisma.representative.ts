import { Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { CreateRepresentativeDto } from './dto/create-representative.dto';

@Injectable()
export class RepresentativesService {
  constructor(private prisma: PrismaService) {}

  async create(createRepresentativeDto: CreateRepresentativeDto) {
    return this.prisma.representante.create({ // <--- cambiado a 'representante'
      data: createRepresentativeDto as any,
    });
  }

  async findAll() {
    return this.prisma.representante.findMany();
  }

  async findOne(id: string) {
    return this.prisma.representante.findUnique({
      where: { id },
    });
  }
}