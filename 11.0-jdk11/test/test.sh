set -e

export ANSI_YELLOW="\e[1;33m"
export ANSI_GREEN="\e[32m"
export ANSI_RESET="\e[0m"

echo -e "\n $ANSI_YELLOW *** testing docker run - jetty *** $ANSI_RESET \n"

echo -e "$ANSI_YELLOW Display current directory: $ANSI_RESET"

docker build . --tag quay.io/ibmz/jetty:latest

docker run -d -p 80:8080 -p 443:8443 --name jet quay.io/ibmz/jetty:latest

docker logs jet

curl localhost:443

docker stop jet

echo -e "\n $ANSI_GREEN *** TEST COMPLETED SUCESSFULLY *** $ANSI_RESET \n"
