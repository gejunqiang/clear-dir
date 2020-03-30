FROM alpine:3.7

RUN apk add --no-cache bash

COPY clear-dir.sh /usr/local/bin/clear-dir.sh

RUN chmod +x /usr/local/bin/clear-dir.sh && ln -svf /usr/local/bin/clear-dir.sh /usr/local/bin/clear-dir

CMD ["clear-dir"]
