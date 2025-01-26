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

## Interactive mode
When you install Elixir, you will have three new command line executables: `iex`, `elixir` and `elixirc`.  
`iex` is a PowerShell command, the same `python`.  
To exit `iex` press `Ctrl+C` twice.  
```bash
$ iex
Erlang/OTP 27 [erts-15.2.1] [source] [64-bit] [smp:16:16] [ds:16:16:10] [async-threads:1] [jit:ns]

Interactive Elixir (1.18.2) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> 40 + 2
42
iex(2)> "hello" <> " world"
"hello world"
```

## Running scripts
To execute file `simple.exs` with `elixir`:
```bash
elixir simple.exs
```

## Basic types
Elixir basic types: integers, floats, booleans, atoms, strings, lists and tuples.  

## Basic arithmetic
```bash
1          # integer
0x1F       # integer
1.0        # float
true       # boolean
:atom      # atom / symbol
"elixir"   # string
[1, 2, 3]  # list
{1, 2, 3}  # tuple
```

## Basic arithmetic
Lưu ý toán tử `/` luôn trả về kiểu float.  
Để thực hiện phép chia trả về số integer và phần dư  
của phép chia thì dùng hàm `div` và `rem`  
Khi gọi hàm function có thể bỏ qua dấu ngoặc đơn,  
nhưng khuyến khích để dấu ngoặc cho dễ đọc code hơn.  
```bash
iex(1)> 1 + 2
3
iex(2)> 5 * 5
25
iex(3)> 10 / 2
5.0
iex(4)> div(10,2)
5
iex(5)> div 10, 2
5
iex(6)> rem 10, 3
1
```

Elixir cung cấp các ký hiệu phím tắt (shortcut) cho các số nhị phân, bát phân và thập lục phân.  
```bash
iex(7)> 0b1010
10
iex(8)> 0o777
511
iex(9)> 0x1F
31
```

Kiểu float trong Elixir có độ chính xác 64-bit.  
```bash
iex(10)> 1.0
1.0
iex(11)> 1.0e-10
1.0e-10
```

Hàm `round` dùng để lấy số nguyên integer gần số thực float nhất.  
Hàm `trunc` dùng để lấy phần nguyên của số thực float.  
```bash
iex(12)> round(3.58)
4
iex(13)> trunc(3.58)
3
```

Hàm `is_integer` dùng để kiểm tra giá trị có phải là số nguyên integer hay không.  
```bash
iex(14)> is_integer(1)
true
iex(15)> is_integer(2.0)
false
```
Hàm `is_float` dùng để kiểm tra số thực float.  
Hàm `is_number` dùng để kiểm tra số nguyên hoặc số thực float.  

## Toán tử logic Booleans and nil
Các toán tử boolean: `or`, `and`, and `not`, được sử dụng nghiêm ngặt với các biểu thức cho ra giá trị boolean (`true` or `false`).  
`nil` là để chỉ sự vắng ma7t5 1 giá trị.  
`false` và `nil` được coi là sai, tất cả các giá trị khác được coi là đúng.  
Trình tự đánh giá các biểu thức từ trái sang phải.  
```bash
# or
iex(16)> 1 || true 
1
iex(17)> false || 11 
11

# and
iex(18)> nil && 13 
nil
iex(19)> true && 17 
17

# not
iex(20)> !true 
false
iex(21)> !1 
false
iex(22)> !nil 
true
```

Các giá trị `0` và `""` trong các ngôn ngữ khác là sai, nhưng với Elixir là đúng.  
Tóm lại, sử dụng `and`, `or` và `not` với giá trị booleans, nếu bất kỳ biểu thức nào không phải bool (non-boolean) thì phải sử dụng: `&&`, `||` và `!`.  


