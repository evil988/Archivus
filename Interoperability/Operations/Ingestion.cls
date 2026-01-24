Class Archivus.Interoperability.Operations.Ingestion Extends Ens.BusinessOperation
{

Method OnMessage(pRequest As Archivus.Interoperability.Messages.Input, Output pResponse As Ens.Response) As %Status
{
    Set tSC = $$$OK

    Set conteudo = pRequest.Content

    Set pResponse = ##class(Archivus.Interoperability.Messages.Output).%New()
    Set pResponse.Content = ##class(%GlobalCharacterStream).%New()

    Do pRequest.Content.Rewind()
    Do pResponse.Content.CopyFrom(pRequest.Content)

    Return tSC
}

}
