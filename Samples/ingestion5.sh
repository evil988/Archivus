#!/bin/bash

curl -s -X POST http://localhost:52773/archivus/ingest \
  -H "Content-Type: application/json" \
  -d '{
    "texto": "WLM Uberlândia - Nota 77885 travada no monitor de integração com status Pendente no D365. Necessário forçar reprocessamento. // TRATATIVA // Alterado status do flag de integração para permitir novo envio. // Kill ^INTD365(1005,77885,\"ERRO\") // Set ^INTD365(1005,77885,\"STATUS\") = \"A\"",
    "identificacao": "SICON-14002",
    "requisicao": 5555
  }'

echo -e "\n✅ Requisição enviada com sucesso!"