Class Archivus.Library.Interoperability.Messages.EmbeddingRequest Extends Ens.Request
{

Property Text As %String(MAXLEN = "");

Storage Default
{
<Data name="EmbeddingRequestDefaultData">
<Subscript>"EmbeddingRequest"</Subscript>
<Value name="1">
<Value>Text</Value>
</Value>
</Data>
<DefaultData>EmbeddingRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
