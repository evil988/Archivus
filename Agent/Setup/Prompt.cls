Class Archivus.Agent.Setup.Prompt Extends %RegisteredObject
{

ClassMethod GetPrompt(hubPath As %String = "hwchase17/react") [ Language = python ]
{
    from langchain import hub
    
    prompt = hub.pull(hubPath)
    return prompt
}

}
