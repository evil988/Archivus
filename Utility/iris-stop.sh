#!/bin/bash
# =====================================================
# iris-stop.sh
# Para o container do InterSystems IRIS no Docker
# =====================================================

# === CONFIGURE AQUI (ou passe como argumento) ===
CONTAINER_NAME=${1:-iris}     # Nome do container (padrão = iris)

echo "🛑 Parando InterSystems IRIS..."
echo "   Container : $CONTAINER_NAME"
echo "──────────────────────────────────────"

# Verifica se o container existe
if ! docker ps -a --format '{{.Names}}' | grep -q "^${CONTAINER_NAME}$"; then
    echo "❌ ERRO: Container '$CONTAINER_NAME' não foi encontrado!"
    echo "   Rode 'docker ps -a' para ver todos os containers."
    exit 1
fi

# Verifica se já está parado
if ! docker ps --format '{{.Names}}' | grep -q "^${CONTAINER_NAME}$"; then
    echo "✅ O container '$CONTAINER_NAME' já está parado!"
    docker ps -a --format "table {{.Names}}\t{{.Status}}" | grep "$CONTAINER_NAME"
    exit 0
fi

# Para o container (com timeout de 30 segundos para shutdown gracioso)
# → Recomendado pela documentação oficial da InterSystems para evitar recovery de crash
echo "⏹️  Parando o container '$CONTAINER_NAME' (graceful shutdown - 30s)..."
if docker stop -t 30 "$CONTAINER_NAME" > /dev/null; then
    echo "✅ Container parado com sucesso!"
    echo ""
    echo "📊 Status atual:"
    docker ps -a --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}" | grep "$CONTAINER_NAME" || echo "   (Container parado)"
    
    echo ""
    echo "🟢 IRIS foi parado com segurança."
else
    echo "⚠️  Falha no stop normal. Forçando parada..."
    if docker kill "$CONTAINER_NAME" > /dev/null; then
        echo "✅ Container parado à força (kill)."
    else
        echo "❌ Falha ao parar o container!"
        exit 1
    fi
fi