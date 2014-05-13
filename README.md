# PudDown 个人博客

受 `Medium` 启发，想实现一个自己的博客，此项目为成长项目，非商业化。

## 项目说明：
项目分两部分，Web客户端和服务器端，两端完全独立，可以分为两个项目，为以后其他平台方便扩展。

### Web客户端：
* JS采用`jQuery`、`EmberJS`组合开发；
* CSS采用`Bootstrap`框架。

### 服务器端：
* 使用Grape做API Resources；
* 使用oauth2做API授权；
* 采用 `Mysql` + `Redis`组合方法实现持久化存储；
* 采用`memcached`做缓存服务。

域名：www.puddown.com

## 功能
* 文章
* 评论