import { Prisma, PrismaClient } from '@prisma/client'
import express from 'express'

const prisma = new PrismaClient()
const app = express()

app.use(express.json())

app.post(`/post/`, async (req, res) => {
    const { title, content, authorName, authorEmail } = req.body

    const result = await prisma.post.create({
        data: {
            title,
            content,
            authorName,
            authorEmail
        },
    })

    res.json(result)
})

app.get('/post/', async (req, res) => {

    const posts = await prisma.post.findMany({})

    res.json(posts)
})

const server = app.listen(8000, () =>
console.log(`
    🚀 Server ready at: http://localhost:8000
    ⭐️ See sample requests: http://pris.ly/e/ts/rest-express#3-using-the-rest-api`),
)