#!/bin/bash
# entrypoint.sh

# 가상환경 활성화
. .venv/bin/activate

# 안내 메시지 출력
echo "데이터 저장 시에는 \`deepsearcher --load \"<가져올 데이터의 링크 혹은 경로>\"\`, 이후 질의 시에는 \`deepsearcher --query \"<질문 내용>\"\`"

# bash 셸 실행 (컨테이너 내부 유지)
exec /bin/bash