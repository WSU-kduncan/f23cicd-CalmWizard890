import subprocess

def lambda_handler(event, context):
    # Run the container restart script on your EC2 instance
    subprocess.run(["/path/to/container_restart_script.sh"], shell=True)

# Make sure to edit the path/to part to be the exact path to the container restart script
# The place that I had put to container restart script was in my home directory that path being /home/williams-ec2/container_restart_script.sh
