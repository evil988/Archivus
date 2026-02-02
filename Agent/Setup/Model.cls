Class Archivus.Agent.Setup.Model Extends %RegisteredObject
{

ClassMethod GetLLM(modelName As %String = "llama-3.3-70b-versatile") [ Language = python ]
{
    from langchain_groq import ChatGroq
    
    try:
        llm = ChatGroq(model=modelName)
        return llm
    except Exception as e:
        print(f"Erro ao iniciar LLM: {e}")
        return None
}

}
