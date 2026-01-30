Class Archivus.Library.Interoperability.Services.Archivus Extends Ens.BusinessService
{

Method OnProcessInput(pInput As %GlobalBinaryStream, Output pOutput As %RegisteredObject) As %Status
{
    Set tSC = $$$OK
    
    Set request = ##class(Archivus.Library.Interoperability.Messages.Input).%New()
    Set request.Content = ##class(%GlobalCharacterStream).%New()
    
    Do pInput.Rewind()
    While 'pInput.AtEnd {
        Set chunk = pInput.Read(32000)
        
        // Converte os bytes UTF-8 crus para String interna do IRIS
        Set chunk = $ZCONVERT(chunk, "I", "UTF8")

        Do request.Content.Write(chunk)
    }

    Set tSC = ..SendRequestSync("Router", request, .response)
    If $$$ISERR(tSC) Return tSC
    
    Set pOutput = ##class(%GlobalCharacterStream).%New()
    Do response.Content.Rewind()
    Do pOutput.CopyFrom(response.Content)

    Return tSC
}

}
