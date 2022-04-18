# case

```elixir
case expression do
  pattern_1 ->
    ...

  pattern_2 ->
    ...

  ...
end
```

- The term pattern here indicates that it deals with pattern matching. In the `case` construct, the provided `expression` is evaluated, and then the result is matched against the given clauses. The first one that matches is executed, and the result of the corresponding block (its last expression) is the result of the entire `case` expression. If no clause matches, an error is raised.
- The general `case` syntax can be directly translated into the multiclause functions approach
