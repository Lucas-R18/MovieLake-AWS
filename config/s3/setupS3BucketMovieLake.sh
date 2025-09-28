#!/bin/bash 
set -euo pipefail

#set -euo pipefail → conjunto de flags que deixam o script mais seguro:
#-e → interrompe o script se algum comando retornar erro.
#-u → erro se usar variável não definida.
#-o pipefail → se um comando numa pipeline (|) falhar, o script também falha.

BUCKET_NAME="movies-pipeline"
AWS_REGION="us-east-1"

# Criar bucket S3
if [ "$AWS_REGION" = "us-east-1" ]; then
  aws s3api create-bucket \
    --bucket "$BUCKET_NAME" \
    --region "$AWS_REGION" \
    >/dev/null 2>&1 || echo "⚠️  Bucket já existe, seguindo..."
else
  aws s3api create-bucket \
    --bucket "$BUCKET_NAME" \
    --region "$AWS_REGION" \
    --create-bucket-configuration LocationConstraint="$AWS_REGION" \
    >/dev/null 2>&1 || echo "⚠️  Bucket já existe, seguindo..."
fi

# Criar estrutura de pastas
echo "📂 Criando pastas no bucket..."
aws s3api put-object --bucket "$BUCKET_NAME" --key "raw/movies/"
aws s3api put-object --bucket "$BUCKET_NAME" --key "processed/movies/"

echo "✅ Estrutura criada com sucesso!"
aws s3 ls "s3://$BUCKET_NAME/" --recursive

#execute o script no wsl com o comando:
# bash setupS3BucketMovieLake.sh
