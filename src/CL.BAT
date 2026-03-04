clipper %1 /w /b >compila.txt
if not errorlevel 1 rtlink file %1
if errorlevel 1 edit compila.txt /h
