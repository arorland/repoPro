@echo off
set cont=0
set archivo2=robotframework-reports\output
set extension=xml
set outputSMS=tigoMoney_sms\target\robotframework-reports\output
set outputUSSD=tigoMoney_ussd\target\robotframework-reports\output
set outputWEB=tigoMoney_web\target\robotframework-reports\output
set outputPrincipal=robotframework-reports
:Loop
	if "%cont%" == "%0%" goto 
	copy "%outputUSSD%"."%extension%" "%archivo2%"_"%cont%"."%extension%"
	set /A cont+=1
	if "%cont%" == "%1%" goto
	copy "%outputSMS%"."%extension%" "%archivo2%"_"%cont%"."%extension%"
	set /A cont+=1
	if "%cont%" == "%2%" goto 
	copy "%outputWEB%"."%extension%" "%archivo2%"_"%cont%"."%extension%"
	set /A cont+=1
	cd "%outputPrincipal%"
	rebot --output output --name Tigo_Money *.xml
:End