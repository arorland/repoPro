*** Settings ***
Library           AppiumLibrary    run_on_failure=Capture Screenshot On Failure

*** Variables ***
${SCREENSHOTS}                  ${EXECDIR}${/}screenshots${/}

${REMOTE_URL}                   http://localhost:4723/wd/hub
${APP_PACKAGE}                  com.android.contacts
${appActivity}                  com.android.contacts.activities.PeopleActivity
${AUTOMATION_NAME}              appium

${PLATFORM_NAME_ANDROID}        Android
${PLATFORM_VERSION_ANDROID}     5.1.1   # Uncomment this from the 'Open Application' keyword if you want to be spesific
${DEVICE_NAME_ANDROID}          Android Emulator    # IP address?
${APP_ANDROID}                  ${CURDIR}${/}app${/}BitbarSampleApp.apk
#${APP_ANDROID}                  ${PROJECTROOT}${/}application.apk
# ${TECLADO}                      xpath = //*[contains(@text, 'Teclado')]
${TECLADO}                      id = com.android.contacts:id/tab_custom_view_text
${INPUT_NAME_FIELD}             id = com.android.contacts:id/digits
${SUBMIT_BUTTON}                id = com.android.contacts:id/dialButton
${SLEEP}                        15
${DIALOGO_MENSAJE}              id = com.android.phone:id/dialog_message
# ${BOTON_CANCELAR}               xpath = //*[contains(@text, 'Cancelar')]
${BOTON_CANCELAR}               id = android:id/button2
${BOTON_ENVIAR}                 id = android:id/button1
${INPUT_NAME_FIELD_2}           id = com.android.phone:id/input_field
${SUITE METADATA}

${PLATFORM_NAME_IOS}            ios
${PLATFORM_VERSION_IOS}         9.0.2   # Uncomment this from the 'Open Application' keyword if you want to be spesific
${DEVICE_NAME_IOS}              iOS Emulator    # IP address?
${APP_IOS}                      ${CURDIR}${/}app${/}BitbarIOSSample.ipa
${AUTO_ACCEPT_ALERTS}           true


*** Keywords ***

Set Up And Open Android Application
    Open Application    ${REMOTE_URL}    platformName=${PLATFORM_NAME_ANDROID}    #platformVersion=${PLATFORM_VERSION_ANDROID}
    ...    deviceName=${DEVICE_NAME_ANDROID}    automationName=${AUTOMATION_NAME}    appPackage=${APP_PACKAGE}      appActivity=${appActivity}
    #Wait Until Page Contains    What is the best way to test your application    5s

Set Up And Open Ios Application
    Open Application    ${REMOTE_URL}    platformName=${PLATFORM_NAME_IOS}    #platformVersion=${PLATFORM_VERSION_IOS}
    ...    deviceName=${DEVICE_NAME_IOS}    app=${APP_IOS}    automationName=${AUTOMATION_NAME}    appPackage=${APP_PACKAGE}
    ...    autoAcceptAlerts=${AUTO_ACCEPT_ALERTS}
    Wait Until Page Contains    What is the best way to test your application    5s

Capture Screenshot On Failure
    Capture Page Screenshot    ${SCREENSHOTS}${/}${TEST NAME}.png

Opcion teclado
    Click Element    ${TECLADO}


Marcar
    [Arguments]    ${codigo}
    Input Text    ${INPUT_NAME_FIELD}    ${codigo}

Marcar_2
    [Arguments]    ${codigo}
    # Wait Until Page Contains Element    ${BOTON_CANCELAR}
    Input Text    ${INPUT_NAME_FIELD_2}    ${codigo}

Llamar
    Click Element    ${SUBMIT_BUTTON}

Verificar mensaje
    [Arguments]    ${mensaje}
#esperar un tiempo hasta que aparesca el Dialogo
    Wait Until Element Is Visible       ${DIALOGO_MENSAJE}      ${SLEEP}
#verificar el mensaje si es el esperado
    Element Should Contain Text         ${DIALOGO_MENSAJE}      ${mensaje}

Tomar screenshoot
    Capture Page Screenshot         ..${/}..${/}screenshots${/}${TEST_NAME}.png

Verificar dialogo
    ${BotonCancelarVisisble} =    Page Should Contain Element    ${BOTON_CANCELAR}
    Run keyword If    ${BotonCancelarVisisble}    Cerrar dialogo

Cerrar dialogo
    Click Element    ${BOTON_CANCELAR}

Enviar
    Click Element    ${BOTON_ENVIAR}

Verificar Enviar
    Wait Until Page Contains Element    ${BOTON_ENVIAR}
    Click Element    ${BOTON_ENVIAR}

Link
    [Arguments]    ${url_test}
    Set Suite Metadata    url_test    ${url_test}
