*** Settings ***
#Resource         ${PROJECTROOT}${/}resources${/}common.robot
Resource         ..${/}..${/}resources${/}common.robot
Test Teardown      Run Keyword If Test Failed    Tomar screenshoot
                   Close Application

*** Variables ***


*** Test cases ***
#*************************Ariel Anivarro **********************************
Envio a USSD
    Set Up And Open Android Application
    #Verificar dialogo
    close Application
