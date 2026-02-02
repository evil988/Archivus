Class Archivus.Agent.Setup.Environment Extends %RegisteredObject
{

ClassMethod Load() As %Status [ Language = python ]
{
    import sys
    import os
    from dotenv import load_dotenv

    #; Meu IRIS sempre priorizava o path errado
    #; import sys
    sys.path.insert(0, "/usr/irissys/mgr/python")
    #; ------------------------------------------

    load_dotenv(dotenv_path="/usr/irissys/mgr/python/.env")
    return True
}

}
