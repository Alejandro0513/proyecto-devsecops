pipeline {
    agent any

    stages {
        stage('Descargar Código') {
            steps {
                echo 'Clonando el repositorio...'
                // Asegúrate de cambiar la URL por la tuya si no lo has hecho
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
                // Hemos actualizado 'aquasec/trivy' por 'ghcr.io/aquasecurity/trivy'
                // Esto soluciona los errores de descarga que estabas viendo
                sh 'docker run --rm -v /var/run/docker.sock:/var/run/docker.sock ghcr.io/aquasecurity/trivy image --exit-code 1 --severity CRITICAL mi-app-segura:latest'
            }
        }

        stage('Despliegue en Producción (CD)') {
            steps {
                echo '¡Imagen limpia! Desplegando en el servidor...'
                // Detenemos el contenedor viejo si existe (el || true evita que falle la primera vez)
                sh 'docker stop app-produccion || true'
                sh 'docker rm app-produccion || true'
                // Arrancamos el nuevo
                sh 'docker run -d --name app-produccion -p 80:80 mi-app-segura:latest'
            }
        }
    }
}
