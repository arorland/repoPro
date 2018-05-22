*** settings ***
Documentation   Prueba de web
Library   SeleniumLibrary

*** variables ***
${url}    https://www.google.com.bo/
${browser}    firefox

*** keywords ***

Abrir Navegador
    [Documentation]   Ingresamos al Navegador
    Open Browser    ${url}  ${browser}
    Maximize Browser Window

*** Test Cases ***
Prueba tres
    [Documentation]   Prueba "prueba 3"
    Abrir Navegador
    Close Browser
