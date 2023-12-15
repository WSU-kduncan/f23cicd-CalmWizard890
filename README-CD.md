**Part 1**

**CI Project Overview**

For this project, I am showing my knowledge on continuous deployment, by in part 1 continuing to use the resources I created in Project 4 to create run my GitHub workflow when a tag is pushed, and to create tags from my repository from the docker/metadata action and finally push images to DockerHub based on the version of git tag, and then using markdown documentation to be able to create my project for yourself. In part 2 I use the EC2 resource to pull and run my DockerHub image, create a script to pull a new image from DockerHub and to reboot the container right after, set a listener to the adnanh's webhook (which is a tool which you can use to execute configured commands from created HTTP endpoints), and finally setting up GitHub to send a message to the listener thus activating the restart script via the hook in the deployment folder that will restart the image container when the message is received. In the final part I create a diagram going over the whole process of continuous deployment and the tools I used to connect the different parts of the process.

As for why I am doing this project, it is to show my understanding on the subject of continuous deployment and the tools related to it. And to complete my basic understanding of the continuous delivery process by combining both continuous integration and continuous deployment pipelines.

The tools I used in this project are:
1. EC2 Instance via AWS Cloud Services
2. DockerHub
3. Docker
4. Lucid Charts
5. GitHub Action Workflow

![CD Process (1)](https://github.com/WSU-kduncan/f23cicd-CalmWizard890/assets/112407371/15b964df-1236-49ab-8114-dafbffbf76b1)

_How to Generate a tag in git/GitHub_
1. Naviagte to the desired commit with the command **git log** to find its commit hash.
2. Create a lightweight tag using the command **git tag <tag_name> <commit_hash>**
3. For the correct outcome you will want to replace <tag_name> with the name you want your tag to have and <commit_hash> with the hash of the commit.
4. Push the tag with the command **git push orgin <tag_name>** with <tag_name> being the name of the tag you wish to push.

_Behavior of GitHub workflow_
- What does it do
1. In the case of this project it will still build and push a Docker image to my public DockerHub repo like is project 4, but is amended to now run only when a tag is made and pushed but it now also generates a set of tags from my repo using the docker/metadata-action, and the last but is used to extract and display docker metadata.
- When does a Github Workflow activate
1. The workflow will run when: a tag is pushed

_DockerHub Repo Link_
- [My Public DockerHub Repository](https://hub.docker.com/repository/docker/calmwizard890/my-project-repository/general)

**Part 2**

_How to install Docker to your instance_
1. Connect to the EC2 instance using a given shortcut
  - ssh starter
2. Optional: Update package information on the ec2 instance if not accessed for a while
  - sudo apt-get update -y
3. Install, Start and Verify Docker
  - sudo apt-get install docker.io -y
  - sudo systemctl start docker
  - sudo docker run hello-world
4. Enable Docker
  - sudo systemctl enable docker
5. Check Docker version
  - docker --version

_Container restart script_

**Justification & description of what it does**
1. Justification
  - There can be a variety of reason to create a restart script, these reasons often hinge on what the script is being used for. For the use in this project the justificaion for the restart script is for Configuration changes, as it grabs a new image each time it restarts so as to have the most up to date version of the docker image.  
2. Description of script
  - The container restart script logs into my Dokcerhub account to pull the latest image from it and then processes to remove the container and stop it, restarting it until the docker process is started up again.
3. Where it should be on the instance (if someone were to use your setup)
  - The location of the resart script is within my ec2 instance is in my home directory or the path /home/williams-ec2/container_restart_script.sh.

_Setting up a webhook on the instance_

1. How to install adnanh's webhook to the instance 
   - sudo apt-get install webhook
2. How to start the webhook since our instance's reboot, we need to handle this
   1. Create a service unit file: 'sudo nano /etc/systemd/system/container-webhook.service'
   2. Add the contents of the webhook defination file to the webhook service file
   3. Reload the service: 'sudo systemctl daemon-reload'
   4. Start the service: 'sudo systemctl start container-webhook'
   5. Make it noew start on reboot: 'sudo systemctl enable container-webhook'
   6. Make sure the service is running: 'sudo systemctl status container-webhook'
   7. Test is by rebooting the server and check again to make sure the service started up correctly.

_webhook task definition file_

1. Description of what it does
   - The webhook on my ec2 instance is set up to if a message is recieved telling the instance to run the restart script, it will do just that running the container restart script, when prompted to.
2. Where it should be on the instance (if someone were to use your setup)
   -The location of this is the same as my container restart script, it being in my home directory /home/williams-ec2/container-restart-script.sh

_How to configure GitHub OR DockerHub to message the listener_
1. GitHub steps
   1. Create a Webhook Endpoint that can receive HTTP requests, this is usually a server with a public URL.
   2. Login into GitHub account, and use an existing repository or create a new one.
   3. Configure a Webhook on GitHub 
     1. Click onto your GitHub repository
     2. Go to settings, webhooks, add webhooks
     3. In the field called 'Payroll URL' enter in the URL of your webhook and choose the events you want to be notified of like it being pushed, a pull requests occuring or if a rebooti command is given.
     4. Set the webhook to be active
     5. Save the webhook to GitHub
2. DockerHub steps
   1. Like in the GitHub steps a Webhook end point is needed to be created that accepts HTTP requests
   2. Login into your DockerHub account
   3. Optional: If you are a premium member you can make an automated build for the repository.
   4. Otherwise manually configure a webhook on DockerHub
      1. Navigate to the chosen DockerHub repository
      2. Go to settings, webhooks, create a webhook
      3. Enter a name for the webhook in the Name field
      4. Enter the webhook URL in the URL field
      5. Choose the event you wish to be notified of (push, pull requests, reboots)
      6. Save the webhook.
  
1. Provide proof that the CI & CD workflow work. This means:



https://github.com/WSU-kduncan/f23cicd-CalmWizard890/assets/112407371/fc0b673a-8c52-47d0-8d2b-bbeeb6f2ab83


