node{
    
    stage('Clone repo'){
        git credentialsId: 'GIT-Credentials', url: 'https://github.com/shailajakalai/mavenrepo.git'
    }
    
    stage('SonarQube analysis') {
    def scannerHome = tool 'sonar-server';
    withSonarQubeEnv('sonar-server') {
      sh "${scannerHome}/bin/sonar-scanner \
      -D sonar.login=admin \
      -D sonar.password=password \
      -D sonar.projectKey=studentapp \
      -D sonar.exclusions=vendor/**,resources/**,**/*.java \
      -D sonar.host.url=http://43.206.242.15:9000/"
    }
  }
    stage('upload war to nexus'){
        nexusArtifactUploader artifacts: [[artifactId: 'studentapp', classifier: '', file: 'target/studentapp-2.5-SNAPSHOT.war', type: 'war']], credentialsId: 'nexusrepo', groupId: 'com.jdevs', nexusUrl: '13.114.54.181:8081', nexusVersion: 'nexus3', protocol: 'http', repository: 'student-snapshot', version: '2.5-SNAPSHOT'
}
}
