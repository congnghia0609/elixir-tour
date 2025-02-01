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
Để thực hiện phép chia trả về số integer và phần dư của phép chia thì dùng hàm `div` và `rem`  
Khi gọi hàm function có thể bỏ qua dấu ngoặc đơn, nhưng khuyến khích để dấu ngoặc cho dễ đọc code hơn.  
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
`nil` là để chỉ sự vắng mặt 1 giá trị.  
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

## Atoms
atom là 1 hằng số mà giá trị chính là tên riêng của nó. Các ngôn ngữ khác gọi là symbol. Chúng thường hữu ích để liệt kê các giá trị riêng biệt.  
```bash
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
```bash
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
```bash
iex(10)> "Chào"
"Chào"
iex(11)> "Chào" <> " thế giới!"
"Chào thế giới!"
```
Nối chuỗi bằng phương pháp nội suy, hỗ trợ bất kỳ dữ liệu nào có thể chuyển đổi thành chuỗi:  
```bash
iex(12)> number = 42 
42
iex(13)> "i am #{number} years old"
"i am 42 years old"
```
Chuỗi có thể xuống dòng trong dấu nháy kép `""`, hoặc dùng ký tự xuống dòng `\n`  
```bash
iex(14)> "hello
...(14)> world"
"hello\nworld"
iex(15)> "hello\nworld"
"hello\nworld"
```

Có thể in chuỗi bằng `IO.puts()` và trả về atom `:ok` sau khi in.  
```bash
iex(16)> IO.puts("hello\nworld")
hello
world
:ok
```

Chuỗi trong Elixir được biểu diễn nội bộ bằng các chuỗi byte nhị phân liền kề:  
```bash
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
```bash
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
```bash
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
```bash
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
```bash
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
```bash
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
```bash
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
```bash
iex(6)> String.split("hello beautiful world")
["hello", "beautiful", "world"]
iex(7)> String.split_at("hello world", 3)
{"hel", "lo world"}
```

Tuple thường kết hợp với atom để tạo thành "tagged tuples" để trả về kết quả thành công hay thất bại.  
```bash
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
```bash
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
```bash
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
```bash
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
```bash
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
```bash
iex> list = [1, 2, 3]
[1, 2, 3]
iex> [0 | list]
[0, 1, 2, 3]
```
Việc khớp mẫu cũng giúp dễ dàng phân rã cấu trúc các kiểu dữ liệu tuple và list, ứng dụng vào đệ quy trong Elixir và với các cấu trúc như maps và binaries.  

### The pin operator (toán tử ghim)
Sử dụng toán tử ghim `^` để khớp mẫu với giá trị hiện tại của biến thay vì liên kết lại biến.  
```bash
iex> x = 1
1
iex> ^x = 2
** (MatchError) no match of right hand side value: 2
```
Vì chúng ta đã ghim x khi nó được liên kết với giá trị 1, nên nó sẽ tương đương với biểu thức sau:  
```bash
iex> 1 = 2
** (MatchError) no match of right hand side value: 2
```

Chúng ta có thể sử dụng toán tử ghim bên trong khớp mẫu tuple hoặc list:  
```bash 
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
```bash
iex> [head | _] = [1, 2, 3]
[1, 2, 3]
iex> head
1
```

## Control flow: case, cond, and if
### case
`case` cho phép chúng ta so sánh 1 giá trị với nhiều mẫu cho đến khi tìm thấy giá trị phù hợp:  
```bash
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
```bash
iex(2)> x = 1 
1
iex(3)> case 10 do 
...(3)> ^x -> "Won't match"
...(3)> _ -> "Will match"
...(3)> end
"Will match"
```

Mệnh đề cũng cho phép các điều kiện bổ sung như:  
```bash
iex(4)> case {1, 2, 3} do 
...(4)> {1, x, 3} when x > 0 -> "Will match"
...(4)> _ -> "Would match, if guard condition were not satisfied"
...(4)> end
"Will match"
```

### if
`if` là một macro trong Elixir, Cú pháp:  
```bash
iex(5)> if nil do 
...(5)> "This won't be seen"
...(5)> else 
...(5)> "This will"
...(5)> end
"This will"
```

Nếu bất kỳ biến hay cấu trúc nào được khai báo hoặc thay đổi bên trong `if`, `case` thì việc khai báo và thay đổi sẽ chỉ có hiệu lực bên trong phạm vi của `if`, `case` thôi, ví dụ:  
```bash
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
```bash
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
```bash
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
```bash
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
```bash
iex(7)> double = fn a -> add.(a, a) end 
#Function<42.18682967/1 in :erl_eval.expr/6>
iex(8)> double.(2)
4
```
Một biến được gán trong hàm không ảnh hưởng đến bên ngoài.  
```bash
iex(9)> x = 42
42
iex(10)> (fn -> x = 0 end).()
0
iex(11)> x
42
```

### Clauses and guards (mệnh đề và lính canh)
Tương tự như `case/2` chúng ta có thể khớp mẫu trên các đối số của các hàm ẩn danh cũng như định nghĩa nhiều mệnh đề và lính canh.  
```bash
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
```bash
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
```bash
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
```bash
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
```bash
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
```bash
iex(5)> string  = "chào"
"chào"
iex(6)> String.length(string)
4
iex(7)> byte_size(string)
5
```
Chuỗi `chào` có 4 ký tự và sử dụng 5 bytes, vì dùng 2 bytes để biểu diễn ký tự `à`.  
Dùng `IO.inspect("", binaries: :as_binaries)` để xem biểu diễn nhị phân của chuỗi.  
```bash
iex(8)> IO.inspect("hello", binaries: :as_binaries)
<<104, 101, 108, 108, 111>>
"hello"
```
`<<0>>` là null byte.  


### Bitstrings (Chuỗi bit)
Bitstring là 1 kiểu dữ liệu cơ bản trong Elixir, được biểu thị bằng cú pháp `<<>>`, một bitstring là 1 chuỗi bit liên tiếp trong bộ nhớ.  
Mặc định 8bits (1 byte) được dùng để lưu trữ mỗi số trong bitstring, nhưng chúng ta có thể dùng cú pháp `::n` để điều chỉnh số lượng n bit.  
```bash
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
```bash
iex(13)> is_bitstring(<<3::4>>)
true
iex(14)> is_binary(<<3::4>>)
false
iex(15)> is_binary(<<42::16>>)
true
```
Có thể dùng khớp mẫu (pattern match) cho binay và bitstring.  
```bash
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
```bash
iex(23)> <<head, rest::binary>> = "banana"
"banana"
iex(24)> head == ?b 
true
iex(25)> rest
"anana"
```

Nhưng lưu ý là khớp mẫu binary làm việc trên bite, do đó với ký tự nhiều byte thì sẽ không khớp trên ký tự, mà khớp trên byte đầu tiên của ký tự đó. Vì vậy, khi so khớp mẫu trên string cần sử dụng với ký hiệu `::utf8`.  
```bash
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
```bash
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
```bash
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
```bash
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
```bash
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
```bash
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
```bash
iex(9)> Map.get(%{:a => 1, 2 => :b}, :a)
1
iex(10)> Map.put(%{:a => 1, 2 => :b}, :c, 3)
%{2 => :b, :c => 3, :a => 1}
iex(11)> Map.to_list(%{:a => 1, 2 => :b})
[{2, :b}, {:a, 1}]
```

### Maps of predefined keys
Mếu map sử dụng key là atom thì chúng ta có thể sử dụng cú pháp `map.key` để truy suất value.  
```bash
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
```bash
iex(15)> %{map | name: "Mary"}
%{name: "Mary", age: 23}
iex(16)> %{map | agee: 27}
** (KeyError) key :agee not found in: %{name: "John", age: 23}.
```

### Nested data structures (Cấu trúc lồng nhau)
Trong thực tế ta hay gặp các trường hợp map nằm trong map, hoặc keyword list nằm trong map, và lồng nhiều cấp... Ví dụ:  
```bash
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
```bash
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
```bash
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
```bash
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
```bash
defmodule Math do
  def zero?(0), do: true
  def zero?(x) when is_integer(x), do: false
end
```

### Default arguments (Đối số mặc định)
Định nghĩa hàm trong Elixir cũng hỗ trợ đối số mặc định:
```bash
defmodule Concat do
  def join(a, b, sep \\ " ") do
    a <> sep <> b
  end
end

IO.puts(Concat.join("Hello", "world"))      #=> Hello world
IO.puts(Concat.join("Hello", "world", "_")) #=> Hello_world
```
Nếu sử dụng đối số mặc định cho hàm có nhiều biến thể thì ta cần tạo ra 1 đầu hàm không có thân hàm để khai báo, ví dụ:  
```bash
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
```bash
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
```bash
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
```bash
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
```bash
iex(1)> Enum.reduce([1, 2, 3], 0, fn x, acc -> x + acc end)
6
iex(2)> Enum.map([1, 2, 3], fn x -> x * 2 end)
[2, 4, 6]
```
Hoặc sử dụng cú pháp chụp capture systax:
```bash
iex(1)> Enum.reduce([1, 2, 3], 0, &+/2)
6
iex(2)> Enum.map([1, 2, 3], &(&1 * 2))
[2, 4, 6]
```




