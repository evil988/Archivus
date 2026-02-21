Class Archivus.Library.Data.Ingestion.Entry Extends %RegisteredObject
{

ClassMethod Insert(pDados As %DynamicObject) As %Status
{
    Set tSC = $$$OK

    If (pDados.texto = "") {
        Throw ##class(%Exception.General).%New("Erro de Validação", 500,, "O campo 'texto' é obrigatório.")
    }

    Set obj = ##class(Archivus.Library.Data.Database.Support).%New()

    Set obj.Data = $PIECE($HOROLOG, ",", 1)
    Set obj.Hora = $PIECE($HOROLOG, ",", 2) 
    Set obj.Texto = pDados.texto
    
    Set tVecString = pDados.vector

    Set tStatement = ##class(%SQL.Statement).%New()
    Set tStatus = tStatement.%Prepare("SELECT TO_VECTOR(?, DOUBLE, 768) AS Vec")
    $$$ThrowOnError(tStatus)
    Set tRS = tStatement.%Execute(tVecString)
    If (tRS.%Next()) {
        Set obj.TextoVetor = tRS.Vec
    }

    If (pDados.identificacao '= "") {
        Set obj.IdentificacaoExterna = pDados.identificacao
    }

    If (pDados.requisicao '= "") {
        Set obj.Requisicao = pDados.requisicao
    }
    
    Set tSC = obj.%Save()

    Quit tSC
}

}
