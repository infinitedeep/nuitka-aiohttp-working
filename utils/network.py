import aiohttp

async def get():
    print('utils.network:get entry')
    try:
        async with aiohttp.ClientSession() as session:
            async with session.get("http://nothinghere") as response:
                res = await response.text()
                if response.status >= 200 and response.status < 300:
                    print('successfully got message: ', res)
                else:
                    print('could not get message:\n');
    except Exception as e:
        print(e)
        print('error while getting message from http://nothinghere')

    print('utils.network:get exit')
