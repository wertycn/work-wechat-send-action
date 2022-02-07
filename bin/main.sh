#!/usr/bin/env bash

#    - ${{ inputs.wechat_id }}
#    - ${{ inputs.agent_secret }}
#    - ${{ inputs.agent_id }}
#    - ${{ inputs.to_user }}
#    - ${{ inputs.msgtype }}
#    - ${{ inputs.content }}
#    - ${{ inputs.cache_path }}
WECHAT_ID=$1
AGENT_SECRET=$2
AGENT_ID=$3
TO_USER=$4
MSG_TYPE=$5
CONTENT=$6
CACHE_PATH=$7
SEND_STEP=$8


if [ "x$SEND_STEP" != "xmain" ]; then
    echo "::notice send_step param value is not main , skip exec"
    exit 0;
fi

WORK_DIR=`dirname $0`
source $WORK_DIR/send.sh