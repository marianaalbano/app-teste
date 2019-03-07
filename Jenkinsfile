def remote = [:]
remote.name = "node"
remote.host = "64.137.162.12"
remote.user = 'root'
remote.password = 'Mudar@123'
remote.allowAnyHosts = true

node {
 	// Clean workspace before doing anything
     stage ('Clean workspace') {
        sshCommand remote: remote, command: "cd /tmp && rm -rf app-teste/"
        sshCommand remote: remote, command: "docker rm -f teste"
     }
    try {
        stage ('Clone') {
        	sshCommand remote: remote, command: "cd /tmp && git clone git@github.com:marianaalbano/app-teste.git"
        }
        stage ('Build') {
        	sh "echo 'running dockerfile'"
            sshCommand remote: remote, command: "cd /tmp/app-teste && docker build -t scripts:${BUILD_NUMBER} ."
        }
        stage ('Tests') {
	        parallel 'static': {
	            sh "echo 'shell scripts to run static tests...'"
                sshCommand remote: remote, command: "cd /tmp/app-teste/tests/ && ./script.sh"
	        },
	        'unit': {
	            sh "echo 'shell scripts to run unit tests...'"
	        },
	        'integration': {
	            sh "echo 'shell scripts to run integration tests...'"
	        }
      	stage ('Deploy') {
            sh "echo 'shell scripts to deploy to server...'"
            sshCommand remote: remote, command: "docker run -itd --name teste scripts:${BUILD_NUMBER}"
      	}
    } catch (err) {
        currentBuild.result = 'FAILED'
        throw err
    }
}
