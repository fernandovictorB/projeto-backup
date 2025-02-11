pipeline {
    agent any

    triggers {
        cron('H H * * 0') 
    }

    stages {
        stage('Executar Backup') {
            steps {
                script {
                    def containerId = sh(script: "docker ps -aq --filter name=container-backup", returnStdout: true).trim()

                    if (containerId) {
                        echo "O container existe. Verificando status..."
                        def isRunning = sh(script: "docker ps -q --filter name=container-backup", returnStdout: true).trim()

                        if (!isRunning) {
                            echo "O container existe mas está parado. Iniciando..."
                            sh "docker start container-backup"
                        }
                    } else {
                        echo "O container não existe. Criando um novo..."
                        sh "docker run -d --name container-backup -v /home/fernandovictor/MeusScripts/scripts-shell:/backup_host backup-container"
                    }

                    echo "Executando backup..."
                    sh "docker exec container-backup /usr/local/bin/backup.sh"
                }
            }
        }
    }
}


