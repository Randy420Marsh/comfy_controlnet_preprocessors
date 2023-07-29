@echo off
CALL :NORMALIZEPATH "python3.exe"
if exist "python3" (
    echo Custom Python build of ComfyUI standalone executable detected:
    echo "%RETVAL%"
    echo --------------------------------------------------
    python install.py %1
) else (
    for /f "tokens=*" %%i in ('where python') do set "PYTHON_PATH=%%i" & goto :done
    :done
    echo Custom Python not found. Use system's Python executable instead:
    echo %PYTHON_PATH%
    echo --------------------------------------------------
    python3 install.py %1
)

:NORMALIZEPATH
    SET RETVAL=%~f1
    EXIT /B
