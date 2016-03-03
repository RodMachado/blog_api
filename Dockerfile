FROM azukiapp/ruby:2.2.3

RUN cd /tmp && \
  curl -L -O https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2 && \
  tar xjf phantomjs-2.1.1-linux-x86_64.tar.bz2 && \
  mv phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/bin/phantomjs && \
  rm phantomjs-2.1.1-linux-x86_64.tar.bz2
