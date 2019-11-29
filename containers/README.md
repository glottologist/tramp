# Using Docker for development

## Building images

Run the following command from a bash/cmd terminal in the root of this directory
```bash
sh buildimages imagetype version domain publish
```

where:

imagetype can be one of the following


* clojure
* elixir
* fsharp
* go
* haskell
* kotlin
* r
* rust
* scala
* all
* * all will build all of the images above at once

version = Some numeric version you wish to give the images
domain = the domain tag the images should be built against.  I.e. if the domain is acme then the images are built and tagged with said domain 

```docker
acme/scala:latest
```

publish is boolean 

## Running build in docker
To run the development container, please use the following command
```bash
docker run --rm -it -v "${PWD}:/app" -w "/app" <domain>/<imagetype> /bin/bash
```

