Class Archivus.Agent.Setup.Tools Extends %RegisteredObject
{

ClassMethod GetTools() [ Language = python ]
{
    from langchain_core.tools import Tool
    import json

    def add_numbers(input_str: str) -> str:
        """Adds two numbers and returns the sum. Input must be JSON with 'a' and 'b' keys, e.g., {"a": 70, "b": 30}"""
        try:
            #; Parse the JSON input
            data = json.loads(input_str)
            a = float(data.get("a", 0))
            b = float(data.get("b", 0))
            result = a + b
            return str(result)
        except json.JSONDecodeError:
            #; If not valid JSON, try to parse as "a, b" format
            try:
                parts = input_str.replace(" ", "").split(",")
                a = float(parts[0])
                b = float(parts[1])
                return str(a + b)
            except (ValueError, IndexError):
                return f"Error: Could not parse input '{input_str}'. Please provide JSON like {{\"a\": 70, \"b\": 30}} or two comma-separated numbers."

    add_numbers_tool = Tool(
        name="add_numbers",
        func=add_numbers,
        description="Adds two numbers and returns the sum. Input must be JSON with 'a' and 'b' keys, e.g., {\"a\": 70, \"b\": 30}"
    )

    #; Retorna uma lista de ferramentas
    return [add_numbers_tool]
}

}
