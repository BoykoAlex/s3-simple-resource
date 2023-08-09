ARG base_image

FROM ${base_image}

RUN apt update && apt upgrade -y
RUN apt install python3 -y
RUN apt install python3-pip -y
RUN apt install wget -y

# get the latest straight from the source - upstream version has known vulns
RUN wget https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64 \
	&& mv jq-linux64 /usr/local/bin/jq \
	&& chmod +x /usr/local/bin/jq
RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install --upgrade awscli
RUN python3 -m pip install --upgrade wheel
RUN python3 -m pip install --upgrade setuptools

ADD assets/ /opt/resource/
