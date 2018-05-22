@echo off
set cont=0
set outputSMS=tigoMoney_sms\target\robotframework-reports\
set outputUSSD=tigoMoney_ussd\target\robotframework-reports\
set outputWEB=tigoMoney_web\target\robotframework-reports\
set outputPrincipal=robotframework-reports
:Loop
	if "%cont%" == "%0%" goto
	cd "%outputUSSD%"
	del *.* /Q
	cd..
	cd..
	cd..
	set /A cont+=1
	if "%cont%" == "%1%" goto
	cd "%outputSMS%"
	del *.* /Q
	cd..
	cd..
	cd..
	set /A cont+=1
	if "%cont%" == "%2%" goto
	cd "%outputWEB%"
	del *.* /Q
	cd..
	cd..
	cd..
	set /A cont+=1
	if "%cont%" == "%3%" goto
	cd "%outputPrincipal%"
	del *.* /Q
	cd..
:End