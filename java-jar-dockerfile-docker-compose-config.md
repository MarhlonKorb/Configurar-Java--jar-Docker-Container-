# Passos para gerar o JAR e subir o Docker:

1 - Executar o build da aplicação para gerar arquivo .jar

2- Criar arquivo de nome Dockerfile

### Configurar arquivo:

- Use uma imagem base do OpenJDK: 

```
FROM openjdk:21
```

- Copie o JAR construído para a imagem

```
COPY target/sua-aplicacao.jar /app/sua-aplicacao.jar
```

- Configure o comando de inicialização

```
CMD ["java", "-jar", "/app/sua-aplicacao.jar"]
```

3 - Construir a imagem Docker:

```
docker build -t nome-da-sua-imagem .
```

5 - Executar o conteiner Docker:

```
docker run -p 8080:8080 nome-da-sua-imagem
```

## Exemplo arquivo Docker:

```
# Use uma imagem base do OpenJDK
FROM azul/zulu-openjdk:21.0.1

# Crie o diretório de aplicativos
RUN mkdir /app

# Copie o JAR construído para o diretório de aplicativos na imagem
COPY target/gerenciador-estacionamento-0.0.1-SNAPSHOT.jar /app/gerenciador-estacionamento.jar

# Configure o diretório de trabalho
WORKDIR /app

# Adicione um tempo de espera de 30 segundos (ou o valor que você considerar apropriado)
CMD ["java", "-jar", "gerenciador-estacionamento.jar"]
```



## Exemplo arquivo Docker.compose(vincular conteiner Java ao container PostgreSQL):

```
version: '3'

services:
  postgres:
    image: postgres:latest
    environment:
      POSTGRES_DB: gerenciador_estacionamento
      POSTGRES_USER: postgres
      POSTGRES_PASSWORD: master
    ports:
      - "5432:5432"
    networks:
      - minha-rede-docker

  java-app:
    build:
      context: .
      dockerfile: Dockerfile
    ports:
      - "8080:8080"
    networks:
      - minha-rede-docker
    depends_on:
      - postgres

networks:
  minha-rede-docker:
    driver: bridge
```


COMANDOS:

- Listar contêiners: 

  ```
  docker ps -a
  ```
- Parar o contêiner:

  ```
   docker stop <ID_do_Conteiner>
  ```
- Excluir o Contêiner: 

  ```
  docker rm <ID_do_Conteiner>
  ```
- Excluir a Imagem (Opcional): 

  ```
  docker rmi <ID_da_Imagem>
  ```

  