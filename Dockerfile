#   Copyright 2019 Decipher Technology Studios
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.

FROM centos:7

LABEL maintainer=engineering@deciphernow.com

ARG VERSION

ENV CLUSTER_NAME local
ENV DOMAIN_NAME localhost
ENV NODE_NAME localhost
ENV NODE_NAMES localhost.localhost

ENV ES_PATH_CONF /opt/elastic/elasticsearch/config

RUN yum update -y

RUN yum install -y \
  ruby

WORKDIR /opt/elastic/elasticsearch

RUN curl -L https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-${VERSION}-linux-x86_64.tar.gz | tar -xz --strip-components=1

COPY /files /

RUN mkdir -p /var/lib/elasticsearch
RUN chown -R 0:0 /opt/elastic/elasticsearch /var/lib/elasticsearch
RUN chmod -R g=u /opt/elastic/elasticsearch /var/lib/elasticsearch

EXPOSE 9200
USER 1000
VOLUME /var/lib/elasticsearch

ENTRYPOINT ["/usr/local/bin/entrypoint"]

CMD ["/opt/elastic/elasticsearch/bin/elasticsearch"]
