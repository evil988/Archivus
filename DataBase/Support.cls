Class Archivus.DataBase.Support Extends %Library.Persistent
{

Property Data As %Date;

Property Hora As %Time;

Property Requisicao As %Integer;

Property IdentificacaoExterna As %Library.String(MAXLEN = 50);

Property Texto As %Stream.GlobalCharacter;

Property TextoVetor As %Library.Embedding(MODEL = "sentence-transformers-config", SOURCE = "Texto");

Storage Default
{
<Data name="SupportDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Data</Value>
</Value>
<Value name="3">
<Value>Hora</Value>
</Value>
<Value name="4">
<Value>Requisicao</Value>
</Value>
<Value name="5">
<Value>Texto</Value>
</Value>
<Value name="6">
<Value>TextoVetor</Value>
</Value>
<Value name="7">
<Value>Arquivo</Value>
</Value>
<Value name="8">
<Value>IdentificacaoExterna</Value>
</Value>
</Data>
<DataLocation>^Archivus.DataBase.SupportD</DataLocation>
<DefaultData>SupportDefaultData</DefaultData>
<ExtentSize>10</ExtentSize>
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
<Property name="Data">
<AverageFieldSize>5</AverageFieldSize>
<OutlierSelectivity>.999999:67592</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="Hora">
<AverageFieldSize>5</AverageFieldSize>
<Selectivity>10.0000%</Selectivity>
</Property>
<Property name="IdentificacaoExterna">
<AverageFieldSize>12</AverageFieldSize>
<Selectivity>10.0000%</Selectivity>
</Property>
<Property name="Requisicao">
<AverageFieldSize>4</AverageFieldSize>
<Selectivity>10.0000%</Selectivity>
</Property>
<Property name="Texto">
<Selectivity>10.0000%</Selectivity>
</Property>
<Property name="TextoVetor">
<AverageFieldSize>4420</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<SQLMap name="IDKEY">
<BlockCount>-44</BlockCount>
</SQLMap>
<StreamLocation>^Archivus.DataBase.SupportS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
