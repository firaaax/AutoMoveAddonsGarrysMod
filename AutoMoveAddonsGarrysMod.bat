@echo off
setlocal enabledelayedexpansion

:: Déclaration des variables
set sourcecss="%CD%\steamapps\common\GarrysMod\garrysmod\addons\css-content-gmodcontent"
set successCount=0
set errorCount=0

:: Vérification de l'existence des fichiers
if exist %sourcecss% (
  echo Les fichiers sont actuellement dans Gmod. {donc option 1}
) else (
  echo Les fichiers ne sont pas dans Gmod. {donc option 2} 
)

:: Menu
echo -----------------------
echo Choisissez une option :
echo 1 - Retirer le css, le advdupe2, les addons
echo 2 - Remettre le css, le advdupe2, les addons (bugs présents)
echo -----------------------

:: Choix de l'utilisateur (boucle jusqu'à ce que l'entrée soit valide)
set "option="
:askOption
set /p option=Entrez votre choix (1 ou 2) :
if "%option%"=="1" goto option1
if "%option%"=="2" goto option2
echo Choix invalide. Entrez 1 ou 2.
goto askOption

:option1
:: Déplacement des fichiers du choix 1 (retirer les fichiers de Gmod)
echo Deplacement en cours...
move "%CD%\steamapps\common\GarrysMod\garrysmod\addons\css-content-gmodcontent" "%CD%" 2>nul
if !errorlevel! equ 0 (
  echo Le dossier css-content-gmodcontent a été déplacé avec succès.
  set /a successCount+=1
) else (
  echo Erreur : Impossible de déplacer le dossier css-content-gmodcontent.
  set /a errorCount+=1
)

move "%CD%\steamapps\common\GarrysMod\garrysmod\data\advdupe2" "%CD%" 2>nul
if !errorlevel! equ 0 (
  echo Le dossier advdupe2 a été déplacé avec succès.
  set /a successCount+=1
) else (
  echo Erreur : Impossible de déplacer le dossier advdupe2.
  set /a errorCount+=1
)

move "%CD%\steamapps\common\GarrysMod\garrysmod\cache\workshop" "%CD%" 2>nul
if !errorlevel! equ 0 (
  echo Le dossier workshop a été déplacé avec succès.
  set /a successCount+=1
) else (
  echo Erreur : Impossible de déplacer le dossier workshop.
  set /a errorCount+=1
)

move "%CD%\steamapps\common\GarrysMod\garrysmod\cache\lua" "%CD%" 2>nul
if !errorlevel! equ 0 (
  echo Le dossier lua a été déplacé avec succès.
  set /a successCount+=1
) else (
  echo Erreur : Impossible de déplacer le dossier lua.
  set /a errorCount+=1
)

move "%CD%\steamapps\workshop\content\4000" "%CD%" 2>nul
if !errorlevel! equ 0 (
  echo Le dossier content\4000 a été déplacé avec succès.
  set /a successCount+=1
) else (
  echo Erreur : Impossible de déplacer le dossier content\4000.
  set /a errorCount+=1
)

move "%CD%\steamapps\workshop\appworkshop_4000.acf" "%CD%" 2>nul
if !errorlevel! equ 0 (
  echo Le fichier appworkshop_4000.acf a été déplacé avec succès.
  set /a successCount+=1
) else (
  echo Erreur : Impossible de déplacer le fichier appworkshop_4000.acf.
  set /a errorCount+=1
)

goto endScript

:option2
:: Déplacement des fichiers du choix 2 (remettre les fichiers dans Gmod)
echo Deplacement en cours...
if not exist "%CD%\steamapps\common\GarrysMod\garrysmod\addons" mkdir "%CD%\steamapps\common\GarrysMod\garrysmod\addons"
if not exist "%CD%\steamapps\common\GarrysMod\garrysmod\data" mkdir "%CD%\steamapps\common\GarrysMod\garrysmod\data"
if not exist "%CD%\steamapps\common\GarrysMod\garrysmod\cache" mkdir "%CD%\steamapps\common\GarrysMod\garrysmod\cache"
if not exist "%CD%\steamapps\workshop\content" mkdir "%CD%\steamapps\workshop\content"

move "%CD%\css-content-gmodcontent" "%CD%\steamapps\common\GarrysMod\garrysmod\addons\css-content-gmodcontent" 2>nul
if !errorlevel! equ 0 (
  echo Le dossier css-content-gmodcontent a été déplacé avec succès.
  set /a successCount+=1
) else (
  echo Erreur : Impossible de déplacer le dossier css-content-gmodcontent.
  set /a errorCount+=1
)

move "%CD%\advdupe2" "%CD%\steamapps\common\GarrysMod\garrysmod\data\advdupe2" 2>nul
if !errorlevel! equ 0 (
  echo Le dossier advdupe2 a été déplacé avec succès.
  set /a successCount+=1
) else (
  echo Erreur : Impossible de déplacer le dossier advdupe2.
  set /a errorCount+=1
)

move "%CD%\workshop" "%CD%\steamapps\common\GarrysMod\garrysmod\cache\workshop" 2>nul
if !errorlevel! equ 0 (
  echo Le dossier workshop a été déplacé avec succès.
  set /a successCount+=1
) else (
  echo Erreur : Impossible de déplacer le dossier workshop.
  set /a errorCount+=1
)

move "%CD%\lua" "%CD%\steamapps\common\GarrysMod\garrysmod\cache\lua" 2>nul
if !errorlevel! equ 0 (
  echo Le dossier lua a été déplacé avec succès.
  set /a successCount+=1
) else (
  echo Erreur : Impossible de déplacer le dossier lua.
  set /a errorCount+=1
)

move "%CD%\4000" "%CD%\steamapps\workshop\content\4000" 2>nul
if !errorlevel! equ 0 (
  echo Le dossier content\4000 a été déplacé avec succès.
  set /a successCount+=1
) else (
  echo Erreur : Impossible de déplacer le dossier content\4000.
  set /a errorCount+=1
)

move "%CD%\appworkshop_4000.acf" "%CD%\steamapps\workshop\appworkshop_4000.acf" 2>nul
if !errorlevel! equ 0 (
  echo Le fichier appworkshop_4000.acf a été déplacé avec succès.
  set /a successCount+=1
) else (
  echo Erreur : Impossible de déplacer le fichier appworkshop_4000.acf.
  set /a errorCount+=1
)

goto endScript

:endScript
:: Message de fin
if !successCount! equ 5 (
  echo Tous les dossiers ont été déplacés avec succès.
) else (
  if !errorCount! gtr 0 (
    echo !successCount! dossiers déplacés avec succès, !errorCount! erreurs.
  ) else (
    echo Aucune opération de déplacement nécessaire.
  )
)
pause
