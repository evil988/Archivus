Class Archivus.Interoperability.Services.Archivus Extends Ens.BusinessService
{

Parameter ADAPTER = "EnsLib.HTTP.InboundAdapter";

Method OnProcessInput(pInput As %GlobalBinaryStream, Output pOutput As %RegisteredObject) As %Status
{
    /*
    curl -X POST http://localhost:9980 \
     -H "Content-Type: application/json" \
     -d '{"chave": "valor", "teste": "exemplo"}'
    */
    Set tSC = $$$OK
    
    Set request = ##class(Archivus.Interoperability.Messages.Input).%New()
    Set request.Content = ##class(%GlobalCharacterStream).%New()
    
    Do pInput.Rewind()
    While 'pInput.AtEnd {
        Set chunk = pInput.Read(32000)
        Do request.Content.Write(chunk)
    }

    Set tSC = ..SendRequestSync("Ingestion", request, .response)
    
    Set pOutput = ##class(%GlobalCharacterStream).%New()
    Do response.Content.Rewind()
    Do pOutput.CopyFrom(response.Content)

    Return tSC
}

}
