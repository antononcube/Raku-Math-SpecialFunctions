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
```
# 0 => 1
# 1 => 1
# 2 => 2
# 3 => 6
# 4 => 24
# 5 => 120
# 6 => 720
# 7 => 5040
# 8 => 40320
# 9 => 362880
# 10 => 3628800
```

The function `factorial` seems reasonably fast:

```perl6
my $tstart = now;
for ^1_000 { factorial($_ * (1..6).pick ) }
my $tend = now;
say "Total time {$tend - $tstart}";
say "Average time {($tend - $tstart) / 1_000}";
```
```
# Total time 0.928399779
# Average time 0.000928399779
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
```
# 1  
# 1  1  
# 1  2  1  
# 1  3  3  1  
# 1  4  6  4  1  
# 1  5  10  10  5  1
```

### Bernoulli-B 

- For odd `n`, the Bernoulli numbers are equal to `0`, except `B[1] = -1/2`.

- `bernoulli-b` can be evaluated to arbitrary numerical precision. (Uses `FatRat`.)

```perl6
bernoulli-b(60).nude
```
```
# (-1215233140483755572040304994079820246041491 56786730)
```

### Gamma function

- The implementation uses approximation formula with machine numbers.
- `Γ(z + 1) = z * Γ(z)`
- Both function names `gamma` and  `Γ` can be used.

Synonyms demo:

```perl6
[gamma(0.3), Γ(0.3)]
```
```
# [2.991568987687589 2.991568987687589]
```

Show that the formula above holds:

```perl6
gamma(2.3) - 1.3 * gamma(1.3)
```
```
# 0
```

-------

## TODO

- [ ] TODO Implementation
  - [ ] TODO Incomplete gamma function
  - [ ] TODO Generalized incomplete gamma function
  - [ ] TODO [Digamma function](https://en.wikipedia.org/wiki/Digamma_function)
  - [ ] TODO [Riemann zeta function](https://en.wikipedia.org/wiki/Riemann_zeta_function)