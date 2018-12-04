# Create a self-contained installer in Bash

This is an example of how to create a self contained Linux command line installer in Bash that will decompress an archive and ask the user to read and accept the license in order to complete the installation.

The content files can be modified according to your need. The content here is just to follow the procedure and can generate a dummy installer with a license acceptance requested.

## Installer content

This installer is basically a self-extracting archive with some logic around, consists in following parts:

- A bash script that performs the extraction of the archive.
- Logic for  asking the user to read and accept the LICENSE.txt file.
- A marker to separate the bash script and the archive.
- An archive containing the actual data to install.

## Creating the installer

### Package your contenct files along with the license file

A tarball with the content files and the lincense should be created. 


	tar -cvzf content.tar.gz DummyContent.txt  LICENSE.txt


### Generate an installer.sh

Copy the template.sh to a file called installer.sh or the name you want for the self-extracting final file

	cp template.sh installer.sh


Append the content tarball to the installer.sh file

	
	cat content.tar.gz >> installer.sh


**Optionally** you can modify the logic on the final installer.sh according to your needs.
You can simply open the installer.sh on your favorite text editor

	vim installer.sh


### Test your installer

Grant execution permissions and run your installer

	chmod +x installer.sh
	mkdir test
	cd test
	cp ../installer.sh .
	./installer.sh


