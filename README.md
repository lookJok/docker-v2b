# docker-v2b
## 一款🚀多代理协议管理面板应用程序界面-V2Board-docker版本

# 启动环境
-cd /docker-v2b
-如果你需要更改数据库的名称和密码，你可以在docker-compose.yml文件中进行修改。修改完成后，运行以下命令来启动环境：
-docker compose up -d
#开始安装V2Board了。首先，我们需要进入到V2Board的Docker容器中
-docker-compose exec php-fpm bash
#我们需要下载并运行Composer，它是一个PHP的依赖管理工具：
-wget https://getcomposer.org/install -O composer.phar
-php composer.phar
-php composer.phar install
# 重启V2Board的服务
-docker-compose restart
