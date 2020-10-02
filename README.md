# Docker installer
<p align="center"><img src="https://gitlab.com/NovumGit/innovation-app-core/-/raw/master/assets/novum.png"  alt="Novum logo"/></p>

## What is this?

This package contains the optional Docker containers that you can use to spin up one  of the samp apps or create a new
api / system.

### Usage
You need a git client, docker-compose and docker installed. 

#### 1. Clone this repository
```git clone git@gitlab.com:NovumGit/innovation-app-util-docker.git```

#### 2. Run build script
```./build.sh```

#### 3. Start containers
```docker-compose up```


### What will happen?
Two containers will be launched, one is a database server (mariadb) and the other a webserver (Apache). The webserver
actually also contains the php executable and composer, the packagemanager for php. It runs the composer update command
which will in turn download the most recent version of all the sourcecode. The sourcecode comes with a composer plugin
that creates the following directories
```
- assets
    - server 
        - http
            - dev
            - prod
            - test
            - server.conf
 - data
    - db
    - log
 - domain
 - public
 - vendor
 ```
     
     
            
        
    
