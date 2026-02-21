#!/bin/bash

curl -s -X POST http://localhost:52773/archivus/ingest \
  -H "Content-Type: application/json" \
  -d '{
    "texto": "// Descrição desassociar a nota fiscal 30001 da garantia 875/2025 Codema Pelotas A Codema Pelotas precisa que seja desassociada a nota fiscal 30001 da garantia 875/2025 Codema Pelotas. Foi feito uma reabertura de ordem de serviço no Jira e a nota permaneceu gravada na garantia. // Tratativa //Previamente foi realizado a reabertura da OS na SICON-13061. //Foi usada a tela Home > Comercial > Notas Fiscais > Notas Fiscais > DESVINCULAÇÃO DE NOTAS FISCAIS para desvincular notas. //Aparentemente a nota 30001 não foi desvinculada da garantia. Kill ^ING(1436,G,2025000875,7,0,4,1) // 30001^20250530^^2",
    "identificacao": "SICON-1111",
    "requisicao": 1111
  }'

echo -e "\n✅ Requisição enviada com sucesso!"