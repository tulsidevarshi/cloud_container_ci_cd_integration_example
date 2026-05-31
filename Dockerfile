FROM mcr.microsoft.com/azure-functions/python:4-python3.10
 
# Azure Functions runtime expects this directory 
ENV AzureWebJobsScriptRoot=/home/site/wwwroot \ 
    AzureFunctionsJobHost__Logging__Console__IsEnabled=true
 
# Install dependencies
COPY requirements.txt /
RUN pip install --no-cache-dir -r /requirements.txt
 
# Copy source code
COPY . /home/site/wwwroot
