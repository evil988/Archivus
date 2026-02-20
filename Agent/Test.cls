Class Archivus.Agent.Test Extends %RegisteredObject
{

/*
do ##class(%SYS.Python).Shell()
import sys
print(sys.path)
*/
/// Test the initialization of a Groq agent with a simple question
ClassMethod TestGroq() [ Language = python ]
{
    #; w ##class(Archivus.Agent.Test).TestGroq()

    #; Meu IRIS sempre priorizava o path errado
    #; import sys
    #; sys.path.insert(0, "/usr/irissys/mgr/python")
    #; ------------------------------------------

    import os
    from dotenv import load_dotenv
    
    # Define expected path for .env
    env_path = "/usr/irissys/mgr/archivus/.env"
    
    # Load environment variables
    if os.path.exists(env_path):
        load_dotenv(env_path)
        print(f"Environment loaded from {env_path}")
    else:
        print(f"Warning: .env not found at {env_path}")
        
    try:
        from langchain_groq import ChatGroq
        
        # Initialize the ChatGroq model
        # Assuming GROQ_API_KEY is defined in the .env file
        chat = ChatGroq(
            temperature=0,
            model_name="llama-3.3-70b-versatile"
        )
        
        # Define a simple question
        question = "Quanto é 2 + 2? Responda de forma concisa."
        print(f"\nQuestion: {question}")
        
        # Invoke the agent
        response = chat.invoke(question)
        
        # Output results
        print("\nResponse:")
        print(response.content)
        print("\nTest completed successfully.")
        
    except Exception as e:
        print(f"\nError initializing or running Groq agent: {e}")
}

ClassMethod TestReact() [ Language = python ]
{
#; w ##class(Archivus.Agent.Test).TestReact()

#; Meu IRIS sempre priorizava o path errado
#; import sys
#; sys.path.insert(0, "/usr/irissys/mgr/python")
#; ------------------------------------------

# Import necessary libraries
from dotenv import load_dotenv
from langchain_groq import ChatGroq
from langchain_classic import hub
from langchain_classic.agents import create_structured_chat_agent, AgentExecutor
from langchain_core.tools import tool

# Load environment variables from the specified .env file
# This assumes the .env file contains GROQ_API_KEY
load_dotenv(dotenv_path="/usr/irissys/mgr/python/.env")

# Initialize the ChatGroq LLM with the specified model
llm = ChatGroq(model="llama-3.3-70b-versatile")

# Define a simple addition tool
@tool
def add_numbers(a: float, b: float) -> float:
    """Adds two numbers and returns the sum."""
    return a + b

# Pull the structured chat agent prompt from LangChain Hub
prompt = hub.pull("hwchase17/structured-chat-agent")

# Create the structured chat agent with the addition tool
agent = create_structured_chat_agent(llm=llm, tools=[add_numbers], prompt=prompt)

# Create the agent executor
agent_executor = AgentExecutor(
    agent=agent,
    tools=[add_numbers],
    verbose=True
)

# Example usage: Run the agent with an input query
# Replace "What is 2 + 2?" with your actual query
result = agent_executor.invoke({"input": "What is 2 + 2?"})

# Print the result
print(result)
}

ClassMethod TestReact2() [ Language = python ]
{
    #; w ##class(Archivus.Agent.Test).TestReact2()
    import iris
    from langchain_classic.agents import create_structured_chat_agent, AgentExecutor

    # Configura Ambiente
    iris.cls("Archivus.Agent.Setup.Environment").Load()

    # Obtém Componentes
    llm = iris.cls("Archivus.Agent.Setup.Model").GetLLM()
    prompt = iris.cls("Archivus.Agent.Setup.Prompt").GetPrompt()
    tools = iris.cls("Archivus.Agent.Setup.Tools").GetTools()

    agent = create_structured_chat_agent(llm=llm, tools=tools, prompt=prompt)

    agent_executor = AgentExecutor(
        agent=agent,
        tools=tools,
        verbose=True,
        handle_parsing_errors=True
    )

    inputQuery = "Quando e 70+30?"
    print(f"User Query: {inputQuery}")
    result = agent_executor.invoke({"input": inputQuery})

    # Retorna apenas o output final (ou o objeto completo se preferir)
    return result.get("output")
}

ClassMethod TestReact3()
{
    #; d ##class(Archivus.Agent.Test).TestReact3()
    Do ##class(Archivus.Agent.Setup.Initialize).Run("Quanto e 70+30?")
}

ClassMethod TestLocalAgent(inputQuery As %String = "Quanto é 70+30?") As %String [ Language = python ]
{
    #; d ##class(Archivus.Agent.Test).TestLocalAgent()
    import iris
    import time
    
    # 1. Carregar Variáveis de Ambiente e Paths
    iris.cls("Archivus.Agent.Setup.Environment").Load()

    from langchain_ollama import ChatOllama
    from langchain_classic.agents import create_react_agent, AgentExecutor

    print("=" * 60)
    print("  TESTE DO AGENTE LOCAL - Modelo: phi4-mini:3.8b")
    print("=" * 60)
    
    # 2. Configurar o LLM Local (phi4-mini:3.8b)
    try:
        llm = ChatOllama(
            model="phi4-mini:3.8b",
            temperature=0.1
        )
        print(f"[OK] LLM Local inicializado: {llm.model}")
    except Exception as e:
        print(f"[ERRO] Falha ao iniciar LLM Local: {e}")
        return str(e)

    # 3. Obter Componentes (Prompt e Ferramentas)
    try:
        prompt = iris.cls("Archivus.Agent.Setup.Prompt").GetPrompt()
        tools = iris.cls("Archivus.Agent.Setup.Tools").GetTools()
        print(f"[OK] Componentes carregados: {len(tools)} ferramentas disponíveis")
    except Exception as e:
        print(f"[ERRO] Falha ao carregar componentes: {e}")
        return str(e)

    # 4. Criar o Agente
    agent = create_react_agent(llm=llm, tools=tools, prompt=prompt)

    agent_executor = AgentExecutor(
        agent=agent,
        tools=tools,
        verbose=True,
        handle_parsing_errors=True
    )
    
    # 5. Execução com medição de tempo
    print("-" * 60)
    print(f"  Query: {inputQuery}")
    print("-" * 60)
    
    start_time = time.time()
    
    try:
        result = agent_executor.invoke({"input": inputQuery})
        end_time = time.time()
        execution_time = end_time - start_time
        
        print("=" * 60)
        print(f"  RESULTADO")
        print("=" * 60)
        print(f"  Output: {result.get('output')}")
        print("-" * 60)
        print(f"  Tempo de execução: {execution_time:.2f} segundos")
        print("=" * 60)
        
        return result.get("output")
    except Exception as e:
        end_time = time.time()
        execution_time = end_time - start_time
        print(f"[ERRO] Falha na execução: {str(e)}")
        print(f"  Tempo até o erro: {execution_time:.2f} segundos")
        return f"Erro: {str(e)}"
}

ClassMethod ReactLocal(inputQuery As %String = "Quem é o presidente do Brasil?") As %String [ Language = python ]
{
    #; d ##class(Archivus.Agent.Test).ReactLocal()
    import iris
    
    # 1. Carregar Variáveis de Ambiente e Paths
    # Utiliza a configuração centralizada existente
    iris.cls("Archivus.Agent.Setup.Environment").Load()

    from langchain_ollama import ChatOllama
    from langchain_classic.agents import create_structured_chat_agent, AgentExecutor
    
    # 2. Configurar o LLM Local
    # Define o modelo aya-expanse:8b conforme solicitado
    try:
        llm = ChatOllama(
            model="aya-expanse:8b",
            temperature=0.1
        )
    except Exception as e:
        print(f"Erro ao iniciar LLM Local: {e}")
        return str(e)

    # 3. Obter Componentes (Prompt e Ferramentas)
    # Reutiliza os métodos de setup existentes para manter compatibilidade
    try:
        prompt = iris.cls("Archivus.Agent.Setup.Prompt").GetPrompt()
        tools = iris.cls("Archivus.Agent.Setup.Tools").GetTools()
    except Exception as e:
        print(f"Erro ao carregar componentes: {e}")
        return str(e)

    # 4. Criar o Agente
    # Estrutura idêntica à execução padrão, mudando apenas o 'llm'
    agent = create_structured_chat_agent(llm=llm, tools=tools, prompt=prompt)

    agent_executor = AgentExecutor(
        agent=agent,
        tools=tools,
        verbose=True,
        handle_parsing_errors=True
    )
    
    # 5. Execução
    print(f"--- Executando Agent com Modelo Local: {llm.model} ---")
    
    try:
        result = agent_executor.invoke({"input": inputQuery})
        return result.get("output")
    except Exception as e:
        return f"Erro na execução do agente: {str(e)}"
}

}
