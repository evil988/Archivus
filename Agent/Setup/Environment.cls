Class Archivus.Agent.Setup.Environment Extends %RegisteredObject
{

ClassMethod Load() As %Status [ Language = python ]
{
    import sys
    import os

    custom_path = "/usr/irissys/mgr/python"
    
    #; Garante prioridade no sys.path (evita duplicatas e mantem no topo)
    if custom_path in sys.path:
        sys.path.remove(custom_path)
    sys.path.insert(0, custom_path)
    
    from dotenv import load_dotenv
    load_dotenv(dotenv_path=os.path.join(custom_path, ".env"))
    return True
}

}
