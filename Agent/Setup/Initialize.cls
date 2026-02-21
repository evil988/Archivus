Class Archivus.Agent.Setup.Initialize Extends %RegisteredObject
{

ClassMethod Run(inputQuery As %String = "") [ Language = python ]
{
    import iris

    #; Configura Ambiente
    iris.cls("Archivus.Agent.Setup.Environment").Load()

    from langchain_classic.agents import create_react_agent, AgentExecutor

    #; Obtém Componentes
    llm = iris.cls("Archivus.Agent.Setup.Model").GetLLM()
    prompt = iris.cls("Archivus.Agent.Setup.Prompt").GetPrompt()
    tools = iris.cls("Archivus.Agent.Setup.Tools").GetTools()

    agent = create_react_agent(llm=llm, tools=tools, prompt=prompt)

    agent_executor = AgentExecutor(
        agent=agent,
        tools=tools,
        verbose=True,
        handle_parsing_errors=True,
        max_iterations=10
    )
    
    #; Execução do Agent
    result = agent_executor.invoke({"input": inputQuery})

    #; Retorna o output final
    return result.get("output")
}

}
