#!/bin/bash
clear
tput cup 1 18 ; echo -n "**************************"
tput cup 2 18 ; echo -n "SCRIPT PARA CREAR USUARIOS"
tput cup 3 18 ; echo -n "**************************"
echo
echo 
echo "Ingrese el nombre del nuevo usuario: "
read nombre
if [ "$home" == "" ] ; then
home="/home/$nombre"
fi
echo "Ingrese el grupo (default 1000): "
read grupo

if [ "$grupo" == "" ] ; then
grupo=1000
fi

echo "Ingrese el shell a utilizar (default /bin/bash): "
read shell
if [ "$shell" == "" ] ; then
shell="/bin/bash"
fi
clear
echo "Los datos ingresados son los siguientes:"
echo "****************************************"
echo -e "\n"
echo "Nombre del usuario: $nombre"
echo "Shell por defecto : $shell"
echo "Directorio home: $home"
echo "Grupo del usuario: $grupo"
echo "-------------------------------------------"
echo "Si los datos son correctos pulse una tecla,"
echo "de lo contrario pulse Ctrl+C para cancelar"
read
useradd -d /home/$nombre -g $grupo -m -s $shell $nombre
if [ "$?" != 0 ] ; then
echo -e "\n"
echo "Ha ocurrido un error, asegurese de que los datos ingresados son correctos."
exit 1
fi
echo -e "\n"
echo "Ingrese una contraseña para $nombre"
passwd $nombre
echo -e "\n"
echo "El usuario fue creado satisfactoriamente"
