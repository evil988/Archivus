Class Archivus.Library.Interoperability.Operations.Embedding Extends Ens.BusinessOperation
{

Parameter INVOCATION = "Queue";

Method GetEmbedding(pRequest As Archivus.Library.Interoperability.Messages.EmbeddingRequest, Output pResponse As Archivus.Library.Interoperability.Messages.EmbeddingResponse) As %Status
{
    Set tSC = $$$OK
    Set pResponse = ##class(Archivus.Library.Interoperability.Messages.EmbeddingResponse).%New()
    
    Set tVecString = ..CallPython(pRequest.Text)
    If ($EXTRACT(tVecString, 1, 5) = "ERROR") {
        Throw ##class(%Exception.General).%New("GenAI", 500,, "Erro gerando Embeddings: " _ tVecString)
    }
    
    Set pResponse.VectorString = tVecString
    Return tSC
}

ClassMethod CallPython(pTexto As %String) As %String [ Language = python ]
{
    import iris
    iris.cls('Archivus.Environment').Load()

    from langchain_google_genai import GoogleGenerativeAIEmbeddings
    
    import os
    if not os.environ.get("GOOGLE_API_KEY"):
        return "ERROR: GOOGLE_API_KEY missing after load"
        
    embeddings = GoogleGenerativeAIEmbeddings(model="models/gemini-embedding-001")

    try:
        vec = embeddings.embed_query(pTexto)
        # Return string representation of the list [x, y, z...] which IRIS accepts for %Vector
        return str(vec)
    except Exception as e:
        return str(e)
}

XData MessageMap
{
<MapItems>
  <MapItem MessageType="Archivus.Library.Interoperability.Messages.EmbeddingRequest">
    <Method>GetEmbedding</Method>
  </MapItem>
</MapItems>
}

}
