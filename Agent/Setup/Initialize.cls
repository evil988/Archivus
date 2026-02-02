Class Archivus.Agent.Setup.Initialize Extends %RegisteredObject
{

/// Inicializa e retorna o Agente Executor
ClassMethod CreateAgent(llm, tools) As %SYS.Python [ Language = python ]
{
    from langchain.agents import initialize_agent, AgentType

    agent = initialize_agent(
        tools, 
        llm, 
        agent=AgentType.ZERO_SHOT_REACT_DESCRIPTION, 
        verbose=True, 
        handle_parsing_errors=True,
        max_iterations=5,
        early_stopping_method="generate"
    )
    
    return agent
}

}
