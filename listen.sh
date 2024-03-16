#!/usr/bin/bash

# Accept command line args. The first parameter should be a port number to listen on.
# Make sure that the value is a number.
# Also, make sure that the port number is between 1024 and 65535.
# If the port number is not valid, print an error message and exit the script.
# If the port number is valid, start netcat in listen mode on the specified port.
# If netcat fails to start, print an error message and exit the script.

# Check if the number of arguments is correct
if [ $# -ne 1 ]; then
    echo "Usage: $0 <port>"
    exit 1
fi 

# Check if the port number is a number
if ! [[ $1 =~ ^[0-9]+$ ]]; then
    echo "Error: $1 is not a number"
    exit 1
fi

# Check if the port number is between 1024 and 65535
if [ $1 -lt 1024 ] || [ $1 -gt 65535 ]; then
    echo "Error: $1 is not a valid port number"
    exit 1
fi

# Start netcat in listen mode on the specified port
nc -l -p $1

# The incomming connection is a websocket connection, generate the response to accept the connection
# HTTP/1.1 101 Switching Protocols
# Upgrade: websocket
# Connection: Upgrade
# Sec-WebSocket-Accept: s3pPLMBiTxaQ9kYGzzhZRbK+xOo=
# Sec-WebSocket-Protocol: chat
# Sec-WebSocket-Version: 13
# echo -e "HTTP/1.1 101 Switching Protocols\r\nUpgrade: websocket\r\nConnection: Upgrade\r\nSec-WebSocket-Accept: s3pPLMBiTxaQ9kYGzzhZRbK+xOo=\r\nSec-WebSocket-Protocol: chat\r\nSec-WebSocket-Version: 13\r\n"

# extract the web socket connection details and respond to the client with the appropriate response
# echo -e "HTTP/1.1 101 Switching Protocols\r\nUpgrade: websocket\r\nConnection: Upgrade\r\nSec-WebSocket-Accept: s3pPLMBiTxaQ9kYGzzhZRbK+xOo=\r\nSec-WebSocket-Protocol: chat\r\nSec-WebSocket-Version: 13\r\n" | nc -l -p $1
