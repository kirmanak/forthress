include prime.frt
: next_prime ( x -- a )
    ( a is the closest prime num, which is also bigger than x )
    repeat
        ( x )
        1 +
        ( x++ )
        dup prime 
        ( x++ is_x++_prime )
    until
;

: factor ( num -- prime_1 prime_2 ... prime_n )
    ( num )
    2 repeat ( 2 is the first i )
        ( i is a candidat for prime_j )
        ( num i )
        over
        ( num i num )
        prime if ( if num is prime already)
            ( num i )
            drop 1
            ( num 1 )
        else  ( if num is not prime yet )
            ( num i )
            2dup
            ( num i num i )
            % if ( if number mod i is not 0 ) 
                ( num i )
                next_prime 0
                ( num new_i 0 )
            else ( if number mod i is 0 )
                ( num i )
                dup rot 
                ( i i num )
                swap /
                ( i num/i )
                over 0 ( 0 is a condition to continue main loop )
                ( i num/i i 0)
            then
        then
    until
;
