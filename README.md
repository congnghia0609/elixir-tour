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

Trong 1 số trường hợp, bạn không quan tâm đến 1 giá trị cụ thể trong mẫu thì ta dùng dấu gạch dưới (underscore) `_` để thay thế, ví du:  
```bash
iex> [head | _] = [1, 2, 3]
[1, 2, 3]
iex> head
1
```





