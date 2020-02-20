#!/usr/bin/python3

import asyncio
import traceback

from utils import network

async def sayHello():
    try:
        print('main: invoking get_magic message')
        await network.get()
        print('main: invoked get_magic message')
    except Exception:
        traceback.print_exc()

def main():
    loop = asyncio.get_event_loop()
    loop.run_until_complete(sayHello())

if __name__ == "__main__":
    main()
