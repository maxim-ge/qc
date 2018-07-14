@echo off
VBoxManage controlvm node1of3 pause
VBoxManage controlvm node2of3 pause
VBoxManage controlvm node3of3 pause
VBoxManage snapshot node1of3 take "%1"
VBoxManage snapshot node2of3 take "%1"
VBoxManage snapshot node3of3 take "%1"
VBoxManage controlvm node1of3 resume
VBoxManage controlvm node2of3 resume
VBoxManage controlvm node3of3 resume