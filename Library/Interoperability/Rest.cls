Class Archivus.Library.Interoperability.Rest Extends %CSP.REST
{

XData UrlMap [ XMLNamespace = "http://www.intersystems.com/urlmap" ]
{
<Routes>
    <Route Url="/ingest" Method="POST" Call="Ingest"/>
    <Route Url="/search" Method="POST" Call="Search"/>
</Routes>
}

ClassMethod ProcessRequest(pAction As %String) As %Status [ Private ]
{
    Set tSC = $$$OK

    Set tSC = ##class(Ens.Director).CreateBusinessService("Archivus", .tService)
    If $$$ISERR(tSC) Throw ##class(%Exception.StatusException).CreateFromStatus(tSC)

    Set tJson = ##class(%DynamicObject).%FromJSON(%request.Content)

    Set tJson.action = pAction

    Set tInput = ##class(%GlobalBinaryStream).%New()
    Do tJson.%ToJSON(tInput)

    Set tSC = tService.OnProcessInput(tInput, .tOutput)
    If $$$ISERR(tSC) Throw ##class(%Exception.StatusException).CreateFromStatus(tSC)

    Do tOutput.Rewind()
    While 'tOutput.AtEnd {
        Write tOutput.Read()
    }
    
    Quit tSC
}

ClassMethod Ingest() As %Status
{
    Quit ..ProcessRequest("ingest")
}

ClassMethod Search() As %Status
{
    Quit ..ProcessRequest("search")
}

}
