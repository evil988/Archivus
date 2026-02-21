Class Archivus.Library.Data.Embedding Extends %RegisteredObject
{

ClassMethod GetEmbedding(pTexto As %String) As %String [ Language = python ]
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

}
