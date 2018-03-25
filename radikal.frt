include prime.frt
: factor ( num -- prime_1 prime_2 ... prime_n )
    2 repeat
        ( num i )
        ( 9 2 )
        ( 9 3 )
        ( 3 3 )
        swap dup 
        ( i num num )
        ( 2 9 9 )
        ( 3 9 9 )
        ( 3 3 3 )
        rot swap 
        ( num i num )
        ( 9 2 9 )
        ( 9 3 9 )
        ( 3 3 3 )
        prime 1
        ( num i is_num_prime 1 )
        ( 9 2 0 1 )
        ( 9 3 0 1 )
        ( 3 3 1 1 )
        = if ( if num is prime already)
            ( num i )
            ( 3 3 )
            drop 1
            ( num 1 )
            ( 3 1 )
        else  ( if num is not prime yet )
            ( num i )
            ( 9 2 )
            ( 9 3 )
            dup rot 
            ( i i num )
            ( 2 2 9 )
            ( 3 3 9 )
            dup rot
            ( i num num i )
            ( 2 9 9 2 )
            ( 3 9 9 3 )
            % 0
            ( i num num%i 0 )
            ( 2 9 1 0 )
            ( 3 9 0 0 )
            = if ( if number mod i is 0 ) 
                ( i num )
                ( 3 9 )
                swap dup 
                ( num i i )
                ( 9 3 3 )
                rot swap
                ( i num i )
                ( 3 9 3 )
                / swap
                ( num/i i )
                ( 3 3 )
                dup rot
                ( i i num/i )
                ( 3 3 3 )
                swap 0
                ( i num/i i 0)
                ( 3 3 3 0 )
            else ( move to next prime )
                ( num i )
                ( 9 2 )
                repeat 
                    ( num i )
                    ( 9 2 )
                    1 +
                    ( num i+1 )
                    ( 9 3 )
                    dup prime not
                    ( num i+1 is_i+1_composite )
                    ( 9 3 0 )
                until 0 ( to continue main loop )
                ( num new_i 0 )
                ( 9 3 0 )
            then
        then
    until
;
