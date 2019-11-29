# Using Docker for development

## Running build in docker
To run the development container, please use the following command from your project directory

In Powershell:
```Powershell
docker run --rm -it -v "${PWD}:/dev" -w "/dev" <domain>/fsharp /bin/bash
```

### Project Templates

The docker dev image for F# comes with dotnet installed.  


To list the available project templates run: 

```
dotnet new
```

And to generate the template for the project:

```
dotnet new <<template name>> -lang F# -o <<output path>>
```

I.e.:
```
dotnet new console -lang F# -o src/MyConsoleApp
```

Will generate a console project in the specified.

To generate a FAKE template instead use: 

```
dotnet new fake
```

### Project Building

To build a FSharp project:

```
dotnet build <<path to fsproj file>>
```

To run a console project or similar

```
dotnet run -p <<path to fsproj file>>
```


### Project Testing 

To run tests:

```
mix test
```
