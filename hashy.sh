#!/bin/bash

## Made by Reaperfish
## Github: https://github.com/Fish2708/hashy

clear

echo "██╗  ██╗ █████╗ ███████╗██╗  ██╗██╗   ██╗"
echo "██║  ██║██╔══██╗██╔════╝██║  ██║╚██╗ ██╔╝"
echo "███████║███████║███████╗███████║ ╚████╔╝ "
echo "██╔══██║██╔══██║╚════██║██╔══██║  ╚██╔╝  "
echo "██║  ██║██║  ██║███████║██║  ██║   ██║   "
echo "╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝   ╚═╝   "
echo ""

if [[ $* == --help || $* == -h ]]; then
    echo "Syntax: Generate: hashy gen 'input'"
    echo "        Check: hashy check 'cleartext' 'hash'"
    echo "Flags: -o : output generated hash to the file ./output.txt"
    echo "       -h or --help : Show this Help"
    echo ""
    echo "Supported Algorithms"
    echo "  -md5"
    echo "  -sha256"
    echo "  -sha512"
    echo "  -b2"
    echo "  -b3"
    echo "  -xxh32"
    echo "  -xxh64"
    echo "  -xxh128"
    exit 1
fi

if ! [ -x "$(command -v md5sum)" ]; then
  echo 'Error: md5sum is not installed.' >&2
  echo "Installing core-utils in 5 seconds..."
  sleep 5
  sudo apt install coreutils -y
fi

if ! [ -x "$(command -v sha256sum)" ]; then
  echo 'Error: sha256sum is not installed.' >&2
  echo "Installing core-utils in 5 seconds..."
  sleep 5
  sudo apt install coreutils -y
fi

if ! [ -x "$(command -v sha512sum)" ]; then
  echo 'Error: sha512sum is not installed.' >&2
  echo "Installing core-utils in 5 seconds..."
  sleep 5
  sudo apt install coreutils -y
fi

if ! [ -x "$(command -v xxhsum)" ]; then
  echo 'Error: xxhsum is not installed.' >&2
  echo "Installing xxhash in 5 seconds..."
  sleep 5
  sudo apt install xxhash -y
fi

if ! [ -x "$(command -v b2sum)" ]; then
  echo 'Error: b2sum is not installed.' >&2
  echo "Installing core-utils in 5 seconds..."
  sleep 5
  sudo apt install coreutils -y
fi

if ! [ -x "$(command -v b3sum)" ]; then
  echo 'Error: b3sum is not installed.' >&2
  echo "Installing b3sum in 5 seconds..."
  sleep 5
  sudo apt install b3sum -y
fi

if [[ $1 == "" ]]; then
    echo "Syntax: Generate: hashy gen 'input'"
    echo "        Check: hashy check 'cleartext' 'hash'"
elif [[ $1 == "gen" && $* == -md5 ]]; then
    echo "Hash Algo: md5"
    echo "Input: $2"
    out=$(echo "$2" | md5sum | tr "-" " ")
    echo "Generated Hash: $out"
    if [[ $* == -o ]]; then
        echo "$out" > output.txt
        echo "Output file: ./output.txt"
    fi
elif [[ $1 == "check" && $* == -md5 ]]; then
    generated=$(echo "$2" | md5sum | tr "-" " ")
    echo "Hash Algo: md5"
    echo "Input: $2"
    echo "Hash of your input: $generated"
    echo "Input hash:         $3"
    in=$(echo "=$(sed -e 's/[[:space:]]*$//'<<<"${3}")=")
    genfixed=$(echo "=$(sed -e 's/[[:space:]]*$//'<<<"${generated}")=")
    if [[ $genfixed == $in ]]; then
        echo "Result: Yes"
    else
        echo "Result: No"
    fi
fi

if [[ $1 == "gen" && $* == -sha256 ]]; then
    echo "Hash Algo: sha256"
    echo "Input: $2"
    out=$(echo "$2" | sha256sum | tr "-" " ")
    echo "Generated Hash: $out"
    if [[ $* == -o ]]; then
        echo "$out" > output.txt
        echo "Output file: ./output.txt"
    fi
elif [[ $1 == "check" && $* == -sha256 ]]; then
    generated=$(echo "$2" | sha256sum | tr "-" " ")
    echo "Hash Algo: sha256"
    echo "Input: $2"
    echo "Hash of your input: $generated"
    echo "Input hash:         $3"
    in=$(echo "=$(sed -e 's/[[:space:]]*$//'<<<"${3}")=")
    genfixed=$(echo "=$(sed -e 's/[[:space:]]*$//'<<<"${generated}")=")
    if [[ $genfixed == $in ]]; then
        echo "Result: Yes"
    else
        echo "Result: No"
    fi
fi

if [[ $1 == "gen" && $* == -sha512 ]]; then
    echo "Hash Algo: sha512"
    echo "Input: $2"
    out=$(echo "$2" | sha512sum | tr "-" " ")
    echo "Generated Hash: $out"
    if [[ $* == -o ]]; then
        echo "$out" > output.txt
        echo "Output file: ./output.txt"
    fi
elif [[ $1 == "check" && $* == -sha512 ]]; then
    generated=$(echo "$2" | sha512sum | tr "-" " ")
    echo "Hash Algo: sha512"
    echo "Input: $2"
    echo "Hash of your input: $generated"
    echo "Input hash:         $3"
    in=$(echo "=$(sed -e 's/[[:space:]]*$//'<<<"${3}")=")
    genfixed=$(echo "=$(sed -e 's/[[:space:]]*$//'<<<"${generated}")=")
    if [[ $genfixed == $in ]]; then
        echo "Result: Yes"
    else
        echo "Result: No"
    fi
fi

if [[ $1 == "gen" && $* == -b2 ]]; then
    echo "Hash Algo: b2"
    echo "Input: $2"
    out=$(echo "$2" | b2sum | tr "-" " ")
    echo "Generated Hash: $out"
    if [[ $* == -o ]]; then
        echo "$out" > output.txt
        echo "Output file: ./output.txt"
    fi
elif [[ $1 == "check" && $* == -b2 ]]; then
    generated=$(echo "$2" | b2sum | tr "-" " ")
    echo "Hash Algo: b2"
    echo "Input: $2"
    echo "Hash of your input: $generated"
    echo "Input hash:         $3"
    in=$(echo "=$(sed -e 's/[[:space:]]*$//'<<<"${3}")=")
    genfixed=$(echo "=$(sed -e 's/[[:space:]]*$//'<<<"${generated}")=")
    if [[ $genfixed == $in ]]; then
        echo "Result: Yes"
    else
        echo "Result: No"
    fi
fi

if [[ $1 == "gen" && $* == -b3 ]]; then
    echo "Hash Algo: b3"
    echo "Input: $2"
    out=$(echo "$2" | b3sum | tr "-" " ")
    echo "Generated Hash: $out"
    if [[ $* == -o ]]; then
        echo "$out" > output.txt
        echo "Output file: ./output.txt"
    fi
elif [[ $1 == "check" && $* == -b3 ]]; then
    generated=$(echo "$2" | b2sum | tr "-" " ")
    echo "Hash Algo: b3"
    echo "Input: $2"
    echo "Hash of your input: $generated"
    echo "Input hash:         $3"
    in=$(echo "=$(sed -e 's/[[:space:]]*$//'<<<"${3}")=")
    genfixed=$(echo "=$(sed -e 's/[[:space:]]*$//'<<<"${generated}")=")
    if [[ $genfixed == $in ]]; then
        echo "Result: Yes"
    else
        echo "Result: No"
    fi
fi

if [[ $1 == "gen" && $* == -xxh32 ]]; then
    echo "Hash Algo: xxh32"
    echo "Input: $2"
    out=$(echo "$2" | xxh32sum | cut -d " " -f 1)
    echo "Generated Hash: $out"
    if [[ $* == -o ]]; then
        echo "$out" > output.txt
        echo "Output file: ./output.txt"
    fi
elif [[ $1 == "check" && $* == -xxh32 ]]; then
    generated=$(echo "$2" | xxh32sum | cut -d " " -f 1)
    echo "Hash Algo: xxh32"
    echo "Input: $2"
    echo "Hash of your input: $generated"
    echo "Input hash:         $3"
    in=$(echo "=$(sed -e 's/[[:space:]]*$//'<<<"${3}")=")
    genfixed=$(echo "=$(sed -e 's/[[:space:]]*$//'<<<"${generated}")=")
    if [[ $genfixed == $in ]]; then
        echo "Result: Yes"
    else
        echo "Result: No"
    fi
fi

if [[ $1 == "gen" && $* == -xxh64 ]]; then
    echo "Hash Algo: xxh64"
    echo "Input: $2"
    out=$(echo "$2" | xxh64sum | cut -d " " -f 1)
    echo "Generated Hash: $out"
    if [[ $* == -o ]]; then
        echo "$out" > output.txt
        echo "Output file: ./output.txt"
    fi
elif [[ $1 == "check" && $* == -xxh64 ]]; then
    generated=$(echo "$2" | xxh64sum | cut -d " " -f 1)
    echo "Hash Algo: xxh64"
    echo "Input: $2"
    echo "Hash of your input: $generated"
    echo "Input hash:         $3"
    in=$(echo "=$(sed -e 's/[[:space:]]*$//'<<<"${3}")=")
    genfixed=$(echo "=$(sed -e 's/[[:space:]]*$//'<<<"${generated}")=")
    if [[ $genfixed == $in ]]; then
        echo "Result: Yes"
    else
        echo "Result: No"
    fi
fi

if [[ $1 == "gen" && $* == -xxh128 ]]; then
    echo "Hash Algo: xxh128"
    echo "Input: $2"
    out=$(echo "$2" | xxh128sum | cut -d " " -f 1)
    echo "Generated Hash: $out"
    if [[ $* == -o ]]; then
        echo "$out" > output.txt
        echo "Output file: ./output.txt"
    fi
elif [[ $1 == "check" && $* == -xxh128 ]]; then
    generated=$(echo "$2" | xxh128sum | cut -d " " -f 1)
    echo "Hash Algo: xxh128"
    echo "Input: $2"
    echo "Hash of your input: $generated"
    echo "Input hash:         $3"
    in=$(echo "=$(sed -e 's/[[:space:]]*$//'<<<"${3}")=")
    genfixed=$(echo "=$(sed -e 's/[[:space:]]*$//'<<<"${generated}")=")
    if [[ $genfixed == $in ]]; then
        echo "Result: Yes"
    else
        echo "Result: No"
    fi
fi
