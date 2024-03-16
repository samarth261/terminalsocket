#!/usr/bin/bash

# Start a server to accept a websocket connectio


# Define the function
ws_handshake_key() {
    # Check if at least one parameter was passed
    if [ $# -lt 1 ]; then
        echo "Error: At least one parameter is required."
        return 1
    fi
    
    # Encode the string using base64
    local ret_key=$(printf "%s" "$1")
    ret_key+="258EAFA5-E914-47DA-95CA-C5AB0DC85B11"
    ret_key=$(printf $ret_key | openssl dgst -sha1 -binary | openssl base64)
    
    # Return the encoded string
    printf $ret_key
}


