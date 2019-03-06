def remote = [:]
remote.name = "node"
remote.host = "64.137.162.12"
remote.user = 'root'
remote.password = 'Mudar@123'
remote.allowAnyHosts = true

node {
 	// Clean workspace before doing anything

    try {
        stage ('Clone') {
        	sshCommand remote: remote, command: 'git clone'
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
