@ECHO OFF

REM Insert path to repo here after the '=' sign:
SET PATH_TO_REPO=

SETLOCAL
IF EXIST *.gltf (
    CALL :replace_model
 ) ELSE ( 
    CALL :show_error 
 )
PAUSE
EXIT /B %ERRORLEVEL% 

:replace_model 
ECHO:
ECHO Detected GLTF files in this directory:
ECHO -------------------------------------------------
ECHO:
DIR /B /A:-D *.gltf
ECHO:
ECHO -------------------------------------------------
ECHO:
SET /p MODEL_NAME="Selected file: "
ECHO:
SET /p OUTPUT_FILE_NAME="Output file name: "
ECHO:
ECHO -------------------------------------------------
ECHO:
ECHO Converting GLTF model to React file...
ECHO:
CALL npx gltfjsx %MODEL_NAME% %OUTPUT_FILE_NAME%.js
ECHO:
ECHO -------------------------------------------------
ECHO:
ECHO Moving files to: %PATH_TO_REPO%...
ECHO:
REM Type in the model's destination path (usually 'public' folder in a React app)
MOVE %MODEL_NAME% %PATH_TO_REPO%\public
ECHO:
REM Type in the produced .js file (usually the component's folder)
MOVE %OUTPUT_FILE_NAME%.js %PATH_TO_REPO%\src\Components\
ECHO:
ECHO -------------------------------------------------
ECHO:
EXIT /B 0

:show_error
ECHO -------------------------------------------------
ECHO:
ECHO No models found.
ECHO:
ECHO -------------------------------------------------
ECHO:
EXIT /B 0