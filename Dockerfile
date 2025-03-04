FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive

# 필수 패키지 및 Python 3.10 설치 (deadsnakes PPA 사용)
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && \
    apt-get install -y python3.10 python3.10-venv python3-pip git

# 작업 디렉토리 설정
WORKDIR /app

COPY . /app

# DeepSearcher 저장소 클론 및 설치
RUN python3.10 -m venv /opt/venv && \
    . /opt/venv/bin/activate && \
    pip install -e . && \
    pip install ollama

# 웹 서비스 실행 시 사용할 포트 노출 (예: 8000)
# entrypoint.sh 복사 및 권한 부여

EXPOSE 8000

# ENTRYPOINT로 entrypoint.sh 실행
ENTRYPOINT ["/bin/bash", "entrypoint.sh"]