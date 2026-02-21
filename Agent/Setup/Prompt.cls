Class Archivus.Agent.Setup.Prompt Extends %RegisteredObject
{

ClassMethod GetPrompt(hubPath As %String = "hwchase17/structured-chat-agent") [ Language = python ]
{
    from langchain_classic import hub
    
    prompt = hub.pull(hubPath)
    return prompt
}

}
