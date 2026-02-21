Class Archivus.Environment Extends %RegisteredObject
{

ClassMethod Load(customPath As %String = "/usr/irissys/mgr/archivus") As %Boolean [ Language = python ]
{
    import os

    env_file = os.path.join(customPath, ".env")
    
    if not os.path.isfile(env_file):
        return 0

    try:
        from dotenv import load_dotenv
        result = load_dotenv(dotenv_path=env_file, override=True)
        return 1 if result else 0
    except Exception as e:
        return 0
}

}
