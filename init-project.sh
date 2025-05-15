#!/bin/bash

echo "🚀 Script de inicialização do projeto React Native 🚀"
echo "===================================================="
echo ""

# Verifica se já existe um projeto
if [ -d "App" ]; then
  echo "⚠️  Diretório App já existe. Pulando a criação do projeto."
else
  echo "📱 Escolha o tipo de projeto:"
  echo "1) React Native CLI"
  echo "2) Expo"
  read -p "Opção (1/2): " escolha

  if [ "$escolha" == "1" ]; then
    echo "🔨 Criando novo projeto React Native CLI..."
    npx react-native init App
  elif [ "$escolha" == "2" ]; then
    echo "🔨 Criando novo projeto Expo..."
    npx create-expo-app App
  else
    echo "❌ Opção inválida!"
    exit 1
  fi

  echo "✅ Projeto criado com sucesso!"
fi

echo ""
echo "📌 Para iniciar o projeto:"
echo "1. Entre no diretório do projeto: cd App"
echo "2. Inicie a aplicação: npm start"
echo ""
echo "Bom desenvolvimento! 👨‍💻👩‍💻" 