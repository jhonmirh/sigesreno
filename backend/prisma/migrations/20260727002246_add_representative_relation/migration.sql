-- AlterTable
ALTER TABLE "Student" ADD COLUMN     "representativeId" TEXT;

-- CreateTable
CREATE TABLE "Representative" (
    "id" TEXT NOT NULL,
    "cedula" TEXT NOT NULL,
    "firstName" TEXT NOT NULL,
    "lastName" TEXT NOT NULL,
    "phone" TEXT NOT NULL,
    "altPhone" TEXT,
    "email" TEXT,
    "address" TEXT NOT NULL,
    "profession" TEXT,
    "kinship" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Representative_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Representative_cedula_key" ON "Representative"("cedula");

-- AddForeignKey
ALTER TABLE "Student" ADD CONSTRAINT "Student_representativeId_fkey" FOREIGN KEY ("representativeId") REFERENCES "Representative"("id") ON DELETE SET NULL ON UPDATE CASCADE;
