#!/bin/bash
# =====================================================
# iris-shell.sh
# Abre o Terminal do SO (Shell Linux) do container IRIS
# =====================================================

# === CONFIGURE AQUI (ou passe como argumento) ===
CONTAINER_NAME=${1:-iris}     # Nome do container (padrão = iris)

echo "🐚 Abrindo Terminal do SO (Shell Linux) do container IRIS..."
echo "   Container : $CONTAINER_NAME"
echo "──────────────────────────────────────"

# Verifica se o container existe
if ! docker ps -a --format '{{.Names}}' | grep -q "^${CONTAINER_NAME}$"; then
    echo "❌ ERRO: Container '$CONTAINER_NAME' não foi encontrado!"
    echo "   Rode 'docker ps -a' para ver os containers."
    exit 1
fi

# Verifica se está rodando
if ! docker ps --format '{{.Names}}' | grep -q "^${CONTAINER_NAME}$"; then
    echo "❌ ERRO: Container '$CONTAINER_NAME' não está rodando!"
    echo "   Inicie primeiro com: ./iris-start.sh"
    exit 1
fi

echo "✅ Conectado ao Shell do container!"
echo "   (Digite 'exit' para sair)"
echo "──────────────────────────────────────"

# Tenta abrir com bash primeiro. Se não existir, abre com sh (muito comum em imagens mínimas)
docker exec -it "$CONTAINER_NAME" bash 2>/dev/null || \
docker exec -it "$CONTAINER_NAME" sh