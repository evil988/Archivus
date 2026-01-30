Class Archivus.Library.Interoperability.Production Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="Archivus.Library.Interoperability.Production" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="Archivus" Category="" ClassName="Archivus.Library.Interoperability.Services.Archivus" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="Ingestion" Category="" ClassName="Archivus.Library.Interoperability.Operations.Ingestion" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="Search" Category="" ClassName="Archivus.Library.Interoperability.Operations.Search" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="Router" Category="" ClassName="Archivus.Library.Interoperability.Processes.Router" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
</Production>
}

}
