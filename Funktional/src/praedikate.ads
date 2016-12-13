package Praedikate is
   type Praedikat is access function (l, r: Integer) return Boolean;
   function greater_op(l,r : integer) return boolean is (l>r);
   function equal_op(l,r : integer) return boolean is (l=r);
   function less_op(l,r : integer) return boolean is (l<r);
   greater : Constant Praedikat := greater_op'access;
   equal : Constant Praedikat := equal_op'access;
   less : Constant Praedikat := less_op'access;
end praedikate;
