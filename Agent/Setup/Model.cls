Class Archivus.Agent.Setup.Model Extends %RegisteredObject
{

/// Inicializa e retorna a instância da LLM
ClassMethod GetLLM() As %SYS.Python [ Language = python ]
{
    import iris
    import os
    from langchain_groq import ChatGroq
    
    # Configuração centralizada do modelo
    llm = ChatGroq(
        model="llama-3.3-70b-versatile",
        temperature=0
    )
    
    return llm
}

}
