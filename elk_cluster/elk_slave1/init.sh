#./bin/bash
# 定义颜色
BLUE_COLOR="\033[36m"
RED_COLOR="\033[31m"
GREEN_COLOR="\033[32m"
VIOLET_COLOR="\033[35m"
RES="\033[0m"

echo -e "${BLUE_COLOR}# ######################################################################${RES}"
echo -e "${BLUE_COLOR}#                       Docker ELK Shell Script                        #${RES}"
echo -e "${BLUE_COLOR}#                       Author:      maye                              #${RES}"
echo -e "${BLUE_COLOR}#                       Email: lmaye@lmaye.com                         #${RES}"
echo -e "${BLUE_COLOR}# ######################################################################${RES}"

# 创建目录
echo -e "${BLUE_COLOR}---> create [elasticsearch]directory start.${RES}"
if [ ! -d "./es/" ]; then
mkdir -p ./es/conf ./es/data ./es/logs
fi

echo -e "${GREEN_COLOR}---> create [filebeat] directory start.${RES}"
if [ ! -d "./filebeat/" ]; then
mkdir -p ./filebeat/conf ./filebeat/logs ./filebeat/data
fi
echo -e "${BLUE_COLOR}===> create directory success.${RES}"

# 目录授权(data/logs 都要授读/写权限)
echo -e "${BLUE_COLOR}---> directory authorize start.${RES}"
if [ -d "./elasticsearch/" ]; then
chmod 777 ./es/data/ ./es/logs/
fi

if [ -d "./filebeat/" ]; then
chmod 777 ./filebeat/data/ ./filebeat/logs/
fi
echo -e "${BLUE_COLOR}===> directory authorize success.${RES}"

# 移动配置文件
echo -e "${BLUE_COLOR}---> move [elasticsearch]config file start.${RES}"
if [ -f "./elasticsearch.yml" ]; then
mv ./elasticsearch.yml ./es/conf
fi

echo -e "${GREEN_COLOR}---> move [filebeat]config file start.${RES}"
if [ -f "./filebeat.yml" ]; then
mv ./filebeat.yml ./filebeat/conf
fi
echo -e "${BLUE_COLOR}===> move config files success.${RES}"
echo -e "${GREEN_COLOR}>>>>>>>>>>>>>>>>>> The End <<<<<<<<<<<<<<<<<<${RES}"

# 部署项目
echo -e "${BLUE_COLOR}==================> Docker deploy Start <==================${RES}"
docker-compose down & docker-compose up
