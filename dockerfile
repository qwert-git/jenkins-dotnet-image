# Starting off with the Jenkins base Image
FROM jenkins/jenkins:lts

 # Switch to root to install .NET Core SDK
USER root

# Just for my sanity... Show me this distro information!
RUN uname -a && cat /etc/*release

COPY ./dotnet-install.sh ./dotnet-install.sh

# RUN chmod +x ./dotnet-install.sh

# RUN ./dotnet-install.sh --version latest
RUN apt-get update && apt-get install wget

RUN wget https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb -O ./packages-microsoft-prod.deb
RUN dpkg -i ./packages-microsoft-prod.deb
RUN rm ./packages-microsoft-prod.deb

RUN apt-get update && apt-get install -y dotnet-sdk-6.0

# Good idea to switch back to the jenkins user.
USER jenkins


VOLUME /var/jenkins_home
