# RVA R users 20190522

# The Azure Portal
# Data Science Virtual Machine
#   https://www.intel.ai/intel-optimized-data-science-virtual-machine-azure/#gs.ctgbk4

# Log on use the RDP file
# Username and password
# username   UserXX
# password   PhlogistonaetherXX

# If you prefer Linux go ahead and download the X2Go client and login to it. 
# public IP, username and password.

# MRAN
# checkpoint and multithreading 
# matrixPerf.R

# Cloudyr   https://cloudyr.github.io/
# https://blog.revolutionanalytics.com/
# https://blog.revolutionanalytics.com/2018/11/azurer-intro.html

library(checkpoint)
checkpoint("2019-05-20")

install.packages("AzureRMR")
library(AzureRMR)

# authenticate with Azure AD:
# - on first login to this client, call create_azure_login()
# - on subsequent logins, call get_azure_login()
az <- create_azure_login()
az
az$list_subscriptions()

#https://blog.revolutionanalytics.com/2018/12/azurestor.html
install.packages("AzureStor")
library(AzureStor)

#bl_endp_key <- storage_endpoint("https://unidemo.blob.core.windows.net/", key=access_key)
#fl_endp_sas <- storage_endpoint("https://mystorage.file.core.windows.net", sas="my_sas")
#ad_endp_tok <- storage_endpoint("https://mystorage.dfs.core.windows.net", token="my_token")

#blob_endp_sas <- storage_endpoint("https://unidemo.blob.core.windows.net/", sas=my_sas)

# alternative (recommended) way of supplying an AAD token
#token <- AzureRMR::get_azure_token("https://storage.azure.com",
 #                                  tenant="myaadtenant", app="app_id", password="mypassword"))
#ad_endp_tok2 <- storage_endpoint("https://mystorage.dfs.core.windows.net", token=token)

my_sas = "<your sas token goes here>"
bl_endp_key <- storage_endpoint("https://unidemo.blob.core.windows.net", sas = my_sas)

bl_endp_key

list_storage_containers(bl_endp_key)

cont <- storage_container(bl_endp_key, "unisys")
cont
list_storage_files(cont)

pcap <- download_blob(cont, src = "20150728Mixed.csv", dest = NULL)
View(pcap)

# install packages for r Markdown
install.packages(c("htmltools", "caTools", "bitops", "base64enc", "rmarkdown"))
