FROM node:18

WORKDIR /app

# Instalar dependências globais
RUN npm install -g react-native-cli @react-native-community/cli

# Instalar dependências necessárias para React Native
RUN apt-get update && apt-get install -y \
    git \
    curl \
    wget \
    unzip \
    software-properties-common \
    && rm -rf /var/lib/apt/lists/*

# Adicionar repositório do OpenJDK
RUN apt-get update && apt-get install -y \
    default-jdk \
    android-tools-adb \
    && rm -rf /var/lib/apt/lists/*

# Configurar variáveis de ambiente para Android
ENV ANDROID_HOME /opt/android-sdk
RUN mkdir -p ${ANDROID_HOME}

# Baixar e instalar Android SDK
RUN wget -q https://dl.google.com/android/repository/commandlinetools-linux-7583922_latest.zip -O /tmp/android-sdk.zip \
    && unzip -q /tmp/android-sdk.zip -d /tmp \
    && rm /tmp/android-sdk.zip \
    && mkdir -p ${ANDROID_HOME}/cmdline-tools \
    && mv /tmp/cmdline-tools ${ANDROID_HOME}/cmdline-tools/latest

# Aceitar licenças Android SDK
RUN cd ${ANDROID_HOME}/cmdline-tools/latest/bin \
    && yes | ./sdkmanager --licenses \
    && ./sdkmanager "platform-tools" "platforms;android-31" "build-tools;31.0.0"

# Adicionar as ferramentas do Android ao PATH
ENV PATH ${PATH}:${ANDROID_HOME}/cmdline-tools/latest/bin:${ANDROID_HOME}/platform-tools

# Configurar usuário não-root (opcional, para melhor segurança)
ARG USERNAME=developer
ARG USER_UID=2000
ARG USER_GID=2000

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && chown -R $USER_UID:$USER_GID /app

USER $USERNAME

EXPOSE 8081
EXPOSE 19000
EXPOSE 19001
EXPOSE 19002

CMD ["bash"]
