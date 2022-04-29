FROM selenoid/chrome:100.0
USER root
RUN apt update && apt install python3-pip && pip3 install undetected_chromedriver
RUN python3 <<EOF
from undetected_chromedriver.patcher import Patcher
Patcher("/usr/bin/chromedriver").auto()
EOF
USER selenium
