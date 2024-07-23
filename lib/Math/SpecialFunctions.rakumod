use v6.d;

unit module Math::SpecialFunctions;

#------------------------------------------------------------
proto sub factorial(Int $n) is export {*}

multi sub factorial(Int $n where $n ≤ 1) {
    return 1;
}

multi sub factorial(Int $n where !($n %% 2)) {
    return $n * factorial($n - 1);
}

multi sub factorial(Int $n is copy where $n %% 2) {

    my $f = $n;

    my $d = $n - 2;
    my $m = $n + $d;

    while $d > 0 {
        $f *= $m;
        $d -= 2;
        $m += $d;
    }

    return $f;
}

#------------------------------------------------------------
proto sub binomial(Int $n, Int $k) is export {*}

multi sub binomial(Int $n, Int $k) {
    if $n < $k || $n < 0 || $k < 0 {
        return 0;
    } else {
        return factorial($n) / (factorial($k) * factorial($n - $k));
    }
}

#------------------------------------------------------------
# Taken from https://rosettacode.org/wiki/Bernoulli_numbers#With_memoization
my $bernoulli = gather {
    my @a;
    for 0 ..* -> $m {
        @a = FatRat.new(1, $m + 1),
             -> $prev {
                 my $j = @a.elems;
                 $j * (@a.shift - $prev);
             } ... { not @a.elems }
        take $m => @a[*- 1] if @a[*- 1];
    }
}

# bernoulli is a lazy sequence of pairs. Each pair is BernoulliB number index to corresponding value.

sub bernoulli-b(UInt $n) is export {
    return do given $n {
        when 0 { 1 }
        when 1 { -1 / 2 }
        when $_ % 2 { 0 }
        default { $bernoulli[($_ + 2) / 2].value }
    }
}

#------------------------------------------------------------
# Taken from https://rosettacode.org/wiki/Gamma_function#Raku
# Not very precise compared to Mathematica / WL. Can be improved.
sub gamma($z) is export {
    constant g = 9;
    $z < .5 ?? pi / sin(pi * $z) / gamma(1 - $z) !!
            sqrt(2 * pi) *
                    ($z + g - 1 / 2) ** ($z - 1 / 2) *
                    exp(-($z + g - 1 / 2)) *
            [+] <
        1.000000000000000174663
     5716.400188274341379136
   -14815.30426768413909044
    14291.49277657478554025
    -6348.160217641458813289
     1301.608286058321874105
     -108.1767053514369634679
        2.605696505611755827729
       -0.7423452510201416151527e-2
        0.5384136432509564062961e-7
       -0.4023533141268236372067e-8
    > Z* 1, |map 1 / ($z +*), 0 ..*
}

sub Γ($z) is export { gamma($z) }
