# Instalação das dependências
python3 -m pip install --target /usr/irissys/mgr/python langchain langchain-core langchain-community langchain-classic langchain-ollama langchain-groq python-dotenv sentence-transformers

ou

python3 -m pip install --target /opt/iris/mgr/python langchain langchain-core langchain-community langchain-ollama langchain-groq python-dotenv sentence-transformers

# No namespace que se deseja usar o Sentence Transformers
INSERT INTO %Embedding.Config (Name, Configuration, EmbeddingClass, Description) 
VALUES (
  'multilingual-config',
  '{"modelName":"sentence-transformers/paraphrase-multilingual-mpnet-base-v2", 
    "hfCachePath":"/tmp/hf_cache/paraphrase-multilingual-mpnet-base-v2", 
    "maxTokens": 256, 
    "checkTokenCount": true}',
  '%Embedding.SentenceTransformers',
  'Modelo multilíngue'
)

ou

INSERT INTO %Embedding.Config (Name, Configuration, EmbeddingClass, Description)
  VALUES ('sentence-transformers-config',
          '{"modelName":"sentence-transformers/all-MiniLM-L6-v2",
            "hfCachePath":"/tmp/hf_cache/all-MiniLM-L6-v2",
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

# Docker
docker run -d \
  --name iris \
  -p 1972:1972 \
  -p 52773:52773 \
  --shm-size=256m \
  intersystems/iris-community:latest-cd