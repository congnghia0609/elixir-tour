# elixir-tour
elixir-tour is a cheat sheet, quick reference to learn elixir programming  

# Install Elixir
Ref: [https://elixir-lang.org/install.html](https://elixir-lang.org/install.html)
```bash
# Ngay 24/01/2025 on Ubuntu 22.04
# https://apollin.com/how-to-install-elixir-on-ubuntu-22-using-asdf/
# https://elixir-lang.org/install.html

# Version managers asdf
## https://github.com/asdf-vm/asdf
## https://asdf-vm.com/
## https://asdf-vm.com/guide/getting-started.html

# Before asdf install
https://github.com/asdf-vm/asdf-erlang#before-asdf-install

## Ubuntu 22.04
sudo apt-get -y install build-essential autoconf m4 libncurses5-dev libwxgtk3.0-gtk3-dev libwxgtk-webview3.0-gtk3-dev libgl1-mesa-dev libglu1-mesa-dev libpng-dev libssh-dev unixodbc-dev xsltproc fop libxml2-utils libncurses-dev openjdk-11-jdk

### check wxe_driver
wx-config --version
3.0.5


# Download asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.15.0

# Install asdf
## Add the following to ~/.bashrc:
. "$HOME/.asdf/asdf.sh"
## Completions must be configured by adding the following to your .bashrc:
. "$HOME/.asdf/completions/asdf.bash"

==> Restart your shell so that PATH changes take effect. 
==> Opening a new terminal tab will usually do it.

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
## (https://hexdocs.pm/elixir/compatibility-and-
## deprecations.html#compatibility-between-elixir-and-erlang-otp)


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
Erlang/OTP 27 [erts-15.2.1] [source] [64-bit] [smp:16:16] 
[ds:16:16:10] [async-threads:1] [jit:ns]

Elixir 1.18.2 (compiled with Erlang/OTP 27)
------------------------------------------------------------
```



# Install Phoenix
Ref: [https://hexdocs.pm/phoenix/installation.html](https://hexdocs.pm/phoenix/installation.html)
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
...
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


# Editor Tool
- VSCode + plugin ElixirLS  

# Elixir Programing
Ref: [https://hexdocs.pm/elixir/introduction.html](https://hexdocs.pm/elixir/introduction.html)  

Xem chi tiết về ngôn ngữ lập trình Elixir [tại đây](elixir-programing.md).  


  
# Observer
Để chạy được Tool Observer đi kèm với Erlang hỗ trợ GUI hiển thị trực quan các thông số của hệ thống máy ảo Erlang cùng với cây giám sát supervision tree, ta chạy lệnh sau:  
```bash
iex -S mix

iex> Mix.ensure_application!(:wx)
iex> Mix.ensure_application!(:runtime_tools)
iex> Mix.ensure_application!(:observer)
iex> :observer.start()
```
Nếu trong file `mix.exs` đã có cấu hình `extra_applications: [:logger, :runtime_tools, :wx, :observer],` thì không cần chạy các lệnh `Mix.ensure_application!/1` chỉ cần chạy `:observer.start()` là được.  


# ETS (Erlang Term Storage)
ETS cho phép chúng ta lưu trữ bất kỳ khái niệm Elixir nào vào 1 bảng table trong bộ nhớ, được thực hiện qua module `:ets` của Erlang.  

Khi tạo bảng ETS, cần có 2 đối số: tên bảng và tập hợp các tùy chọn. 2 tùy chọn cần thiết là loại bảng (mặc định là `:set` các key không trùng nhau) và quy tắc truy cập bảng. Trong đó, quy tắc truy cập bảng bao gồm:  
- `:public` Read/Write cho tất cả các tiến trình.
- `:protected` Read cho tất cả tiến trình, chỉ được Write bởi tiến trình sở hữu. Đây là tùy chọn mặc định.
- `:private` Read/Write chỉ giới hạn cho tiến trình sở hữu.


# Umbrella projects
Umbrella projects được sử dụng để xây dựng các ứng dụng chạy cùng nhau trong 1 kho lưu trữ repository duy nhất.  

Để tạo Umbrella projects ta dùng lệnh:
```bash
mix new kv_umbrella --umbrella

* creating README.md
* creating .formatter.exs
* creating .gitignore
* creating mix.exs
* creating apps
* creating config
* creating config/config.exs

Your umbrella project was created successfully.
Inside your project, you will find an apps/ directory
where you can create and host many apps:

    cd kv_umbrella
    cd apps
    mix new my_app

Commands like "mix compile" and "mix test" when executed
in the umbrella project root will automatically run
for each application in the apps/ directory.
```

`kv_umbrella` sẽ quản lý các ứng dụng chạy bên trong theo cấu trúc thư mục:  
```bash
+ kv_umbrella
  + apps
    + kv
    + kv_server
```

Để tạo app mới `kv_server` trong `kv_umbrella/apps` ta chạy lệnh sau:  
```bash
cd kv_umbrella/apps
mix new kv_server --module KVServer --sup
# cờ flag `--sup` là nhờ Mix tạo một cây giám sát supervision tree tự động cho chúng ta, thay vì phải tự làm bằng tay.
* creating README.md
* creating .formatter.exs
* creating .gitignore
* creating mix.exs
* creating lib
* creating lib/kv_server.ex
* creating lib/kv_server/application.ex
* creating test
* creating test/test_helper.exs
* creating test/kv_server_test.exs

Your Mix project was created successfully.
You can use "mix" to compile it, test it, and more:

    cd kv_server
    mix test

Run "mix help" for more commands.
```


# Releases
Để release project thông thường thì chỉ cần chạy: `mix release`.  

Với umbrella project thì chạy:
```bash
MIX_ENV=prod mix release

* assembling foo-0.0.1 on MIX_ENV=prod
* using config/runtime.exs to configure the release at runtime

Release created at _build/prod/rel/foo

    # To start your system
    _build/prod/rel/foo/bin/foo start

Once the release is running:

    # To connect to it remotely
    _build/prod/rel/foo/bin/foo remote

    # To stop it gracefully (you may also send SIGINT/SIGTERM)
    _build/prod/rel/foo/bin/foo stop

To list all commands:

    _build/prod/rel/foo/bin/foo

```

Chú ý 1 số lệnh để vận hành bản build release:  
- `bin/foo start`, `bin/foo start_iex`, `bin/foo restart`, và `bin/foo stop` để thao tác khởi chạy, khởi chạy lại hoặc tắt hệ thống.  
- `bin/foo rpc COMMAND` và `bin/foo remote` để chạy lệnh trên hệ thống đang chạy hoặc để kết nối với hệ thống đang chạy.  
- `bin/foo eval COMMAND` để khỡi động 1 hệ thống với chạy 1 lệnh duy nhất và sau đó tắt.
- `bin/foo daemon` và `bin/foo daemon_iex` để khởi chạy hệ thống ở chế độ chạy ngầm daemon.
- `bin/foo install` để cài đặt hệ thống như 1 dịch vụ trên máy Windows.

Có 2 chế độ chạy code release: tương tác interactive và nhúng embedded. Mặc định thì chạy ở chế độ tương tác interactive, tải các module 1 cách động khi chúng được sử dụng lần đầu tiên, hạn chế là yêu cầu request đầu tiên sẽ chậm hơn. Với chế độ nhúng embedded là tải tất cả các module có sẵn trước, đảm bảo hệ thống sẵn sàng xử lý các yêu cầu sau khi khởi động.  


Build umbrella project với nhiều cấu hình releases thì chạy:  
```bash
MIX_ENV=prod mix release foo
MIX_ENV=prod mix release bar
```


# Operating System environment configuration (Cấu hình môi trường hệ điều hành)

Để tạo các file cấu hình cho môi trường chạy ta dùng lệnh:  
```bash
mix release.init

* creating rel/vm.args.eex
* creating rel/remote.vm.args.eex
* creating rel/env.sh.eex
* creating rel/env.bat.eex
```

Để cấu hình VM arguments thì xem thêm tài liệu về [VM arguments and flags in the Erlang documentation](https://www.erlang.org/doc/apps/erts/erl_cmd.html)



