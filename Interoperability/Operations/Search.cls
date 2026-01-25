Class Archivus.Interoperability.Operations.Search Extends Ens.BusinessOperation
{

Method OnMessage(pRequest As Archivus.Interoperability.Messages.Input, Output pResponse As Ens.Response) As %Status
{
    Set tSC = $$$OK

    Set tJsonInput = ##class(%DynamicObject).%FromJSON(pRequest.Content)

    If (tJsonInput.texto = "") {
        Throw ##class(%Exception.General).%New("Erro de Validação", 500,, "O campo 'texto' é obrigatório para a busca.")
    }
    
    Set tResultArray = ##class(Archivus.Search.Vector).VectorDotProduct(tJsonInput.texto)

    Set pResponse = ##class(Archivus.Interoperability.Messages.Output).%New()
    Set pResponse.Content = ##class(%GlobalCharacterStream).%New()
    
    Do pResponse.Content.Write(tResultArray.%ToJSON())
    
    Return tSC
}

}
