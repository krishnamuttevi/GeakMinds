import json, time, random
from azure.eventhub import EventHubProducerClient, EventData
from faker import Faker

fake = Faker()
conn_str = "enter"
eventhub_name = "enter"

producer = EventHubProducerClient.from_connection_string(conn_str, eventhub_name=eventhub_name)

def generate_transaction():
    return {
        "transaction_id": f"TX-{random.randint(1000,9999)}",
        "product_id": f"P{random.randint(1, 10):03d}",
        "store_id": f"S{random.randint(1, 5):02d}",
        "channel": random.choice(["online", "store"]),
        "timestamp": fake.date_time_this_year().isoformat(),
        "quantity": random.randint(1, 5),
        "price": round(random.uniform(10.0, 100.0), 2)
    }

while True:
    event_data = EventData(json.dumps(generate_transaction()))
    producer.send_batch([event_data])
    print("Event sent")
    time.sleep(1)
