FROM ministryofjustice/cloud-platform-tools:2.7.0

COPY ecr-deletion-check.sh /ecr-deletion-check.sh

RUN chmod +x /ecr-deletion-check.sh

ENTRYPOINT ["/ecr-deletion-check.sh"]
