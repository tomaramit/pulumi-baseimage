FROM node:10.15.0-slim

RUN apt-get update && apt-get -y install curl && apt-get -y install dos2unix

WORKDIR /root/bin/
ENV PATH="/root/bin:${PATH}"
ENV PATH="/root/.pulumi/bin:${PATH}"

RUN curl -fsSL https://get.pulumi.com | sh
RUN curl -Lo kubectl  https://amazon-eks.s3-us-west-2.amazonaws.com/1.11.5/2018-12-06/bin/linux/amd64/kubectl
RUN curl -Lo aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.11.5/2018-12-06/bin/linux/amd64/aws-iam-authenticator

COPY run.sh /src/app/

RUN dos2unix /src/app/run.sh
RUN chmod a+x /src/app/run.sh

WORKDIR /src/app/

ENTRYPOINT ["./run.sh"]
