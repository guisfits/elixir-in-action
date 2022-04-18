# cond

- The `cond` macro can be thought of as equivalent to an `if-else-if` pattern. It takes a list of expressions and executes the block of the first expression that evaluates to a truthy value:

```elixir
cond do
  expression_1 ->
    ...

  expression_2 ->
    ...
...
end
```

- The result of `cond` is the result of the corresponding executed block. If none of the conditions is satisfied, `cond` raises an error.
