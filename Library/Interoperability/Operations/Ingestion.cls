Class Archivus.Library.Interoperability.Operations.Ingestion Extends Ens.BusinessOperation
{

Method OnMessage(pRequest As Archivus.Library.Interoperability.Messages.Input, Output pResponse As Ens.Response) As %Status
{
    Set tSC = $$$OK

    Set tJson = ##class(%DynamicObject).%FromJSON(pRequest.Content)

    Set tSC = ##class(Archivus.Library.Data.Ingestion.Entry).Insert(tJson)
    If $$$ISERR(tSC) Throw ##class(%Exception.StatusException).CreateFromStatus(tSC)

    Set pResponse = ##class(Archivus.Library.Interoperability.Messages.Output).%New()
    Set pResponse.Content = ##class(%GlobalCharacterStream).%New()

    Set tResponseJson = {"status": "success", "message": "Documento indexado com sucesso."}
    Do pResponse.Content.Write(tResponseJson.%ToJSON())
    
    Return tSC
}

}
