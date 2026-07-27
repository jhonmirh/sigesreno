/*
  Warnings:

  - A unique constraint covering the columns `[cedulaEscolar]` on the table `Student` will be added. If there are existing duplicate values, this will fail.

*/
-- AlterTable
ALTER TABLE "Student" ADD COLUMN     "address" TEXT,
ADD COLUMN     "allergies" TEXT,
ADD COLUMN     "bloodType" TEXT,
ADD COLUMN     "cedulaEscolar" TEXT,
ADD COLUMN     "chronicDiseases" TEXT,
ADD COLUMN     "hasBirthCertificate" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "hasIdCopy" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "hasPhotos" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "hasPreviousGrades" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "pantsSize" TEXT,
ADD COLUMN     "placeOfBirth" TEXT,
ADD COLUMN     "shirtSize" TEXT,
ADD COLUMN     "shoeSize" TEXT;

-- CreateIndex
CREATE UNIQUE INDEX "Student_cedulaEscolar_key" ON "Student"("cedulaEscolar");
