FROM ubuntu:14.04

RUN \
  apt-get update && \
  apt-get install -y git curl && \
  apt-get clean && rm -rf /var/lib/apt/lists/*
RUN \
  cd /opt && git clone https://github.com/sstephenson/bats.git && \
  cd /opt/bats && ./install.sh /usr/local
RUN \
  rm -rf /etc/skel && \
  useradd -c 'Test User' -m testuser

COPY . /src

RUN chown -R testuser /src

USER testuser
WORKDIR /home/testuser
ENV FRESH_LOCAL "/src"

RUN git clone https://github.com/freshshell/fresh ~/.fresh/source/freshshell/fresh
RUN ln -s /src/freshrc ~/.freshrc

COPY . /src

RUN /home/testuser/.fresh/source/freshshell/fresh/bin/fresh

CMD ~/bin/fresh update && /usr/local/bin/bats /src/tests
