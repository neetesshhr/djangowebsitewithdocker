FROM ubuntu:latest
RUN apt-get update  && apt-get install --no-install-recommends --no-install-suggests -y \
python3-pip python3-setuptools python3-dev && rm -rf /var/lib/apt/lists/*

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

#create django app inside docker container & install django

RUN mkdir /mysite
COPY . /mysite
WORKDIR /mysite
RUN pip3 install -r requirements.txt

#set permission for our bash file
RUN chmod +x /mysite/entrypoint.sh
ENTRYPOINT ["sh", "/mysite/entrypoint.sh"] 
#we run django through this later



