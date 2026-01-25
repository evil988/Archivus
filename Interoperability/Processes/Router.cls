Class Archivus.Interoperability.Processes.Router Extends Ens.BusinessProcess
{

Property TargetIngestion As Ens.DataType.ConfigName [ InitialExpression = "Ingestion" ];

Property TargetSearch As Ens.DataType.ConfigName [ InitialExpression = "Search" ];

Parameter SETTINGS = "TargetIngestion:Basic,TargetSearch:Basic";

Method OnRequest(pRequest As Archivus.Interoperability.Messages.Input, Output pResponse As Ens.Response) As %Status
{
    Set tSC = $$$OK

    Set tJson = ##class(%DynamicObject).%FromJSON(pRequest.Content)

    Set tTarget = ""

    If (tJson.action = "ingest") {
        Set tTarget = "Ingestion"
    } ElseIf (tJson.action = "search") {
        Set tTarget = "Search"
    } Else {
        Throw ##class(%Exception.General).%New("Router Error", 500,, "Ação desconhecida ou não fornecida: "_tJson.action)
    }

    Do pRequest.Content.Rewind()

    Set tSC = ..SendRequestSync(tTarget, pRequest, .pResponse)

    Return tSC
}

Storage Default
{
<Data name="RouterDefaultData">
<Subscript>"Router"</Subscript>
<Value name="1">
<Value>TargetIngestion</Value>
</Value>
<Value name="2">
<Value>TargetSearch</Value>
</Value>
</Data>
<DefaultData>RouterDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
