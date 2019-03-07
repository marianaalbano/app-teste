FROM ubuntu:latest
MAINTAINER mariana.albano@outlook.com

#Install git and cron
RUN apt-get update
RUN apt-get -y install vim
RUN apt-get -y install cron
RUN apt-get -y install python3
RUN apt-get -y install git

# copy crontab file in the cron directory
COPY config/crontab /etc/cron.d/crontab

# cpy script file in the script directory
COPY scripts /opt/scripts

# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/crontab

# Apply cron job
RUN crontab /etc/cron.d/crontab

# Create the log file to be able to run tail
RUN touch /var/log/cron.log

# Run the command on container startup
CMD cron && tail -f /var/log/cron.log