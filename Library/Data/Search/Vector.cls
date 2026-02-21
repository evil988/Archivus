Class Archivus.Library.Data.Search.Vector Extends %RegisteredObject
{

ClassMethod VectorDotProduct(pInput As %String, pTop As %Integer = 5) As %DynamicArray
{
    // set array = ##class(Archivus.Library.Data.Search.Vector).VectorDotProduct("aumento de lucros no trimestre", 5)

    Set tResultArray = ##class(%DynamicArray).%New()
    Set tStatement = ##class(%SQL.Statement).%New()

    Set tQuery =    "SELECT TOP ? ID, Requisicao, IdentificacaoExterna, Texto " _
                    "FROM Archivus_Library_Data_Database.Support " _
                    "ORDER BY VECTOR_DOT_PRODUCT(TextoVetor, TO_VECTOR(?, DOUBLE, 768)) DESC"
    
    Set tStatus = tStatement.%Prepare(tQuery)
    $$$ThrowOnError(tStatus)

    Set tVector = ##class(Archivus.Library.Data.Ingestion.Entry).GetGeminiEmbedding(pInput)

    Set tResultSet = tStatement.%Execute(pTop, tVector)

    If (tResultSet.%SQLCODE < 0) {
        Throw ##class(%Exception.SQL).CreateFromSQLCODE(tResultSet.%SQLCODE, tResultSet.%Message)
    }

    While tResultSet.%Next() {
        Set tRow = ##class(%DynamicObject).%New()
        Set tRow.ID = tResultSet.ID
        Set tRow.Requisicao = tResultSet.Requisicao
        Set tRow.IdentificacaoExterna = tResultSet.IdentificacaoExterna
        
        Set tRow.Texto = tResultSet.Texto
        
        Do tResultArray.%Push(tRow)
    }

    Quit tResultArray
}

}
