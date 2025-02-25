BootStrap: docker
From: ubuntu:20.04

%environment
    export DEBIAN_FRONTEND=noninteractive
    export OPENAI_API_KEY="" #TODO: APIKEY 삽입
    export FIRECRAWL_API_KEY="" #TODO: APIKEY 삽입

%post
    # 필수 패키지 및 Python 3.10 설치 (deadsnakes PPA 사용)
    apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && \
    apt-get install -y python3.10 python3.10-venv python3-pip git

    # 작업 디렉토리 설정
    mkdir -p /app
    cd /app

    # DeepSearcher 저장소 클론 및 설치
    git clone https://github.com/HyunjaeJang/deep-searcher-yonsei . && \
    python3.10 -m venv .venv && \
    . .venv/bin/activate && \
    pip install -e . && \
    pip install ollama

    # entrypoint.sh 복사 및 권한 부여
    chmod +x /entrypoint.sh

%startscript
    exec /entrypoint.sh