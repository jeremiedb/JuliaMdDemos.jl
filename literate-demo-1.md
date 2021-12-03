```@meta
EditURL = "<unknown>/experiments/literate-demo-1.jl"
```

This multiline comment
is treated as markdown.

This is also markdown.

````@example literate-demo-1
md"""
````

Title

````@example literate-demo-1
blah blah blah
"""
````

# Rational numbers

In julia rational numbers can be constructed with the `//` operator.
Lets define two rational numbers, `x` and `y`:

````@example literate-demo-1
# Define variable x and y
x = 1//3
y = 2//5
````

When adding `x` and `y` together we obtain a new rational number:

````@example literate-demo-1
z = x + y
````

---

*This page was generated using [Literate.jl](https://github.com/fredrikekre/Literate.jl).*

