FROM alpine

RUN apk add --no-cache curl coreutils
COPY producer-control-switch.sh /producer-control-switch.sh
RUN chmod +x /producer-control-switch.sh
CMD ["./producer-control-switch.sh"]
