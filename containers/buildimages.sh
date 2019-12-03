#!/bin/bash
IMAGETYPE=$1
VERSION=$2
DOMAIN=$3
PUBLISHTODOCKERHUB=$4
USEDEVCONTAINER=$5
DEVPATH=$6



build(){

   cd $1
   cd .devcontainer
   echo $VERSION > VERSION
   echo "Adding domain $DOMAIN"
   sed -i "s/<domain>/$DOMAIN/g" Dockerfile
   sed -i "s/<domain>/$DOMAIN/g" devcontainer.json
   echo "Adding version $VERSION"
   sed -i "s/<version>/$VERSION/g" Dockerfile


   echo "Building $1 image"
   docker image build -t $DOMAIN/$1:$VERSION -t $DOMAIN/$1:latest .
   echo "$1 image built"
   
  if [ $USEDEVCONTAINER ]
   then
      echo "Copying dev container image"
      mkdir -p $DEVPATH
      rm -rf $DEVPATH/.devcontainer
      cp -rf ../.devcontainer $DEVPATH/.devcontainer
      chown -R $USER:$GROUP $DEVPATH
      chmod -R 755 $DEVPATH
   fi

   # Clean up 
   echo "Resetting domain"
   sed -i "s/$DOMAIN/<domain>/g" Dockerfile
   sed -i "s/$DOMAIN/<domain>/g" devcontainer.json
   echo "Resetting version"
   sed -i "s/:$VERSION/:<version>/g" Dockerfile


   rm -f VERSION

   if [ $PUBLISHTODOCKERHUB ]
   then
      echo "Publishing image"
      docker push $DOMAIN/$1
   fi
   cd ..
   cd ..

}


buildnodc(){

   cd $1
   echo $VERSION > VERSION
   echo "Adding domain $DOMAIN"
   sed -i "s/<domain>/$DOMAIN/g" Dockerfile
   echo "Adding version $VERSION"
   sed -i "s/<version>/$VERSION/g" Dockerfile


   echo "Building $1 image"
   docker image build -t $DOMAIN/$1:$VERSION -t $DOMAIN/$1:latest .
   echo "$1 image built"


   # Clean up 
   echo "Resetting domain"
   sed -i "s/$DOMAIN/<domain>/g" Dockerfile
   echo "Resetting version"
   sed -i "s/:$VERSION/:<version>/g" Dockerfile


   rm -f VERSION

   if [ $PUBLISHTODOCKERHUB ]
   then
      echo "Publishing image"
      docker push $DOMAIN/$1
   fi
   cd ..


}


if [ -z "$IMAGETYPE" ]
then
      echo "No language type entered"
      echo "Available languages are:"
      echo "- ansible"
      echo "- clisp"
      echo "- clojure"
      echo "- elixir"
      echo "- elm"
      echo "- flutter"
      echo "- fsharp"
      echo "- go"
      echo "- haskell"
      echo "- haxe"
      echo "- idris"
      echo "- ionic"
      echo "- kotlin"
      echo "- ocaml"
      echo "- phoenix"
      echo "- purescript"
      echo "- python3"
      echo "- r-lang"
      echo "- reactnative"
      echo "- rust"
      echo "- scala"
      echo "- v-lang"
      echo "======================================================================"
      echo "sh buildimages <languagetype> <version> <domain> <publish> <usedevcontainer> <devpath>"
      echo "=> where:"
      echo "=> version = Some numeric version you wish to give the images"
      echo "=> domain = the domain tag the images should be built against.  I.e. if the domain is acme then the images are built and tagged with said domain - acme/scala:latest"
      echo "=> publish is a boolean value specifying if you want to publish the images to docker hub"
      echo "=> usedevcontainer is boolean value specifying if you want to use the value in a VSCode remote container"      
      echo "=> devpath is the path to the dev folder where you want the .devcontainer file to be copied"
      exit 1;
fi

CURRENT=${PWD}
echo $CURRENT
cd $CURRENT

#Prepare git config
mkdir -p ~/.git-localhost
cp -r ~/.gitconfig ~/.git-localhost/.gitconfig

buildnodc development-ubuntu
buildnodc development-centos

case $IMAGETYPE in 
"ansible")
   build ansible
   ;;
"clisp")
   build clisp
   ;;
"clojure")
   build clojure
   ;;
"development-ubuntu")
   ;;
"development-centos")
   ;;
"elixir")
    build elixir
   ;;
"elm")
    build nodejs
    build elm
   ;;
"flutter")
    buildnodc android
    build flutter
   ;;
"fsharp")
   build fsharp
   ;;

"go")
   build go
   ;;
"haskell")
     build haskell
   ;;
"haxe")
     build haxe
   ;;
"idris")
     build idris
   ;;
"ionic")
    buildnodc android
    build ionic
   ;;
"kotlin")
   build kotlin
   ;;
"nodejs")
   build nodejs
   ;;
"ocaml")
   build ocaml
   ;;
"phoenix")
   build elixir
   build phoenix
   ;;
"purescript")
   build nodejs
   build purescript
   ;;
"python3")
   build python3
   ;;
"reactnative")
    build reactnative
   ;;
"r-lang")
   build r-lang
   ;;
"rust")
   build rust
   ;;
"scala")

   build scala
   ;;
"v-lang")
   build v-lang
   ;;
"all")
   build python3
   build nodejs
   build haskell
   build clisp
   build clojure
   build elixir
   build elm
   build fsharp
   build go
   build haxe
   build idris
   build ionic
   build kotlin
   build ocaml
   build purescript
   build python3
   build reactnative
   build r-lang
   build rust
   build scala
   build v-lang
   ;;

esac

echo "Images built"

   

   
  
