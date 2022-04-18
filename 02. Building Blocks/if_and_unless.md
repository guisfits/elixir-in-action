# If and Unless

```elixir
if condition do
...
else
...
end
```
or
```elixir
if condition, do: something, else: another_thing
```

- Recall that everything in Elixir is an expression that has a return value. The `if` expression returns the result of the executed block (that is, of the block’s last expression). If the condition isn’t met and the `else` clause isn’t specified, the return value is the atom `nil`:

- `unless` is equivalent of `if (not ...)`

```elixir
unless a >= b, do: b, else: a
```

