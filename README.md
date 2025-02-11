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

## Interactive mode
When you install Elixir, you will have three new command line executables: `iex`, `elixir` and `elixirc`.  
`iex` is a PowerShell command, the same `python`.  
To exit `iex` press `Ctrl+C` twice.  
```elixir
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
```elixir
elixir simple.exs
```

## Basic types
Elixir basic types: integers, floats, booleans, atoms, strings, lists and tuples.  

## Basic arithmetic
```elixir
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
Để thực hiện phép chia trả về số integer và phần dư của phép chia thì dùng hàm `div` và `rem`  
Khi gọi hàm function có thể bỏ qua dấu ngoặc đơn, nhưng khuyến khích để dấu ngoặc cho dễ đọc code hơn.  
```elixir
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
```elixir
iex(7)> 0b1010
10
iex(8)> 0o777
511
iex(9)> 0x1F
31
```

Kiểu float trong Elixir có độ chính xác 64-bit.  
```elixir
iex(10)> 1.0
1.0
iex(11)> 1.0e-10
1.0e-10
```

Hàm `round` dùng để lấy số nguyên integer gần số thực float nhất.  
Hàm `trunc` dùng để lấy phần nguyên của số thực float.  
```elixir
iex(12)> round(3.58)
4
iex(13)> trunc(3.58)
3
```

Hàm `is_integer` dùng để kiểm tra giá trị có phải là số nguyên integer hay không.  
```elixir
iex(14)> is_integer(1)
true
iex(15)> is_integer(2.0)
false
```
Hàm `is_float` dùng để kiểm tra số thực float.  
Hàm `is_number` dùng để kiểm tra số nguyên hoặc số thực float.  

## Toán tử logic Booleans and nil
Các toán tử boolean: `or`, `and`, and `not`, được sử dụng nghiêm ngặt với các biểu thức cho ra giá trị boolean (`true` or `false`).  
`nil` là để chỉ sự vắng mặt 1 giá trị.  
`false` và `nil` được coi là sai, tất cả các giá trị khác được coi là đúng.  
Trình tự đánh giá các biểu thức từ trái sang phải.  
```elixir
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

## Atoms
atom là 1 hằng số mà giá trị chính là tên riêng của nó. Các ngôn ngữ khác gọi là symbol. Chúng thường hữu ích để liệt kê các giá trị riêng biệt.  
```elixir
iex(1)> :apple 
:apple
iex(2)> :orange 
:orange
iex(3)> :apple == :apple 
true
iex(4)> :apple == :orange 
false
```
atom thường được dùng để thể hiện trạng thái của toán tử, bằng cách sử dụng các giá trị như: `:ok` và `:error`.  
Giá trị `nil`, `true` và `false` cũng là các atom. Elixir cho phép bỏ qua dấu `:` với các atom: `nil`, `true` và `false`.  
```elixir
iex(5)> true == :true 
true
iex(6)> is_atom(false)
true
iex(7)> is_boolean(:false) 
true
iex(8)> is_atom(nil)
true
```

## Chuỗi Strings
Strings trong Elixir được phân cách bằng dấu nháy kép `""` và được mã hóa theo UTF-8.  
```elixir
iex(10)> "Chào"
"Chào"
iex(11)> "Chào" <> " thế giới!"
"Chào thế giới!"
```
Nối chuỗi bằng phương pháp nội suy, hỗ trợ bất kỳ dữ liệu nào có thể chuyển đổi thành chuỗi:  
```elixir
iex(12)> number = 42 
42
iex(13)> "i am #{number} years old"
"i am 42 years old"
```
Chuỗi có thể xuống dòng trong dấu nháy kép `""`, hoặc dùng ký tự xuống dòng `\n`  
```elixir
iex(14)> "hello
...(14)> world"
"hello\nworld"
iex(15)> "hello\nworld"
"hello\nworld"
```

Có thể in chuỗi bằng `IO.puts()` và trả về atom `:ok` sau khi in.  
```elixir
iex(16)> IO.puts("hello\nworld")
hello
world
:ok
```

Chuỗi trong Elixir được biểu diễn nội bộ bằng các chuỗi byte nhị phân liền kề:  
```elixir
iex(17)> is_binary("chào")
true
iex(18)> byte_size("chào")
5 # Ký tự `à` cần 2 byte để biểu diễn trong UTF-8
iex(19)> byte_size("chao")
4
iex(20)> String.length("chào")
4
iex(21)> String.upcase("chào")
"CHÀO"
```

## Structural comparison
Elixir cung cấp các toán tử so sánh: `==`, `!=`, `<=`, `>=`, `<`, `>`.  
Số nguyên integer và số thực float là giống nhau nếu chúng có cùng giá trị.  
Các toán tử so sánh nghiêm ngặt về kiểu dữ liệu: `===` và `!==`.  
Các toàn tử so sánh trong Elixir có thể so sánh mọi kiểu dữ liệu.  
```elixir
iex(1)> 1 == 1.0 
true
iex(2)> 1 == 2.0 
false
iex(3)> 1 === 1.0 
false
```

## Lists and tuples (Danh sách và Bộ)
### (Linked) Lists (Danh sách liên kết)
Elixir sử dụng dấu ngoặc vuông để chỉ định danh sách các giá trị, trong đó mỗi phần tử có thể thuộc bất kỳ kiểu dữ liệu nào.  
Hai danh sách có thể được nối hoặc trừ bằng các toán tử `++` và `--`. Các toán tử này không sửa đổi các danh sách ban đầu mà luôn trả về 1 danh sách mới.  
Các cấu trúc dữ liệu Elixir là bất biến (immutable). Lợi thế là làm code rõ ràng hơn, có thể thoải mái truyền dữ liệu mà không lo bị thay đổi dữ liệu trong bộ nhớ - chỉ có thể chuyển đổi dữ liệu.  
```elixir
iex(1)> [1, 2, true, 3]
[1, 2, true, 3]
iex(2)> length([1, 2, true, 3])
4
iex(3)> [1, 2, 3] ++ [4, 5, 6]
[1, 2, 3, 4, 5, 6]
iex(4)> [1, true, 2, false, 3, true] -- [true, false]
[1, 2, 3, true]
iex(5)> [1, true, 2, false, 3, true] -- [true, 4]
[1, 2, false, 3, true]
```
Hai hàm `hd()` và `tl()` dùng để lấy phần tử đầu tiên của danh sách (head) và tail là các phần tử còn lại cảu danh sách.  
Dùng `hd()` và `tl()` với danh sách rỗng sẽ gây ra lỗi.  
```elixir
iex(6)> list = [1, 2, 3]
[1, 2, 3]
iex(7)> hd(list)
1
iex(8)> tl(list)
[2, 3]
iex(9)> hd([])
** (ArgumentError) errors were found at the given arguments:

  * 1st argument: not a nonempty list

    :erlang.hd([])
    iex:9: (file)
```
Đôi khi việc tạo 1 danh sách sẽ trả về một chuỗi được bắt đầu bằng `~c`, vì Elixir in danh sách số ASCII thành danh sách các ký tự, để hiểu rõ chuỗi ký tự này ta dùng `i` để lấy thông tin về giá trị đó.  
```elixir
iex(9)> [11, 12, 13]
~c"\v\f\r"
iex(10)> [104, 101, 108, 108, 111]
~c"hello"
iex(11)> i ~c"hello"
Term
  ~c"hello"
Data type
  List
Description
  This is a list of integers that is printed using the `~c` sigil syntax,
  defined by the `Kernel.sigil_c/2` macro, because all the integers in it
  represent printable ASCII characters. Conventionally, a list of Unicode
  code points is known as a charlist and a list of ASCII characters is a
  subset of it.
Raw representation
  [104, 101, 108, 108, 111]
Reference modules
  List
Implemented protocols
  Collectable, Enumerable, IEx.Info, Inspect, JSON.Encoder, List.Chars, String.Chars
```

## Tuples (Bộ)
Elixir dùng dấu ngoặc nhọn để định nghĩa Tuple, tương tự như list, tuple có thể chứa bất kỳ giá trị nào.  
Tuple lưu trữ các phần tử liên tiếp trong bộ nhớ, điều này cho phép truy suất phần tử theo chỉ mục hoặc theo kích thước phần tử, chỉ mục bắt đầu từ 0.  
```elixir
iex(1)> tuple = {:ok, "hello"}
{:ok, "hello"}
iex(2)> elem(tuple, 1)
"hello"
iex(3)> tuple_size(tuple)
2
iex(4)> put_elem(tuple, 1, "world")
{:ok, "world"}
iex(5)> tuple
{:ok, "hello"}
```
`put_elem` trả về một tuple mới, tuple ban đầu không bị thay đổi.  
Cả List và Tuple đều là bất biến (immutable), mỗi thao tác trên tuple đều trả về 1 tuple mới và không làm thay đổi tuple ban đầu.  

## Lists or tuples?
List được lưu trữ trong bộ nhớ là danh sách liên kết, các phần tử liên kết bằng con trỏ. Mọi tương tác trên list đều tuyến tính vì phải duyệt hết chiều dài danh sách liên kết. Ví dụ việc nối 2 list phụ thuộc vào chiều dài của list bên trái.  
```elixir
iex> list = [1, 2, 3]
[1, 2, 3]

# This is fast as we only need to traverse `[0]` to prepend to `list`
iex> [0] ++ list
[0, 1, 2, 3]

# This is slow as we need to traverse `list` to append 4
iex> list ++ [4]
[1, 2, 3, 4]
```

Tuple được lưu trữ liên tiếp trong bộ nhớ, việc lấy kích thước hoặc truy cập 1 phần tử theo chỉ mục sẽ nhanh hơn, đổi lại việc thêm xóa sửa các phần tử sẽ tốn kém vì phải tạo ra 1 tuple mới trong bộ nhớ. (giống khái niệm Array trong các ngôn ngữ khác). Tuy nhiên, khi cập nhật tuple thì không phải đơn thuần copy thành 1 tuple mới mà tuple cũ và tuple mới vẫn chia sẽ các phần tử cũ, ngoại trừ phần tử mới thay thế. ==> giúp giảm lượng cấp phát bộ nhớ, được thực hiện nhờ tính chất bất biến (immutable) của ngôn ngữ Elixir.  

List được sử dụng khi khi số lượng phần tử trả về có thể thay đổi. Dùng Tuple khi kích thước cố định. Ví dụ:  

Hàm `String.split()` trả về số lượng phần tử phụ thuộc vào input cho nên trả về List.  
Hàm `String.split_at()` chia chuỗi thành 2 phần tại 1 vị trí nhất định, cho nên trả về Tuple.  
```elixir
iex(6)> String.split("hello beautiful world")
["hello", "beautiful", "world"]
iex(7)> String.split_at("hello world", 3)
{"hel", "lo world"}
```

Tuple thường kết hợp với atom để tạo thành "tagged tuples" để trả về kết quả thành công hay thất bại.  
```elixir
iex> File.read("path/to/existing/file")
{:ok, "... contents ..."}
iex> File.read("path/to/unknown/file")
{:error, :enoent}
```
Tuple thì hỗ trợ truy suất ngẫu nhiên còn List thì phải duyệt danh sách từ phần tử đầu tiên.  

## Size or length?
Khi đếm các phần tử của 1 cấu trúc dữ liệu, Elixir tuân theo quy tắc: hàm `size` nếu phép toán diễn ra theo thời gian không đổi (giá trị được tính toán trước) và `length` nếu phép toán là tuyến tính (tính toán sẽ chậm nếu đầu vào tăng, --> ghi nhớ: `length` và `linear` đều bắt đầu bằng `l`).  
Ví dụ: `byte_size()`, `tuple_size()`, `length()` và `String.length()`.  


## Pattern matching (Khớp mẫu)
Toán tử `=` trong Elixir được gọi là toán tử khớp, dùng để khớp mẫu bên trong các cấu trúc dữ liệu. Toán tử `^` dùng để truy cập các giá trị được ràng buộc trước đó.  

### The match operator (Toán tử khớp)
Trong Elixir, toán tử `=` được gọi là toán tử khớp, vì:  
```elixir
iex(1)> x = 1 
1
iex(2)> 1 = x 
1
iex(3)> 2 = x 
** (MatchError) no match of right hand side value: 1
    (stdlib 6.2) erl_eval.erl:667: :erl_eval.expr/6
    iex:3: (file)
```
Lưu ý, biểu thức 1 = x là hợp lệ và nó khớp vì cả 2 vế đều bằng 1. Khi các vế không khớp thì lỗi MatchError được quăng ra.  
Một biến chỉ có thể được gán ở phía bên trái của `=`.  

### Pattern matching (khớp mẫu)
Toán tử khớp không chỉ được dùng để gán các giá trị đơn giản, mà còn hữu ích cho việc giải cấu trúc các kiểu dữ liệu phức tạp hơn, ví dụ:  
```elixir
iex(3)> {a, b, c} = {:hello, "world", 42}
{:hello, "world", 42}
iex(4)> a
:hello
iex(5)> b
"world"
iex(6)> c
42
```
Lỗi khớp mẫu sẽ xảy ra nếu kích thước cả 2 vế khác nhau, hoặc kiểu khác nhau.  
```elixir
iex(7)> {a, b, c} = {:hello, "world"}
** (MatchError) no match of right hand side value: {:hello, "world"}
    (stdlib 6.2) erl_eval.erl:667: :erl_eval.expr/6
    iex:7: (file)

iex(7)> {a, b, c} = [:hello, "world", 42]
** (MatchError) no match of right hand side value: [:hello, "world", 42]
    (stdlib 6.2) erl_eval.erl:667: :erl_eval.expr/6
    iex:7: (file)

iex(7)> [a, b, c] = [1, 2, 3]
[1, 2, 3]
iex(8)> a
1
```

Một List có hỗ trợ khớp head và tail:  
```elixir
iex(9)> [head | tail] = [1, 2, 3]
[1, 2, 3]
iex(10)> head
1
iex(11)> tail
[2, 3]

iex(12)>[head | tail] = []
** (MatchError) no match of right hand side value: []
```

Cú pháp `[head | tail]` còn hỗ trợ cho việc thêm phần tử và đầu danh sách list.  
```elixir
iex> list = [1, 2, 3]
[1, 2, 3]
iex> [0 | list]
[0, 1, 2, 3]
```
Việc khớp mẫu cũng giúp dễ dàng phân rã cấu trúc các kiểu dữ liệu tuple và list, ứng dụng vào đệ quy trong Elixir và với các cấu trúc như maps và binaries.  

### The pin operator (toán tử ghim)
Sử dụng toán tử ghim `^` để khớp mẫu với giá trị hiện tại của biến thay vì liên kết lại biến.  
```elixir
iex> x = 1
1
iex> ^x = 2
** (MatchError) no match of right hand side value: 2
```
Vì chúng ta đã ghim x khi nó được liên kết với giá trị 1, nên nó sẽ tương đương với biểu thức sau:  
```elixir
iex> 1 = 2
** (MatchError) no match of right hand side value: 2
```

Chúng ta có thể sử dụng toán tử ghim bên trong khớp mẫu tuple hoặc list:  
```elixir 
iex> x = 1
1
iex> [^x, 2, 3] = [1, 2, 3]
[1, 2, 3]
iex> {y, ^x} = {2, 1}
{2, 1}
iex> y
2
iex> {y, ^x} = {2, 2}
** (MatchError) no match of right hand side value: {2, 2}
```

Trong 1 số trường hợp, bạn không quan tâm đến 1 giá trị cụ thể trong mẫu thì ta dùng dấu gạch dưới (underscore) `_` để thay thế, ví dụ:  
```elixir
iex> [head | _] = [1, 2, 3]
[1, 2, 3]
iex> head
1
```

## Control flow: case, cond, and if
### case
`case` cho phép chúng ta so sánh 1 giá trị với nhiều mẫu cho đến khi tìm thấy giá trị phù hợp:  
```elixir
iex(1)> case {1, 2, 3} do 
...(1)> {4, 5, 6} -> 
...(1)> "This clause won't match"
...(1)> {1, x, 3} -> 
...(1)> "This clause will match and bind x to 2 in this clause"
...(1)> _ -> 
...(1)> "This cloase would match any value"
...(1)> end 
"This clause will match and bind x to 2 in this clause"
```

Nếu muốn khớp mẫu với một biến đã có ta dùng toán tử ghim `^`:  
```elixir
iex(2)> x = 1 
1
iex(3)> case 10 do 
...(3)> ^x -> "Won't match"
...(3)> _ -> "Will match"
...(3)> end
"Will match"
```

Mệnh đề cũng cho phép các điều kiện bổ sung như:  
```elixir
iex(4)> case {1, 2, 3} do 
...(4)> {1, x, 3} when x > 0 -> "Will match"
...(4)> _ -> "Would match, if guard condition were not satisfied"
...(4)> end
"Will match"
```

### if
`if` là một macro trong Elixir, Cú pháp:  
```elixir
iex(5)> if nil do 
...(5)> "This won't be seen"
...(5)> else 
...(5)> "This will"
...(5)> end
"This will"
```

Nếu bất kỳ biến hay cấu trúc nào được khai báo hoặc thay đổi bên trong `if`, `case` thì việc khai báo và thay đổi sẽ chỉ có hiệu lực bên trong phạm vi của `if`, `case` thôi, ví dụ:  
```elixir
iex(6)> x = 1
1
iex(7)> if true do 
...(7)> x = x + 1 
...(7)> end
2
iex(8)> x
1
```

Trong trường hợp đó, nếu bạn muốn thay đổi giá trị, bạn phải trả về giá trị từ `if`:  
```elixir
iex(9)> x = 1
1
iex(10)> x = if true do 
...(10)> x + 1 
...(10)> else 
...(10)> x 
...(10)> end
2
iex(11)> x
2
```

Nếu bạn có quá nhiều khối lệnh `if` lồng nhau, thì bạn nên sử dụng `cond` thay thế.  

### cond
Nếu `case` dùng để khớp mệnh đề nhiều mẫu, còn `if` thì kiểm tra 1 điều kiện duy nhất, thì `cond` là cấu trúc hữu ích giúp bạn kiểm tra nhiều điều kiện để trả về giá trị đầu tiên khác `nil` hoặc `false`, ví dụ:  
```elixir
iex(1)> cond do 
...(1)> 2 + 2 == 5 -> "This will not be true"
...(1)> 2 * 2 == 3 -> "Nor this"
...(1)> 1 + 1 == 2 -> "But this will"
...(1)> true -> "This is always true (equivalent to else)"
...(1)> end
"But this will"
```

## Anonymous functions (Hàm ẩn danh)
Hàm ẩn danh cho phép chúng ta lưu trữ và truyền mã code thực thi như thề nó là 1 số nguyên hoặc chuỗi.  

### Identifying functions and documentation (Định danh hàm và tài liệu)
Hàm function trong Elixir được định danh bằng tên và số lượng đối số (arity) của hàm. `trunc/1` định danh 1 hàm có tên và `trunc` và nhận 1 đối số, trong khi `trunc/2` định danh 1 hàm hợp lệ khác có cùng tên nhưng số lượng đối số (arity) là 2.  
Trong Elixir shell ta dùng `h trunc/1` để in ra tài liệu mô tả cho hàm `trunc/1`.  

### Defining anonymous functions (Định nghĩa hàm ẩn danh)
Hàm ẩn danh trong Elixir được phân định bằng từ khóa `fn` và `end`. Chúng ta có thể gọi hàm ẩn danh cách truyền đối số cho nó sử dụng dấu chấm `.` giữa biến và dấu ngoặc đơn:  
```elixir
iex(2)> add = fn a, b -> a + b end 
#Function<41.18682967/2 in :erl_eval.expr/6>
iex(3)> add.(1, 2)
3
iex(4)> is_function(add)
true
iex(5)> is_function(add, 2)
true
iex(6)> is_function(add, 1)
false
```
Dấu chấm `.` giúp phân biệt rõ ràng khi gọi hàm ẩn danh được lưu trữ trong biến `add`, trái ngược với 1 hàm có tên `add/2`. Ví dụ, 1 hàm ẩn danh đuọc lưu trữ trong biến `is_atom` sẽ không có sự mơ hồ giữa `is_atom.(:foo)` và `is_atom(:foo)`. Dùng `is_function()` để kiểm tra 1 biến có phải là hàm hay không.  

### Closures
Hàm ẩn danh cũng có thể truy cập các biến nằm trong phạm vi khi hàm được định nghĩa, gọi là closures vì nó đóng trong phạm vi của nó.  
```elixir
iex(7)> double = fn a -> add.(a, a) end 
#Function<42.18682967/1 in :erl_eval.expr/6>
iex(8)> double.(2)
4
```
Một biến được gán trong hàm không ảnh hưởng đến bên ngoài.  
```elixir
iex(9)> x = 42
42
iex(10)> (fn -> x = 0 end).()
0
iex(11)> x
42
```

### Clauses and guards (mệnh đề và lính canh)
Tương tự như `case/2` chúng ta có thể khớp mẫu trên các đối số của các hàm ẩn danh cũng như định nghĩa nhiều mệnh đề và lính canh.  
```elixir
iex(12)> f = fn 
...(12)> x, y when x > 0 -> x + y 
...(12)> x, y -> x * y 
...(12)> end 
#Function<41.18682967/2 in :erl_eval.expr/6>
iex(13)> f.(1, 3)
4
iex(14)> f.(-1, 3)
-3
```

### The capture operator (Toán tử bắt địa chỉ)
Ký hiệu `name/anity` định danh hàm có thể được dùng để bắt địa chỉ hàm đã có thành 1 kiểu dữ liệu để truyền đi, tương tự như hàm ẩn danh hoạt động.  
Sau khi bắt địa chỉ hàm, chúng ta có thể truyền nó làm tham số hoặc gọi nó bằng cách sử dụng ký hiệu hàm ẩn danh, lẫn hàm định nghĩa trong các mô đun modules.  
```elixir
iex(15)> fun = &String.length/1
&String.length/1
iex(16)> fun.("hello")
5
iex(17)> add = &+/2
&:erlang.+/2
iex(18)> add.(1, 2)
3
```
Toán tử trong Elixir cũng là hàm, cho nên chúng ta cũng có thể bắt địa chỉ toán tử.  

Cú pháp bắt địa chỉ (capture) cũng có thể sử dụng như phím tắt shortcut để tạo các hàm bao bọc các hàm hiện có. Ví dụ, hàm khiểm tra số lượng đối số:  
```elixir
iex(19)> is_arity_2 = fn fun -> is_function(fun, 2) end
#Function<42.18682967/1 in :erl_eval.expr/6>
iex(20)> is_arity_2.(add)
true
iex(21)> is_arity_2 = &is_function(&1, 2)
#Function<42.18682967/1 in :erl_eval.expr/6>
iex(22)> is_arity_2.(add)
true
```
`&1` biểu thị đối số đầu tiên được truyền vào hàm. 2 cách định nghĩa trên tương đương nhau.  

Toán tử bắt địa chỉ capture cũng hoạt động với toán tử và chuỗi nội suy.  
```elixir
iex(24)> fun = &(&1 + 1)  # the same as fn x -> x + 1 end
#Function<42.18682967/1 in :erl_eval.expr/6>
iex(25)> fun.(1)
2
iex(26)> fun2 = &"Good #{&1}"
#Function<42.18682967/1 in :erl_eval.expr/6>
iex(27)> fun2.("morning")
"Good morning"
```

## Binaries, strings, and charlists (Nhị phân, chuỗi và danh sách ký tự)
### Unicode and Code Points
Unicode là 1 bảng mã được thống nhất giữa các hệ thống máy tính, chứa tất cả các ký tự hình thành biểu đồ mã, mỗi ký tự được cấp 1 chỉ số duy nhất gọi là điểm mã (Code Point).  
Trong Elixir, dùng `?` trước 1 ký tự để biết điểm mã Code Point, thường được biễu diễn dưới dạng thập lục phân.  
```elixir
iex(1)> ?a 
97
iex(2)> ?$
36
iex(3)> "\u0061" == "a"
true
iex(4)> 0x0061 = 97 = ?a 
97
```
### UTF-8 and Encodings
Trong khi Code Point là thứ chúng ta lưu trữ thì encoding là cách chúng ta lưu trữ nó, encoding là 1 cách triển khai. Tức là, chúng ta cần 1 cơ chế để chuyển đổi số Code Point thành bytes để có thể lưu trữ trong bộ nhớ, ghi vào ổ cứng...  
Elixir sử dụng UTF-8 để mã hóa chuỗi, các điểm mã code point được mã hóa thành một chuỗi byte 8-bit. UTF-8 là mã hóa ký tự có độ rộng thay đổi, sử dụng từ 1 đên 14 bytes để lưu trữ mỗi điểm mã code point thuộc Unicode.  
```elixir
iex(5)> string  = "chào"
"chào"
iex(6)> String.length(string)
4
iex(7)> byte_size(string)
5
```
Chuỗi `chào` có 4 ký tự và sử dụng 5 bytes, vì dùng 2 bytes để biểu diễn ký tự `à`.  
Dùng `IO.inspect("", binaries: :as_binaries)` để xem biểu diễn nhị phân của chuỗi.  
```elixir
iex(8)> IO.inspect("hello", binaries: :as_binaries)
<<104, 101, 108, 108, 111>>
"hello"
```
`<<0>>` là null byte.  


### Bitstrings (Chuỗi bit)
Bitstring là 1 kiểu dữ liệu cơ bản trong Elixir, được biểu thị bằng cú pháp `<<>>`, một bitstring là 1 chuỗi bit liên tiếp trong bộ nhớ.  
Mặc định 8bits (1 byte) được dùng để lưu trữ mỗi số trong bitstring, nhưng chúng ta có thể dùng cú pháp `::n` để điều chỉnh số lượng n bit.  
```elixir
iex(9)> <<42>> == <<42::8>>
true
iex(10)> <<3::4>>
<<3::size(4)>>
iex(11)> <<0::1, 0::1, 1::1, 1::1>> == <<3::4>>
true
iex(12)> <<1>> == <<257>>
true
```
Số `3` được biểu diễn nhị phân là `0011`.  
Bất kỳ giá trị nào vượt quá số bit được cung cấp để lưu trữ sẽ bị cắt bỏ (tràn bit).  

### Binaries
Binaries là 1 bitstring có số lượng bit chia hết cho 8, tức là mọi binary đều là bitstring, nhưng không phải mọi bitstring đều là binary. Dùng hàm `is_bitstring/1` và `is_binary/1` để kiểm tra.  
```elixir
iex(13)> is_bitstring(<<3::4>>)
true
iex(14)> is_binary(<<3::4>>)
false
iex(15)> is_binary(<<42::16>>)
true
```
Có thể dùng khớp mẫu (pattern match) cho binay và bitstring.  
```elixir
iex(16)> <<0, 1, x>> = <<0, 1, 2>>
<<0, 1, 2>>
iex(17)> x
2
iex(18)> <<0, 1, x::binary>> = <<0, 1, 2, 3>>
<<0, 1, 2, 3>>
iex(19)> x
<<2, 3>>
iex(20)> <<head::binary-size(2), rest::binary>> = <<0, 1, 2, 3>>
<<0, 1, 2, 3>>
iex(21)> head 
<<0, 1>>
iex(22)> rest 
<<2, 3>>
```

string là một UTF-8 encoded binary (mã nhị phân được mã hóa UTF-8), trong đó, mỗi điểm mã code point cho mỗi ký tự được mã hóa từ 1 đến 4 byte. Do đó, mọi string đều là binary, nhưng mọi binary trong UTF-8 thì chưa chắc là string hợp lệ.  
Toán tử `<>` có thể được dùng để nối 2 binary.  
string là binary nên có thể dùng khớp mẫu trên string.  
```elixir
iex(23)> <<head, rest::binary>> = "banana"
"banana"
iex(24)> head == ?b 
true
iex(25)> rest
"anana"
```

Nhưng lưu ý là khớp mẫu binary làm việc trên bite, do đó với ký tự nhiều byte thì sẽ không khớp trên ký tự, mà khớp trên byte đầu tiên của ký tự đó. Vì vậy, khi so khớp mẫu trên string cần sử dụng với ký hiệu `::utf8`.  
```elixir
iex(26)> <<x, rest::binary>> = "über"
"über"
iex(27)> x == ?ü
false
iex(28)> rest 
<<188, 98, 101, 114>>
iex(29)> <<x::utf8, rest::binary>> = "über"
"über"
iex(30)> x == ?ü
true
iex(31)> rest 
"ber"
```

### Charlists (danh sách ký tự)
charlist là danh sách các số nguyên trong đó tất cả các số nguyên đều là điểm mã code point hợp lệ. Hay gặp trong 1 số tình huống cụ thể như giao tiếp với các thư viện Erlang cũ không chấp nhận binary làm tham số. Dấu ấn (sigil) `~c` cho biết rằng chúng ta đang xử lý 1 charlist chứ không phải 1 chuỗi string thông thường. Thay vì chứa byte, charlist chứa các điểm mã nguyên code point integer. Tuy nhiên, danh sách chỉ được in dưới dạng dấu ấn sigil nếu tất cả các điểm mã code point nằm trong phạm vi ASCII.  
``` bash
iex(32)> ~c"hello"
~c"hello"
iex(33)> ~c"hełło"
[104, 101, 322, 322, 111]
iex(34)> is_list(~c"hełło")
true
```
2 Hàm `to_string/1` và `to_charlist/1` để chuyển đổi charlist thành string và ngược lại.  
```elixir
iex(35)> to_charlist("hełło")
[104, 101, 322, 322, 111]
iex(36)> to_string(~c"hełło")
"hełło"
iex(37)> to_string(:hello)
"hello"
iex(38)> to_string(1)
"1"
```
Việc nối chuỗi string(binary) sử dụng toán tử `<>`, còn nối charlist(bản chất là list) thì dùng `++`.  
```elixir
iex(39)> ~c"this " ++ ~c"works"
~c"this works"
iex(40)> "he" <> "llo"
"hello"
```

## Keyword lists and maps
Trong Elixir có 2 cấu trúc dữ liệu liên kết k-v là keyword list và map.  

### Keyword lists (danh sách từ khóa)
Keyword lists Danh sách từ khóa chủ yếu được sử dụng làm đối số tùy chọn cho hàm.  
Ví dụ, ta cần chia tách 1 string các số nguyên integer, mỗi số cách nhau 2 khoảng trắng (space):  
```elixir
iex(1)> String.split("1  2  3", " ", [trim: true])
["1", "2", "3"]
iex(2)> String.split("1  2  3", " ", [trim: true, parts: 2])
["1", " 2  3"]
iex(3)> String.split("1  2  3", " ", trim: true, parts: 2)
["1", " 2  3"]
iex(4)> [{:trim, true}, {:parts, 2}] == [trim: true, parts: 2]
true
```
Trong đó, `[trim: true]` và `[trim: true, parts: 2]` là Keyword lists Danh sách từ khóa, nếu keyword lists là đối số cuối cùng của hàm thì có thể bỏ qua dấu ngoặc vuông.  

Keyword lists là quan trọng vì chúng có 3 đặc điểm đặc biệt:  
- Keys phải là atoms.
- Keys là có thứ tự, do lập trình viên quyết định.
- Keys có thể được cấp nhiều lần.
Keyword lists là list, cho nên ta có thể dùng các toán tử `++` để thêm giá trị mới.  

### Maps as key-value pairs
Một map được tạo bằng cú pháp `%{}`.  
```elixir
iex(5)> map = %{:a => 1, 2 => :b}
%{2 => :b, :a => 1}
iex(6)> map[:a]
1
iex(7)> map[2]
:b
iex(8)> map[:c]
nil
```

So với keyword lists, thì map có 2 điểm khác biệt:  
- Map cho phép bất kỳ giá trị nào làm key.
- Map có thứ tự nội bộ riêng, không đảm bảo thứ tự này sẽ giống nhau ngay cả khi chúng có cùng tập keys.

Map rất hữu dụng với việc khớp mẫu pattern matching, trả về tập con.  
```elixir
iex> %{} = %{:a => 1, 2 => :b}
%{2 => :b, :a => 1}
iex> %{:a => a} = %{:a => 1, 2 => :b}
%{2 => :b, :a => 1}
iex> a
1
iex> %{:c => c} = %{:a => 1, 2 => :b}
** (MatchError) no match of right hand side value: %{2 => :b, :a => 1}
```
Một map rỗng `%{}` khớp với tất cả các map.  

Map cung cấp nhiều API để thêm, xóa, cập nhật.  
```elixir
iex(9)> Map.get(%{:a => 1, 2 => :b}, :a)
1
iex(10)> Map.put(%{:a => 1, 2 => :b}, :c, 3)
%{2 => :b, :c => 3, :a => 1}
iex(11)> Map.to_list(%{:a => 1, 2 => :b})
[{2, :b}, {:a, 1}]
```

### Maps of predefined keys
Mếu map sử dụng key là atom thì chúng ta có thể sử dụng cú pháp `map.key` để truy suất value.  
```elixir
iex(12)> map = %{:name => "John", :age => 23}
%{name: "John", age: 23}
iex(13)> map = %{name: "John", age: 23}
%{name: "John", age: 23}
iex(14)> map.name
"John"
iex(15)> map.agee 
** (KeyError) key :agee not found in: %{name: "John", age: 23}.
```

Cú pháp cập nhật key, nếu key chưa tồn tại sẽ gây ra lỗi:  
```elixir
iex(15)> %{map | name: "Mary"}
%{name: "Mary", age: 23}
iex(16)> %{map | agee: 27}
** (KeyError) key :agee not found in: %{name: "John", age: 23}.
```

### Nested data structures (Cấu trúc lồng nhau)
Trong thực tế ta hay gặp các trường hợp map nằm trong map, hoặc keyword list nằm trong map, và lồng nhiều cấp... Ví dụ:  
```elixir
iex(17)> users = [
...(17)>   john: %{name: "John", age: 27, languages: ["Erlang", "Ruby", "Elixir"]},
...(17)>   mary: %{name: "Mary", age: 29, languages: ["Elixir", "F#", "Clojure"]}
...(17)> ]
[
  john: %{name: "John", age: 27, languages: ["Erlang", "Ruby", "Elixir"]},
  mary: %{name: "Mary", age: 29, languages: ["Elixir", "F#", "Clojure"]}
]
iex(18)> users[:john].age
27
iex(19)> users = put_in(users[:john].age, 31)
[
  john: %{name: "John", age: 31, languages: ["Erlang", "Ruby", "Elixir"]},
  mary: %{name: "Mary", age: 29, languages: ["Elixir", "F#", "Clojure"]}
]
iex(20)> users = update_in(users[:mary].languages, fn languages -> List.delete(languages, "Clojure") end)
[
  john: %{name: "John", age: 31, languages: ["Erlang", "Ruby", "Elixir"]},
  mary: %{name: "Mary", age: 29, languages: ["Elixir", "F#"]}
]
```

## Modules and functions (Mô đun và Hàm)
Để tạo Module trong Elixir, ta dùng macro `defmodule`, chử4 cái đầu tiên của Module phải viết hoa, còn chữ cái đầu tiên của các hàm trong Module phải viết thường hoặc gạch dưới (underscore):  
```elixir
iex(1)> defmodule Math do
...(1)>   def sum(a, b) do
...(1)>     a + b
...(1)>   end
...(1)> end
{:module, Math,
 <<70, 79, 82, 49, 0, 0, 5, 228, 66, 69, 65, 77, 65, 116, 85, 56, 0, 0, 0, 168,
   0, 0, 0, 18, 11, 69, 108, 105, 120, 105, 114, 46, 77, 97, 116, 104, 8, 95,
   95, 105, 110, 102, 111, 95, 95, 10, 97, ...>>, {:sum, 2}}
iex(2)> Math.sum(1, 2)
3
```

### Compilation (Biên dịch)
Tập tin code `math.ex` có thể được biên bằng `elixirc`, để tạo ra file `Elixir.Math.beam` chứa mã bytecode của mudole, nếu ta chạy dòng lệnh `iex` cùng cấp với file này thì sử dụng được module này: 
```elixir
# file math.ex
defmodule Math do
  def sum(a, b) do
    a + b
  end
end

elixirc math.ex

iex(1)> Math.sum(1, 2)
3
```

### Scripting mode (Chố độ viết kịch bản)
Ngoài phần mở rộng tập tin `.ex`, Elixir còn hỗ trợ tập tin `.exs` để viết tập lệnh scripting. Elixir xử lý cả 2 tệp theo cùng 1 cách, điểm khác nhau là tệp `.ex` dùng để biên dịch, trong khi tệp `.exs` dùng để viết tập lệnh scripting. Quy ước này được tuân theo bời các dự án như `mix`.  
Chúng ta có thể tạo ra tệp `math.exs` rồi thực thi nó bằng cách: `elixir math.exs`. Việc dùng `elixir` thay cho `elixirc` là để module được biên dịch và tải vào bộ nhớ, nhưng không có tệp `.beam` nào được ghi vào ổ đĩa.  
Dự án Elixir thường được tổ chức thành 3 thư mục:
- `_build`: chứa các hiện vật biên dịch
- `lib`: chứa mã Elixir (thường là file `.ex`)
- `test`: chứa các file kiểm tra (thường là file `.exs`)
Khi làm việc các dự án thực tế, công cụ build có tên là `mix` sẽ chịu trách nhiệm biên dịch và thiết lập các đường dẫn phù hợp cho bạn.  

### Function definition (Định nghĩa hàm)
Trong module, chúng ta có thể định nghĩa hàm công cộng (public) với `def/2` và các hàm nội bộ (private - riêng) với `defp/2`.  
Khai báo hàm cũng hỗ trợ tính guards (bảo vệ) và đa hình (multiple clauses), nếu 1 hàm có nhiều mệnh đề, Elixir sẽ thử từng mệnh đề cho đến khi tìm thấy 1 mệnh đề khớp. Ví dụ hàm check số 0 sau:  
```elixir
defmodule Math do
  def zero?(0) do
    true
  end

  def zero?(x) when is_integer(x) do
    false
  end
end

IO.puts Math.zero?(0)         #=> true
IO.puts Math.zero?(1)         #=> false
IO.puts Math.zero?([1, 2, 3]) #=> ** (FunctionClauseError)
IO.puts Math.zero?(0.0)       #=> ** (FunctionClauseError)
```
Dấu chấm hỏi `zero?` có nghĩa là hàm này trả về giá trị bool.  
Giống như `if`, định nghĩa hàm cũng hỗ trợ cả cú pháp `do:` (viết 1 dòng) và `do`-block (khối lệnh nhiều dòng). Ví dụ hàm trên có thể viết lại như sau:  
```elixir
defmodule Math do
  def zero?(0), do: true
  def zero?(x) when is_integer(x), do: false
end
```

### Default arguments (Đối số mặc định)
Định nghĩa hàm trong Elixir cũng hỗ trợ đối số mặc định:
```elixir
defmodule Concat do
  def join(a, b, sep \\ " ") do
    a <> sep <> b
  end
end

IO.puts(Concat.join("Hello", "world"))      #=> Hello world
IO.puts(Concat.join("Hello", "world", "_")) #=> Hello_world
```
Nếu sử dụng đối số mặc định cho hàm có nhiều biến thể thì ta cần tạo ra 1 đầu hàm không có thân hàm để khai báo, ví dụ:  
```elixir
defmodule Concat do
  # A function head declaring defaults
  def join(a, b, sep \\ " ")

  def join(a, b, _sep) when b == "" do
    a
  end

  def join(a, b, sep) do
    a <> sep <> b
  end
end

IO.puts(Concat.join("Hello", ""))           #=> Hello
IO.puts(Concat.join("Hello", "world"))      #=> Hello world
IO.puts(Concat.join("Hello", "world", "_")) #=> Hello_world
```
Khi 1 biến không được sử dụng bới 1 hàm hoặc mệnh đề, chúng ta cần thêm dấu gạch dưới `_` vào tên của nó để báo hiệu ý định này.  


## Recursion (Đệ quy)
### Loops through recursion (Vòng lặp thông qua đệ quy)
Do tính bất biến (immutability), mà Elixir không có vòng lặp như các ngôn ngữ khác, vì vậy vòng lặp trong ngôn ngữ hàm (function languages) dựa trên đệ quy: 1 hàm được gọi đệ quy cho đến khi gặp phải điều kiện chặn. Không có dữ liệu nào bị thay đổi trong quá trình này. Ví dụ in chuỗi nhiều lần dưới đây:  
```elixir
defmodule Recursion do
  def print_multiple_times(msg, n) when n > 0 do
    IO.puts(msg)
    print_multiple_times(msg, n - 1)
  end

  def print_multiple_times(_msg, 0) do
    :ok
  end
end

Recursion.print_multiple_times("Hello!", 3)
# Hello!
# Hello!
# Hello!
:ok
```
Tương tự như `case`, 1 hàm có thể có nhiều mệnh đề, 1 mệnh để được thực thi khi các đối số được truyền vào hàm khớp với các mẫu đối số và guards của nó được đánh giá là `true`.  


### Reduce and map algorithms (Thuật toán Reduce & map)
Cùng khám phá sức mạnh của đệ quy để tính tổng 1 danhs sách số:  
```elixir
defmodule Math do
  def sum_list([head | tail], accumulator) do
    sum_list(tail, head + accumulator)
  end

  def sum_list([], accumulator) do
    accumulator
  end
end

IO.puts Math.sum_list([1, 2, 3], 0) #=> 6
```
Quá trình lấy 1 danh sách và rút gọn thành 1 giá trị gọi là thuật toán rút gọn reduce algorithm, và đóng vai trò trung tâm của lập trình hàm.  


Nếu ta muốn nhân đôi mỗi giá trị trong danh sách thì sao?  
```elixir
defmodule Math do
  def double_each([head | tail]) do
    [head * 2 | double_each(tail)]
  end

  def double_each([]) do
    []
  end
end

Math.double_each([1, 2, 3]) #=> [2, 4, 6]
```
Quá trình lấy 1 danh sách và ánh xạ mapping trên danh sách đó được gọi là thuật toán ánh xạ map algorithm.  
Đệ quy và tối ưu hóa lệnh gọi tail là 1 phần quan trọng của Elixir và thường được sử dụng để tạo vòng lặp, tuy nhiên trong thực tế hiếm khi sử dụng đệ quy như trên để thao tác danh sách.  
Module `Enum` sẽ cung cấp nhiều tiện ích để làm việc với sanh sách, ví dụ:  
```elixir
iex(1)> Enum.reduce([1, 2, 3], 0, fn x, acc -> x + acc end)
6
iex(2)> Enum.map([1, 2, 3], fn x -> x * 2 end)
[2, 4, 6]
```
Hoặc sử dụng cú pháp chụp capture systax:  
```elixir
iex(1)> Enum.reduce([1, 2, 3], 0, &+/2)
6
iex(2)> Enum.map([1, 2, 3], &(&1 * 2))
[2, 4, 6]
```

## Enumerables and Streams
Elixir cho phép chúng ta viết mã đệ quy, nhưng hầu hết các thao tác với collections đều được thực hiện với sự trợ giúp của các module `Enum` và `Stream`.  

### Enumerables
Ngoài 2 Enum với list và map, module `Enum` còn cung cấp nhiều hàm để truyển đổi transform, sắp xếp sort, gom nhóm group, lọc filter và rút trích các mục items. 
Elixir cũng cung cấp các phạm vi range.  
```elixir
iex(1)> Enum.map(1..3, fn x -> x * 2 end)
[2, 4, 6]
iex(2)> Enum.reduce(1..3, 0, &+/2)
6
```

Chúng ta có thẻ nói các hàm trong module `Enum` là đa hình (polymorphic) vì chúng có thể hoạt động với nhiều kiểu dữ liệu nào có triển khai giao thức `Enumerable`.  

### Eager vs Lazy (Háo hức và lười biếng)
Tất cả các hàm trong module `Enum` đều là Eager.  
```elixir
iex(3)> odd? = fn x -> rem(x, 2) != 0 end
#Function<42.18682967/1 in :erl_eval.expr/6>
iex(4)> Enum.filter(1..3, odd?)
[1, 3]
```
Khi thực hiện nhiều thao tác với `Enum`, mỗi thao tác sẽ tạo ra 1 danhs ách trung gian cho đến khi chúng ta đạt được kết quả:  
```elixir
iex(5)> 1..100 |> Enum.map(&(&1 *3)) |> Enum.filter(odd?) |> Enum.sum()
7500

# Tương đương với mã sau nếu không dùng pipe operator.
iex(5)> Enum.sum(Enum.filter(Enum.map(1..100, &(&1 * 3)), odd?))
7500
```

### The pipe operator (Toán tử đường ống)
Ký hiệu `|>` được sử dụng trong đoạn code trên là toán tử đường ống pipe operator: nó lấu đầu ra từ biểu thức ở trước bên trái và truyền nó làm đối số đầu tiên cho lệnh gọi hàm ở phía bên phải. Giúp viết code trở nên rõ ràng dễ hiểu với việc chuyển đổi dữ liệu qua một loạt các hàm.  

### Streams (luồng)
Một thay thế cho `Enum`, Elixir cung cấp module `Stream` hỗ trợ các hoạt động lười biếng lazy operator:  
```elixir
iex(6)> 1..100 |> Stream.map(&(&1 * 3)) |> Stream.filter(odd?) |> Enum.sum()
7500
```
Thay vì tạo danh sách trung gian, các Stream xây dựng 1 loạt các phép tính chỉ được gọi khi chúng ta truyền Stream cơ bản cho module `Enum`. Stream hữu ích khi làm việc với các bộ sưu tập lớn (collection), có thể là vô hạn.  
Hàm `Stream.cycle/1` có thể được sử dụng để tạo 1 luống tuần hoàn với 1 enumerable vô hạn, tránh không gọi hàm `Enum.map/2` trên các luồng như vậy vì chúng sẽ tuần hoàn mãi mãi:  
```elixir
iex(9)> stream = Stream.cycle([1, 2, 3])
#Function<64.82544474/2 in Stream.unfold/2>
iex(10)> Enum.take(stream, 10)
[1, 2, 3, 1, 2, 3, 1, 2, 3, 1]
```

Một hàm thú vị khác là `Stream.resource/3` có thể được sử dụng để bao quanh các tài nguyên, đảm bảo chúng được mở ngay trước khi liệt kê (enumeration) và đóng close sau đó. Ví dụ, `File.stream!/1` được xây dựng trên dựa trên `Stream.resource/3` để truyền phát các tệp tin:  
```elixir
iex> "path/to/file" |> File.stream!() |> Enum.take(10)
```
Ví dụ trên sẽ lấy 10 dòng đầu tiên của tập tin đã chọn. Điều này có nghĩa là các luồng stream có thể rất hữu ích để xử lý các tập tin lớn hoặc thậm trí các tài nguyên chậm như tài nguyên mạng (network resource).  


## Processes (tiến trình)
Trong Elixir, tất cả code chạy bên trong các tiến trình process. Các process được cô lập (isolated) với nhau và giao tiếp thông qua việc truyền tin nhắn message. Process không chỉ là cơ sở cho tính đồng thời concurrency trong Elixir mà còn cung cấp phương tiện để xây dựng các chương trình phân tán distributed và khả năng chịu lỗi cao fault-tolerant.  
Đừng nhầm lẫn giữa Process của Elixir và Process của hệ điều hành. Process trong Elixir cực kỳ nhẹ về bộ nhớ và CPU (thậm chí so sánh với các luồng thread được sử dụng trong nhiều ngôn ngữ lập trình khác). Vì vậy, không có gì lạ khi có hàng chục hoặc thậm chí hàng trăm nghìn tiến trình process chạy cùng lúc.  

### Spawning processes (sinh tiến trình)
Cách cơ bản để tạo ra tiến trình mới là dùng hàm `spawn/1`, nó lấy 1 hàm để thực thi trong 1 tiến trình khác:  
```elixir
iex(3)> pid = spawn(fn -> 1 + 2 end)
#PID<0.107.0>
iex(4)> Process.alive?(pid)
false
```
Lưu ý `spawn/1` trả về PID (mã định danh tiến trình process identifier). Tiến trình process được tạo ra sẽ thực thi hàm đã cho và kết thúc sau khi hàm chạy xong:  

Chúng ta có thể lấy PID của tiến trình hiện tại bằng `self/0`:  
```elixir
iex(5)> self()
#PID<0.105.0>
iex(6)> Process.alive?(self())
true
```

Các tiến trình process trở nên thú vị hơn nhiều khi chúng ta có thể gửi và nhận tin nhắn message.  

### Sending and receiving messages (Gửi và nhận tin nhắn)
Chúng ta có thể gửi tin nhắn message đến 1 tiến trình process với `send/2` và nhận tin nhắn bằng `receive/1`:  
```elixir
iex(8)> send(self(), {:hello, "world"})
{:hello, "world"}
iex(9)> receive do
...(9)> {:hello, msg} -> msg
...(9)> {:world, _msg} -> "won't match"
...(9)> end
"world"
```

Khi 1 tin nhắn message được gửi đến 1 tiến trình process, message đó sẽ được lưu trữ trong hộp thư của tiến trình process đó. Khối `receive/1` sẽ đi qua hộp thư process hiện tại để tìm kiếm 1 message khớp với bất kỳ mẫu nào được đưa ra. `receive/1` hỗ trợ các guards và nhiều mệnh đề, giống như `case/2`.  
Process gửi message không bị chặn trên `send/2`, nó đưa message vào hộp thư của người nhận và tiếp tục. Đặc biệt, tiến trình process có thể gửi message cho chính nó.  
nếu không có message nò trong hộp thư khớp với bất kỳ mẫu nào, process hiện tại sẽ đợi cho đến khi cho đến khi có message khớp, thời gian chờ cũng có thể được chỉ định:  
```elixir
iex(1)> receive do 
...(1)> {:hello, msg} -> msg 
...(1)> after 
...(1)> 1_000 -> "nothing after 1s"
...(1)> end 
"nothing after 1s"
```
Bạn có thể thiết lập thời gian chờ (timeout) là 0 khi bạn mong đợi message sẽ nằm trong hộp thư.  
```elixir
iex(2)> parent = self()
#PID<0.105.0>
iex(3)> spawn(fn -> send(parent, {:hello, self()}) end)
#PID<0.106.0>
iex(4)> receive do 
...(4)> {:hello, pid} -> "Got hello from #{inspect pid}"
...(4)> end
"Got hello from #PID<0.106.0>"
```
Hàm `inspect/1` được sử dụng để chuyển đồi biểu diễn bên trong của cấu trúc dữ liệu thành chuỗi, thường để in.  
Khi ở chế độ shell, bạn có thể dùng `flush/0` để xả và in ra tất cả message trong hộp thư.  
```elixir
iex(5)> send(self(), :hello)
:hello
iex(6)> flush()
:hello
:ok
```

### Links (liên kết)
Vì mặc định các process là cô lập cho nên process này chết không ảnh hưởng đến process khác và process cha. Nếu chúng ta muốn lỗi trong 1 process lan truyền đến 1 process khác, chúng ta nên liên kết chúng. Điều này có thể được thực hiện với `spawn_link/1`:  
```elixir
iex(7)> self()
#PID<0.105.0>
iex(8)> spawn_link(fn -> raise "oops" end)

18:09:17.244 [error] Process #PID<0.107.0> raised an exception
** (RuntimeError) oops
** (EXIT from #PID<0.105.0>) shell process exited with reason: {%RuntimeError{message: "oops"}, []}

Interactive Elixir (1.18.2) - press Ctrl+C to exit (type h() ENTER for help)
```
Vì các process này được liên kết, nên bây giờ chúng ta thấy 1 thông báo cho process cha, tức là tiến trình shell, đã nhận được tín hiệu Exit từ 1 process khác khiến shekk kết thúc. IEX phát hiện tính huống này và bắt đầu 1 phiên shell mới.  

Việc liên kết cũng có thể được thực hiện thủ công bằng cách gọi `Process.link/1`.  
Process và Link đóng vai trò quan trọng trong xây dựng các hệ thống chịu lỗi (fault-tolerant systems), các tiến trình Process trong Elixir được cô lập và không chia sẻ bất cứ thứ gì theo mặc định. Do đó, lỗi trong 1 process sẽ không bao giờ làm sập hoặc làm hỏng trạng thái của Process khác. Tuy nhiên, liên kết cho phép các Process thiết lập mối quan hệ trong trường hợp lỗi. Chúng ta thường liên kết các process của mình với các trình giám sát supervisors, là người sẽ phát hiện 1 process bị chết và bắt đầu 1 process mới thay thế.  

Trong khi các ngôn ngữ khác yêu cầu chúng ta phải phát hiện/xử lý (catch/handle) các ngoại lệ exceptions, thì trong Elixir, chúng ta thực sự có thể để các process lỗi vì chúng ta mong đợi người giám sát supervisors khởi động lại hệ thống đúng cách. "Thất bại nhanh chóng - Failing fast" (đôi khi được gọi là để nó sụp đổ) là 1 triết lý phổ biến khi viết phần mềm Elixir!  

`spawn/1` và `spawn_link/1` là các hàm cơ bản để tạo tiến trình trong Elixir. Trong thực tế chung ta hay dùng các trừu tượng được xây dựng trên chúng, phổ biến nhất được gọi là tác vụ task.  

### Tasks (tác vụ)
task được xây dựng dựa trên các hàm spawn để cung cấp các báo cáo lỗi và nội quan (introspection) tốt hơn:  
```elixir
iex(9)> Task.start(fn -> raise "oops" end)
{:ok, #PID<0.109.0>}

18:38:13.963 [error] Task #PID<0.109.0> started from #PID<0.108.0> terminating
** (RuntimeError) oops
    (elixir 1.18.2) src/elixir.erl:386: :elixir.eval_external_handler/3
Function: #Function<43.18682967/0 in :erl_eval.expr/6>
    Args: []
```
Thay vì `spawn/1` và `spawn_link/1` chúng ta sử dụng `Task.start/1` và `Task.start_link/1` trả về {:ok, pid} thay vì chỉ PID. Đây là những gì cho phép các Task được sử dụng trong cây giám sát supervision tree. Hơn nữ, Task cung cấp các hàm tiện lợi, như `Task.async/1` và `Task.await/1`, và chức năng để phân phối dễ dàng.  
Chúng ta sẽ khám phá các nhiệm vụ và các khái niệm trừu tượng xung quanh process trong hướng dẫn về "Mix và OTP".  

### State (trạng thái)
Nếu bạn xây dựng 1 ứng dụng yêu cầu trạng thái state để duy trì cấu hình ứng dụng thì bạn sẽ lưu trữ nó ở đâu? Process là câu trả lời phổ biến nhất cho câu hỏi này. Chúng ta có thể viết các process lặp vô hạn, duy trì trạng thái và gửi nhận message. Ví dụ, viết 1 module khởi động một process mới hoạt động như 1 kho lưu trữ key-value trong file có tên `kv.exs`:  
```elixir
defmodule KV do
  def start_link do
    Task.start_link(fn -> loop(%{}) end)
  end

  defp loop(map) do
    receive do
      {:get, key, caller} ->
        send(caller, Map.get(map, key))
        loop(map)
      {:put, key, value} ->
        loop(Map.put(map, key, value))
    end
  end
end
```

Hãy thử chạy bằng: `iex kv.exs`:  
```elixir
iex(1)> {:ok, pid} = KV.start_link()
{:ok, #PID<0.111.0>}
iex(2)> send(pid, {:get, :hello, self()})
{:get, :hello, #PID<0.110.0>}
iex(3)> flush()
nil
:ok
```
Đầu tiên, process map không có key, do đó gửi message `:get` rồi xóa hộp thư đến của process hiện tại sẽ trả về `nil`. Bây giờ gửi message `:put` và thử lại:  
```elixir
iex(4)> send(pid, {:put, :hello, :world})
{:put, :hello, :world}
iex(5)> send(pid, {:get, :hello, self()})
{:get, :hello, #PID<0.110.0>}
iex(6)> flush()
:world
:ok
```
Chú ý cách process duy trì trạng thái và chúng ta có thể lấy và cập nhật trạng thái này bằng cách gửi message. Bất kỳ process nào biết pid ở trên đều có thể gửi message và thao tác trạng thái.  
Bạn có thể đăng ký `pid`, đặt tên cho nó và cho phép những ai biết tên đó đều gửi message đến nó:  
```elixir
iex(7)> Process.register(pid, :kv)
true
iex(8)> send(:kv, {:get, :hello, self()})
{:get, :hello, #PID<0.110.0>}
iex(9)> flush()
:world
:ok
```

Trong thực tế, Elixir cung cấp `Agent` là những trừu tượng đơn giản để quản lý trạng thái, mã trên có thể được viết lại như sau:  
```elixir
iex(10)> {:ok, pid} = Agent.start_link(fn -> %{} end)
{:ok, #PID<0.112.0>}
iex(11)> Agent.update(pid, fn map -> Map.put(map, :hello, :world) end)
:ok
iex(12)> Agent.get(pid, fn map -> Map.get(map, :hello) end)
:world
```
Một tùy chọn `:name` có thể được cung cấp cho `Agent.start_link/2` và nó sẽ được tự động đăng ký. bên cạnh Agent, Elixir cung cấp API để xây dựng các máy chủ tổng quan gọi là `GenServer`, sổ đăng ký registries, và nhiều thứ khác, tất cả đều được hỗ trợ bởi các process bên dưới, sẽ được trình bày chi tiết trong hướng dẫn "Mix và OTP".  


## IO and the file system
Hệ thống IO cung cấp cơ hội tuyệt vời để làm sáng tỏ 1 số triết lý và điều thú vị về Elixir và Erlang VM.  

### The IO module
Module IO là cơ chế chính trong Elixir để đọc và ghi vào nhập/xuất chuẩn `:stdio`, lỗi chuẩn `:stderr`, tập tin file và các thiết bị IO khác. Việc sử dụng module này khá đơn giản:  
```elixir
iex(1)> IO.puts("hello world")
hello world
:ok
iex(2)> IO.gets("yes or no? ")
yes or no? yes 
"yes\n"
```
Mặc định, các hàm trong module IO đọc từ đầu vào chuẩn và ghi vào đầu ra chuẩn. Chúng ta có thể thay đổi điều đó bằng cách truyền `:stderr` làm đối số, để ghi vào vào thiết bị lỗi chuẩn:  
```elixir
iex(3)> IO.puts(:stderr, "hello world")
hello world
:ok
```

### The File module
Module `File` chứa các hàm cho phép chúng ta mở tệp dưới dạng thiết bị IO. Mặc định, tệp được mở ở chế độ nhị phân, bằng các hàm `IO.binread/2` và `IO.binwrite/2` từ module `IO`:  
```elixir
iex> {:ok, file} = File.open("path/to/file/hello", [:write])
{:ok, #PID<0.47.0>}
iex> IO.binwrite(file, "world")
:ok
iex> File.close(file)
:ok
iex> File.read("path/to/file/hello")
{:ok, "world"}
```
Có thể mở file bằng tùy chọn `:append` thay vì `:write` để giữ nguyên nội dung của file. Bạn cũng có thể truyền tùy chọn `:utf8` để yêu cầu module `File` diễn giải các byte được đọc từ file thành các byte được mã hóa UTF-8.  

Bạn cũng sẽ nhận thấy rằng các hàm trong module `File` có 2 biến thể: 1 biến thể thông thường và 1 biến thể khác có dấu chấm than ở cuối `!`. Ví dụ, khi chúng ta đọc file "hello", chúng ta có thể sử dụng `File.read!/1` thay cho `File.read/1`:  
```elixir
iex> File.read("path/to/file/hello")
{:ok, "world"}
iex> File.read!("path/to/file/hello")
"world"
iex> File.read("path/to/file/unknown")
{:error, :enoent}
iex> File.read!("path/to/file/unknown")
** (File.Error) could not read file "path/to/file/unknown": no such file or directory
```
Lưu ý phiên bản có `!` trả về nội dung của file thay vì 1 tuple, và nếu có bất kỳ lỗi nào xảy ra, hàm sẽ báo lỗi.  

Phiên bản không có `!` được ưu tiên khi bạn muốn xử lý các kết quả khác nhau bằng cách sử dụng khớp mẫu pattern matching:  
```elixir
case File.read("path/to/file/hello") do
  {:ok, body} -> # do something with the `body`
  {:error, reason} -> # handle the error caused by `reason`
end
```
Tránh viết:  
```elixir
{:ok, body} = File.read("path/to/file/unknown")
```
vì trong trường hợp xảy ra lỗi, `File.read/1` sẽ trả về {:error, reason} và việc so khớp mẫu sẽ không thành công.  
Do đó, nếu bạn không muốn xử lý lỗi, hãy sử dụng các hàm kết thúc bằng dấu chấm than `!`.  

### The Path module
Phần lớn các hàm trong module `File` mong đợi các đường dẫn làm đối số. Module `Path` cung cấp các tiện ích để làm việc với các đường dẫn này.  
```elixir
iex(4)> Path.join("foo", "bar")
"foo/bar"
iex(5)> Path.expand("~/hello")
"/home/user/hello"
```
Nên xử dụng các hàm từ module `Path` thay vì thao tác trực tiếp chuỗi vì module `Path` xử lý tốt đường dẫn cho các hệ điều hành khác nhau. Cuối cùng, Elixir sẽ tự động đổi dấu gạch chép slash `/` thành dấu gạch chéo ngược backslash `\` trên Windows khi thực hiện các thao tác với file.  


### Processes (tiến trình)
Bạn có thể thấy rằng `File.open/2` trả về 1 bộ tuple như {:ok, pid}:  
```elixir
iex> {:ok, file} = File.open("hello")
{:ok, #PID<0.47.0>}
```
Điều này xảy ra vì module `IO` thực sự hoạt động với các tiến trình process. Vì là 1 process, khi bạn ghi vào 1 file đã bị đóng, thực tế là bạn đang gửi 1 message đến 1 process đã bị chấm dứt:  
```elixir
iex> File.close(file)
:ok
iex> IO.write(file, "is anybody out there")
** (ErlangError) Erlang error: :terminated:

  * 1st argument: the device has terminated

    (stdlib 5.0) io.erl:94: :io.put_chars(#PID<0.114.0>, "is anybody out there")
    iex:4: (file)
```

Hãy xem chi tiết hơn những gì xảy ra khi bạn yêu cầu `IO.write(pid, binary)`. Module `IO` gửi 1 message đến process được xác định bởi `pid` với thao tác mong muốn. 1 process ad-hoc nhỏ có thể giúp chúng ta thấy điều đó:  
```elixir
iex> pid = spawn(fn ->
...>   receive do
...>     msg -> IO.inspect(msg)
...>   end
...> end)
#PID<0.57.0>
iex> IO.write(pid, "hello")
{:io_request, #PID<0.41.0>, #Reference<0.0.8.91>,
 {:put_chars, :unicode, "hello"}}
** (ErlangError) erlang error: :terminated
```
Bằng cách mô hình hóa các thiết bị IO với process, Erlang VM cho phép chúng ta thậm chí đọc và ghi vào các file trên các nút node.  


### iodata and chardata
Trong tất cả các ví dụ trên, chúng ta sử dụng nhị phân khi ghi vào file. Tuy nhiên, hầu hết các hàm IO trong Elixir cũng chấp nhận "iodata" hoặc "chardata".  
1 trong những lý do chính để sử dụng "iodata" và "chardata" là vì hiệu suất. Ví dụ, hãy tưởng tượng bạn cần chào ai đó trong ứng dụng của mình:  
```elixir
name = "Mary"
IO.puts("Hello " <> name <> "!")
```
Các chuỗi trong Elixir là bất biến immutable, giống như hầu hết các cấu trúc dữ liệu khác, ví dụ trên sẽ sao chép chuỗi "Mary" vào chuỗi "Hello Mary!" mới. Mặc dù điều này không quan trọng đối với chuỗi ngắn, nhưng việc sao chép có thể khá tốn kém đối với chuỗi lớn! Vì lý do này, các hàm IO trong Elixir cho phép bạn truyền 1 danh sách chuỗi thay thế:  
```elixir
name = "Mary"
IO.puts(["Hello ", name, "!"])
```
Trong ví dụ trên, không có sao chép. Thay vào đó, chúng ta tạo ra 1 danh sách chứa tên gốc. Chúng ta gọi những danh sách như vậy là "iodata" hoặc "chardata" và chúng ta sẽ sớm biết được sự khác biệt chính xác giữa chúng.  

"iodata" và "chardata" không chỉ chứa các chuỗi mà còn có thể chứa các danh sách chuỗi lồng nhau tùy ý nữa:  
```elixir
IO.puts(["apple", [",", "banana", [",", "lemon"]]])
```

Sự khác biệt giữa "iodata" và "chardata" là việc biểu diễn số nguyên integer. Với "iodata" số nguyên biểu diễn byte, với "chardata" số nguyên biểu diễn điểm mã Unicode codepoints. Đối với các ký tự ASCII, biểu diễn byte giống với biểu diễn điểm mã codepoint, do đó nó phù hợp với cả 2 phân loại. Tuy nhiên, thiết bị IO mặc định hoạt động với chardata, nghĩa là chúng ta có thể thực hiện:  
```elixir
iex(6)> IO.puts([?O, ?l, ?á, ?\s, "Mary", ?!])
Olá Mary!
:ok
```
charlist ví dụ như `~c"hello world"` là danh sách các số nguyên và do đó là chardata.  

Việc lựa chọn giữa iodata và chardata phụ thuộc vào mã hóa encoding của thiết bị IO. Nếu file được mở không có encoding thì file là iodata và nên dùng với các hàm trong module IO bắt đầu bằng `bin*`. Mặc định thiết bị IO `:stdio` và file được mở với `:utf8` chính là chardata và làm việc với các hàm còn lại trong module `IO`.  


## alias, require, import, and use
Để tạo điều kiện thuận lợi cho việc tái sử dụng phần mềm, Elixir cung cấp 3 chỉ thị: `alias`, `require` và `import` cùng với 1 macro có tên là `use` được tóm tắt dưới đây:  
```elixir
# Alias the module so it can be called as Bar instead of Foo.Bar
alias Foo.Bar, as: Bar

# Require the module in order to use its macros
require Foo

# Import functions from Foo so they can be called without the `Foo.` prefix
import Foo

# Invokes the custom code defined in Foo as an extension point
use Foo
```
3 cái đầu tiên được gọi là chỉ thị vì chúng có phạm vi từ vựng lexical scope, trong khi `use` là điểm mở rộng chung cho phép module được sử dụng đưa mã vào.  

### alias (bí danh)
`alias` cho phép bạn thiết lập bí danh cho bất kỳ tên module nào.  
Việc gọi `alias` mà không có tùy chọn `:as` sẽ tự động đặt bí danh thành phần cuối của tên Module, ví dụ: `alias Math.List` giống như: `alias Math.List, as: List`.  
Lưu ý rằng `alias` có phạm vi từ điển lexically scoped, cho phép bạn đặt alias bên trong các hàm cụ thể:  
```elixir
defmodule Math do
  def plus(a, b) do
    alias Math.List
    # ...
  end

  def minus(a, b) do
    # ...
  end
end
```
Việc gọi `alias` bên trong `plus/2` chỉ có tác dụng bên trong hàm này, và không có ảnh hưởng gì với hàm `minus/2`.  

### require (yêu cầu)
Elixir cung cấp macro như 1 cơ chế cho meta-programming (viết mã để tạo ra mã). Macro được mở rộng tại thời điểm biên dịch.  
Các hàm công khai public functions trong module có sẵn trên toàn cục, nhưng để sử dụng macro, bạn cần phải chọn tham gia bằng cách yêu cầu module mà chúng được định nghĩa.  
```elixir
iex(1)> Integer.is_odd(3)
** (UndefinedFunctionError) function Integer.is_odd/1 is undefined or private. However, there is a macro with the same name and arity. Be sure to require Integer if you intend to invoke this macro
    (elixir 1.18.2) Integer.is_odd(3)
    iex:1: (file)
iex(1)> require Integer 
Integer
iex(2)> Integer.is_odd(3)
true
```
Trong Elixir, `Integer.is_odd/1` được định nghĩa là 1 macro để có thể sử dụng như 1 guard. Điều này có nghĩa là, để gọi `Integer.is_odd/1`, trước tiên chúng ta cần yêu cầu module `Integer`.  
Lưu ý rằng giống như chỉ thị `alias`, `require` cũng có phạm vi từ vựng lexically scoped.  


### import
Chúng ta sử dụng `import` bất cứ khi nào muốn truy cập hàm hoặc macro từ các module khác mà không cần sử dụng tên đầy đủ. Lưu ý rằng chúng ta chỉ có thể import các hàm public, vì các hàm private không bao giờ có thể truy cập được từ bên ngoài.  
```elixir
iex(3)> import List, only: [duplicate: 2]
List
iex(4)> duplicate(:ok, 3)
[:ok, :ok, :ok]
```
Tùy chọn `:only` được khuyến nghị để tránh import tất cả các hàm của module, ngược lại, `:except` cho phép import tất cả các hàm trong module ngoại trừ danh sách hàm.  

Lưu ý rằng `import` cũng có phạm vi từ vựng lexically scoped, tức là cũng có thể import các macro và hàm cụ thể bên trong các định nghĩa hàm:
```elixir
defmodule Math do
  def some_function do
    import List, only: [duplicate: 2]
    duplicate(:ok, 10)
  end
end
```

Mặc dù `import` có thể hữu ích cho các framework và library để xây dựng các lớp trừu tượng, nhưng các nhà phát triển thường thích sử dụng `alias` hơn `import`, vì alias giúp làm rõ hơn nguồn gốc của hàm được gọi.  


### use
Macro `use` thường được sử dụng như 1 điểm mở rộng. Điều này có nghĩa là khi bạn sử dụng `use` 1 module `FooBar`, bạn cho phép module đó đưa bất kỳ mã nào vào module hiện tại, chẳng hạn như nhập chính nó hoặc các module khác, xác định các hàm mới, thiết lập trạng thái module, v.v.  
Ví dụ để viết các bài kiểm tra sử dụng ExUnit framework, chúng ta sử dụng module `ExUnit.Case`:  
```elixir
defmodule AssertionTest do
  use ExUnit.Case, async: true

  test "always pass" do
    assert true
  end
end
```
Đằng sau hậu trường, `use` yêu cầu module đã cho và sau đó gọi hàm gọi lại `__using__/1` callback trên module đó, cho phép module đưa 1 số mã vào ngữ cảnh hiện tại. 1 số module như `ExUnit.case` cũng như `Supervisor` và `GenServer` sử dụng cơ chế này để đưa vào module của bạn 1 số hành vi cơ bản mà module của bạn có mục đích ghi đè override hoặc hoàn thiện complete.  
Nói chung, module sau đây:  
```elixir
defmodule Example do
  use Feature, option: :value
end
```
được biên dịch thành  
```elixir
defmodule Example do
  require Feature
  Feature.__using__(option: :value)
end
```
Vì `use` cho phép chạy bất kỳ mã nào nên chúng ta không thể thực sự biết được tác dụng phụ của việc sử dụng 1 module nếu không đọc tài liệu của nó. Do đó, hãy sử dụng chức năng này 1 cách cẩn thận và chỉ khi thật sự cần thiết. Không sử dụng `use` khi `import` hoặc `alias` có thể thực hiện được.  


### Understanding Aliases (hiểu về bí danh)
Bạn có thể thắc mắc Elixir alias thực chất là gì và nó được biểu diễn như thế nào?  
1 alias trong Elixir là 1 mã định danh viết hoa như `String`, `Keyword`, v.v. được chuyển đổi thành 1 atom trong quá trình biên dịch. Ví dụ, mặc định, `String` alias được dịch thành atom "Elixir.String":  
```elixir
iex(5)> is_atom(String)
true
iex(6)> to_string(String)
"Elixir.String"
iex(7)> :"Elixir.String" == String
true
```
Bằng cách sử dụng chỉ thị `alias/2`, chúng ta đang thay đổi atom mà alias mở rộng thành.  

Các alias mở rộng atome vì trong Erlang VM (và do đó là Elixir), các module luôn được biểu diễn bằng các atoms:  
```elixir
iex(10)> List.flatten([1, [2], 3])
[1, 2, 3]
iex(11)> :"Elixir.List".flatten([1, [2], 3])
[1, 2, 3]
```
Đó là cơ chế chúng ta sử dụng để gọi các module Erlang:  
```elixir
iex(12)> :lists.flatten([1, [2], 3])
[1, 2, 3]
```

### Module nesting (Lồng ghép module)
Xem ví dụ sau:  
```elixir
defmodule Foo do
  defmodule Bar do
  end
end
```
Ví dụ trên định nghĩa 2 module: Foo và Foo.Bar. Module thứ 2 có thể được truy cập như `Bar` bên trong `Foo` miễn là chúng nằm trong cùng 1 phạm vi từ vựng lexical scope.  

Nếu sau đó, module `Bar` được di chuyển ra khỏi định nghĩa module `Foo` thì module này phải được tham chiếu bằng tên đầy đủ `Foo.Bar` hoặc phải sử dụng chỉ thị `alias` như đã thảo luận ở trên.  

Trong Elixir, bạn không cần phải định nghĩa module `Foo` trước khi định nghĩa module `Foo.Bar`, chúng thực sự độc lập. Ví dụ trên cũng có thể được viết như sau:  
```elixir
defmodule Foo.Bar do
end

defmodule Foo do
  alias Foo.Bar
  # Can still access it as `Bar`
end
```

Việc đặt bí danh alias cho 1 module lồng nhau không đưa các module cha vào phạm vi. Ví dụ:  
```elixir
defmodule Foo do
  defmodule Bar do
    defmodule Baz do
    end
  end
end

alias Foo.Bar.Baz
# The module `Foo.Bar.Baz` is now available as `Baz`
# However, the module `Foo.Bar` is *not* available as `Bar`
```


### Multi alias/import/require/use
Có thể `alias`, `import`, `require`, hoặc `use` nhiều module cùng 1 lúc. Điều này đặc biệt hữu ích khi chúng ta bắt đầu lồng các module, điều này rất phổ biến khi xây dựng các ứng dụng Elixir. Ví dụ, tưởng tượng bạn có 1 ứng dụng trong đó tất cả các module được lồng vào `MyApp` bạn có thể đặt bí danh cho các module `MyApp.Foo`, `MyApp.Bar` và `MyApp.Baz` cùng 1 lúc như sau:  
```elixir
alias MyApp.{Foo, Bar, Baz}
```


## Module attributes (Thuộc tính module)
Thuộc tính module trong Elixir phục vụ 3 mục đích:  
- Làm chú thích annotations cho module và function.
- Làm bộ nhớ module tạm thời được sử dụng trong quá trình biên dịch.
- Làm hằng số thời gian biên dịch.

### As annotations (chú thích)
Elixir mang khái niệm thuộc tính module từ Erlang. Ví dụ:  
```elixir
defmodule MyServer do
  @moduledoc "My server code."
end
```
Elixir có 1 số thuộc tính được giữ lại, như:  
- `@moduledoc` cung cấp tài liệu cho module hiện tại.
- `@doc` cung cấp tài liệu cho hàm hoặc macro theo sau thuộc tính.
- `@spec` cung cấp 1 typespec cho hàm theo sau thuộc tính.
- `@behaviour` được sử dụng để chỉ định OTP hoặc hành vi do người dùng xác định.

Ví dụ module `Math` được thêm chú thích vào file `math.ex`:  
```elixir
defmodule Math do
  @moduledoc """
  Provides math-related functions.

  ## Examples

      iex> Math.sum(1, 2)
      3

  """

  @doc """
  Calculates the sum of two numbers.
  """
  def sum(a, b), do: a + b
end
```
Elixir khuyến khích sử dụng Markdown để viết tài liệu dễ đọc. Nội dung nhiều dòng bắt đầu và kết thúc bằng 3 dấu nháy kép. Chúng ta có thể truy cập tài liệu của bất kỳ module đã biên dịch nào trực tiếp từ IEx:  
```elixir
elixirc math.ex
iex
iex> h Math # Access the docs for the module Math
...
iex> h Math.sum # Access the docs for the sum function
...
```
Elixir có 1 công cụ là ExDoc dùng để tạo các trang HTML từ tài liệu.  

### As temporary storage (lưu trữ tạm thời)
Chúng ta đã thấy cách định nghĩa thuộc tính, nhưng làm thế nào chúng ta có thể đọc chúng? Xem ví dụ:  
```elixir
defmodule MyServer do
  @service URI.parse("https://example.com")
  IO.inspect(@service)
end
```
Nếu cố gắng truy cập vào 1 thuộc tính chưa được xác định sẽ in ra cảnh báo:  
```elixir
defmodule MyServer do
  @unknown
end
warning: undefined module attribute @unknown, please remove access to @unknown or explicitly set it before access
```
Thuộc tính chũng có thể được đọc bên trong các hàm:  
```elixir
defmodule MyApp.Status do
  @service URI.parse("https://example.com")
  def status(email) do
    SomeHttpClient.get(@service)
  end
end
```
Thuộc tính module được định nghĩa tại thời điểm biên dịch và giá trị trả về của nó, không phải lệnh gọi hàm, là thứ sẽ được thay thế cho thuộc tính. Vì vậy, đoạn mã trẹn sẽ biên dịch thành đoạn mã sau:  
```elixir
defmodule MyApp.Status do
  def status(email) do
    SomeHttpClient.get(%URI{
      authority: "example.com",
      host: "example.com",
      port: 443,
      scheme: "https"
    })
  end
end
```
Điều này có thể hữu ích cho việc tính toán trước các giá trị và sau đó đưa kết quả vào module. Đây chính là ý nghĩa của lưu trữ tạm thồi: sau khi module được biên dịch, thuộc tính module sẽ bị loại bỏ, ngoại trừ các hàm đã đọc thuộc tính attribute. Nếu bạn đọc cùng 1 thuộc tính nhiều lần bên trong nhiều hàm, bạn sẽ làm tăng thời gian biên dịch vì Elixir phải biên dịch mọi ảnh chụp nhanh giá trị của thuộc tính.  


### As compile-time constants
Thuộc tính module cũng có thể hữu ích như hằng số thời gian biên dịch. Nhưng bản thân các hàm đủ để đóng vai trò là hằng số trong cơ sở mã, Ví dụ thay vì định nghĩa `@hours_in_a_day 24` bạn nên ưu tiên `defp hours_in_a_day(), do: 24`, thậm chí có thể định nghĩa 1 hàm public nếu nó cần chia sẻ giữa các module.  

Các thuộc tính module rất hữu dụng trong module `ExUnit` với nhiều mục đích khác nhau:  
```elixir
defmodule MyTest do
  use ExUnit.Case, async: true

  @tag :external
  @tag os: :unix
  test "contacts external service" do
    # ...
  end
end
```


## Structs (Cấu trúc)
Struct là phần mở rộng được xây dựng trên map, cung cấp các giá trị mặc định và kiểm tra thời gian biên dịch compile-time.  

### Defining structs (định nghĩa cấu trúc)
Để định nghĩa cấu trúc struct ta dùng `defstruct/1`:  
```elixir
iex(1)> defmodule User do
...(1)> defstruct name: "John", age: 27
...(1)> end
{:module, User,
 <<70, 79, 82, 49, 0, 0, 8, 244, 66, 69, 65, 77, 65, 116, 85, 56, 0, 0, 0, 247,
   0, 0, 0, 22, 11, 69, 108, 105, 120, 105, 114, 46, 85, 115, 101, 114, 8, 95,
   95, 105, 110, 102, 111, 95, 95, 10, 97, ...>>, %User{name: "John", age: 27}}
```
Danh sách từ khóa sử dụng với `defstruct` xác định các trường fields cùng với giá trị mặc định của chúng. Struct lấy tên của module mà chúng được định nghĩa. Trong ví dụ trên, chúng ta đã định nghĩa 1 struct có tên là `User`.  
Bây giờ chúng ta có thể tạo Struct `User` bằng cú pháp tương tự với cú pháp được sử dụng để tạo map:  
```elixir
iex(2)> %User{}
%User{name: "John", age: 27}
iex(3)> %User{name: "Jane"}
%User{name: "Jane", age: 27}
```
Struct cung cấp đảm bảo tại thời điểm biên dịch rằng chỉ những trường fields được xác định thông qua defstruct mới được phép tồn tại trong struct:  


### Accessing and updating structs (Truy cập và cập nhật cấu trúc)
Struct có cùng cú pháp truy cập và cập nhật các trường field giống với map với khóa cố định:  
```elixir
iex(4)> john = %User{}
%User{name: "John", age: 27}
iex(5)> john.name 
"John"
iex(6)> jane = %{john | name: "Jane"}
%User{name: "Jane", age: 27}
iex(7)> %{jane | oops: :field}
** (KeyError) key :oops not found in: %User{name: "Jane", age: 27}
```
Khi sử dụng cú pháp cập nhật `|`, Elixir biết rằng không có khóa mới nào được thêm vào struct, cho phép map ở bên dưới chia sẻ cấu trúc của chúng trong bộ nhớ. Trong ví dụ trên cả john và jane đều chia sẻ cùng 1 cấu trúc khóa trong bộ nhớ.  

Struct cũng có thể sử dụng khớp mẫu pattern matching, để so khớp giá trị của các khóa cụ thể cũng như để đảm bảo rằng giá trị so khớp là 1 struct có cùng kiểu với giá trị được so khớp.  
```elixir
iex(7)> %User{name: name} = john 
%User{name: "John", age: 27}
iex(8)> name 
"John"
iex(9)> %User{} = %{}
** (MatchError) no match of right hand side value: %{}
```


### Structs are bare maps underneath (Cấu trúc là map trống ở bên dưới)
Struct chỉ đơn giản là map có trường đặc biệt là `__struct__` chứa tên của struct:  
```elixir
iex(9)> is_map(john)
true
iex(10)> john.__struct__
User
```
Tuy nhiên struct không kế thừa bất kỳ giao thức nào mà map thực hiện. Ví dụ, bạn không thể liệt kê hoặc truy cập 1 struct bằng:  
```elixir
iex(11)> john[:name]
** (UndefinedFunctionError) function User.fetch/2 is undefined (User does not implement the Access behaviour
iex(11)> Enum.each(john, fn {field, value} -> IO.puts(value) end)
** (Protocol.UndefinedError) protocol Enumerable not implemented for type User (a struct)
```
Struct cung cấp tính năng quan trọng nhất là: đa hình dữ liệu data polymorphism.  


### Default values and required keys (giá trị mặc định và khóa bắt buộc)
Nếu bạn không chỉ định key value mặc định khi định nghĩa struct, `nil` sẽ được gán mặc định:  
```elixir
iex(11)> defmodule Product do 
...(11)> defstruct [:name]
...(11)> end
{:module, Product,
 <<70, 79, 82, 49, 0, 0, 8, 208, 66, 69, 65, 77, 65, 116, 85, 56, 0, 0, 0, 250,
   0, 0, 0, 22, 14, 69, 108, 105, 120, 105, 114, 46, 80, 114, 111, 100, 117, 99,
   116, 8, 95, 95, 105, 110, 102, 111, 95, ...>>, %Product{name: nil}}
iex(12)> %Product{}
%Product{name: nil}
```
Bạn cũng có thể bắt buộc phải chỉ định 1 số khóa nhất định khi tạo struct thông qua thuộc tính module `@enforce_keys`:  
```elixir
iex(13)> defmodule Car do
...(13)> @enforce_keys [:make]
...(13)> defstruct [:model, :make]
...(13)> end
{:module, Car,
 <<70, 79, 82, 49, 0, 0, 11, 184, 66, 69, 65, 77, 65, 116, 85, 56, 0, 0, 1, 80,
   0, 0, 0, 31, 10, 69, 108, 105, 120, 105, 114, 46, 67, 97, 114, 8, 95, 95,
   105, 110, 102, 111, 95, 95, 10, 97, 116, ...>>, %Car{model: nil, make: nil}}
iex(14)> %Car{}
** (ArgumentError) the following keys must also be given when building struct Car: [:make]
    expanding struct: Car.__struct__/1
    iex:14: (file)
```
enforce_keys cung cấp 1 đảm bảo lúc biên dịch đơn giản để hỗ trợ các nhà phát triển khi xây dựng các struct. Nó không được thực thi trên các bản cập nhật và không cung cấp bất kỳ loại xác thực giá trị nào.  


## Protocols (giao thức)
Giao thức protocol là cơ chế để đạt được tính đa hình polymorphism trong Elixir, nơi bạn muốn hành vị thay đổi tùy theo kiểu dữ liệu. Chúng ta đã quen thuộc với các giải quyết vấn đề: thông qua việc khớp mẫu và các mệnh đề guard. Xem xét 1 module tiện ích đơn giản giúp chúng ta biết kiểu của biến đầu vào:  
```elixir
defmodule Utility do
  def type(value) when is_binary(value), do: "string"
  def type(value) when is_integer(value), do: "integer"
  # ... other implementations ...
end
```
Code này có thể gây ra vấn đề nếu nó được chia sẻ dưới dạng phụ thuộc dependency bởi nhiều ứng dụng vì sẽ không có cách dễ dàng nào để mở rộng chức năng của nó.  
Đây chính là lúc giao thức protocol có thể giúp chúng ta: giao thức protocol cho phép chúng ta mở rộng hành vi ban đầu cho nhiều kiểu dữ liệu tùy theo nhu cầu. Bởi vì việc phân phối 1 giao thức protocol có thể áp dụng cho bất kỳ kiểu dữ liệu nào đã triển khai giao thức và bất kỳ ai cũng có thể triển khai giao thức đó vào bất kỳ lúc nào.  
Sau đây là cách chúng ta có thể viết cùng 1 chức năng `Utility.type/1` dưới dạng 1 giao thức protocol:  
```elixir
defprotocol Utility do
  @spec type(t) :: String.t()
  def type(value)
end

defimpl Utility, for: BitString do
  def type(_value), do: "string"
end

defimpl Utility, for: Integer do
  def type(_value), do: "integer"
end
```
Chúng ta định nghĩa protocol bằng `defprotocol/2` các hàm và đặc tả có thể trông giống với các interface hoặc abstract lớp trừu tượng trong các ngôn ngữ khác. Chúng ta có thể thêm nhiều triển khai tùy thích bằng cách sử dụng `defimpl/2`. Đầu ra hoàn toàn giống nhau cứ như chúng ta có 1 module duy nhất với nhiều hàm:  
```elixir
iex> Utility.type("foo")
"string"
iex> Utility.type(123)
"integer"
```

Một trong những giao thức protocol phổ biến nhất mà bạn có thể gặp là giao thức `String.Chars`: triển khai hàm `to_string/1` cho các cấu trúc tùy ý của bạn sẽ nói cho hat nhân kernel Elixir biết các biểu diễn chúng dưới dạng chuỗi.  


### Example
Chúng ta có thể triển khai 1 protocol `Size` tổng quát cho tất cả các cấu trúc dữ liệu có kích thước được tính toán trước sẽ triển khai, như sau:  
```elixir
defprotocol Size do
  @doc "Calculates the size (and not the length!) of a data structure"
  def size(data)
end
```
Protocol `Size` mong đợi 1 hàm có tên là `size` nhận 1 đối số (cấu trúc dữ liệu mà chúng ta muốn biết kích thước) được triển khai. bây giờ chúng ta có thể triển khai giao thức protocol cho các cấu trúc dữ liệu có triển khai tuân thủ:  
```elixir
defimpl Size, for: BitString do
  def size(string), do: byte_size(string)
end

defimpl Size, for: Map do
  def size(map), do: map_size(map)
end

defimpl Size, for: Tuple do
  def size(tuple), do: tuple_size(tuple)
end
```
Chúng ta khôi triển khai protocol `Size` cho List vì không có thông tin "size" được tính toán trước cho list, và độ dài của list phải được tính toán với `length/1`. Bây giờ, với protocol đã được xác định và triển khai đang có, ta thử sử dụng:  
```elixir
iex> Size.size("foo")
3
iex> Size.size({:ok, "hello"})
2
iex> Size.size(%{label: "some label"})
1
```


### Protocols and structs (giao thức và cấu trúc)
Sức mạnh mở rộng của Elixir xuất hiện khi protocol và struct được sử dụng cùng với nhau.  
Chúng ta đã biết mặc dù struct là map nhưng chúng không chia sẻ các triển khai giao thức với map. Ví dụ, `MapSet` (set dựa trên map) được triển khai dưới dạng struct. hãy thử sử dụng giao thức `Size` với `MapSet`:  
```elixir
iex> Size.size(%{})
0
iex> set = %MapSet{} = MapSet.new
MapSet.new([])
iex> Size.size(set)
** (Protocol.UndefinedError) protocol Size not implemented for MapSet.new([]) of type MapSet (a struct)
```

Thay vì chi sẻ triển khai giao thức protocol với map, struct yêu cầu giao thức riêng của chúng. Vì `MapSet` có kích thước được tính toàn trước và có thể truy cập thông qua `MapSet.size/1`, chúng ta có thể định nghĩa triển khai `Size` cho nó:  
```elixir
defimpl Size, for: MapSet do
  def size(set), do: MapSet.size(set)
end
```
Nếu muốn, bạn có thể đưa ra ngữ nghĩa riêng cho kích thước của struct.  
```elixir
defmodule User do
  defstruct [:name, :age]
end

defimpl Size, for: User do
  def size(_user), do: 2
end
```


### Implementing Any
Việc triển khai thủ công các giao thức protocol cho mọi loại có thể nhanh chóng trở nên lặp lại và nhàm chán. Trong trường hợp này, Elixir cung cấp 2 tùy chọn: chúng ta có thể dẫn suất derive cách triển khai giao thức protocol 1 cách rõ ràng cho các kiểu của mình hoặc tự động triển khai giao thức protocol cho tất cả các kiểu. Trong cả 2 trường hợp, chúng ta cần triển khai giao thức protocol cho `Any`.  

### Deriving (dẫn xuất)
Elixir cho phép chúng ta tạo ra 1 triển khai giao thức protocol dựa trên triển khai `Any`. Trước tiên triển khai `Any` như sau:  
```elixir
defimpl Size, for: Any do
  def size(_), do: 0
end
```
Có thể nói rằng việc triển khai ở trên không hợp lý. Ví dụ, không có ý nghĩa gì khi nói rằng kích thướng của `PID` hoặc `Integer` là 0.  

Tuy nhiên, để làm việc tốt với `Any` chúng ta cần phải yêu cầu struct dẫn xuất giao thức protocol `Size` tường minh:  
```elixir
defmodule OtherUser do
  @derive [Size]
  defstruct [:name, :age]
end
```
Khi dẫn xuất, Elixir sẽ triển khai giao thức `Size` cho `OtherUser` dựa trên triển khai được cung cấp cho `Any`.  


### Fallback to Any (Quay lại Any)
Một giải pháp thay thế khác cho `@derive` là yêu cầu rõ ràng giao thức chuyển sang fallback `Any` khi không tìm thấy triển khai. Điều này có thể đạt được bằng cách đặt `@fallback_to_any` thành `true` trong định nghĩa giao thức protocol:  
```elixir
defprotocol Size do
  @fallback_to_any true
  def size(data)
end
```
Vì việc triển khai `Size` cho `Any` không phải là việc có thể áp dụng cho bất kỳ dữ liệu nào, cho nên `@fallback_to_any` là 1 hành vi tùy chọn. Đối với phần lớn giao thức protocol, việc đưa ra lỗi khi 1 giao thức không được triển khai là hành vi phù hợp. Với triển khai `Any` như vầy:  
```elixir
defimpl Size, for: Any do
  def size(_), do: 0
end
```
thì tất cả các kiểu dữ liệu nào, bao gồm struct, mà chưa triển khai giao thức `Size` sẽ được coi là có kích thước 0.  


### Built-in protocols (giao thức tích hợp)
Elixir đi kèm với một số giao thức tích hợp build-in protocol. Ví dụ module `Enum` cung cấp nhiều hàm hoạt động với bất kỳ cấu trúc dữ liệu nào triển khai giao thức `Enumerable`:  
```elixir
iex> Enum.map([1, 2, 3], fn x -> x * 2 end)
[2, 4, 6]
iex> Enum.reduce(1..3, 0, fn x, acc -> x + acc end)
6
```

Một ví dụ hữu ích khác là giao thức `String.Chars`, giao thức này chỉ định các chuyển đổi cấu trúc dữ liệu thành dạng biểu diễn thân thiện dưới dạng chuỗi. Giao thức này được thể hiện qua hàm `to_string`:  
```elixir
iex> to_string(:hello)
"hello"
```

Lưu ý rằng nội suy chuỗi trong Elixir gọi hàm `to_string`:  
```elixir
iex> "age: #{25}"
"age: 25"
```
Đoạn mã trên hoạt động vì number có thực thi giao thức `String.Chars`, còn nếu truyền 1 tuple thì sẽ dẫn đến lỗi.  
```elixir
iex> tuple = {1, 2, 3}
{1, 2, 3}
iex> "tuple: #{tuple}"
** (Protocol.UndefinedError) protocol String.Chars not implemented for {1, 2, 3} of type Tuple
```

Khi cần in 1 cấu trúc dữ liệu phức tạp hơn, người ta có thể sử dụng hàm `inspect` dựa trên giao thức `Inspect`:  
```elixir
iex> "tuple: #{inspect(tuple)}"
"tuple: {1, 2, 3}"
```

Giao thức `Inspect` là giao thức được sử dụng để chuyển đổi bất kỳ cấu trúc dữ liệu nào thành dạng văn bản có thể đọc được. Đây là những gì mà công cụ IEx sử dụng để in kết quả:  
```elixir
iex> {1, 2, 3}
{1, 2, 3}
iex> %User{}
%User{name: "john", age: 27}
```

Nhớ rằng, thoe quy ước, bất cứ khi nào giá trị được kiểm tra (inspected) bắt đầu bằng `#`, nó sẽ biểu diễn 1 cấu trúc dữ liệu theo cú pháp Elixir không hợp lệ. Điều này có nghĩa là giao thức inspect không thể đảo ngược vì thông tin có thể bị mất trong quá trình thực hiện:  
```elixir
iex> inspect &(&1+2)
"#Function<6.71889879/1 in :erl_eval.expr/5>"
```


## Comprehensions (nhận thức)
Trong Elixir, việc lặp qua 1 `Enumerable` là phổ biến, thường lọc ra 1 số kết quả và ánh xạ giá trị vào 1 danh sách khác. Comprehensions là 1 cú pháp hoàn hảo cho những cấu trúc như vậy: Chúng nhóm những nhiệm vụ chung đó thành dạng đặt biệt của `for`:  
Ví dụ, chúng ta có thể ánh xạ 1 danh sách các số nguyên thành các giá trị bình phương của chúng:  
```elixir
iex(1)> for n <- [1, 2, 3, 4], do: n * n 
[1, 4, 9, 16]
```
Comprehensions được tạo thành từ 3 phần: bộ sinh generator, bộ lọc filter, và collectables.  


### Generators and filters (bộ tạo và bộ lọc)
Trong biểu thức trên, `n <- [1, 2, 3, 4]` là bộ tạo generator. Bất kỳ enumerable nào cũng có thể thể được truyền vào phía bên phải của biểu thức bộ tạo generator:  
```elixir
iex(2)> for n <- 1..4, do: n * n
[1, 4, 9, 16]
```

Biểu thức bộ tạo cũng hỗ trợ việc khớp mẫu ở phía bên trái của chúng; tất cả các mẫu không khớp đều bị bỏ qua. Ví dụ, chúng ta có 1 danh sách từ khóa trong đó có khóa atom `:good` và `:bad`, và chúng ta chỉ muốn tính bình phương các giá trị của khóa `:good`:  
```elixir
iex(3)> values = [good: 1, good: 2, bad: 3, good: 4]
[good: 1, good: 2, bad: 3, good: 4]
iex(4)> for {:good, n} <- values, do: n * n
[1, 4, 16]
```

Ngoài việc khớp mẫu, bộ lọc có thể được sử dụng để chọn 1 số phần tử cụ thể. Ví dụ, chúng ta có thể chọn bội số của 3 và loại bỏ tất cả các phần tử khác:  
```elixir
iex(5)> for n <- 0..5, rem(n, 3) == 0, do: n * n
[0, 9]
```

Comprehensions sẽ loại bỏ tất cả các phần tử mà biểu thức lọc trả về giá trị `false` hoặc `nil`; tất cả các giá trị khác đều được chọn.  

Comprehensions thường cung cấp cách biểu diễn ngắn gọn hơn nhiều so với việc sử dụng các hàm tương đương từ các module `Enum` và `Stream`. Hơn nữa, Comprehensions cũng cho phép nhiều bộ tạo và bộ lọc được đưa ra. Sau đây là 1 ví dụ nhận được danh sách các thư mục là lấy kích thước của từng tệp trong các thư mục đó:  
```elixir
dirs = ["/home/mikey", "/home/james"]

for dir <- dirs,
    file <- File.ls!(dir),
    path = Path.join(dir, file),
    File.regular?(path) do
  File.stat!(path).size
end
```

Nhiều bộ tạo cũng có thể được sử dụng để tính tích Descartes của 2 danh sách:  
```elixir
iex(6)> for i <- [:a, :b, :c], j <- [1, 2], do: {i, j}
[a: 1, a: 2, b: 1, b: 2, c: 1, c: 2]
```

Cuối cùng, hãy nhớ rằng các phép gán biến bên trong phạm vi Comprehensions, dù là trong bộ tạo, bộ lọc hay bên trong khối code, đều không được phản ánh ra bên ngoài Comprehensions.


### Bitstring generators (bộ tạo Bitstring)
Bộ tạo Bitstring cũng được hỗ trợ và rất hữu ích khi bạn cần comprehend trên nhiều luồng bitstrings. Ví dụ bên dưới nhận 1 danh sách các điểm ảnh từ 1 binary với các giá trị đỏ, xanh lá cây và xanh lam tương ứng và chuyển đổi chúng thành các bộ tuple gồm 3 phần tử:  
```elixir
iex(7)> pixels = <<213, 45, 132, 64, 76, 32, 76, 0, 0, 234, 32, 15>>
<<213, 45, 132, 64, 76, 32, 76, 0, 0, 234, 32, 15>>
iex(8)> for <<r::8, g::8, b::8 <- pixels>>, do: {r, g, b}
[{213, 45, 132}, {64, 76, 32}, {76, 0, 0}, {234, 32, 15}]
```
Bộ tạo bitstring có thể được kết hợp với các bộ tạo enumerable "thông thường", và cũng hỗ trợ bộ lọc.  


### The :into option (tùy chọn :into)
Trong các ví dụ trên, tất cả các comprehension đều trả về danh sách dưới dạng kết quả của chúng. Tuy nhiên, kết quả của comprehension có thể được chèn vào các cấu trúc dữ liệu khác nhau bằng cách truyền tùy chọn `:into` vào comprehension.  
Vì dụ, bộ tạo bitstring có thể được sử dụng với tùy chọn `:into` để dễ dàng xóa tất cả các khoảng trắng trong chuỗi:  
```elixir
iex(9)> for <<c <- " hello world ">>, c != ?\s, into: "", do: <<c>>
"helloworld"
```

Sets, map và các dictionaries khác cũng có thể được đưa vào tùy chọn `:into`. Nhìn chung, `:into` chập nhận bất kỳ cấu trúc dữ liệu nào triển khai giao thức `Collectable` protocol.  
Một trường hợp sử dụng phổ biến của `:into` có thể là chuyển đổi các giá trị trong map:  
```elixir
iex(10)> for {key, val} <- %{"a" => 1, "b" => 2}, into: %{}, do: {key, val * val}
%{"a" => 1, "b" => 4}
```

Một ví dụ khác sử dụng stream. Module `IO` cung cấp stream (cả `Enumerable` và `Collectable`) một thiết bị đầu cuối echo phản hồi lại phiên bản viết hoa của bất kỳ kiểu dữ liệu nào được nhập, có thể được triển khai bằng cách sử dụng các comprehension:  
```elixir
iex> stream = IO.stream(:stdio, :line)
iex> for line <- stream, into: stream do
...>   String.upcase(line) <> "\n"
...> end
```

### Other options
Comprehensions hỗ trợ các tùy chọn khác, chẳng hạn như: `:reduce` và `:uniq`. Có thể tìm hiểu thêm về comprehensions theo các link sau:  
- [`for` official reference in Elixir documentation](https://hexdocs.pm/elixir/Kernel.SpecialForms.html#for/1)
- [Mitchell Hanberg's comprehensive guide to Elixir's comprehensions](https://www.mitchellhanberg.com/the-comprehensive-guide-to-elixirs-for-comprehension/)


## Sigils (dấu ấn)
Một trong những mục tiêu của Elixir là khả năng mở rộng: các nhà phát triển phải có khả năng mở rộng ngôn ngữ để phù hợp với bất kỳ lĩnh vực cụ thể nào. Dấu ấn sigils cung cấp nền tảng cho việc mở rộng ngôn ngữ với các cách biểu diễn văn bản tùy chính. Dấu ấn sigils bắt đầu bằng ký tự `~` theo sau là 1 chữ cái thường hoặc 1 hay nhiều chữ cái viết hoa, sau đó là 1 dấu phân cách delimiter. Các sửa đổi tùy chọn được thêm vào sau dấu phân cách cuối cùng. Ví dụ: `~c"hello world"`.  


## Regular expressions (biểu thức chính quy)
Dấu ấn sigils phổ biến nhất trong Elixir là `~r` được sử dụng để tạo biểu thức chính quy regular expressions:  
```elixir
iex(1)> regex = ~r/foo|bar/
~r/foo|bar/
iex(2)> "foo" =~ regex 
true
iex(3)> "bat" =~ regex
false
```

Elixir cung cấp các biểu thức chính quy tương thích với Perl (regexe), được triển khai bởi thư viện PCRE. Regexe cũng hỗ trợ các trình sửa đổi. Ví dụ, trình sửa đổi `i` làm cho 1 biểu thức chính quy không phân biệt chữ hoa chữ thường:  
```elixir
iex(4)> "HELLO" =~ ~r/hello/
false
iex(5)> "HELLO" =~ ~r/hello/i
true
```

Sigils hỗ trợ 8 dấu phân cách khác nhau:  
```elixir
~r/hello/
~r|hello|
~r"hello"
~r'hello'
~r(hello)
~r[hello]
~r{hello}
~r<hello>
```
Lý do đằng sau việc hỗ trợ các dấu phân cách khác nhau là để cung cấp 1 cách để viết các ký tự mà không cần dấu phân cách thoát. Ví dụ, 1 biểu thức chính quy với dấu gạch chép như `~r(^http?://)` có thể đọc tốt hơn `~r/^http?:\/\//`. Tương tự như vậy, nếu biểu thức chính quy có dấu gạch chéo và bắt giữ nhóm capturing groups (sử dụng`()`), thì bạn có thể chọn dấu nháy kép thay cho dấu ngoặc đơn.  


## Strings, charlists, and word lists sigils (Chuỗi, charlist và danh sách từ sigils)
Bên cạnh biểu thức chính quy, Elixir còn đi kèm với 3 dấu ấn sigils khác.  

### Strings
Dấu ấn `~s` được sử dụng để tạo chuỗi, giống như dấu nháy kép. Dấu ấn `~s` hữu ích khi chuỗi chưa dấu nháy kép:  
```elixir
iex(1)> ~s(this is a string with "double" quotes, not 'single' ones)
"this is a string with \"double\" quotes, not 'single' ones"
```


### Charlists
Dấu ấn `~c` là cách thông thường để biểu thị charlist.  
```elixir
iex(2)> [?c, ?a, ?t]
~c"cat"
iex(3)> ~c(this is a char list containing "double quotes")
~c"this is a char list containing \"double quotes\""
```

### Word lists
Dấu ấn `~w` được sử dụng để tạo danh sách các từ (các từ chỉ là các chuỗi thông thường). Bên trong dấu `~w`, các từ được phân tách bằng khoảng trắng.  
```elixir
iex(4)> ~w(foo bar bat)
["foo", "bar", "bat"]
```
Dấu `~w` cũng chấp nhận các ký tự sửa đổi `c`, `s` và `a` (lần lượt cho charlist, strings và atom), chỉ định kiểu dữ liệu của các phần tử trong danh sách kết quả:  
```elixir
iex(5)> ~w(foo bar bat)a
[:foo, :bar, :bat]
```


## Interpolation and escaping in string sigils (Nội suy và thoát khỏi các dấu ấn chuỗi)
Elixir hỗ trợ 1 số biến thể dấu ấn sigil để xử lý các ký tự thoát và nội suy. Đặc biệt, dấu ấn sigil chữ in hoa không thực hiện nội suy hoặc thoát. Ví dụ, mặc dù cá `~s` và `~S` đều trả về chuỗi, nhưng chuỗi trước cho phép mã thoát và nội suy trong khi chuỗi sau thì không:  
```elixir
iex(6)> ~s(String with escape codes \x26 #{"inter" <> "polation"})
"String with escape codes & interpolation"
iex(7)> ~S(String without escape codes \x26 without #{interpolation})
"String without escape codes \\x26 without \#{interpolation}"
```
Các mã thoát sau đây có thể được sử dụng trong chuỗi string và charlist:  
- `\\`: dấu gạch chéo ngược đơn single backslash
- `\a`: chuông / báo động bell/alert
- `\b`: phím xóa lùi <- Back
- `\d`: phím xóa delete
- `\e`: phím thoát escape
- `\f`: form feed
- `\n`: xuống dòng newline
- `\r`: carriage return
- `\s`: khoảng trắng space
- `\t`: tab
- `\v`: tab dọc vertical tab
- `\0`: null byte
- `\xDD`: biểu diễn 1 byte đơn trong hệ thập lục phân, ví dụ `\x13`
- `\uDDDD` và `\u{D...}`: biểu diễn 1 điển mã Unicode codepoint ở dạng thập lục phân, ví dụ `\u{1F600}`

Ngoài ra, dấu nháy kép bên trong bên trong chuỗi được đặt trong nháy kép cần được thoát bằng `\"`, và tương tự như vậy với dấu nháy đơn là `\'`. Tuy nhiên, tốt hơn hết là nên thay đổi các dấu phân cách như đã nói ở trên thay vì thoát escape chúng.  
Dấu ấn sigil cũng hỗ trợ heredocs, tức là 3 dấu nháy kép hoặc nháy đơn làm dấu phân cách:  
```elixir
iex> ~s"""
...> this is
...> a heredoc string
...> """
```

Nếu heredoc có sử dụng nhiều dấu nháy kép và nháy đơn thì đây là giải pháp tốt để viết:  
```elixir
@doc ~S"""
Converts double-quotes to single-quotes.

## Examples

    iex> convert("\"foo\"")
    "'foo'"

"""
def convert(...)
```


## Calendar sigils (Dấu ấn lịch)
Elixir cung cấp nhiều dấu ấn để giải quyết nhiều loại thời gian time và ngày tháng date khác nhau.  

### Date (ngày tháng)
Cấu trúc `%Date{}` struct chứa nhiều trương `year`, `month`, `day`, và `calendar`. Bạn có thể tạo 1 cấu trúc bằng cách sử dụng dấu ấn `~D`:  
```elixir
iex(8)> d = ~D[2019-10-31]
~D[2019-10-31]
iex(9)> d.day
31
```

### Time
Cấu trúc `%Time{}` struct chứa các trường `hour`, `minute`, `second`, `microsecond`, và `calendar`. Bạn có thể tạo cấu trúc bằng dấu ấn `~T`:  
```elixir
iex(10)> t = ~T[23:00:07.0]
~T[23:00:07.0]
iex(11)> t.second
7
```

### NaiveDateTime (Ngày giờ ngây thơ)
Cấu trúc `%NaiveDateTime{}` struct chứa các trường cả `Date` và `Time`. Bạn có thể tạo bằng dấu ấn `~N`:  
```elixir
iex(12)> ndt = ~N[2019-10-31 23:00:07]
~N[2019-10-31 23:00:07]
```
Tại sao gọi là ngây thơ? Vì nó không chứa thông tin múi giờ timezone. Do đó, ngày giờ cụ thể có thể không tồn tại hoặc có thể tồn tại 2 lần trong 1 số múi giờ nhất định, ví dụ chúng ta chỉnh đồng hồ lùi lại và tiến lên.  


## UTC DateTime
Cấu trúc `%DateTime{}` struct chứa các trường giống như `NaiveDateTime` với việc bổ dung các trường để theo dõi múi giờ timezone. Dấu ấn `~U` cho phép ta tạo DateTime theo múi giờ UTC:  
```elixir
iex(13)> dt = ~U[2019-10-31 19:59:03Z]
~U[2019-10-31 19:59:03Z]
iex(14)> %DateTime{minute: minute, time_zone: time_zone} = dt
~U[2019-10-31 19:59:03Z]
iex(15)> minute 
59
iex(16)> time_zone 
"Etc/UTC"
```


## Custom sigils (Dấu ấn tùy chỉnh)
Dấu ấn sigil trong Elixir có thể mở rộng. Trên thực tế, sử dụng sigil `~r/foo/i` tương đương với việc gọi `sigil_r` với 1 binary và 1 charlist làm đối số:  
```elixir
iex(17)> sigil_r(<<"foo">>, [?i])
~r/foo/i
```
Chúng ta có thể truy cập tài liệu về sigil `~r` thông qua `sigil_r`:  
```elixir
iex(18)> h sigil_r
...
```
Chúng ta cũng có thể cung cấp sigil của riêng mình bằng cách triển khai các hàm theo mẫu `sigil_{character}`. Ví dụ, cùng triển khai sigil `~i` trả về 1 số nguyên (với bộ điều chỉnh tùy chọn `n` để làm cho nó âm):  
```elixir
iex> defmodule MySigils do
...>   def sigil_i(string, []), do: String.to_integer(string)
...>   def sigil_i(string, [?n]), do: -String.to_integer(string)
...> end
iex> import MySigils
iex> ~i(13)
13
iex> ~i(42)n
-42
```
Dấu ấn sigil tùy chỉnh có thể là 1 ký tự thường hoặc 1 ký tự viết hoa theo sau là nhiều ký tự viết hoa và chữ số.  

Dấu ấn sigil cũng có thể được sử dụng để thực hiện công việc tại lúc biên dịch với sự trợ giúp của macro. Ví dụ, biểu thức chính quy trong Elixir được biên dịch thành 1 biểu diễn hiệu quả trong quá trình biên dịch mã nguồn, do đó bỏ qua bước này khi chạy. Nếu bạn quan tâm đến chủ đề này, bạn có thể tìm hiểu thêm về macro và xem cách sigil được triển khai trong module `Kernel`, nơi các hàm `sigil_*` được định nghĩa.  


## try, catch, and rescue (Thử, bắt và giải cứu)
Elixir có 3 cơ chế lỗi: lỗi errors, ném throws, và thoát exits.  

### Errors
Errors (hoặc ngoại lệ exceptions) được sử dụng khi những điều bất thường xảy ra trong mã. Một ví dụ lỗi có thể tạo ra bằng cách công thêm 1 số vào atom:  
```elixir
iex(1)> :foo + 1
** (ArithmeticError) bad argument in arithmetic expression: :foo + 1
    :erlang.+(:foo, 1)
    iex:1: (file)
```

Một lỗi trong thời gian chạy có thể xảy ra bất cứ lúc nào bằng cách sử dụng `raise/1`:  
```basg
iex(1)> raise "oops"
** (RuntimeError) oops
    iex:1: (file)
```

Có thể đưa ra 1 lỗi khác bằng lệnh `raise/2` truyền tên lỗi và danh sách các đối số từ khóa:  
```elixir
iex(1)> raise ArgumentError, message: "invalid argument foo"
** (ArgumentError) invalid argument foo
    iex:1: (file)
```

bạn cũng có thể tự định nghĩa mỗi của mình bằng cách tạo 1 module và sử dụng cấu trúc `defexception/1` bên trong module đó. Theo cách này bạn sẽ tạo ra 1 lỗi có tên giống với tên của module mà lỗi được định nghĩa. Trường hợp phổ biến nhất là định nghĩa 1 ngoại lệ tùy chỉnh với trường field thông báo message:  
```elixir
iex(1)> defmodule MyError do
...(1)>   defexception message: "default message"
...(1)> end
{:module, MyError,
 <<70, 79, 82, 49, 0, 0, 12, 68, 66, 69, 65, 77, 65, 116, 85, 56, 0, 0, 1, 77,
   0, 0, 0, 30, 14, 69, 108, 105, 120, 105, 114, 46, 77, 121, 69, 114, 114, 111,
   114, 8, 95, 95, 105, 110, 102, 111, 95, ...>>, :ok}
iex(2)> raise MyError 
** (MyError) default message
    iex:2: (file)
iex(2)> raise MyError, message: "custom message"
** (MyError) custom message
    iex:2: (file)
```

Error có thể được khắc phục bằng cách sử dụng cấu trúc `try/rescue`:  
```elixir
iex(2)> try do
...(2)>   raise "oops"
...(2)> rescue
...(2)>   e in RuntimeError -> e
...(2)> end
%RuntimeError{message: "oops"}
```
Ví dụ trên giải quyết Error thời gian chạy và trả về một ngoại lệ của chính nó, sau đó được in trong `iex`.  
Nếu bạn không có nhu cầu sử dụng ngoại lệ exception, bạn không cần phải truyền biến để để giải cứu `rescue`:  
```elixir
iex(2)> try do
...(2)>   raise "oops"
...(2)> rescue
...(2)>   RuntimeError -> "Error!"
...(2)> end
"Error!"
```

Trong thực tế, các nhà phát triển Elixir hiếm khi sử dụng cầu trúc `try/rescue`. Ví dụ nhiều ngôn ngữ sẽ buộc bạn phải rescue lỗi khi không thể mở file thành công. Thay vào đó, Elixir cung cấp hàm `File.read/1` trả về 1 bộ tuple chứa thông về việc file có được mở thành công hay không:  
```elixir
iex> File.read("hello")
{:error, :enoent}
iex> File.write("hello", "world")
:ok
iex> File.read("hello")
{:ok, "world"}
```

Không có `try/rescue` ở đây. Trong trường hợp bạn muốn xử lý nhiều kết quả khi 1 file, bạn có thể sử dụng khớp mẫu bằng cách sử dụng cấu trúc `case`:  
```elixir
iex> case File.read("hello") do
...>   {:ok, body} -> IO.puts("Success: #{body}")
...>   {:error, reason} -> IO.puts("Error: #{reason}")
...> end
```
Đối với những trường hợp bạn mong đợi 1 file tồn tại (và việc thiếp file đó thực sự là 1 lỗi), bạn có thể sử dụng `File.read!/1`:  
```elixir
iex> File.read!("unknown")
** (File.Error) could not read file "unknown": no such file or directory
    (elixir) lib/file.ex:272: File.read!/1
```
Cuối cùng, chính ứng dụng của bạn sẽ quyết định xem lỗi mở file có phải là lỗi ngoại lệ hay không. Đó là lý do vì sao Elixir không áp đặt ngoại lệ cho `File.read/1` và nhiều hàm khác. Thay vào đó, nó để nhà phát triển tự chọn cách tốt nhất để tiến hành.  

Nhiều hàm trong thư viện chuẩn tuân tho mô hình có 1 đối tác tạo ra ngoại lệ thay vì trả về các bộ tuple để khớp. Quy ước là tạo 1 hàm (`foo`) trả về các bộ `{:ok, resurl}` hoặc `{:error, reason}` và 1 hàm khác (`foo!` cùng tên nhưng có thêm ký tự theo sau `!`) có cùng đối số với `foo` nhưng sẽ phát sinh ngoại lệ nếu có lỗi. `foo!` sẽ trả về kết quả (không được gói trong 1 tuple) nếu mọi thứ diễn ra tốt đẹp. Module `File` là 1 ví dụ điển hình về quy ước này.  


### Fail fast / Let it crash (thất bại nhanh chóng / hãy để nó sụp đổ)
1 câu nói phổ biến trong cộng đồng Erlang, cũng như Elixir, là "thất nại nhanh chóng" / "hãy để nó sụp đổ". Ý tưởng đằng sau việc cho nó sụp đổ là trong trường hợp có điều gì bất ngờ xảy ra, tốt nhất là để ngoại lệ xẩy ra mà không cần cứu nó.  

Điều quan trọng là phải nhấn mạnh từ bất ngờ. Ví dụ, tưởng tượng bạn đang xây dựng 1 tập lệnh để xử lý file. Tập lệnh của bạn nhận tên file làm đầu vào. Người dùng có thể mắc lỗi và cung cấp tên file không xác định. Trong trường hợp này, mặc dù bạn có thể sử dụng `File.read!/1` để đọc file và để nó sập trong trường hợp tên file không hợp lệ, nhưng có lẽ sẽ hợp lý hơn khi sử dụng `File.read/1` và cung cấp cho người dùng 1 tập lệnh của bạn phản hồi rõ ràng và chính xác về lỗi xảy ra.  


### Reraise
Mặc dù chúng ta thường tránh sử dụng `try/rescue` trong Elixir, 1 tính huống mà chúng ta có thể muốn sử dụng các cấu trúc như vậy là để quan sát/giám sát (Observabilitty/monitoring). Hãy tưởng tượng bạn muốn ghi lại rằng có điều gì đó không ổn, bạn có thể làm:  
```elixir
try do
  ... some code ...
rescue
  e ->
    Logger.error(Exception.format(:error, e, __STACKTRACE__))
    reraise e, __STACKTRACE__
end
```
Trong ví dụ trên, chúng ta đã giải cứu ngoại lệ, ghi lại ngoại lệ và sau đó nêu lại re-raised. Chúng ta sử dụng cấu trúc `__STACKTRACE__` khi định dạng ngoại lệ và nêu lại. Điều này đảm bảo chúng ta sẽ đưa lại ngoại lệ như hiện tại mà không thay đổi giá trị hoặc nguồn gốc của nó.  

Nói chung, chúng ta hiểu lỗi trong Elixir theo nghĩa đen: chúng dành cho những tình huống bất ngờ và/hoặc ngoại lệ, không bao giờ dùng để kiểm soát luồng mã của chúng ta. Trong trường hợp bạn thực sự cần các cấu trúc kiểm soát luồng, hãy sử dụng `throws`. Đó là những gì chúng ta sẽ thấy tiếp theo.  


### Throws (ném)
Trong Elixir, 1 giá trị có thể được ném ra và sau đó đuôc bắt lại. `throw` và `catch` được dành riêng cho những tình huống không thể lấy lại giá trị trừ khi sử dụng `throw` và `catch`.
Những tình huống đó khá hiếm gặp trong thực tế, trừ khi tiếp với các thư viện không cung cấp API phù hợp. Ví dụ, tưởng tượng module `Enum` không cung cấp bất kỳ API nào để tìm giá trị và chúng ta cần tìm bội số đầu tiên của 13 trong danh sách các số:  
```elixir
try do
  Enum.each(-50..50, fn x ->
    if rem(x, 13) == 0, do: throw(x)
  end)
  "Got nothing"
catch
  x -> "Got #{x}"
end
"Got -39"
```
Từ khi `Enum` cung cấp API phù hợp nêu trên, trong thực tế `Enum.find/2` là giải pháp phù hợp:  
```elixir
Enum.find(-50..50, &(rem(&1, 13) == 0))
-39
```


### Exits (thoát)
Tất cả mã của Elixir chạy bên trong các tiến trình giao tiếp với nhau. Khi 1 tiến trình chết vì nguyên nhân tự nhiên (ví dụ ngoại lệ chưa được xử lý), nó sẽ gửi tín hiệu thoát. Một tiến trình cũng có thể chết bằng cách gửi rõ ràng tín hiệu thoát `exit`:  
```elixir
spawn_link(fn -> exit(1) end)
** (EXIT from #PID<0.56.0>) shell process exited with reason: 1
```
Trong ví dụ trên, tiến trình được liên kết đã chết bằng cách gửi tín hiệu thoát `exit` có giá trị là 1. Elixir shell sẽ tự động xử lý những thông báo đó và in chúng ra thiết bị đầu cuối.  
`exit` cũng có thể được bắt bằng cách sử dụng `try/catch`:  
```elixir
try do
  exit("I am exiting")
catch
  :exit, _ -> "not really"
end
"not really"
```

`catch` cũng có thể được sử dụng trong thân hàm mà không cần try tương ứng.  
```elixir
defmodule Example do
  def matched_catch do
    exit(:timeout)
  catch
    :exit, :timeout ->
      {:error, :timeout}
  end

  def mismatched_catch do
    exit(:timeout)
  catch
    # Since no clause matches, this catch will have no effect
    :exit, :explosion ->
      {:error, :explosion}
  end
end
```

Tuy nhiên, việc sử dụng `try/catch` đã không còn phổ biến và việc sử dụng nó để bắt `exit` còn hiếm hơn.  
Tín hiệu thoát `exit` là 1 phần quan trọng của hệ thống chịu lỗi do Erlang VM cung cấp. Các tiến trình thường chạy dưới cây giám sát supervision tree, bản thân chúng là các tiến trình lắng nghe tín hiệu thoát `exit` từ các tiến trình được giám sát. Khi nhận được tín hiệu thoát `exit`, chiến lược giám sát sẽ được kích hoạt và quá trình bị giám sát sẽ được khởi động lại.  
Chính hệ thống giám sát này khiến cho các cấu trúc như `try/catch` và `try/rescue` trở nên không phổ biến trong Elixir. Thay vì cứu rỗi, chúng ta thà "thất bại nhanh chóng" vì cây giám sát sẽ đảm bảo ừng dụng của chúng ta sẽ trở lại trạng thái ban đầu đã biết sau khi xảy ra lỗi.  


### After
Đôi khi cần phải đảm bảo dọn sạch tài nguyên sau 1 số hành động có khả năng gây ra lỗi. Cấu trúc `try/after` cho phép bạn làm điều đó. Ví dụ, chúng ta có thể mở 1 file và sử dụng mệnh đề `after` để đóng file đó - kể cả khi có sự cố xảy ra:  
```elixir
{:ok, file} = File.open("sample", [:utf8, :write])
try do
  IO.write(file, "olá")
  raise "oops, something went wrong"
after
  File.close(file)
end
** (RuntimeError) oops, something went wrong
```
Mệnh đề `after` sẽ được thực thi bất kể khối lệnh `try` có thành công hay không. Tuy nhiên, lưu ý rằng nếu 1 tiến trình được liên kết thoát `exit`, tiến trình này sẽ thoát và mệnh đề `after` sẽ không được chạy. Do đó, `after` chỉ cung cấp 1 đảm bảo mềm. May mắn thay, các file trong Elixir cũng được liên kết với các tiến trình hiện tại và do đó chúng sẽ luôn được đóng nếu tiến trình hiện tại bị sập, không phụ thuộc vào mệnh đề `after`. bạn sẽ thấy điều tương tự cũng đúng với các tài nguyên khác như bảng ETS, socket, ports và v.v.  

Đôi khi bạn có thể muốn bao bọc toàn bộ phần thân của 1 hàm trong 1 cấu trúc `try`, thường là để đảm bảo 1 số mã sẽ được thực thi sau đó. Trong những trường hợp như vậy, Elixir cho phép bạn bỏ qua dòng `try`:  
```elixir
defmodule RunAfter do
  def without_even_trying do
    raise "oops"
  after
    IO.puts("cleaning up!")
  end
end
RunAfter.without_even_trying
cleaning up!
** (RuntimeError) oops
```
Elixir sẽ tự động gói phần thân hàm trong mệnh đề `try` bất cứ khi nào 1 trong các lệnh `after`, `rescue` hoặc `catch` được chỉ định. Khối `after` xử lý các hiệu ứng phụ và không thay đổi giá trị trả về từ các mệnh đề phía trên nó.  


### Else
Nếu có 1 khối `else`, nó sẽ khớp với kết quả của khối `try` bất cứ khi nào khối `try` kết thúc mà không có lệnh `throw` hoặc `error`.  
```elixir
x = 2
2
try do
  1 / x
rescue
  ArithmeticError ->
    :infinity
else
  y when y < 1 and y > -1 ->
    :small
  _ ->
    :large
end
:small
```
Ngoại lệ trong khối `else` không được bắt. Nếu không có mẫu nào bên trong khối `else` khớp, ngoại lệ sẽ được đưa ra; ngoại lệ này không được bắt bởi khối `try/catch/rescue/after` hiện tại.  


## Variables scope (tầm vực biến)
Tương tự như `case`, `cond`, `if` và các cấu trúc khác trong Elixir, các biến được định nghĩa bên trong các khối `try/catch/rescue/after` không bị rò rỉ ra ngữ cảnh bên ngoài. Nói cách khác, mã này không hợp lệ:  
```elixir
try do
  raise "fail"
  what_happened = :did_not_raise
rescue
  _ -> what_happened = :rescued
end
what_happened
** (CompileError) undefined variable "what_happened"
```
Thay vào đó, bạn nên trả về giá trị của biểu thức `try`:  
```elixir
what_happened =
  try do
    raise "fail"
    :did_not_raise
  rescue
    _ -> :rescued
  end
what_happened
:rescued
```

Hơn nữa, các biến được định nghĩa trong khối do-block của `try` cũng không có sẵn trong `rescue/after/else`. Điều này là do khối `try` có thể lỗi bất cứ lúc nào và do đó các biến có thể chưa bao giờ được liên kết ngay từ đầu. Vì vậy, điều này cũng không hợp lệ:  
```elixir
try do
  raise "fail"
  another_what_happened = :did_not_raise
rescue
  _ -> another_what_happened
end
** (CompileError) undefined variable "another_what_happened"
```

Như vậy có thể thấy `try`,`catch` và `rescue` trong Elixir ít được sử dụng hơn so với các ngôn ngữ khác.  


## Writing documentation (viết tài liệu)

### Markdown
Tài liệu Elixir được viết bằng Markdown.  

### Module Attributes (thuộc tính module)
Tài liệu trong Elixir thường được đính kèm vào các thuộc tính của module. Xem ví dụ:  

```elixir
defmodule MyApp.Hello do
  @moduledoc """
  This is the Hello module.
  """
  @moduledoc since: "1.0.0"

  @doc """
  Says hello to the given `name`.

  Returns `:ok`.

  ## Examples

      iex> MyApp.Hello.world(:john)
      :ok

  """
  @doc since: "1.3.0"
  def world(name) do
    IO.puts("hello #{name}")
  end
end
```
Thuộc tính `@moduledoc` được sử dụng để thêm tài liệu vào module. `@doc` được sử dụng trước 1 hàm để cung cấp tài liệu cho hàm đó. Bên cạnh các thuộc tính trên, `@typedoc` cũng có thể được sử dụng để đính kèm tài liệu vào các kiểu được xác định là 1 phần của typespec.  


### Function arguments (đối số hàm)
Khi ghi tài liệu cho hàm, tên đối số được trình biên dịch suy ra. Ví dụ:  
```elixir
def size(%{size: size}) do
  size
end
```
Trình biên dịch sẽ suy ra đối số này dưới dạng `map`. Đôi khi suy luận sẽ không tối ưu, đặ biệt nếu hàm chứa nhiều mệnh đề với đối số khớp với các giá trị mỗi lần khác nhau. Bạn có thể chỉ định tên thích hợp cho tài liệu bằng cách khai báo hàm head tại bất kỳ thời điểm nào trước khi triển khai:  
```elixir
def size(map_with_size)

def size(%{size: size}) do
  size
end
```

### Documentation metadata (tài liệu siêu dữ liệu)
Một số siêu dữ liệu metadata thường dùng là `:since` chú thích phiên bản mà module, function, type, hoặc callback được thêm vào. Một loại khác là `:deprecated` đưa ra cảnh báo trong tài liệu rằng việc sử dụng này không được khuyến khích.  


### Recommendations (khuyến nghị)
Khi viết tài liệu:
- Giữ d9aon5 văn đầu tiên của tài liệu ngắn gọn và đơn giản, thường là 1 dòng. Các công cụ như `ExDoc` sử dụng dòng đầu tiên để tạo bản tóm tắt.  
- Tham chiếu các module theo tên đầy đủ của chúng. Markdown sử dụng dấu nháy (\`) để trích dẫn code. Elixir dựa trên nó để tự động tạo liên kết khi tên module hoặc hàm được tham chiếu. Vì lý do này, hãy luôn sử dụng tên đầy đủ. Nếu bạn có 1 module là `MyApp.Hello` thì luôn tham chiếu nó là `MyApp.Hello` chứ đừng bao giờ là `Hello`.  
- Tham chiếu các hàm theo tên và số lượng arity nếu chúng là hàm cục bộ, như `world/1` hoặc theo module, tên và số lượng arity nếu trỏ đến 1 module bên ngoài: `MyApp.Hello.world/1`.  
- Tham chiếu `@callback` bằng cách thêm `c:` như: `c:world/1`.  
- Tham chiếu đến `@type` bằng cách thêm `:t` vào trước, như: `t:value/0`.  
- Bắt đầu phần mới với tiêu đề Markdown cấp độ hai ##. Tiêu đề cấp độ 1 được dành riêng cho tên Module và hàm.
- Đặt tài liệu trước mệnh đề đầu tiên của các hàm nhiều mệnh đề. Tài liệu luôn theo từng hàm và số lượng arity chứ không phải theo từng mệnh đề.  
- Sử dụng khóa `:since` trong siêu dữ liệu metadate tài liệu để chú thích bất cứ khi nào có hàm hoặc module mới được thêm vào API của bạn.  


### Doctests (tài liệu kiểm tra)
Khuyến khích các nhà phát triển nên đưa các ví dụ vào tài liệu, thường nằm trong tiêu đề ## Example. Để đảm bảo các ví dụ không bị lỗi thời, khung thử nghiệm của Elixir (ExUnit) cung cấp 1 tính năng gọi là doctest cho phép các nhà phát triển thử nghiệm các ví dụ trong tài liệu của họ. Doctest hoạt động bằng cách phân tích các mẫu mã bắt đầu bằng `iex>` từ tài liệu.  


### Documentation != Code comments (Tài liệu != bình luận mã)
Tài liệu là hợp đồng với người dùng API của bạn, những người không nhất thiết phải có quyền truy cập vào mã nguồn, trong khi chú thích mã dành cho những người tương tác trực tiếp với mã nguồn. Bạn có thể tìm hiểu và diễn đạt những đảm bảo khác nhau về phần mềm của mình bằng cách tách biệt 2 khái niệm đó.  


### Hiding internal modules and functions (ẩn các module và hãm bên trong)
Elixir cho phép các nhà phát triển ẩn các module và hàm khỏi tài liệu bằng cách đặt `@doc false` để ẩn 1 hàm cụ thể hoặc `@moduledoc false`  để ẩn toàn bộ module.  
```elixir
defmodule MyApp.Hidden do
  @moduledoc false

  @doc """
  This function won't be listed in docs.
  """
  def function_that_wont_be_listed_in_docs do
    # ...
  end
end
```
Trong trường hợp bạn không muốn ẩn toàn bộ module, bạn có thể ẩn từng hàm riêng lẻ:  
```elixir
defmodule MyApp.Sample do
  @doc false
  def add(a, b), do: a + b
end
```
Lưu ý rằng `@moduledoc false` hoặc `@doc false` không làm cho hàm trở thành riêng tư. Hàm trên vẫn có thể được gọi như: `MyApp.Sample.add(1, 2)`. 


### Code.fetch_docs/1
Elixir lưu trữ tài lie7u5 bên trong các khối được xác định trước trong bytecode. Tài liệu không được tải vào bộ nhớ khi các module được tải, thay vào đó nó có thể được đọc từ từ bytecode trong ổ đĩa bằng hàm `Code.fecth_docs/1`. Nhược điểm là các module được xác định trong bộ nhớ, như các module được xác định trong IEx, không thể truy cập tài liệu của chúng vì chúng không ghi mã bytecode vào ổ đĩa.  


## Optional syntax sheet (bảng cú pháp tùy chọn)
Elixir cho phép các nhà phát triển bỏ qua các dấu phân cách trong 1 số trường hợp để làm cho mã dễ đọc hơn, ví dụ dấu ngoặc đơn là tùy chọn:  
```elixir
iex> length([1, 2, 3]) == length [1, 2, 3]
true
```

và khối `do-end` tương đương với danh sách từ khóa keyword lists:  
```elixir
# do-end blocks
iex> if true do
...>   :this
...> else
...>   :that
...> end
:this

# keyword lists
iex> if true, do: :this, else: :that
:this
```
Danh sách từ khóa sử dụng ký hiệu thông thường của Elixir để phân tách dad1 đối số, trong đó chúng ta phân tách từng cặp key-value bằng dấu phẩy và mỗi khóa được theo sau bởi `:`. Trong khối `do` chúng ta loại bỏ dấu hai chấm, dấu phẩy và phân tách mỗi từ khóa bằng 1 dòng mới. 


### Walk-through (hướng dẫn)
Xem đoạn mã sau:  
```elixir
if variable? do
  Call.this()
else
  Call.that()
end
```
Bây giờ chúng ta hãy loại bỏ từng quy ước một:  
1. Khối `do-end` tương đương với từ khóa:  
```elixir
if variable?, do: Call.this(), else: Call.that()
```
2. Danh sách từ khóa là đối số cuối cùng không yêu cầu dấu ngoặc vuông, nhưng chúng ta hãy thêm chúng:  
```elixir
if variable?, [do: Call.this(), else: Call.that()]
```
3. Danh sách từ khóa giống như danh sách các cặp 2 phần tử:  
```elixir
if variable?, [{:do, Call.this()}, {:else, Call.that()}]
```
4. Cuối cùng, dấu ngoặc đơn là tùy chọn khi gọi hàm, nhưng chúng ta hãy thêm chúng vào:  
```elixir
if(variable?, [{:do, Call.this()}, {:else, Call.that()}])
```
Bốn quy tắc này phác thảo cú pháp tùy chọn có trong Elixir.  

Để hiểu tại sao những quy tác này lại quan trọng, chúng ta có thể so sánh ngắn gọn Elixir với các ngôn ngữ lập trình khác. Hầu hết các ngôn ngữ lập trình đều có 1 số từ khóa để định nghĩa phương thức, hàm, điều kiện, vòng lặp, v.v. Mỗi từ khóa đó đều có các quy tắc cú pháp riêng kèm theo.  

Tuy nhiên, trong Elixir, không có tính năng ngôn ngữ nào trong số này yêu cầu "từ khóa" đặc biệt, thay vào đó, tất cả đều được xây dựng từ tập hợp quy tắc nhỏ này. Lợi ích khác là các nhà phát triển cũng có thể mở rộng ngôn ngữ theo cách phù hợp với chính ngôn ngữ đó, vì các cấu trúc để thiết kế và mở rộng ngôn ngữ là giống nhau.  

Cuối cùng, những quy tắc đó cho phép chúng ta viết:  
```elixir
defmodule Math do
  def add(a, b) do
    a + b
  end
end
```
thay vì:  
```elixir
defmodule(Math, [
  {:do, def(add(a, b), [{:do, a + b}])}
])
```

Nếu bạn lo lắng về việc áp dụng các quy tắc này thì trình định dạng Elixir sẽ xử lý những lo ngại này. Hầu hết các nhà phát triển Elixir sử dụng tác vụ `mix format` để định dạng cơ sở mã của họ theo 1 bộ quy tắc được nhóm Elixir và cộng đồng xác định rõ ràng. Ví dụ, `mix format` sẽ luôn thêm dấu ngoặc đơn vào lệnh gọi hàm trừ khi được cấu hình rõ ràng là không làm như vậy. Điều này giúp duy trì tính nhất quán trên tất cả các cơ sở mã trong các tổ chức và cộng đồng rộng lớn hơn.  


## Erlang libraries (Thư viện Erlang)
Elixir cung cấp khả năng tương tác tuyệt vời với các thư viện Erlang. Trên thực tế, Elixir không khuyến khích việc chỉ đóng gói các thư viện Erlang mà thay vào đó là giao tiếp trực tiếp với mã Erlang.  
Các module Erlang có quy ước đặt tên khác với Elixir và bắt đầu bằng chữ thường. Trong cả 2 trường hợp, tên module là các atom và chúng ta gọi các hàm bằng cách phân phối đến tên module:  
```elixir
iex> is_atom(String)
true
iex> String.first("hello")
"h"
iex> is_atom(:binary)
true
iex> :binary.first("hello")
104
```

Chúng ta sẽ làm quen với 1 số hàm Erlang phổ biến và hữu ích nhất không có trong Elixir.  


### The binary module (module nhị phân)
Module `String` trong Elixir xử lý binary được mã hóa UTF-8. Module `:binary` hữu ích khi bạn xử lý dữ liệu nhị phân không nhất thiết được mã hóa UTF-8.  
```elixir
iex> String.to_charlist("Ø")
[216]
iex> :binary.bin_to_list("Ø")
[195, 152]
```
Ví dụ trên cho thấy sự khác biệt, module `String` trả về các điểm mã Unicode, trong khi `:binary` xử lý các byte dữ liệu thô.  


### Formatted text output (Định dạng văn bản đầu ra)
Elixir không chứa hàm tương tự như `printf` có trong C và các ngôn ngữ khác. May thay, các hàm thư viện chuẩn Erlang có `:io.format/2` và `:io_lib.format/2` có thể được sử dụng. Định dạng đầu tiên cho đầu ra thiết bị đầu cuối terminal, trong khi định dạng thứ 2 cho `iolist`.  
```elixir
iex> :io.format("Pi is approximately given by:~10.3f~n", [:math.pi])
Pi is approximately given by:     3.142
:ok
iex> to_string(:io_lib.format("Pi is approximately given by:~10.3f~n", [:math.pi]))
"Pi is approximately given by:     3.142\n"
```

### The crypto module (Module mật mã)
Module `:crypto` chứa các hàm băm, chữ ký số, mã hóa và nhiều tính năng khác:  
```elixir
iex> Base.encode16(:crypto.hash(:sha256, "Elixir"))
"3315715A7A3AD57428298676C5AE465DADA38D951BDFAC9348A8A31E9C7401CB"
```
Module `:crypto` là 1 phần của ứng dụng `:crypto` đi kèm với Erlang. Điều này có nghĩa là bạn phải liệt kê ứng fung5 `:crypto` như 1 ứng dụng bổ sung trong cấu hình dự án của bạn. Để thực hiện việc này, hãy chỉnh sửa file `mix.exs` của bạn như sau:  
```elixir
def application do
  [extra_applications: [:crypto]]
end
```
Bất kỳ module nào không phải là 1 phần của ứng dụng Erlang `:kernel` hoặc `:stdlib` đều phải có ứng dụng được liệt kê rõ ràng trong `mix.exs` của bạn. Bạn có thể tìm thấy tên ứng dụng của bất kỳ module Erlang nào trong tài liệu Erlang.  


### The digraph module (module digraph)
Các module `:digraph` và `:digraph_utils` chứa các hàm để xử lý đồ thị có hướng được xây dựng từ các đỉnh và cạnh. Sau khi xây dựng đồ thị, các thuật toán trong đó sẽ giúp tìm ra đường đi ngắn nhất giữa 2 đỉnh hoặc các chu trình trong đồ thị.  

Cho 3 đỉnh, hãy tìm đường đi ngắn nhất từ đỉnh đầu tiên đến đỉnh cuối cùng.
```elixir
iex> digraph = :digraph.new()
iex> coords = [{0.0, 0.0}, {1.0, 0.0}, {1.0, 1.0}]
iex> [v0, v1, v2] = (for c <- coords, do: :digraph.add_vertex(digraph, c))
iex> :digraph.add_edge(digraph, v0, v1)
iex> :digraph.add_edge(digraph, v1, v2)
iex> :digraph.get_short_path(digraph, v0, v2)
[{0.0, 0.0}, {1.0, 0.0}, {1.0, 1.0}]
```
Chú ý rằng các hàm trong `:digraph` thay đổi cấu trúc đồ thị tại chỗ, điều này có thể thực hiện được vì chúng được triển khai dưới dạng bảng ETS, sẽ được giải thích ở phần sau.  


### Erlang Term Storage (Lưu trữ thuật ngữ Erlang)
Các module `:ets` và `:dets` xử lý việc lưu trữ các cấu trúc dữ liệu lớn trong bộ nhớ hoặc trên ổ đĩa.  

ETS cho phép bạn tạo 1 bảng chứa các tuple. Theo mặc định, các bảng ETS được bảo vệ, nghĩa là chỉ có tiến trình sở hữu mới có thể ghi vào bảng nhưng bất kỳ tiến trình nào khác đều có thể đọc. ETS có 1 số chức năng cho phép sử dụng bảng như 1 cơ sở dữ liệu đơn giản, kho lưu trữ key-value hoặc như 1 cơ chế bộ nhớ đệm.  

Các hàm trong module `ets` sẽ sửa đổi trạng thái của bảng như 1 tác dụng phụ.  
```elixir
iex> table = :ets.new(:ets_test, [])
# Store as tuples with {name, population}
iex> :ets.insert(table, {"China", 1_374_000_000})
iex> :ets.insert(table, {"India", 1_284_000_000})
iex> :ets.insert(table, {"USA", 322_000_000})
iex> :ets.i(table)
<1   > {<<"India">>,1284000000}
<2   > {<<"USA">>,322000000}
<3   > {<<"China">>,1374000000}
```


### The math module (module toán học)
Module `:math` chứa các phép toán phổ biến bao gồm các hàm lượng giác, hàm mũ và hàm logarit.  
```elixir
iex> angle_45_deg = :math.pi() * 45.0 / 180.0
iex> :math.sin(angle_45_deg)
0.7071067811865475
iex> :math.exp(55.0)
7.694785265142018e23
iex> :math.log(7.694785265142018e23)
55.0
```


### The queue module (module hàng đợi)
Module `:queue` cung cấp 1 cấu trúc dữ liệu thực hiện hàng đợi FIFO (vào trước ra trước) hai đầu 1 cách hiệu quả:  
```elixir
iex> q = :queue.new
iex> q = :queue.in("A", q)
iex> q = :queue.in("B", q)
iex> {value, q} = :queue.out(q)
iex> value
{:value, "A"}
iex> {value, q} = :queue.out(q)
iex> value
{:value, "B"}
iex> {value, q} = :queue.out(q)
iex> value
:empty
```


### The rand module
`:rand` có các hàm trả về giá trị ngẫu nhiên và thiết lập hạt giống ngẫu nhiên.  
```elixir
iex> :rand.uniform()
0.8175669086010815
iex> _ = :rand.seed(:exs1024, {123, 123534, 345345})
iex> :rand.uniform()
0.5820506340260994
iex> :rand.uniform(6)
6
```


### The zip and zlib modules
Module `:zip` cho phép bạn đọc và ghi các file ZIP vào và ra khỏi ổ đĩa hoặc bộ nhớ, cũng như trích xuất thông tin file. mã này đếm số lượng file trong file ZIP.  
```elixir
iex> :zip.foldl(fn _, _, _, acc -> acc + 1 end, 0, :binary.bin_to_list("file.zip"))
{:ok, 633}
```

Module `:zlib` xử lý việc nén dữ liệu theo định dạng zlib, như được tìm thấy trong tiện ích dòng lệnh gzip trong hệ thống Unix.  
```elixir
iex> song = "
...> Mary had a little lamb,
...> His fleece was white as snow,
...> And everywhere that Mary went,
...> The lamb was sure to go."
iex> compressed = :zlib.compress(song)
iex> byte_size(song)
110
iex> byte_size(compressed)
99
iex> :zlib.uncompress(compressed)
"\nMary had a little lamb,\nHis fleece was white as snow,\nAnd everywhere that Mary went,\nThe lamb was sure to go."
```


## Debugging (gỡ lỗi)
Có 1 số cách phổ biến để gỡ lỗi trong Elixir.  

### IO.inspect/2
Điều khiến `IO.inspect(item, otps \\[])` thực sự hữu ích trong việc gỡ lỗi là nó trả về đối số `item` được truyền vào mà không ảnh hưởng đến hành vi của mã gốc. Ví dụ:  
```elixir
(1..10)
|> IO.inspect()
|> Enum.map(fn x -> x * 2 end)
|> IO.inspect()
|> Enum.sum()
|> IO.inspect()
```
In ra:  
```elixir
1..10
[2, 4, 6, 8, 10, 12, 14, 16, 18, 20]
110
```
Như bạn thấy, `IO.inspect/2` cho phép "theo dõi spy" các giá trị ở hầu hết mọi nơi trong mã của bạn mà không làm thay đổi kết quả, khiến nó trở nên rất hữu ích trong 1 đường ống như trong trường hợp trên.  

`IO.inspect/2` cũng cung cấp khả năng trang trí đầu ra bằng tùy chọn nhãn `label`. Nhãn sẽ được in trước mục được kiểm tra:  
```elixir
[1, 2, 3]
|> IO.inspect(label: "before")
|> Enum.map(&(&1 * 2))
|> IO.inspect(label: "after")
|> Enum.sum
```
In ra:  
```elixir
before: [1, 2, 3]
after: [2, 4, 6]
```

Ngoài ra, `IO.inspect/2` với `binding/0` cũng rất phổ biến, hàm này trả về tất cả tên biến và giá trị của chúng:  
```elixir
def some_fun(a, b, c) do
  IO.inspect(binding())
  ...
end
```
Khi `some_fun/3` được gọi với `:foo`, `:bar`, `:baz` nó sẽ in ra:  
```elixir
[a: :foo, b: "bar", c: :baz]
```
Xem [IO.inspect/2](https://hexdocs.pm/elixir/IO.html#inspect/2) và [Inspect.Opts](https://hexdocs.pm/elixir/Inspect.Opts.html) để tìm hiểu thêm về chức năng này và đọc về tất cả các tùy chọn được hỗ trợ.  


### dbg/2
Elixir v1.14 giới thiệu `dbg/2`. `dbg` tương tự như `IO.inspect/2` nhưng được thiết kế riêng cho việc gỡ lỗi. Nó in giá trị được truyền vào và trả về (giống như `IO.inspect/2`) nhưng nó cũng in mã và vị trí.  
```elixir
# In my_file.exs
feature = %{name: :dbg, inspiration: "Rust"}
dbg(feature)
dbg(Map.put(feature, :in_version, "1.14.0"))
```
Đoạn mã trên in ra nội dung sau:  
```elixir
[my_file.exs:2: (file)]
feature #=> %{inspiration: "Rust", name: :dbg}
[my_file.exs:3: (file)]
Map.put(feature, :in_version, "1.14.0") #=> %{in_version: "1.14.0", inspiration: "Rust", name: :dbg}

```
Khi nói về `IO.inspect/2` chúng ta đã đề cập đến tính hữu ích của nó khi được đặt giữa các bước của |> pipeline. `dbg` làm tốt hơn: nó hiểu mã Elixir, do đó nó sẽ in ra giá trị ở mọi bước của pipeline.  
```elixir
[dbg_pipes.exs:5: (file)]
__ENV__.file #=> "/home/myuser/dbg_pipes.exs"
|> String.split("/", trim: true) #=> ["home", "myuser", "dbg_pipes.exs"]
|> List.last() #=> "dbg_pipes.exs"
|> File.exists?() #=> true
```
Trong khi `dbg` cung cấp các tiện ích xung quanh cấu trúc Elixir, bạn sẽ cần `IEx` nếu muốn thực thi mã và đặt điểm dừng trong khi gỡ lỗi.  


### Pry (tò mò)
Khi sử dụng `IEx`, bạn có thể truyền `--dbg pry` làm tùy chọn để "dừng" việc thực thi mã tại nơi có lệnh gọi dbg:  
```elixir
iex --dbg pry
```
Hoặc để gỡ lỗi bên trong 1 dự án:  
```elixir
iex --dbg pry -S mix
```

Bây giờ bất kỳ lệnh gọi nào đến `dbg` sẽ hỏi bạn có muốn pry mã hiện tại hay không. Nếu bạn chấp nhận, bạn sẽ có thể truy cập tất cả các biến, cũng như các mục nhập và bí danh từ code, trực tiếp từ IEx. Điều này được gọi là "prying". Trong khi phiên spy đang chạy, việc thực thi mã dừng lại, cho đến khi `continue` (hoặc `c`) hoặc `next` (hoặc `n`) được gọi. Hãy nhớ rằng bạn luôn có thể chạy `iex` trong ngữ cảnh của 1 dự án với `iex -S mix TASK`.  


### Breakpoints (điểm ngắt)
Các lệnh gọi `dbg` yêu cầu chúng ta phải thay đổi mã mà chúng ta muốn gỡ lỗi và chức năng từng bước hạn chế. May thay, IEx cũng cung cấp hàm `IEx.break!/2` cho phép bạn thiết lập và quản lý điểm dừng trên bất kỳ mã Elixir nào mà không cần sửa đổi mã nguồn của nó:  

Tương tự như `dbg` khi đạt đến điểm dừng quá trình thực thi mã sẽ dừng lại cho đến khi `continue` (hoặc `c`) hoặc `next` (hoặc `n`) được gọi. Theo mặc định, điểm dừng có thể điều hướng từng dòng, tuy nhiên, chúng không có quyền truy cập vào các bí danh và import khi điểm dừng được đặt trên các module đã biên dịch.  

Nhiệm vụ `mix test` tích hợp trực tiếp với các điểm dừng thông qua cờ `-b / --breakpoints`. Khi cờ được sử dụng, 1 điểm dừng được đặt ở đầu mỗi bài kiểm tra sẽ chạy:  

Sau đây là 1 số lệnh bạn có thể sử dụng trong thực tế:  
```elixir
# Debug all failed tests
iex -S mix test --breakpoints --failed
# Debug the test at the given file:line
iex -S mix test -b path/to/file:line

```


### Observer (người quan sát)
Để gỡ lỗi các hệ thống phức tạp, việc nhảy vào mã là không đủ. Cần phải hiểu toàn bộ máy ảo, tiến trình, ứng dụng cũng như thiết lập cơ chế theo dõi. May thay, điều này có thể thực hiện được trong Erlang với `:observer`. Trong ứng dụng của bạn:  
```elixir
$ iex
:observer.start()
```
Phần trên sẽ mở ra 1 giao diện người dùng đồ họa khác cung cấp nhiều khung để hiểu và điều hướng đầy đủ theo thời gian chạy và dự án của bạn.  

Nếu bạn sử dụng nền tảng web Phoenix, nó sẽ đi kèm với Phoenix LiveDashboard, 1 bảng điều khiển web dành cho ác node sản xuất production cung cấp các tính năng tương tự như Observer.  

Cuối cùng, bạn có thể có được cái nhìn tồng quan về thông tin thời gian chạy bằng cách gọi trực tiếp `runtime_info/0` trong IEx.  


###  Other tools and community (Các công cụ và cộng đồng khác)
Chúng ta mới chỉ khám phá sơ qua những gì Erlang VM có thể cung cấp, ví dụ:  
- Cùng với quan sát ứng dụng, Erlang cũng bao gồm `:crashdump_viewer` để xem bản dump sự cố.  
- Tích hợp với các trình theo dõi cấp hệ điểu hành, chẳng hạn như [Linux Trace Toolkit](https://www.erlang.org/doc/apps/runtime_tools/lttng), [DTRACE](https://www.erlang.org/doc/apps/runtime_tools/dtrace) và [SystemTap](https://www.erlang.org/doc/apps/runtime_tools/systemtap)  
- [Microstate accounting](http://www.erlang.org/doc/man/msacc.html) đo lường thời gian chạy cho 1 số tác vụ cấp thấp trong 1 khoảng thời gian ngắn.  
- Mix ships với nhiều tác vụ trong namespace `profile`, chẳng hạn như `mix profile.cprof` và `mix profile.fprof`.  
- Đối với các trường hợp sử dụng nâng cao hơn, bạn nên đọc sách [Erlang in Anger](https://www.erlang-in-anger.com/) rất tuyệt vời, có sẵn dưới dạng sách điện tử miễn phí.  



# Introduction to Mix

## Our first project
Để tạo project đầu tiên tên `kv` với module tên `KV` ta dùng lệnh:  
```elixir
mix new kv --module KV
```

Để biên dịch dự án:  
```elixir
cd kv
mix compile
```

Chạy dự án với tương tác bằng shel:  
```elixir
iex -S mix
```

Bạn có thể biên dịch lại mã nguồn bất cứ khi nào có sự thay đổi code với iex bằng lệnh `recomple`:  
```elixir
iex(1)> recompile()
Compiling 1 file (.ex)
:ok
iex(2)> recompile()
:noop
```

## Running tests
Một số thứ cần lưu ý với test:  
- 1. File test là tập lệnh Elixir (.exs) điều này rất tiện lợi vì chúng ta không cần phải biên dịch các file test trước khi chạy chúng.
- 2. Chúng ta định nghĩa 1 nodule test tên `KVTest` trong đó chúng ta sử dụng `ExUnit.Case` để đưa API thử nghiệm vào.  
- 3. Chúng ta sử dụng 1 trong các macro `ExUnit.DocTest.doctest/1` để chỉ ra rằng module KV chứa doctest.
- 4. Chúng ta sử dụng macro `ExUnit.test/2` để xác định 1 bài kiểm đơn giản.

Mix cũng tạo ra 1 file có tên `test/test_helper.exs` có nhiệm vụ thiết lập khung thử nghiệm: `ExUnit.start()`. File này sẽ d8uo7c5 Mix yêu cầu mỗi lần trước khi chúng ta chạy thử nghiệm.  

Chúng ta có thể chạy test với lệnh:  
```elixir
$ mix test
Compiling 1 file (.ex)
Generated kv app
Running ExUnit with seed: 229451, max_cases: 32

..
Finished in 0.01 seconds (0.00s async, 0.01s sync)
1 doctest, 1 test, 0 failures
```

Chúng ta có thể chạy 1 thử ngiệm duy nhất bằng:  
```elixir
mix test test/kv_test.exs:5
```


## Automatic code formatting (Định dạng mã tự động)
1 File được tạo ra bởi `mix new` là `.formatter.exs`. Elixir đi kèm với 1 trình định dạng mã có khã năng tự động định dạng cơ sở mã theo 1 phong cách nhất quán.  
Để định dạng mã code ta chạy lệnh: `mix format`  


## Environments (Môi trường)
Mix cung cấp khái niệm môi trường. Chúng cho phép nhà phát triển tùy chỉnh biên dịch và các tùy chọn khác cho các tình huống cụ thể. Theo mặc định, Mix hiểu 3 môi trường:  
- `:dev` nơi mà các tác vụ Mix (như biên dịch) chạy theo mặc định.
- `:test` được sử dụng bởi `mix test`
- `:prod` cái bạn sẽ sử dụng để chạy dự án của mình trong quá trình sản xuất.

Mix mặc định là môi trường `:dev`, ngoại trừ tác vụ `test` sẽ mặc định là môi trường `:test`. Môi trường có thể thay đổi thông qua biến môi trường `MIX_ENV`:  
```bash
MIX_ENV = prod mix compile
```
Trên Windows:  
```bash
set "MIX_ENV=prod" && mix compile
```

Mix là 1 công cụ xây dựng build và do đó, nó không được mong đợi sẽ có sẵn trong production. Do đó, bạn chỉ nên truy cập `Mix.env/0` trong các file cấu hình configuration và bên trong `mix.exs`, không bao giờ truy cập trong mã của ứng dụng (lib).  


## Exploring (khám phá)
Bạn luôn có thể gọi tác vụ trợ giúp để liệt kê tất cả các tác vụ khả dụng:  
```bash
mix help
mix help compile
```


## Simple state management with agents (Quản lý trạng thái đơn giản với các tác nhân agent)

- Agent là các wrapper đơn giản xung quanh trạng thái.
- GenServer "Genericservers" (tiến trình processes) đóng gói trạng thái, cung cấp cá lệnh gọi đồng bộ và bất đồng bộ, hỗ trợ tải lại mã, v.v.
- Task các đơn vị tính toán bất đồng bộ cho phép tạo ra 1 tiến trình và có khả năng truy xuất kết quả của quy trình đó sau này.





