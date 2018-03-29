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

: radical ( num -- radical )
    ( num )
    dup 1 
    ( num num 1 )
    = not 
    ( num does_num_differ_from_1 )
    if ( if num is not 1 )
        ( num )
        dup prime
        ( num is_num_prime )
        not 
        ( num is_num_composite )
        if ( num is composite )
            ( num )
            dup >r
            ( num, num )
            2 swap 
            ( 2 num, num )
            2 /
            ( 2 num/2, num )
            swap r>
            ( num/2 2 num )
            1 >r
            ( num/2 2 num, 1 )
            repeat
                ( num/i i num, rad )
                2dup swap
                ( num/i i num num i, rad )
                % 
                ( num/i i num num%i, rad )
                if ( if num % i is not 0 )
                    ( num/i i num, rad )
                    over >r
                    ( num/i i num, rad i )
                    rot dup 
                    ( i num num/i num/i, rad i )
                    r> >
                    ( i num num/i is_num/i>i, rad )
                    if ( if num/i is bigger than i )
                        ( i num num/i, rad )
                        rot next_prime
                        ( num num/i new_i, rad )
                        rot 0 ( 0 is a mark to continue the main loop )
                        ( num/i new_i num 0, rad )
                    else 
                        ( i num num/i, rad )
                        1 ( break the main loop )
                    then
                else
                    ( num/i i num, rad )
                    swap dup
                    ( num/i num i i, rad )
                    r> *
                    ( num/i num i i*rad )
                    >r next_prime 
                    ( num/i num new_i, i*rad )
                    swap 0
                    ( num/i new_i num 0, i*rad )
                then
            until
            ( i num num/i, rad )
            drop drop 
            ( i, rad )
            drop r>
            ( rad )
        then
    then 
;
