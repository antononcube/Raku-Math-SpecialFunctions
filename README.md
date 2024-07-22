# Math::SpecialFunctions

Raku package for mathematical special functions.

------

## Installation

From Zef ecosytem:

```
zef install Math::SpecialFunctions
```

From GitHub:

```
zef install https://github.com/antononcube/Raku-Math-SpecialFunctions.git
```

------

## Usage examples

Here are example usage for the currently implemented functions:

```perl6
use Math::SpecialFunctions;
factorial(10)
```
```
# 3628800
```

```perl6
binomial(10, 6)
```
```
# 210
```

```perl6
bernoulli-b(10).nude
```
```
# (5 66)
```

```perl6
gamma(0.3)
```
```
# 2.991568987687589
```

For Gamma function also `Γ` can be used:

```perl6
Γ(0.3)
```
```
# 2.991568987687589
```

-------

## TODO

- [ ] TODO Implementation
  - [ ] TODO [Digamma function](https://en.wikipedia.org/wiki/Digamma_function)
  - [ ] TODO [Riemann zeta function](https://en.wikipedia.org/wiki/Riemann_zeta_function)