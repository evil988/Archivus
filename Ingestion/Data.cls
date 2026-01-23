Class Archivus.Ingestion.Data Extends %RegisteredObject
{

ClassMethod Insert() As %Status
{
    // w ##class(Archivus.Ingestion.Data).Insert()
    
    Set dados(1) = $LISTBUILD("Relatório Financeiro", "O lucro líquido subiu 15% no último trimestre devido à redução de custos operacionais.")
    Set dados(2) = $LISTBUILD("Análise de Mercado", "As ações da empresa caíram 5% após o anúncio de novas regulamentações.")
    Set dados(3) = $LISTBUILD("Relatório de Vendas", "As vendas aumentaram 20% graças à expansão para novos mercados.")
    Set dados(4) = $LISTBUILD("Auditoria Interna", "Revisão de processos de compliance concluída sem não conformidades críticas.")
    Set dados(5) = $LISTBUILD("Projeto de TI", "Migração para o servidor em nuvem completada com 99.9% de uptime.")
    Set dados(6) = $LISTBUILD("Recursos Humanos", "Contratação de 15 novos desenvolvedores para o setor de inovação.")
    Set dados(7) = $LISTBUILD("Logística", "Otimização de rotas reduziu o tempo de entrega em 12% na região Sul.")
    Set dados(8) = $LISTBUILD("Marketing Digital", "Campanha de verão gerou 50.000 novos leads qualificados.")
    Set dados(9) = $LISTBUILD("Manutenção Predial", "Reforma do sistema de ar condicionado central agendada para o próximo mês.")
    Set dados(10) = $LISTBUILD("Jurídico", "Acordo firmado no processo trabalhista nº 4522, reduzindo o passivo estimado.")

    For i=1:1:10 {
        Set item = dados(i)

        Set obj = ##class(Archivus.DataBase.Support).%New()
        Set obj.Data = $PIECE($HOROLOG, ",", 1)
        Set obj.Hora = $PIECE($HOROLOG, ",", 2)
        Set obj.Requisicao = $RANDOM(10000) + 1
        Set obj.IdentificacaoExterna = "SICON-"_($RANDOM(9000) + 1000)
        Do obj.Texto.Write($LIST(item, 2))
        Set sc = obj.%Save()

        If $$$ISERR(sc) Quit
    }
    Quit sc
}

ClassMethod Clear() As %Status
{
    // w ##class(Archivus.Ingestion.Data).Clear()
    
    &sql(DELETE FROM Archivus_DataBase.Support)

    If (SQLCODE < 0) {
        Quit $$$ERROR($$$SQLError, SQLCODE, %msg)
    }

    Quit $$$OK
}

}
