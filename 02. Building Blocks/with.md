# with

syntax
```elixir
with pattern_1 <- expression_1,
     pattern_2 <- expression_2,
     ...
do
  ...
end
```

Examples

```elixir
iex(1)> with {:ok, login} <- {:ok, "alice"},
             {:ok, email} <- {:ok, "some_email"} do
          %{login: login, email: email}
        end

%{email: "some_email", login: "alice"}
```

Here you went through two pattern matches to extract the login and the email. Then the `do` block is evaluated. The result of the `with` expression is the last result of the expression in the `do` block

```elixir
iex(2)> with {:ok, login} <- {:error, "login missing"},
             {:ok, email} <- {:ok, "email"} do
          %{login: login, email: email}
        end
{:error, "login missing"}
```
