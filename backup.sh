#!/bin/bash

# Diretório no HOST (será montado dentro do container)
ORIGEM="/backup_host"

# Diretório dentro do CONTAINER onde os backups serão armazenados
DESTINO_CONTAINER="/backup"

# Formatar a data para criar o nome do backup
DATA_HORA=$(date "+%d-%m-%Y")
NOME_BACKUP="Backup_$DATA_HORA.tar.gz"

# Criar o diretório de destino dentro do container (se não existir)
mkdir -p "$DESTINO_CONTAINER"

# Verificar se o diretório de origem existe dentro do container
if [ ! -d "$ORIGEM" ]; then
    echo "Erro: O diretório de origem '$ORIGEM' não existe dentro do container!"
    exit 1
fi

# Criar o backup dentro do container
echo "Criando backup dos arquivos do HOST para dentro do container..."
tar -czvf "$DESTINO_CONTAINER/$NOME_BACKUP" -C "$ORIGEM" . > /dev/null

# Verificar se o backup foi criado com sucesso
if [ $? -eq 0 ]; then
    echo "Backup '$NOME_BACKUP' criado com sucesso dentro do container em '$DESTINO_CONTAINER'!"
else
    echo "Erro ao criar backup."
    exit 1
fi

echo "Processo de backup concluído!"

