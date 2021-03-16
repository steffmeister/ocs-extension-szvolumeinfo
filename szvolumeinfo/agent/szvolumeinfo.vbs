'----------------------------------------------------------
' Plugin for OCS Inventory NG 2.x
' Script : Volume Info
' Version : 1.0
' Date : 03/03/2021
' Authors : Stefan ZIDAR
'----------------------------------------------------------
' OS checked [X] on	32b	64b	(Professionnal edition)
'	Windows XP		[ ]
'	Windows Vista	[ ]	[ ]
'	Windows 7		[ ]	[ ]
'	Windows 8.1		[ ]	[ ]	
'	Windows 10		[ ]	[X]
'	Windows 2k8R2		[ ]
'	Windows 2k12R2		[ ]
'	Windows 2k16		[ ]
' ---------------------------------------------------------
' NOTE : No checked on Windows 8
' ---------------------------------------------------------
Option Explicit
On Error Resume Next

'====================================================
dim objFSO, colDrives, objDrive
Set objFSO = CreateObject("Scripting.FileSystemObject")
Set colDrives = objFSO.Drives
dim volume_info

function getDriveType(decDriveType)
	select case decDriveType
		case 0:getDriveType = "Unknown"
		case 1:getDriveType = "Removable"
		case 2:getDriveType = "Fixed"
		case 3:getDriveType = "Network"
		case 4:getDriveType = "CD-ROM"
		case 5:getDriveType = "RAM Disk"
	end select
end function 

For Each objDrive in colDrives
	volume_info = "<SZVOLUMEINFO>" & vbNewLine
	volume_info = volume_info & "<DRIVELETTER>" & objDrive.DriveLetter & "</DRIVELETTER>" & vbNewLine
	volume_info = volume_info & "<DRIVETYPE>" & getDriveType(objDrive.DriveType) & "</DRIVETYPE>" & vbNewLine
	volume_info = volume_info & "<TOTALSIZE>" & objDrive.TotalSize & "</TOTALSIZE>" & vbNewLine
	volume_info = volume_info & "<VOLUMENAME>" & objDrive.VolumeName & "</VOLUMENAME>" & vbNewLine
	volume_info = volume_info & "<SERIALNUMBER>" & Hex(objDrive.SerialNumber) & "</SERIALNUMBER>" & vbNewLine
	volume_info = volume_info & "<SHARENAME>" & objDrive.ShareName & "</SHARENAME>" & vbNewLine
	'volume_info = volume_info & "<ROOTFOLDER>" & objDrive.RootFolder & "</ROOTFOLDER>" & vbNewLine
	'volume_info = volume_info & "<PATH>" & objDrive.Path & "</PATH>" & vbNewLine
	volume_info = volume_info & "<ISREADY>" & objDrive.IsReady & "</ISREADY>" & vbNewLine
	volume_info = volume_info & "<FREESPACE>" & objDrive.FreeSpace & "</FREESPACE>" & vbNewLine
	volume_info = volume_info & "<FILESYSTEM>" & objDrive.FileSystem & "</FILESYSTEM>" & vbNewLine
	volume_info = volume_info & "<AVAILABLESPACE>" & objDrive.AvailableSpace & "</AVAILABLESPACE>" & vbNewLine
	volume_info = volume_info & "</SZVOLUMEINFO>"
	wscript.echo(volume_info)
Next