# hashy
Generating and Checking Hashes
***
## Currently Supported Algorithms
  - md5 
  - sha256
  - sha512
  - b2
  - b3
  - xxh32
  - xxh64
  - xxh128
## Features
  - Easy to use
  - Output generated Hash to File
  - Automatically install needed packages using apt
## Usage
#### Generating:
  - ./hashy.sh gen "text" -algo
#### Checking:
  - ./hashy.sh check "text" "hash" -algo
#### Flags
  - -o Output Generated Hash to ./output.txt
  - --help / -h Display Help
