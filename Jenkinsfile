def remote = [:]
remote.name = "node"
remote.host = "64.137.162.12"
remote.allowAnyHosts = true

node {
 	// Clean workspace before doing anything
    withCredentials([usernamePassword(credentialsId: 'sshUserAcct', passwordVariable: 'Mudar@123', usernameVariable: 'root')]) {
    remote.user = userName
    remote.password = password

    try {
        stage ('Clone') {
        	sshCommand remote: remote, command: '> teste.txt'
        }
        stage ('Build') {
        	sh "echo 'shell scripts to build project...'"
        }
        stage ('Tests') {
	        parallel 'static': {
	            sh "echo 'shell scripts to run static tests...'"
	        },
	        'unit': {
	            sh "echo 'shell scripts to run unit tests...'"
	        },
	        'integration': {
	            sh "echo 'shell scripts to run integration tests...'"
	        }
        }
      	stage ('Deploy') {
            sh "echo 'shell scripts to deploy to server...'"
      	}
    } catch (err) {
        currentBuild.result = 'FAILED'
        throw err
    }
}
