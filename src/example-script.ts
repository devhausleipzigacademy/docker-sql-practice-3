import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

async function callDb() {
	await prisma.post.create({});
}

callDb();
