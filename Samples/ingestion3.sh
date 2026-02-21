#!/bin/bash

curl -s -X POST http://localhost:52773/archivus/ingest \
  -H "Content-Type: application/json" \
  -d '{
    "texto": "// descricao Codema - Cancelamento da NF 50459 e 96401 - Filial Caçapava Boa tarde Poderiam efetuar, o cancelamento das NFs no Siconnet, NF 50459 de Serviço e a NF 96401 de mercadorias, da Filial Caçapava. Efetuado cancelamento diretamente no D365. Segue anexo Grato Aldo JEan // tratativa // cancelar nf 50459 d ##class(sicomweb.sicom.gen.fun.F1I610).I610(1404,20250728,NF,50459,,AC^FI) // cancelar nf 96401 d ##class(sicomweb.sicom.gen.fun.F1I610).I610(1404,20250728,21,96401,,AC^FI)",
    "identificacao": "SICON-13492",
    "requisicao": 3333
  }'

echo -e "\n✅ Requisição enviada com sucesso!"