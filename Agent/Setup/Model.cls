Class Archivus.Agent.Setup.Model Extends %RegisteredObject
{

ClassMethod GetLLM(pModelName As %String = "gemini-3-flash-preview", pTemperature As %Float = 0, pMaxTokens As %Integer = 1024) As %RegisteredObject [ Language = python ]
{
    import iris
    from langchain_google_genai import ChatGoogleGenerativeAI
    
    try:
        llm = ChatGoogleGenerativeAI(model=pModelName, temperature=pTemperature, max_tokens=pMaxTokens)
        return llm

    except ImportError as e:
        return None

    except Exception as e:
        return None
}

}
