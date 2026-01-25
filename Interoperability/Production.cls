Class Archivus.Interoperability.Production Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="Archivus.Interoperability.Production" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="Archivus" Category="" ClassName="Archivus.Interoperability.Services.Archivus" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="Ingestion" Category="" ClassName="Archivus.Interoperability.Operations.Ingestion" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="Search" Category="" ClassName="Archivus.Interoperability.Operations.Search" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="Router" Category="" ClassName="Archivus.Interoperability.Processes.Router" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
</Production>
}

}
