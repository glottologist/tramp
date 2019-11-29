# Using Docker for development

## Running build in docker
To run the development container, please use the following command from your project directory

In Powershell:
```Powershell
docker run --rm -it -v "${PWD}:/dev" -w "/dev" <domain>/haskell /bin/bash
```

### Project Templates

A list of Stack templates for Haskell can be found here:

[Templates](https://github.com/commercialhaskell/stack-templates)

These templates can be invoked using:

```Haskell
stack new <project name> <template new>
```
For example, a Hakyll template can be  generated with:

```Haskell
stack new myproject hakyll-template
```


### Project Building

Projects can be built using normal stack build command

```Haskell
stack build
```

### Project Testing 

Projects can be tested using normal stack test command

```Haskell
stack test
```