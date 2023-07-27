#!/usr/bin/env sh
#
# Build docker image
#

set -eu

function check_openssl() {
    # Check if openssl is installed
    if ! command -v openssl &> /dev/null
    then
        echo "OpenSSL could not be found. Install it now? (yes/no)"

        # Read user input
        read answer

        # Check user input
        if [ "$answer" != "${answer#[Yy]}" ] ;then
            # Detects which OS and package management system is being used and installs openssl
            if [[ "$OSTYPE" == "linux-gnu"* ]]; then
                # Assume user has either apt or yum
                if command -v apt &> /dev/null
                then
                    sudo apt update -y && sudo apt install openssl -y
                elif command -v yum &> /dev/null
                then
                    sudo yum update -y && sudo yum install openssl -y
                else
                    echo "Could not install OpenSSL. Please manually install OpenSSL and rerun this script."
                    exit 1
                fi
            elif [[ "$OSTYPE" == "darwin"* ]]; then
                # MacOS
                brew install openssl
            else
                echo "Could not install OpenSSL. Please manually install OpenSSL and rerun this script."
                exit 1
            fi
        else
            echo "OpenSSL is not installed. Please install OpenSSL and rerun this script."
            exit 1
        fi
    else
        echo "OpenSSL is installed."
    fi
}



function renew_certs() {
    # Check if openssl is installed
    check_openssl

    # Define the directory
    local dir="./certs"

    # Check if the directory exists
    if [ ! -d "$dir" ]; then
        echo "Directory $dir does not exist."
        exit 1
    fi

    # Delete all files in the directory
    rm -rf "$dir"/*

    # Generate new certificates using openssl
    openssl req -x509 -newkey rsa:4096 -keyout "$dir/key.pem" -out "$dir/cert.pem" -days 365 -nodes -subj "/CN=localhost"
}

test $# -eq 0 && (echo Availbale funcs:;echo; declare -F | awk '{print $3}'; exit 1)

$@ # Run the function passed as the first argument