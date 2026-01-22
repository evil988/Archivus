Class Archivus.Ingestion.Data Extends %RegisteredObject
{

ClassMethod InserirRegistro() As %Status
{
    // w ##class(Archivus.Ingestion.Data).Teste()
    Set obj = ##class(Archivus.DataBase.Support).%New()
    Set obj.Nome = "Documento de Teste 01"
    Set obj.Descricao = "Este é um texto de exemplo para verificar se a vetorização automática está funcionando corretamente no IRIS."
    
    Quit obj.%Save()
}

ClassMethod LimparRegistros() As %Status
{
    // w ##class(Archivus.Ingestion.Data).LimparRegistros()
    &sql(DELETE FROM Archivus_DataBase.Support)

    If (SQLCODE < 0) {
        Quit $$$ERROR($$$SQLError, SQLCODE, %msg)
    }

    Quit $$$OK
}

}
