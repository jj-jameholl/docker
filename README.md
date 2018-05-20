# docker
docker for lnmp

## liunx 
docker官方提供多种缩减版的liunx平台，我用得比较多的是aipine，它使用apk命令来安装服务，apk add ...,apk del ..., virtual指令可以方便的将多个服务打包成一个进行安装或卸载，
具体apk支持操作可以进入对应容器查看帮助文档。

## nginx
我这里是将nginx的配置文件在构建镜像是copy给了image，这样做的后果是，一旦镜像生成后，这个nginx镜像的配置文件将无法更改，所以你大可跳过这一步，在composer.yml文件
中将这个配置文件挂载到docker容器目录下，这样可以方便修改配置。

## mysql
注意点有两个，一是需要在composer.yml文件中加上command : mysqld --default-authentication-plugin=mysql_native_password，这样做的目的是强制mysql使用加密密码的方式
因为在某些环境下平台与mysql的加密方式可能不兼容，导致密码一直错误。二是为了数据持久化，你需要将mysql容器的/var/lib/mysql目录关联到本地来，即将数据保存到本地，实现持久化。

## php 
php镜像我是直接从官方库拉下来，想了解php的dockerfile内容，附上链接：https://github.com/docker-library/php/blob/b045ba7c51ceed8a495beb8ea7274df48a3c70e1/7.2/alpine3.7/fpm/Dockerfile

##continue

