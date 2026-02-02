# Instalação das dependências
python3 -m pip install --target /usr/irissys/mgr/python langchain langchain-core langchain-community langchain-ollama langchain-groq python-dotenv sentence-transformers

# No namespace que se deseja usar o Sentence Transformers
INSERT INTO %Embedding.Config (Name, Configuration, EmbeddingClass, Description)
  VALUES ('sentence-transformers-config',
          '{"modelName":"sentence-transformers/all-MiniLM-L6-v2",
            "hfCachePath":"/tmp/hf_cache",
            "maxTokens": 256,
            "checkTokenCount": true}',
          '%Embedding.SentenceTransformers',
          'a small SentenceTransformers embedding model')

# Caso você tenha problemas de permissão no cache do huggingface:
chmod -R 777 /home/vboxuser/.cache/huggingface
chmod o+x /home/vboxuser
chmod o+x /home/vboxuser/.cache

# Chave do Groq
https://console.groq.com/keys

# Configurar o LangSmith
No dotenv:
LANGCHAIN_TRACING_V2=true
LANGCHAIN_API_KEY=sua_chave
LANGCHAIN_PROJECT=nome_do_projeto
GROQ_API_KEY=sua_chave