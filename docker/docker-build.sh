#!/bin/bash
# Jenkins 自动部署 Spring boot 服务，当前脚本需要在jenkins容器中使用gradle触发执行
# ----------------------------------------------------------------------------------------------------------------------

# 参数： 服务名、版本号
S_NAME=$1
S_VERSION=$2
JAR_NAME=$S_NAME-$S_VERSION.jar

# 复制编译文件到docker目录
rm -f ./docker/*.jar
/bin/cp -rf ./build/libs/$JAR_NAME ./docker/eureka.jar

# ----------------------------------------------------------------------------------------------------------------------
# 推送镜像到仓库
S_HUB="hub.unionlive.com/$S_NAME:$S_VERSION"
docker build --tag $S_HUB ./docker/
docker push $S_HUB
echo "> docker push $S_HUB"
# ----------------------------------------------------------------------------------------------------------------------

echo "build push success ......"

