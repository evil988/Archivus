Class Archivus.Library.Data.Database.Support Extends %Library.Persistent
{

Property Data As %Date;

Property Hora As %Time;

Property Requisicao As %Integer;

Property IdentificacaoExterna As %Library.String(MAXLEN = 50);

Property Texto As %String(MAXLEN = 32767);

Property TextoVetor As %Vector(DATATYPE = "DOUBLE", LEN = 768);

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
<Value>IdentificacaoExterna</Value>
</Value>
<Value name="6">
<Value>Texto</Value>
</Value>
<Value name="7">
<Value>TextoVetor</Value>
</Value>
</Data>
<DataLocation>^Archivus.Library.D34DD.SupportD</DataLocation>
<DefaultData>SupportDefaultData</DefaultData>
<ExtentSize>1</ExtentSize>
<IdLocation>^Archivus.Library.D34DD.SupportD</IdLocation>
<IndexLocation>^Archivus.Library.D34DD.SupportI</IndexLocation>
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
<OutlierSelectivity>.999999:67599</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="Hora">
<AverageFieldSize>5</AverageFieldSize>
<OutlierSelectivity>.999999:79921</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="IdentificacaoExterna">
<AverageFieldSize>13</AverageFieldSize>
<OutlierSelectivity>.999999:"SICON-12345"</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="Requisicao">
<AverageFieldSize>4</AverageFieldSize>
<OutlierSelectivity>.999999:9876</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="Texto">
<OutlierSelectivity>.999999:$lb("1","%Stream.GlobalCharacter","^Archivus.Library.D34DD.SupportS")</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="TextoVetor">
<AverageFieldSize>4420</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<SQLMap name="IDKEY">
<BlockCount>-8</BlockCount>
</SQLMap>
<StreamLocation>^Archivus.Library.D34DD.SupportS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
