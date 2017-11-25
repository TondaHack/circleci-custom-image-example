FROM buildpack-deps:jessie

RUN mkdir -p /example && \
  echo "#!/bin/sh\necho 'Hello world!'" > /example/hello.sh && \
  chmod +x /example/hello.sh

CMD [ "/example/hello.sh" ]
