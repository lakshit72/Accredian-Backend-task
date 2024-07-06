var express = require('express');
const { PrismaClient } = require('@prisma/client');


var app = express();
const prisma = new PrismaClient();

const PORT = 8080;

app.use(express.json());

app.post('/refer',async (req,res)=>{
    const { email, name, PhoneNo, RefEmail } = req.body;
    try{
        const result = await prisma.Refferees.create({
            data:{
                email,
                name,
                PhoneNo
            }
        });
        
        const referrer = await prisma.User.findUnique({
            where:{
                email:RefEmail
            }
        })

        const refRes = prisma.Reffers.create({
            data:{
                Refferrer:{connect:{Id:referrer.Id}},
                Refferee:{connect:{Id:result.Id}}
            }
        })
        res.json({
            Msg:"Success",
            Id:result.Id
        });
    }catch(e){
        console.log(e);
        res.status(500).json({
            error:"Server Error!"
        })
    }
});

app.listen(PORT,()=>{
    console.log("Server Started");
});