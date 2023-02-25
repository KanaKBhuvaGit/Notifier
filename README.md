## Clone the project from GitHub:

```sh
git clone https://github.com/KanaKBhuvaGit/Notifier.git && cd Notifier
```

## Install dependencies and setup the database:

```sh
mix setup
```

## Start the Phoenix server:

```sh
mix phx.server
```

## Run the Tests with Coverage Checking:

```sh
MIX_ENV=test mix do coveralls.json
```

## To view the coverage in a web browser run the following:

```sh
MIX_ENV=test mix coveralls.html ; open cover/excoveralls.html
```

## Visit
[`localhost:4000`](http://localhost:4000)
in your web browser.