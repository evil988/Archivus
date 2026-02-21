Class Archivus.Library.Data.Ingestion.Entry Extends %RegisteredObject
{

ClassMethod Insert(pDados As %DynamicObject) As %Status
{
    Set tSC = $$$OK

    If (pDados.texto = "") {
        Throw ##class(%Exception.General).%New("Erro de Validação", 500,, "O campo 'texto' é obrigatório.")
    }

    Set obj = ##class(Archivus.Library.Data.Database.Support).%New()

    Set obj.Data = $PIECE($HOROLOG, ",", 1)
    Set obj.Hora = $PIECE($HOROLOG, ",", 2) 
    Set obj.Texto = pDados.texto
    
    Set tVecString = ..GetEmbedding(pDados.texto)
    If ($EXTRACT(tVecString, 1, 5) = "ERROR") {
        Throw ##class(%Exception.General).%New("GenAI", 500,, "Erro gerando Embeddings: " _ tVecString)
    }

    Set tStatement = ##class(%SQL.Statement).%New()
    Set tStatus = tStatement.%Prepare("SELECT TO_VECTOR(?, DOUBLE, 768) AS Vec")
    $$$ThrowOnError(tStatus)
    Set tRS = tStatement.%Execute(tVecString)
    If (tRS.%Next()) {
        Set obj.TextoVetor = tRS.Vec
    }

    If (pDados.identificacao '= "") {
        Set obj.IdentificacaoExterna = pDados.identificacao
    }

    If (pDados.requisicao '= "") {
        Set obj.Requisicao = pDados.requisicao
    }
    
    Set tSC = obj.%Save()

    Quit tSC
}

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
