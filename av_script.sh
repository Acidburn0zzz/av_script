#This program is free software; you can redistribute it and/or
#modify it under the terms of the GNU General Public License
#as published by the Free Software Foundation; either version 2
#of the License, or (at your option) any later version.
 
#This program is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#GNU General Public License for more details.
 
#You should have received a copy of the GNU General Public License
#along with this program; if not, write to the Free Software
#Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 
#!/bin/bash
 
clear
pacman -Syy
 
echo ""
echo "Installing ClamAV"
 
echo ""
pacman -S clamav
echo ""
 
echo "Updating virus definitions"
echo ""
freshclam
echo ""
 
echo "Creating directory for logs..."
mkdir /var/log/avscan
sleep 1
echo ""
 
echo "Output of scan will be stored in /var/log/avscan/scan.log"
sleep 2
echo ""
 
echo "Checking all files on system"
clamscan -r / --max-filesize=2000M --max-scansize=2000M -l /var/log/avscan/scan.log
