Class Archivus.Interoperability.Operations.Ingestion Extends Ens.BusinessOperation
{

Method OnMessage(pRequest As Archivus.Interoperability.Messages.Input, Output pResponse As Ens.Response) As %Status
{
    Set tSC = $$$OK

    Set tJson = ##class(%DynamicObject).%FromJSON(pRequest.Content)

    Set tSC = ##class(Archivus.Ingestion.Data).Insert(tJson)
    If $$$ISERR(tSC) Throw ##class(%Exception.StatusException).CreateFromStatus(tSC)

    Set pResponse = ##class(Archivus.Interoperability.Messages.Output).%New()
    Set pResponse.Content = ##class(%GlobalCharacterStream).%New()

    Set tResponseJson = {"status": "success", "message": "Documento indexado com sucesso."}
    Do pResponse.Content.Write(tResponseJson.%ToJSON())
    
    Return tSC
}

}
