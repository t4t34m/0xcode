import asyncio #pip install asyncio aiohttp
import aiohttp
import time
websites = ["http://target.com/index.php?id=1", "http://target.com/index.php?id=2", ".....etc"]
async def get(url, session):
    try:
        async with session.get(url=url) as response:
            resp = await response.read()
            print("Successfully got url {} with resp of length {}.".format(url, len(resp)))
    except Exception as e:
        print("Unable to get url {} due to {}.".format(url, e.__class__))
async def main(urls):
    async with aiohttp.ClientSession() as session:
        ret = await asyncio.gather(*[get(url, session) for url in urls])
    print("Finalized all. Return is a list of len {} outputs.".format(len(ret)))
urls = websites.split("\n")
start = time.time()
asyncio.run(main(urls))
end = time.time()
print("Done in {} SEC".format(end - start))
