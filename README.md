Issue tracked at [Nuitka/#](https://github.com/Nuitka/Nuitka/issues/)

This repo illustrates a bug that occurs when using nuitka with asyncio coroutines.When you make a network call to a non existent url using aiohttp in a coroutine assume get(), and you wrap the code inside get() with a try catch so that any network issues are swallowed, the coroutine which awaits on get() is still returning `RuntimeError: cannot reuse already awaited compiled_coroutine get`.

Python: 3.6.10
Nutika: 0.6.7

# Expected
1) The exception is swallowed, but still I dont see the message `utils.magic:get_message exit` which should have been present.

### How to trigger the bug

```
# ./run.sh
( ... docker building the image ... )

main: invoking get_magic message
utils.magic:get_message entry
utils.network:get entry
Cannot connect to host nothinghere:80 ssl:default [Name or service not known]
error while getting message from http://nothinghere
utils.network:get exit
Traceback (most recent call last):
  File "main.py", line 11, in sayHello
    await magic.get_message()
  File "/app/utils/magic.py", line 6, in get_message
RuntimeError: cannot reuse already awaited compiled_coroutine get

```
