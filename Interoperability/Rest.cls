Class Archivus.Interoperability.Rest Extends %CSP.REST
{

XData UrlMap [ XMLNamespace = "http://www.intersystems.com/urlmap" ]
{
<Routes>
    <Route Url="/ingest" Method="POST" Call="Ingest"/>
</Routes>
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
    Set tSC = $$$OK
    Set tSC = ##class(Ens.Director).CreateBusinessService("Archivus", .tService)
    If $$$ISERR(tSC) Throw ##class(%Exception.StatusException).CreateFromStatus(tSC)

    Set tInput = ##class(%GlobalBinaryStream).%New()
    Do tInput.CopyFrom(%request.Content)

    Set tSC = tService.OnProcessInput(tInput, .tOutput)
    If $$$ISERR(tSC) Throw ##class(%Exception.StatusException).CreateFromStatus(tSC)

    Do tOutput.Rewind()
    While 'tOutput.AtEnd {
        Write tOutput.Read()
    }

    Quit tSC
}

}
