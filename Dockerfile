# 使用官方Python 2.7镜像作为基础镜像
FROM python:2.7-slim

# 设置工作目录
WORKDIR /app

# 复制项目文件到容器
COPY . .

# 安装依赖
RUN pip install -r requirements.txt

# 暴露应用端口
EXPOSE 5000

# 定义启动命令
CMD ["python", "app.py"]
