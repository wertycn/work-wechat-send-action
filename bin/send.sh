#!/bin/bash

# TODO:参数检查


WORK_DIR=`dirname $0`
content_script='.'${MSG_TYPE}'.content="'${CONTENT}'"'
cat $WORK_DIR/../template/${MSG_TYPE}.json | jq .agentid=$AGENT_ID | jq '.touser="@all"' |  jq "$content_script"  > ./.__wechat_message_body.json
MESSAGE_BODY=`cat ./.__wechat_message_body.json | jq .`
echo "$MESSAGE_BODY"
# 获取token
token_response=`curl -s -S "https://qyapi.weixin.qq.com/cgi-bin/gettoken?corpid=${WECHAT_ID}&corpsecret=${AGENT_SECRET}"`
# 判断请求是否成功
errcode=`echo $token_response | jq .errcode`
if [ "x$errcode" != "x0" ]; then
    echo "request token failed!"
    echo $token_response | jq .
    exit 1;
fi

ACCESS_TOKEN=`echo $token_response | jq -r .access_token`

#
#curl -d "${MESSAGE_BODY}" "https://qyapi.weixin.qq.com/cgi-bin/message/send?access_token=${ACCESS_TOKEN}"
curl -s -S -d "@.__wechat_message_body.json" "https://qyapi.weixin.qq.com/cgi-bin/message/send?access_token=${ACCESS_TOKEN}"


rm -rf ./.__wechat_message_body.json
