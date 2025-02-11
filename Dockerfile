# Usando a imagem Alpine
FROM alpine:3.20

# Instalando pacotes necessários
RUN apk add --no-cache bash tar

# Criando diretório dentro do container para armazenar backups
RUN mkdir -p /backup

# Copiando o script de backup para dentro do container
COPY backup.sh /usr/local/bin/backup.sh

# Dando permissão de execução ao script
RUN chmod +x /usr/local/bin/backup.sh

# Mantendo o container ativo e permitindo rodar backups continuamente
CMD ["/bin/sh", "-c", "/usr/local/bin/backup.sh && tail -f /dev/null"]

