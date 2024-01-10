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
