# elixir-tour
elixir-tour is a cheat sheet, quick reference to learn elixir programming  

# Install Elixir
```bash
# Ngay 24/01/2025 on Ubuntu 22.04
# https://apollin.com/how-to-install-elixir-on-ubuntu-22-using-asdf/
# https://elixir-lang.org/install.html

# Version managers asdf
## https://github.com/asdf-vm/asdf
## https://asdf-vm.com/
## https://asdf-vm.com/guide/getting-started.html

# Download asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.15.0

# Install asdf
## Add the following to ~/.bashrc:
. "$HOME/.asdf/asdf.sh"
## Completions must be configured by adding the following to your .bashrc:
. "$HOME/.asdf/completions/asdf.bash"

==> Restart your shell so that PATH changes take effect. Opening a new terminal tab will usually do it.

## Check asdf version
asdf version
v0.15.0-31e8c93

asdf -h

# Uninstall asdf
## In your ~/.bashrc remove the lines that source asdf.sh and the completions:
. "$HOME/.asdf/asdf.sh"
. "$HOME/.asdf/completions/asdf.bash"
## Remove the $HOME/.asdf dir:
rm -rf "${ASDF_DATA_DIR:-$HOME/.asdf}"
## Run this command to remove all asdf config files:
rm -rf "$HOME/.tool-versions" "$HOME/.asdfrc"


# Install Plugins Erlang & Elixir for asdf
## Install Plugins asdf-erlang
## https://github.com/asdf-vm/asdf-erlang
asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git

## Install Plugins asdf-elixir
## https://github.com/asdf-vm/asdf-elixir
asdf plugin add elixir https://github.com/asdf-vm/asdf-elixir.git

## Check asdf plugin list
asdf plugin list
asdf plugin list --urls
------------------------------------------------------------
elixir                       https://github.com/asdf-vm/asdf-elixir.git
erlang                       https://github.com/asdf-vm/asdf-erlang.git
------------------------------------------------------------

# Check compatibility between elixir and erlang:
## https://hexdocs.pm/elixir/compatibility-and-deprecations.html#compatibility-between-elixir-and-erlang-otp


# Install Erlang
export KERL_CONFIGURE_OPTIONS="--disable-debug --without-javac"
asdf install erlang <version>
## https://www.erlang.org/downloads
asdf list-all erlang
asdf install erlang 27.2.1
------------------------------------------------------------
Erlang/OTP 27.2.1 (asdf_27.2.1) has been successfully built.
Cleaning up compilation products for 'asdf_27.2.1' under:
  - /home/nghiatc/.asdf/plugins/erlang/kerl-home/builds...
  - /home/nghiatc/.asdf/downloads/erlang/27.2.1...
... done.
------------------------------------------------------------

## Activate globally with:
asdf global erlang 27.2.1
## Activate locally in the current folder with:
asdf local erlang 27.2.1

## Check erlang version
erl -eval 'erlang:display(erlang:system_info(otp_release)), halt().'  -noshell
------------------------------------------------------------
"27"
------------------------------------------------------------


# Install Elixir
asdf list-all elixir
## IMPORTANT: Elixir versions are compiled for specific Erlang/OTP versions, 
## so you need to pick the package which corresponds to your Erlang version. 
## That is, if we installed Erlang v27, we will need Elixir with otp-27 in name. 
## Let’s install the latest version:
asdf install elixir 1.18.2-otp-27
## Activate globally with:
asdf global elixir 1.18.2-otp-27

## Check Elixir Version
elixir -v
------------------------------------------------------------
Erlang/OTP 27 [erts-15.2.1] [source] [64-bit] [smp:16:16] [ds:16:16:10] [async-threads:1] [jit:ns]

Elixir 1.18.2 (compiled with Erlang/OTP 27)
------------------------------------------------------------


```

# Install Phoenix
```bash
# https://hexdocs.pm/phoenix/installation.html
# Install the Phoenix application generator:
mix archive.install hex phx_new
------------------------------------------------------------
Resolving Hex dependencies...
Resolution completed in 0.008s
New:
  phx_new 1.7.18
* Getting phx_new (Hex package)
All dependencies are up to date
Compiling 11 files (.ex)
     warning: this clause of defp phoenix_dep/2 is never used
     │
 459 │   defp phoenix_dep("deps/phoenix", %{pre: ["dev"]}),
     │        ~
     │
     └─ lib/phx_new/generator.ex:459:8: Phx.New.Generator.phoenix_dep/2

     warning: Mix.Rebar.rebar_cmd/1 is deprecated. Use rebar_args/2 or available?/1 instead
     │
 271 │     Mix.Rebar.rebar_cmd(:rebar3)
     │               ~
     │
     └─ lib/mix/tasks/phx.new.ex:271:15: Mix.Tasks.Phx.New.rebar_available?/0

Generated phx_new app
Generated archive "phx_new-1.7.18.ez" with MIX_ENV=prod
Are you sure you want to install "phx_new-1.7.18.ez"? [Yn] y
* creating /home/nghiatc/.asdf/installs/elixir/1.18.2-otp-27/.mix/archives/phx_new-1.7.18
------------------------------------------------------------

## Để xem tất cả các tùy chọn cho việc tạo một ứng dụng Phoenix mới thì dùng:
mix help phx.new

# Create project hello not use database.
# https://hexdocs.pm/phoenix/up_and_running.html
mix phx.new hello --no-ecto
------------------------------------------------------------
* creating hello/lib/hello/application.ex
* creating hello/lib/hello.ex
* creating hello/lib/hello_web/controllers/error_json.ex
* creating hello/lib/hello_web/endpoint.ex
* creating hello/lib/hello_web/router.ex
* creating hello/lib/hello_web/telemetry.ex
* creating hello/lib/hello_web.ex
* creating hello/mix.exs
* creating hello/README.md
* creating hello/.formatter.exs
* creating hello/.gitignore
* creating hello/test/support/conn_case.ex
* creating hello/test/test_helper.exs
* creating hello/test/hello_web/controllers/error_json_test.exs
* creating hello/lib/hello_web/controllers/error_html.ex
* creating hello/test/hello_web/controllers/error_html_test.exs
* creating hello/lib/hello_web/components/core_components.ex
* creating hello/lib/hello_web/controllers/page_controller.ex
* creating hello/lib/hello_web/controllers/page_html.ex
* creating hello/lib/hello_web/controllers/page_html/home.html.heex
* creating hello/test/hello_web/controllers/page_controller_test.exs
* creating hello/lib/hello_web/components/layouts/root.html.heex
* creating hello/lib/hello_web/components/layouts/app.html.heex
* creating hello/lib/hello_web/components/layouts.ex
* creating hello/priv/static/images/logo.svg
* creating hello/lib/hello/mailer.ex
* creating hello/lib/hello_web/gettext.ex
* creating hello/priv/gettext/en/LC_MESSAGES/errors.po
* creating hello/priv/gettext/errors.pot
* creating hello/priv/static/robots.txt
* creating hello/priv/static/favicon.ico
* creating hello/assets/js/app.js
* creating hello/assets/vendor/topbar.js
* creating hello/assets/css/app.css
* creating hello/assets/tailwind.config.js

Fetch and install dependencies? [Yn] y
* running mix deps.get
* running mix assets.setup
* running mix deps.compile

We are almost there! The following steps are missing:

    $ cd hello

Start your Phoenix app with:

    $ mix phx.server

You can also run your app inside IEx (Interactive Elixir) as:

    $ iex -S mix phx.server
------------------------------------------------------------

cd hello

# Start your Phoenix app with:
mix phx.server

# You can also run your app inside IEx (Interactive Elixir) as:
iex -S mix phx.server

# By default, Phoenix accepts requests on port 4000. 
# If we point our favorite web browser at http://localhost:4000, 
# we should see the Phoenix Framework welcome page.
==> To stop it, we hit ctrl-c twice.
```
