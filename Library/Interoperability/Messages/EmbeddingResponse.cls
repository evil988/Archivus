Class Archivus.Library.Interoperability.Messages.EmbeddingResponse Extends Ens.Response
{

Property VectorString As %String(MAXLEN = "");

Storage Default
{
<Data name="EmbeddingResponseDefaultData">
<Subscript>"EmbeddingResponse"</Subscript>
<Value name="1">
<Value>VectorString</Value>
</Value>
</Data>
<DefaultData>EmbeddingResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
