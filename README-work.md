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

The subsections below show example usage for the currently implemented functions.

### Factorial

```perl6
use Math::SpecialFunctions;
.say for (^11) Z=> (^11)».&factorial
```

The function `factorial` seems reasonably fast:

```perl6
my $tstart = now;
for ^1_000 { factorial($_ * (1..6).pick ) }
my $tend = now;
say "Total time {$tend - $tstart}";
say "Average time {($tend - $tstart) / 1_000}";
```

### Binomial

Pascal's triangle:

```perl6
for (^6) -> $n {
    say do for (0..$n) -> $k {
        binomial($n, $k), " "
    }.join
}
```

### Bernoulli-B 

- For odd `n`, the Bernoulli numbers are equal to `0`, except `B[1] = -1/2`.

- `bernoulli-b` can be evaluated to arbitrary numerical precision. (Uses `FatRat`.)

```perl6
bernoulli-b(60).nude
```

### Gamma function

- The implementation uses approximation formula with machine numbers.
- Both function names `gamma` and  `Γ` can be used.
- The property `Γ(z + 1) = z * Γ(z)` holds.

Synonyms demo:

```perl6
[gamma(0.3), Γ(0.3)]
```

Show that the property above holds:

```perl6
gamma(2.3) - 1.3 * gamma(1.3)
```

-------

## TODO

- [ ] TODO Implementation
  - [ ] TODO Incomplete gamma function
  - [ ] TODO Generalized incomplete gamma function
  - [ ] TODO [Digamma function](https://en.wikipedia.org/wiki/Digamma_function)
  - [ ] TODO [Riemann zeta function](https://en.wikipedia.org/wiki/Riemann_zeta_function)