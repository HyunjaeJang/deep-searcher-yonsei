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

# DeepSearcher 저장소 클론 및 설치
RUN git clone https://github.com/HyunjaeJang/deep-searcher-yonsei . && \
    python3.10 -m venv .venv && \
    . .venv/bin/activate && \
    pip install -e . && \
    pip install ollama

# 필요한 환경변수 설정 (예: OPENAI_API_KEY 등)
ENV OPENAI_API_KEY= #TODO: APIKEY 삽입
ENV FIRECRAWL_API_KEY=#TODO: APIKEY 삽입
# 웹 서비스 실행 시 사용할 포트 노출 (예: 8000)
# entrypoint.sh 복사 및 권한 부여

RUN chmod +x /entrypoint.sh

# 필요한 포트 노출 (예: 웹 서비스)
EXPOSE 8000

# ENTRYPOINT로 entrypoint.sh 실행
ENTRYPOINT ["/entrypoint.sh"]