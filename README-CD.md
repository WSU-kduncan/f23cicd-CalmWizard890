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

