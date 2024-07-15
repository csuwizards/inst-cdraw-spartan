# This task installs both ChemDraw and Spartan for Science Chem Lab #415
$public = "c:\temp"
# mkdir "$public\SS415"
$workdir="$public\SS415"
cd $workdir
# Get rid of directory of any previously=existing chemdraw files & expand latest installer
rm -rec -force ChemDraw
mkdir ChemDraw
Expand-Archive ChemDraw.zip -DestinationPath "${workdir}" -Force

# Install ChemOffice
msiexec /i "${workdir}\Chemdraw\PerkinElmer\ChemOffice\PerkinElmer_ChemOffice_Suite_2018.msi" /qn 
msiexec /i "${workdir}\Chemdraw\PerkinElmer\ChemOffice\PerkinElmer_ChemOffice_64-bit_Support_18.0.msi" /qn

# Spartan network-licensing install
Start-Process Spartan20Installer114.exe -ArgumentList "/S /Network=172.22.12.4" -Wait
# Spartan20Installer114.exe "/S /Network=172.22.12.4" -Wait 

# Unzip rezipped COS (for mercury stuff...)