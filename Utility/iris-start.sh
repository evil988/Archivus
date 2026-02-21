#!/bin/bash
# =====================================================
# iris-start.sh
# Inicia o container do InterSystems IRIS no Docker
# =====================================================

# === CONFIGURE AQUI (ou passe como argumento) ===
CONTAINER_NAME=${1:-iris}     # Nome do container (padrão = iris)

echo "🚀 Iniciando InterSystems IRIS..."
echo "   Container : $CONTAINER_NAME"
echo "──────────────────────────────────────"

# Verifica se o container existe
if ! docker ps -a --format '{{.Names}}' | grep -q "^${CONTAINER_NAME}$"; then
    echo "❌ ERRO: Container '$CONTAINER_NAME' não foi encontrado!"
    echo "   Rode 'docker ps -a' para ver todos os containers."
    exit 1
fi

# Verifica se já está rodando
if docker ps --format '{{.Names}}' | grep -q "^${CONTAINER_NAME}$"; then
    echo "✅ O container '$CONTAINER_NAME' já está em execução!"
    docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}" | grep "$CONTAINER_NAME"
    exit 0
fi

# Inicia o container
echo "▶️  Iniciando o container '$CONTAINER_NAME'..."
if docker start "$CONTAINER_NAME" > /dev/null; then
    echo "✅ Container iniciado com sucesso!"
    echo ""
    echo "📊 Status atual:"
    docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}" | grep "$CONTAINER_NAME"
    
    echo ""
    echo "⏳ IRIS está inicializando internamente (pode levar 10-30 segundos)..."
else
    echo "❌ Falha ao iniciar o container!"
    echo "   Verifique logs com: docker logs $CONTAINER_NAME"
    exit 1
fi