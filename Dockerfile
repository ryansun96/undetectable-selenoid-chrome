FROM selenoid/chrome:100.0
RUN apt update && apt install python3-pip && pip3 install undetected_chromedriver
WORKDIR /app

RUN python3 <<EOF
from undetected_chromedriver.patcher import Patcher
Patcher("/usr/bin/chromedriver").auto()
EOF
