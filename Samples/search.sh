#!/bin/bash

curl -s -X POST http://localhost:52773/archivus/search \
  -H "Content-Type: application/json" \
  -d '{
    "texto": "reabertura de ordem de serviço"
  }'

echo -e "\n✅ Requisição enviada com sucesso!"