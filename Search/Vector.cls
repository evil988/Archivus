Class Archivus.Search.Vector Extends %RegisteredObject
{

/// VECTOR_DOT_PRODUCT
ClassMethod VectorDotProduct(pInput As %String, pTop As %Integer = 5) As %DynamicArray
{
    // set array = ##class(Archivus.Search.Vector).VectorDotProduct("aumento de lucros no trimestre", 5)

    Set tResultArray = ##class(%DynamicArray).%New()
    Set tStatement = ##class(%SQL.Statement).%New()

    Set tQuery =    "SELECT TOP ? ID, Requisicao, IdentificacaoExterna, Texto " _
                    "FROM Archivus_DataBase.Support " _
                    "ORDER BY VECTOR_DOT_PRODUCT(TextoVetor, EMBEDDING(?)) DESC"
    
    Set tStatus = tStatement.%Prepare(tQuery)
    $$$ThrowOnError(tStatus)

    Set tResultSet = tStatement.%Execute(pTop, pInput)

    If (tResultSet.%SQLCODE < 0) {
        Throw ##class(%Exception.SQL).CreateFromSQLCODE(tResultSet.%SQLCODE, tResultSet.%Message)
    }

    While tResultSet.%Next() {
        Set tRow = ##class(%DynamicObject).%New()
        Set tRow.ID = tResultSet.ID
        Set tRow.Requisicao = tResultSet.Requisicao
        Set tRow.IdentificacaoExterna = tResultSet.IdentificacaoExterna
        
        Set tStreamOid = ##class(%Stream.GlobalCharacter).%Open(tResultSet.Texto)
        Do tStreamOid.Rewind()
        Set tRow.Texto = tStreamOid.Read()
        
        Do tResultArray.%Push(tRow)
    }

    Quit tResultArray
}

}
