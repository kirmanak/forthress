: concat ( addr1 addr2 -- addr3 )
    ( addr1 addr2 )
    dup count
    ( addr1 addr2 len2 )
    rot
    ( addr2 len2 addr1 )
    dup count
    ( addr2 len2 addr1 len1 )
    rot swap
    ( addr2 addr1 len2 len1 )
    dup rot
    ( addr2 addr1 len1 len1 len2 )
    + heap-alloc
    ( addr2 addr1 len1 addr3 )
    rot dup
    ( addr2 len1 addr3 addr1 addr1 )
    rot dup
    ( addr2 len1 addr1 addr1 addr3 addr3 )
    rot string-copy
    ( addr2 len1 addr1 addr3 )
    swap heap-free
    ( addr2 len1 addr3 )
    dup rot
    ( addr2 addr3 addr3 len1 )
    + rot
    ( addr3 addr3-2 addr2 )
    dup rot swap
    ( addr3 addr2 addr3-2 addr2 )
    string-copy heap-free
    ( addr3 )
;
