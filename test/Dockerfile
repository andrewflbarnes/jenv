FROM centos:7

RUN yum install -y https://cdn.azul.com/zulu/bin/zulu-repo-1.0.0-1.noarch.rpm
RUN yum install -y zulu18-jdk
RUN yum install -y zulu11-jdk
RUN yum install -y java-11-openjdk
RUN yum install -y java-1.7.0-openjdk
RUN yum install -y java-1.8.0-openjdk
RUN ARCH=$(arch); \
[[ "$ARCH" == "x86_64" ]] && ARCH=amd64; \
curl -L https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-22.3.3/graalvm-ce-java11-linux-$ARCH-22.3.3.tar.gz | tar xzf - -C /usr/lib/jvm/

ADD ./ /root/.jenv

RUN echo 'export PATH="$HOME/.jenv/bin:$PATH"' >> ~/.bash_profile
RUN echo 'eval "$(jenv init -)"' >> ~/.bash_profile

