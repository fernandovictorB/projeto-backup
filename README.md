
# 🚀 Backup Automático com Docker e Jenkins

Este projeto realiza **backups automáticos** de arquivos do host para dentro de um **container Docker**. O backup é executado **semanalmente** por meio de um **Jenkins Pipeline**.

## 📌 Tecnologias Utilizadas
✅ **Docker** - Para criar o ambiente isolado do backup.  
✅ **Alpine Linux** - Sistema operacional leve dentro do container.  
✅ **Jenkins** - Para automatizar a execução do backup semanalmente.  
✅ **Shell Script** - Para compactar e armazenar os backups.  

## 📂 Estrutura do Projeto
```bash
projeto-backup/
│── Dockerfile        # Cria a imagem do container de backup
│── backup.sh         # Script que executa o backup
│── Jenkinsfile       # Pipeline para automatizar o backup
│── README.md         # Documentação do projeto
```

## 🔧 Como Usar
### 1️⃣ Construir e rodar o container
```sh
docker build -t backup-container .
docker run -d --name container-backup -v /caminho/do/host:/backup_host backup-container
```

### 2️⃣ Testar manualmente o backup
```sh
docker exec container-backup /usr/local/bin/backup.sh
```

### 3️⃣ Configurar no Jenkins
- Criar um **Pipeline** no Jenkins.
- Conectar ao **GitHub**.
- Usar o **Jenkinsfile** para automatizar o backup semanal.

## ⏳ Automação
O **Jenkins** executa o backup **1 vez por semana**, sempre aos **domingos**.  

Se o container já existir, ele **apenas executa o backup** sem recriá-lo.  

## 📜 Licença
Este projeto é **open-source** e pode ser usado livremente.
