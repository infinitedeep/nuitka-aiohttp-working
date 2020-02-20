Issue tracked at [Nuitka/#](https://github.com/Nuitka/Nuitka/issues/)

This repo illustrates a working version of nutika and aiohttp.Any exception in the coroutine where we use aiohttp to make network request when wrapped in try catch, swallows the exception and the exception is not bubbled up

Python: 3.6.10
Nutika: 0.6.7


### How to run

```
# ./run.sh
( ... docker building the image ... )

main: invoking get_magic message
utils.network:get entry
Cannot connect to host nothinghere:80 ssl:default [Name or service not known]
error while getting message from http://nothinghere
utils.network:get exit
main: invoked get_magic message


```
