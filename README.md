DOCKER-HG2GIT
=============

##Description

The docker image convert hg repository to git repository, it uses Rocco Rutte's fast-export.


##Usage

	1.  Run docker image in PowerShell
		docker run -it --rm -v /c/Users/<USER-ID>/Temp:/home/taster/Temp tinysun/hg2git
		
	2.  Command for clone and convert

		hg clone <remote repository url>
		hg2git <mercurial repository>
		
		ex) taster@xxxx:~/Temp$ hg clone https://192.168.1.10/hg/Foo
		    taster@xxxx:~/Temp$ hg2git Foo
		
	3.	Check if Git repo created in c:\Users\<USER-ID>\Temp
