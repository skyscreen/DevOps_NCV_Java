pipeline {
  agent any
  
  stages{
    stage {
      steps{
        script{
           sh "export ANSIBLE_HOST_KEY_CHECKING=false;ansible-playbook /tmp/deploy_job.yml -u sky -i /etc/ansible/hosts"
        }//script
      }//steps
    
    }//stage
  
  }//stages



} //pipeline
