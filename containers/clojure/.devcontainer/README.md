# Using Docker for development

## Running build in docker
To run the development container, please use the following command from your project directory

In Powershell:
```Powershell
docker run --rm -it -v "${PWD}:/app" -w "/app" <domain>/clojure /bin/bash
```

### Project Templates

To generate new projects you can use the new operator with leiningen.

```
lein new app myproject
```

### Project Building

To build a project.

```
lein compile
```

### Project Testing 

To test a project.

```
lein test
```