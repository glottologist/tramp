# Using Docker for development

## Running build in docker
To run the development container, please use the following command from your project directory

In Powershell:
```Powershell
docker run --rm -it -v "${PWD}:/dev" -w "/dev" <domain>/elixir /bin/bash
```

### Project Templates

The docker dev image for Elixir comes with mix_templates and mix_generator installed.  

https://github.com/pragdave/mix_templates
https://github.com/pragdave/mix_generator

To list the available project templates run: 

```
mix template.hex
```

You can install a template by running:

```
mix template.install hex <<template name>>
```

I.e.:
```
mix template.install hex gen_template_project
```

will install a generic template for Elixir.

To see the locally installed templates: 

```
mix template list
```

And to generate the template for the project:

```
mix gen <<template name>> <<app name>>
```

I.e.:
```
mix gen project my_app
```

Will generate a project called my_app using the gen_template_project template.

### Project Building

To compile an Elixir project:

```
mix compile
```

To start an iex session:

```
iex -S mix
```

From inside the iex session you can recompile with:

```
recompile()
```

### Project Testing 

To run tests:

```
mix test
```
