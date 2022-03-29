# radsecproxy_log_analysis
Python script to analyse radsecproxy logs and create utilisation graphs on a per-institution level


Example run script:

    #!/bin/bash

    LOG_DIR="/var/log/radsecproxy/"

    BASE_DIR="/opt/eduroam_statistics"
    HTML_DIR="${BASE_DIR}/html"
    STATISTICS_DIR="${BASE_DIR}/statistics"
    UNIQUE_USERS_DIR="${BASE_DIR}/unique-users"
    IHL_CONFIG_FILE="${BASE_DIR}/ihlconfig.json"

    CONTAINER="spgreen/radsecproxy_log_analysis:20220329-3.10.4"
    CONTAINER_WORK_DIR="/usr/src/app"
    
    docker run --rm \
            -v /etc/localtime:/etc/localtime:ro \
            -v /etc/timezone:/etc/timezone:ro \
            -v ${IHL_CONFIG_FILE}:${CONTAINER_WORK_DIR}/ihlconfig.json:ro \
            -v ${LOG_DIR}:${CONTAINER_WORK_DIR}/logs:ro \
            -v ${STATISTICS_DIR}:${CONTAINER_WORK_DIR}/statistics \
            -v ${UNIQUE_USERS_DIR}:${CONTAINER_WORK_DIR}/uniqueUsersFiles \
            -v ${HTML_DIR}:${CONTAINER_WORK_DIR}/html \
            ${CONTAINER}

