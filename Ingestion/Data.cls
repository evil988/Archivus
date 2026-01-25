Class Archivus.Ingestion.Data Extends %RegisteredObject
{

ClassMethod Insert(pDados As %DynamicObject) As %Status
{
    Set tSC = $$$OK

    If (pDados.texto = "") {
        Throw ##class(%Exception.General).%New("Erro de Validação", 500,, "O campo 'texto' é obrigatório.")
    }

    Set obj = ##class(Archivus.DataBase.Support).%New()

    Set obj.Data = $PIECE($HOROLOG, ",", 1)
    Set obj.Hora = $PIECE($HOROLOG, ",", 2)

    Do obj.Texto.Write(pDados.texto)

    If (pDados.identificacao '= "") {
        Set obj.IdentificacaoExterna = pDados.identificacao
    }

    If (pDados.requisicao '= "") {
        Set obj.Requisicao = pDados.requisicao
    }
    
    Set tSC = obj.%Save()

    Quit tSC
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
