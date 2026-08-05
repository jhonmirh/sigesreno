import { PrismaClient } from '@prisma/client';
import { PrismaPg } from '@prisma/adapter-pg';
import { Pool } from 'pg';
import * as bcrypt from 'bcrypt';
import 'dotenv/config'; // Asegura la lectura del archivo .env

// Configurar el pool de conexión para PostgreSQL
const connectionString = process.env.DATABASE_URL;
const pool = new Pool({ connectionString });
const adapter = new PrismaPg(pool);

// Instanciar Prisma utilizando el adaptador
const prisma = new PrismaClient({ adapter });

async function main() {
  console.log('Iniciando carga de datos semilla...');

  // 1. Crear el usuario Administrador Principal
  const salt = await bcrypt.genSalt(10);
  const hashedPassword = await bcrypt.hash('admin1234', salt);

  const admin = await prisma.user.upsert({
    where: { username: 'director_admin' },
    update: {},
    create: {
      username: 'director_admin',
      password: hashedPassword,
      role: 'ADMIN',
    },
  });
  console.log(`Usuario Administrador creado: ${admin.username}`);

  // 2. Crear nombres de Próceres para las Secciones
  const proceres = ['Simón Bolívar', 'Andrés Bello', 'Antonio José de Sucre', 'José Antonio Páez', 'Francisco de Miranda'];
  
  for (const nombre of proceres) {
    await prisma.nombreProcer.upsert({
      where: { nombre },
      update: {},
      create: { nombre },
    });
  }
  console.log('Nombres de Próceres registrados correctamente.');
}

main()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });