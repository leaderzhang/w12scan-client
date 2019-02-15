FROM debian
MAINTAINER w8ay@qq.com
ENV LC_ALL C.UTF-8
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN set -x \
    && apt update \
    && apt install python3 nmap masscan python3-pip -y
RUN mkdir -p /opt/w12scan-client
COPY . /opt/w12scan-client

RUN set -x \
    && pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple -r /opt/w12scan-client/requirements.txt

WORKDIR /opt/w12scan-client
ENTRYPOINT ["python3","main.py"]