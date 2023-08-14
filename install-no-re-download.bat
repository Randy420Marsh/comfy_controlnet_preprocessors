@echo off
CALL :NORMALIZEPATH "python.exe"
if exist "python" (
    echo Custom Python build of ComfyUI standalone executable detected:
    echo "%RETVAL%"
    echo --------------------------------------------------
    python install-no-re-download.py %1
) else (
    for /f "tokens=*" %%i in ('where python') do set "PYTHON_PATH=%%i" & goto :done
    :done
    echo Custom Python not found. Use system's Python executable instead:
    echo %PYTHON_PATH%
    echo --------------------------------------------------
    python install-no-re-download.py %1
)

:NORMALIZEPATH
    SET RETVAL=%~f1
    EXIT /B
