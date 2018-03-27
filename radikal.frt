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

: radikal ( num -- radikal )
    ( TODO: what if num is 504 ? )
    ( num )
    1 1 rot
    ( 1 1 num )
    2 repeat ( 2 is the first i )
        ( i is a candidat for prime_j )
        ( rad prev num i )
        over prime
        ( rad prev num i is_num_prime )
        if ( if num is prime already)
            ( rad prev num i )
            drop swap
            ( rad num prev )
            2dup =
            ( rad num prev num prev )
            if ( if num and prev are the same number )
                ( rad num prev )
                drop drop
                ( rad )
            else
                ( rad num prev )
                drop *
                ( rad*num )
            then
            1 ( to break the main loop )
        else  ( if num is not prime yet )
            ( rad prev num i )
            2dup %
            ( rad prev num i num%i )
            if ( if number mod i is not 0 ) 
                ( rad prev num i )
                next_prime 0
                ( rad prev num new_i 0 )
            else ( if number mod i is 0 )
                ( rad prev num i )
                swap over
                ( rad prev i num i )
                / swap
                ( rad prev num/i i )
                rot 2dup
                ( rad num/i i prev i prev )
                = if ( if i equals to prev )
                    ( rad num/i i prev )
                    rot swap
                    ( rad i num/i prev )
                    next_prime 0
                    ( rad prev num/i next_prime 0 )
                else ( if i is new )
                    ( rad num/i i prev )
                    rot 2dup
                    ( rad i prev num/i prev num/i )
                    = if ( if num/i == prev )
                        ( rad i prev num/i )
                        drop drop
                        ( rad i prev num/i )
                        * 1 
                        ( rad*i 1 )
                    else ( if num/i != prev )
                        ( rad i prev num/i )
                        rot rot
                        ( rad num/i i prev )
                        drop rot
                        ( num/i i rad )
                        over *
                        ( num/i i rad*i )
                        swap rot
                        ( rad*i i num/i )
                        over 0
                        ( rad*i i num/i i 0 )
                    then
                then
            then
        then
    until
;
