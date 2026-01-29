Class Archivus.Agent.Setup.Environment Extends %RegisteredObject
{

ClassMethod LoadEnv() As %Status [ Language = python ]
{
    import sys
    import os
    
    #; Pasta do arquivo dotenv
    target_dir = '/usr/irissys/mgr/python'

    try:
        from dotenv import load_dotenv
        env_path = os.path.join(target_dir, ".env")

        if not os.path.exists(env_path):
            print(f"Arquivo .env não encontrado em {env_path}")
            return 0
        
        #; Carrega as variáveis de ambiente
        load_dotenv(dotenv_path=env_path, override=True)
        return 1

    except Exception as e:
        print(f"Erro inesperado ao carregar .env: {e}")
        return 0
}

}
