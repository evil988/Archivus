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
    /*
curl -X POST http://localhost:52773/archivus/ingest \
-H "Content-Type: application/json" \
-d '{
    "texto": "O lucro líquido subiu 15% no último trimestre devido à redução de custos operacionais.",
    "identificacao": "SICON-12345",
    "requisicao": 9876
}'
    */
    Quit ..ProcessRequest("ingest")
}

ClassMethod Search() As %Status
{
    /*
curl -X POST http://localhost:52773/archivus/search \
-H "Content-Type: application/json" \
-d '{
    "texto": "lucro subiu"
}'
    */
    Quit ..ProcessRequest("search")
}

}
