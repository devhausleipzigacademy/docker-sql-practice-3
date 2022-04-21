/*
  Warnings:

  - You are about to drop the column `authorId` on the `Post` table. All the data in the column will be lost.
  - You are about to drop the column `published` on the `Post` table. All the data in the column will be lost.
  - You are about to drop the column `viewCount` on the `Post` table. All the data in the column will be lost.
  - You are about to drop the `User` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `authorEmail` to the `Post` table without a default value. This is not possible if the table is not empty.
  - Added the required column `authorName` to the `Post` table without a default value. This is not possible if the table is not empty.
  - Made the column `content` on table `Post` required. This step will fail if there are existing NULL values in that column.

*/
-- DropForeignKey
ALTER TABLE "Post" DROP CONSTRAINT "Post_authorId_fkey";

-- AlterTable
ALTER TABLE "Post" DROP COLUMN "authorId",
DROP COLUMN "published",
DROP COLUMN "viewCount",
ADD COLUMN     "authorEmail" TEXT NOT NULL,
ADD COLUMN     "authorName" TEXT NOT NULL,
ALTER COLUMN "content" SET NOT NULL;

-- DropTable
DROP TABLE "User";
