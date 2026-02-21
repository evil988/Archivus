#!/bin/bash

curl -s -X POST http://localhost:52773/archivus/ingest \
  -H "Content-Type: application/json" \
  -d '{
    "texto": "WLM Montes Claros - Exclusão negociação relatório notas pendentes Prezados Favor excluir a negociação 23653 do relatório de notas pendentes (tela 01), da WLM Montes Claros. Teal em anexo Att Fabricio // TRATATIVA // Retirar a negociacao da listagem do Relatório de Notas Fiscais Pendentes Kill ^IRE1(1003,C,23653) Kill ^IRE1(1003,C,23653,1) // Backup // Set ^IRE1(1003,C,23653) = 0 // Set ^IRE1(1003,C,23653,1) = ^^^^Aguardando retorno da Senior^67296,55851^Pedido cancelado.",
    "identificacao": "SICON-13546",
    "requisicao": 2222
  }'

echo -e "\n✅ Requisição enviada com sucesso!"