FROM <domain>/development-ubuntu:<version>
ADD README.md .
RUN wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb && \
    dpkg -i packages-microsoft-prod.deb && \
    apt install -y apt-transport-https ca-certificates && \
    apt -y update && \
    apt install -y dotnet-sdk-3.0 && \
    echo $(dotnet --info) 

RUN dotnet new -i Expecto.Template::* && \
    dotnet tool install fake-cli -g && \
    dotnet new -i "fake-template::*"

