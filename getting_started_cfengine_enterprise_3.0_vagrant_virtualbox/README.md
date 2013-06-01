# Getting setup
0. See what baseboxes you have installed
````
vagrant box list
````

1. Import the baseboxe I have provided
````
vagrant box add centos-5.x-i386_nickanderson_201304271927 resources/veewee/centos-5.x-i386_nickanderson_201304271927.box
````

2. Make sure its installed
````
vagrant box list
````

3. Start a vagrant project based on that box
````
vagrant init centos-5.x-i386_nickanderson_201304271927
````

4. Check the status of the vagrant nodes defined
````
vagrant status
````

5. Bring up a node
````
vagrant up
````

6. Check the status
````
vagrant status
````

7. SSH to the vm
````
vagrant ssh
````

8. Destroy the VM
````
vagrant destroy
````

9. Define multiple VMs (I have this done for you)
````
cp Vagrantfile-Simple Vagrantfile
````

10. Start them up
````
vagrant up
````

11. Check the status
````
vagrant status
````

12. SSH to each vm
````
vagrant ssh hub
vagrant ssh node001
````

13. Stop the VMs
````
vagrant halt
````
