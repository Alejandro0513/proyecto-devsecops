pipeline {
    agent any
    stages {
        stage('Descargar Código') {
            steps {
                echo 'Clonando el repositorio...'
                git branch: 'desarrollo', url: 'https://github.com/Alejandro0513/proyecto-devsecops.git'
            }
        }
        stage('Construir Imagen (Build)') {
            steps {
                echo 'Construyendo el contenedor...'
                sh 'docker build -t mi-app-segura:latest .'
            }
        }
        stage('Análisis de Seguridad (Trivy)') {
            steps {
                echo 'Buscando vulnerabilidades CRÍTICAS...'
                sh 'docker run --rm -v /var/run/docker.sock:/var/run/docker.sock aquasec/trivy:0.49.1 image --exit-code 1 --severity CRITICAL mi-app-segura:latest'
            }
        }
        stage('Despliegue en Producción (CD)') {
            steps {
                echo '¡Imagen limpia! Desplegando en el servidor...'
                sh 'docker stop app-produccion  true'
                sh 'docker rm app-produccion 
Spoiler
 true'

                // MODIFICACIÓN AQUÍ: Añadimos un comando infinito al final
                sh 'docker run -d --name app-produccion mi-app-segura:latest tail -f /dev/null'
            }
        }
    }
}
