Class Archivus.Agent.Setup.Tools Extends %RegisteredObject
{

ClassMethod GetTools() [ Language = python ]
{
    from langchain_core.tools import Tool
    
    @tool
    def add_numbers(number1: float, number2: float) -> str:
        """Soma dois números e retorna o resultado. Informe number1 e number2 como valores numéricos."""
        return str(number1 + number2)

    return [add_numbers]
}

}
