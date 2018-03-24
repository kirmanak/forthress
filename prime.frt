: prime ( n )
  dup 0 < if ." Incorrect argument " else
  ( by definition )
  dup 2 < if drop 0 else
    ( for does not work, so I have to use do-loop )
    ( which does an iteration and 2 becames not prime )
    dup 2 = if drop 1 else
        dup
        ( calculates limit for the loop )
        ( n / 2 + 1 )
        dup 2 / 1 +
        ( current index for the loop )
        2 do
            ( copies current index and checks the remainder )
            r@ % 0
            = if 
                ( drops the n and pushes the answer )
                drop 0
                ( drops current index )
                r> drop 
                ( and pushes the limit as the index )
                r@ >r
            else dup then 
        loop
        ( if answer is not false then push true )
        0 = if 0 else drop 1 then
        then 
    then
then ;

: prime-allot ( n )
    ( calculates the result )
    prime
    ( allocates the memory and stores an address twice )
    cell% allot dup
    ( places the result under an address )
    rot swap
    ( writes the result into the memory )
    !
;
