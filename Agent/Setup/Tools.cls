Class Archivus.Agent.Setup.Tools Extends %RegisteredObject
{

ClassMethod GetTools() [ Language = python ]
{
    from langchain_core.tools import tool

    @tool
    def add_numbers(a: float, b: float) -> float:
        """Adds two numbers and returns the sum."""
        return a + b

    #; Retorna uma lista de ferramentas
    return [add_numbers]
}

}
