#!/bin/bash

curl -s -X POST http://localhost:52773/archivus/ingest \
  -H "Content-Type: application/json" \
  -d '{
    "texto": "// Descrição: Ajuste de saldo físico filial 1401. Produto 55902 (Filtro de Óleo) com divergência entre físico e sistema. // Tratativa: Após inventário local, constatado erro na última entrada de nota. // Comando: Set ^ESTOQUE(1401,55902,\"SALDO\") = 45 // Backup: Set ^BKP(\"SICON-14001\") = ^ESTOQUE(1401,55902,\"SALDO\")",
    "identificacao": "SICON-14001",
    "requisicao": 4444
  }'

echo -e "\n✅ Requisição enviada com sucesso!"