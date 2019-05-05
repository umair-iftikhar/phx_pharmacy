run:
	MIX_ENV=prod mix phx.server

runiexdev:
	iex -S mix phx.server

rundev:
	mix phx.server

update:
	MIX_ENV=prod mix deps.get --only prod
	MIX_ENV=prod mix compile
	cd assets && npm install && cd ..
	cd assets && npm run deploy && cd ..
	MIX_ENV=prod mix phx.digest
	MIX_ENV=prod mix ecto.setup

prod:
	MIX_ENV=prod mix local.hex --force
	MIX_ENV=prod mix local.rebar --force
	MIX_ENV=prod mix deps.get --only prod
	MIX_ENV=prod mix compile
	MIX_ENV=prod mix ecto.setup
	cd assets && npm install && cd ..
	cd assets && npm run deploy && cd ..
	MIX_ENV=prod mix phx.digest

dev:
	mix local.hex --force
	mix local.rebar --force
	mix deps.get
	mix compile
	cd assets && npm install && cd ..
	mix ecto.setup
	mix phx.server

release:
	MIX_ENV=prod mix local.hex --force
	MIX_ENV=prod mix local.rebar --force
	MIX_ENV=prod mix deps.get --only prod
	MIX_ENV=prod mix compile
	cd assets && npm install && cd ..
	MIX_ENV=prod mix ecto.setup
	MIX_ENV=prod mix release --env=prod

setupenv:
	sudo apt-get update
	sudo apt-get install -y autoconf automake libtool build-essential libgmp-dev libssl-dev
	curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
	sudo apt-get install nodejs
	echo "deb https://packages.erlang-solutions.com/debian stretch contrib" | sudo tee /etc/apt/sources.list.d/erlang-solutions.list
	wget https://packages.erlang-solutions.com/debian/erlang_solutions.asc
	sudo apt-key add erlang_solutions.asc
	sudo apt-get update
	sudo apt-get install -y elixir
	sudo apt-get install postgresql -y
	sudo apt-get install inotify-tools -y


