@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

rem Set values for your storage account
set subscription_id=cfacc2df-d985-4746-aaa5-848ce7e43a34
set azure_storage_account=margiestravelsstorage
set azure_storage_key=DefaultEndpointsProtocol=https;AccountName=margiestravelsstorage;AccountKey=BlinvgSJ9T+PItQzumeEh9q5GkQzQJ3fZDrrfEkY5+kdNDA3aNMORInEf4VJvd6kjDPnR77+/LRd+AStYZEB0g==;EndpointSuffix=core.windows.net


echo Creating container...
call az storage container create --account-name !azure_storage_account! --subscription !subscription_id! --name margies --public-access blob --auth-mode key --account-key !azure_storage_key! --output none

echo Uploading files...
call az storage blob upload-batch -d margies -s data --account-name !azure_storage_account! --auth-mode key --account-key !azure_storage_key!  --output none
