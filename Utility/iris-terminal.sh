#!/bin/bash
# =====================================================
# iris-terminal.sh
# Abre o Terminal do InterSystems IRIS (ObjectScript)
# que está rodando no Docker
# =====================================================

# === CONFIGURE AQUI (se necessário) ===
CONTAINER_NAME="iris"      # Nome do seu container (rode "docker ps" para confirmar)
INSTANCE_NAME="IRIS"       # Quase sempre é IRIS

# =====================================================

echo "🚀 Abrindo Terminal do InterSystems IRIS..."
echo "   Container : $CONTAINER_NAME"
echo "   Instância : $INSTANCE_NAME"
echo "   (Digite 'halt' ou Ctrl+D para sair)"
echo "──────────────────────────────────────"

# Comando oficial para abrir o terminal do IRIS
docker exec -it "$CONTAINER_NAME" iris session "$INSTANCE_NAME"