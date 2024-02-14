@echo off
setlocal EnableDelayedExpansion

rem Criar arquivo de log

set "logFile=log.txt"

echo Limpeza de pastas temporárias >> "%logFile%"
echo Data: %date:~0,10% >> "%logFile%"
echo Hora: %time:~0,2% >> "%logFile%"

rem Definir variáveis
set "pasta1=%temp%"
set "pasta2=%systemroot%\temp"
set "pasta3=%systemroot%\Prefetch"

rem Chamar a função para limpar a pasta %temp%
call :LimparPastaTemp "%pasta1%"

rem Chamar a função para limpar a pasta temp
call :LimparPastaTemp2 "%pasta2%"

rem Chamar a função para limpar a pasta prefetch
call :LimparPastaPrefetch "%pasta3%"

rem Exibir mensagem de finalização
echo Processo de limpeza finalizado.
echo "Ele está apagando os arquivos que consegue e deixando de lado aqueles que não pode excluir por falta de permissao. Se você quiser ter certeza de que os arquivos foram apagados corretamente, pode olhar nas pastas indicadas por conta propria ou verificar um arquivo chamado log.txt em "%logFile%" para ver quais arquivos foram removidos com sucesso."
pause
shutdown /s /t 60 >> "%logFile%"
exit /b

:LimparPastaTemp
echo Limpando a pasta %1...
forfiles /p %1 /s /m *.* /D -2 /c "cmd /c if @isdir==FALSE (del @file 2>nul) else (rd /s /q @file 2>nul)" >> "%logFile%"
exit /b

:LimparPastaTemp2
echo Limpando a pasta %1...
forfiles /p %1 /s /m *.* /D -2 /c "cmd /c if @isdir==FALSE (del @file 2>nul) else (rd /s /q @file 2>nul)" >> "%logFile%"
exit /b

:LimparPastaPrefetch
echo Limpando a pasta %1...
forfiles /p %1 /s /m *.* /D -2 /c "cmd /c if @isdir==FALSE (del @file 2>nul) else (rd /s /q @file 2>nul)" >> "%logFile%"
exit /b

