*** Settings ***
#Resource         ${PROJECTROOT}${/}resources${/}common.robot
Resource         ..${/}..${/}resources${/}common.robot
Test Teardown      Run Keyword If Test Failed    Tomar screenshoot
                   Close Application

*** Variables ***


*** Test cases ***
Consultar saldo c.128
    Link                         https://jira.tigo.net.bo/browse/MFS-22
    Set Up And Open Android Application
    Opcion teclado
    Marcar                              *55511#5#
    Llamar
    Verificar mensaje                   Tu saldo total de Tigo Money
    Tomar screenshoot
    Verificar Enviar
Consultar saldo c.129
    Link                         https://jira.tigo.net.bo/browse/MFS-26
    Set Up And Open Android Application
    Opcion teclado
    Marcar                              *55511#6#1234#
    Llamar
    Verificar mensaje                   PIN incorrecto
    Tomar screenshoot
    Verificar Enviar
***Keywords***
