import json

with open('restful-booker.postman_collection.json', 'r') as f:
    col = json.load(f)

for item in col.get('item', []):
    if item.get('item'):
        for sub in item.get('item'):
            if sub.get('name') == 'CreateToken':
                for event in sub.get('event', []):
                    if event.get('listen') == 'test':
                        print("".join(event.get('script', {}).get('exec', [])))
