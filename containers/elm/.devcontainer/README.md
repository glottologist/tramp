# Using Docker for development

## Running build in docker
To run the development container, please use the following command from your project directory

In Powershell:
```Powershell
docker run --rm -it -v "${PWD}:/dev" -w "/dev" <domain>/elm /bin/bash
```

### Project Templates

You can generate a project template using the generator-elm-app.

```
yo elm-app
```

Or you can use elm-new.

```
elm new                        # Initialize an Html.program in the current directory
elm new my-project             # Initialize an Html.program in my-project/
elm new my-project --beginner  # Initialize an Html.beginnerProgram in my-project/
elm new my-spa --navigation    # Initialize a Navigation.program in my-spa/
elm new hello --hello-world    # Initialize an "Hello, world!" program in hello/
elm new --version              # Prints the installed version
elm new --help                 # Prints all possible commands
```

### Project Building

To build a project, run elm-make against the .elm file

```
elm-make src/Main.elm
```

### Project Testing 

To test, you can use the elm-test framework

In the first instance you will need to init the tests to get everything set up.

```
elm test init
```

Then you can test by running.

```
elm test
```

You can also run the tests in watch mode.

```
elm test --watch
```


