Class Archivus.Library.Interoperability.Processes.Router Extends Ens.BusinessProcess
{

Property TargetIngestion As Ens.DataType.ConfigName [ InitialExpression = "Ingestion" ];

Property TargetSearch As Ens.DataType.ConfigName [ InitialExpression = "Search" ];

Property TargetEmbedding As Ens.DataType.ConfigName [ InitialExpression = "Embedding" ];

Parameter SETTINGS = "TargetIngestion:Basic,TargetSearch:Basic,TargetEmbedding:Basic";

Method OnRequest(pRequest As Archivus.Library.Interoperability.Messages.Input, Output pResponse As Ens.Response) As %Status
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

    // Call Embedding if texto exists
    If (tJson.texto '= "") {
        Set tEmbeddingReq = ##class(Archivus.Library.Interoperability.Messages.EmbeddingRequest).%New()
        Set tEmbeddingReq.Text = tJson.texto
        
        Set tSC = ..SendRequestSync(..TargetEmbedding, tEmbeddingReq, .tEmbeddingRes)
        $$$ThrowOnError(tSC)
        
        Set tJson.vector = tEmbeddingRes.VectorString
        
        Set tNewStream = ##class(%GlobalCharacterStream).%New()
        Do tNewStream.Write(tJson.%ToJSON())
        Set pRequest.Content = tNewStream
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
<Value name="3">
<Value>TargetEmbedding</Value>
</Value>
</Data>
<DefaultData>RouterDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
