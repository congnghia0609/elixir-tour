## File này được đọc sau khi ứng dụng và các phần phụ thuộc
## của chúng ta được biên dịch và do đó nó có thể cấu hình
## cách ứng dụng của chúng ta hoạt động khi chạy.
import Config

# config :iex, default_prompt: ">>>"
config :kv, :routing_table, [{?a..?z, node()}]

if config_env() == :prod do
  config :kv, :routing_table, [
    {?a..?m, :"foo@nghiatc"},
    {?n..?z, :"bar@nghiatc"}
  ]
end
