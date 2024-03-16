import asyncio
import websockets

async def handle_websocket(websocket, path):
    # Handle incoming messages and send responses
    async for message in websocket:
        # Process the received message
        response = process_message(message)

        # Send the response back to the client
        await websocket.send(response)

# Function to process the received message
def process_message(message):
    # Process the message and generate a response
    response = "Received: " + message
    return response

# Start the WebSocket server
start_server = websockets.serve(handle_websocket, "localhost", 8765)

# Run the event loop
asyncio.get_event_loop().run_until_complete(start_server)
asyncio.get_event_loop().run_forever()