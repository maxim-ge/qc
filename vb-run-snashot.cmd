@echo off

VBoxManage controlvm node1of3 poweroff 
VBoxManage controlvm node2of3 poweroff 
VBoxManage controlvm node3of3 poweroff 

VBoxManage snapshot node1of3 restore %1
VBoxManage startvm node1of3 --type headless

