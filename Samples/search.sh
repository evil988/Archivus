#!/bin/bash

# Texto padrão (caso não passe nada)
TEXTO="reabertura de ordem de serviço"

# Processa os argumentos
while [[ $# -gt 0 ]]; do
  case $1 in
    --filtro|--texto|-t)
      TEXTO="$2"
      shift 2
      ;;
    -h|--help)
      echo "Uso:"
      echo "  $0                    → usa o texto padrão"
      echo "  $0 \"filtro de oleo\"   → argumento posicional"
      echo "  $0 --filtro \"filtro de oleo\""
      echo "  $0 --texto \"troca de óleo\""
      exit 0
      ;;
    *)
      TEXTO="$1"   # se não usar flag, pega direto
      shift
      ;;
  esac
done

# Constrói o JSON manualmente (sem jq)
# Escapa aspas duplas e barras invertidas para JSON válido
ESCAPED="${TEXTO//\\/\\\\}"      # escapa \ primeiro
ESCAPED="${ESCAPED//\"/\\\"}"    # depois escapa "

JSON="{\"texto\": \"$ESCAPED\"}"

echo "🔍 Enviando busca por: \"$TEXTO\""

curl -s -X POST http://localhost:52773/archivus/search \
  -H "Content-Type: application/json" \
  -d "$JSON"

echo -e "\n✅ Requisição enviada com sucesso!"