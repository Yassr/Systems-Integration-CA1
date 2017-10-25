
#!/usr/bin/python
import os, sys
import getpass
import grp

fd = os.open("home", os.O_RDWR|os.O_CREAT)

info = os.fstat(fd)
username = getpass.getuser()

print "User ID: %d" % info.st_uid
print "Group ID: %d" % info.st_gid
print "User Name: %s" % username
print "Group Name: %s" % grp.getgrgid(info.st_gid)[0]
print "iNode: %d" % info.st_ino




