# Github Action 企业微信消息发送插件
通过企业微信自定义应用发送通知，支持执行失败后发送失败通知、自定义模板

支持消息类型：
* 文本
* markdown

支持发送模式：
* 调用时发送
* 完成时发送
* 调用及结束时均发送

使用方式：

```yaml
- name: 缓存配置
  uses: actions/cache@v2
  with:
    path: ~/.wechat_token
    key: ${{ runner.os }}-wechat-token
    restore-keys: ${{ runner.os }}-wechat-token
- name: 企业微信markdown消息发送
  uses: wertycn/work-wechat-send-action@main
    #               --sink=wechat:?corp_id=wwd992b74a155ca424&corp_secret=k6Ot-SE5Zwp02ouyyiFO_JezSHsGDeD0FVeKtxkJDj0&agent_id=1000002&to_user=&level=Normal&label=K8S-Alert-Prod&msg_type=markdown
  with:
    wechat_id: xxxx # 企业微信id
    agent_secret: xxxx # 应用密钥
    agent_id: 1000002 #应用id
    to_user:  xx # 消息接收人，多个使用竖线|分割,默认为空发送给所有人
    cache_token: true # 缓存token 需配合cache action使用,默认不开启
    cache_path: ~/.wechat_token
    msgtype: markdown
    content: "您的会议室已经预定，稍后会同步到`邮箱` 
        >**事项详情** 
        >事　项：<font color=\"info\">开会</font> 
        >组织者：@miglioguan 
        >参与者：@miglioguan、@kunliu、@jamdeezhou、@kanexiong、@kisonwang 
        > 
        >会议室：<font color=\"info\">广州TIT 1楼 301</font> 
        >日　期：<font color=\"warning\">2018年5月18日</font> 
        >时　间：<font color=\"comment\">上午9:00-11:00</font> 
        > 
        >请准时参加会议。 
        > 
        >如需修改会议信息，请点击：
        >[修改会议信息](https://work.weixin.qq.com)"
```

自定义action参考文档
https://docs.github.com/cn/actions/creating-actions/about-custom-actions#further-reading

