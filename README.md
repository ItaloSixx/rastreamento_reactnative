# Projeto React Native com Docker

Este projeto utiliza Docker para criar um ambiente de desenvolvimento padronizado para React Native.

## Requisitos

- Docker
- Docker Compose

## Como iniciar o ambiente de desenvolvimento

1. Clone este repositório
2. Execute o comando para construir a imagem e iniciar o container:

```bash
docker-compose up -d
```

3. Entre no container:

```bash
docker exec -it react-native-dev bash
```

4. Dentro do container, crie um novo projeto React Native:

```bash
# Para iniciar um projeto com React Native CLI
npx react-native init MeuApp

# OU para iniciar um projeto com Expo
npx create-expo-app MeuApp
```

5. Entre no diretório do projeto e inicie a aplicação:

```bash
cd MeuApp
npm start
```

## Portas expostas

- 8081: Metro Bundler
- 19000, 19001, 19002: Expo

## Estrutura do ambiente

O ambiente de desenvolvimento inclui:
- Node.js 18
- React Native CLI
- JDK 11
- Android SDK
- Dependências necessárias para desenvolvimento React Native 