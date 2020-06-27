// hello.ts

import {
    APIGatewayProxyEvent,
    APIGatewayProxyResult,
    Context
  } from "https://deno.land/x/lambda/mod.ts";
  
  export async function handler(
    event: APIGatewayProxyEvent,
    context: Context
  ): Promise<APIGatewayProxyResult> {
    const res = {
      body: `Welcome to deno ${Deno.version.deno} 🦕`,
      headers: { "content-type": "text/html;charset=utf8" },
      statusCode: 200
    };
    console.log(res)
    return res
  }

console.log(handler({} as APIGatewayProxyEvent,{} as Context))