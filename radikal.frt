include prime.frt
: factor ( num -- prime_1 prime_2 ... prime_n )
    2 repeat
        ( num i )
        swap dup 
        ( i num num )
        rot swap 
        ( num i num )
        prime if ( if num is prime already)
            ( num i )
            drop 1
            ( num 1 )
        else  ( if num is not prime yet )
            ( num i )
            dup rot 
            ( i i num )
            dup rot
            ( i num num i )
            % if ( if number mod i is not 0 ) 
                ( num i )
                repeat 
                    ( num i )
                    1 +
                    ( num i+1 )
                    dup prime not
                    ( num i+1 is_i+1_composite )
                until 0 ( to continue main loop )
                ( num new_i 0 )
            else ( if number mod i is 0 )
                ( i num )
                swap dup 
                ( num i i )
                rot swap
                ( i num i )
                / swap
                ( num/i i )
                dup rot
                ( i i num/i )
                swap 0
                ( i num/i i 0)
            then
        then
    until
;
