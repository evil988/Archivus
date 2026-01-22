Class Archivus.DataBase.Support Extends %Library.Persistent
{

Property Descricao As %Library.String(MAXLEN = 10000);

Property Nome As %Library.String(MAXLEN = 10000);

Property EmbeddingDescricao As %Library.Embedding(MODEL = "sentence-transformers-config", SOURCE = "Descricao");

Storage Default
{
<Data name="SupportDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Descricao</Value>
</Value>
<Value name="3">
<Value>Nome</Value>
</Value>
<Value name="4">
<Value>EmbeddingDescricao</Value>
</Value>
</Data>
<DataLocation>^Archivus.DataBase.SupportD</DataLocation>
<DefaultData>SupportDefaultData</DefaultData>
<ExtentSize>1</ExtentSize>
<IdLocation>^Archivus.DataBase.SupportD</IdLocation>
<IndexLocation>^Archivus.DataBase.SupportI</IndexLocation>
<Property name="%%CLASSNAME">
<AverageFieldSize>2</AverageFieldSize>
<OutlierSelectivity>.999999:</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="%%ID">
<AverageFieldSize>3</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<Property name="Descricao">
<AverageFieldSize>88</AverageFieldSize>
<OutlierSelectivity>.999999:"O lucro líquido subiu 15% no último trimestre devido à redução de custos operacionais."</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="EmbeddingDescricao">
<AverageFieldSize>4420</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<Property name="Nome">
<AverageFieldSize>22</AverageFieldSize>
<OutlierSelectivity>.999999:"Relatório Financeiro"</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<SQLMap name="IDKEY">
<BlockCount>-8</BlockCount>
</SQLMap>
<StreamLocation>^Archivus.DataBase.SupportS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
