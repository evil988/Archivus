Class Archivus.Agent.Tools.Search Extends %RegisteredObject
{

ClassMethod Request(pText As %String) As %String [ Language = python ]
{
    #; w ##class(Archivus.Agent.Tools.Search).Request("aumento de lucros")
    import requests
    import json
    
    try:
        url = "http://localhost:52773/archivus/search"
        headers = {
            "Content-Type": "application/json"
        }
        
        payload = {
            "texto": pText
        }
        
        response = requests.post(url, json=payload, headers=headers, timeout=60)
        response.raise_for_status()
        
        return response.text
        
    except Exception as e:
        return f"Erro na busca: {str(e)}"
}

}
