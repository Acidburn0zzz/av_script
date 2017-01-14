#######################################################################

## This section checks what package manager is in use

if [ -d /var/log/apt ]; then  
	apt-get install clamav
fi

if [ -d /var/log/dnf ]; then
	dnf install clamav
fi

if [ -f /var/log/pacman.log ]; then
	pacman -S clamav
fi

#######################################################################

echo "Updating Virus Database"
freshclam -v

echo "What would you like to do now?"
echo "1) Scan single file"
echo "2) Scan directory"
echo "3) Scan entire system"

	read option
		
		if [ $option = 1 ]; then
		echo "Please enter name of file"
		read filename
		clamscan $filename
		fi
		
		if [ $option = 2 ]; then
		echo "Please enter name of directory"
		read directory
		clamscan -r $directory
		fi
		
		if [ $option = 3 ]; then
		echo "Scanning Entire System...please wait"
		clamscan -r / --max-filesize=2000M --max-scansize=2000M
		fi


#######################################################################
