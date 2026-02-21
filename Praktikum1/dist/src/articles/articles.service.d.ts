import { CreateArticleDto } from './dto/create-article.dto';
import { UpdateArticleDto } from './dto/update-article.dto';
import { PrismaService } from '../prisma/prisma.service';
export declare class ArticlesService {
    private prisma;
    constructor(prisma: PrismaService);
    create(createArticleDto: CreateArticleDto): import(".prisma/client").Prisma.Prisma__ArticleClient<{
        id: number;
        createdAt: Date;
        updatedAt: Date;
        title: string;
        description: string | null;
        body: string;
        published: boolean;
        authorId: number | null;
    }, never, import("@prisma/client/runtime/library").DefaultArgs>;
    findAll(): import(".prisma/client").Prisma.PrismaPromise<({
        author: {
            id: number;
            email: string;
            name: string | null;
            password: string;
            createdAt: Date;
            updatedAt: Date;
        } | null;
    } & {
        id: number;
        createdAt: Date;
        updatedAt: Date;
        title: string;
        description: string | null;
        body: string;
        published: boolean;
        authorId: number | null;
    })[]>;
    findDrafts(): import(".prisma/client").Prisma.PrismaPromise<({
        author: {
            id: number;
            email: string;
            name: string | null;
            password: string;
            createdAt: Date;
            updatedAt: Date;
        } | null;
    } & {
        id: number;
        createdAt: Date;
        updatedAt: Date;
        title: string;
        description: string | null;
        body: string;
        published: boolean;
        authorId: number | null;
    })[]>;
    findOne(id: number): import(".prisma/client").Prisma.Prisma__ArticleClient<({
        author: {
            id: number;
            email: string;
            name: string | null;
            password: string;
            createdAt: Date;
            updatedAt: Date;
        } | null;
    } & {
        id: number;
        createdAt: Date;
        updatedAt: Date;
        title: string;
        description: string | null;
        body: string;
        published: boolean;
        authorId: number | null;
    }) | null, null, import("@prisma/client/runtime/library").DefaultArgs>;
    update(id: number, updateArticleDto: UpdateArticleDto): import(".prisma/client").Prisma.Prisma__ArticleClient<{
        id: number;
        createdAt: Date;
        updatedAt: Date;
        title: string;
        description: string | null;
        body: string;
        published: boolean;
        authorId: number | null;
    }, never, import("@prisma/client/runtime/library").DefaultArgs>;
    remove(id: number): import(".prisma/client").Prisma.Prisma__ArticleClient<{
        id: number;
        createdAt: Date;
        updatedAt: Date;
        title: string;
        description: string | null;
        body: string;
        published: boolean;
        authorId: number | null;
    }, never, import("@prisma/client/runtime/library").DefaultArgs>;
}
