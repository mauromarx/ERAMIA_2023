//
IMPORT $;
//
Persons := $.modPersons.File;
//
//
Layout_Persons_RecID := RECORD
  UNSIGNED4 RecID;
  $.modPersons.Layout;
END;

Layout_Persons_RecID IDrecs($.modPersons.Layout L, INTEGER cnt) := TRANSFORM
  SELF.RecID  := cnt;
  SELF        := L;
END;

EXPORT UID_Persons := PROJECT(Persons,IDrecs(LEFT,COUNTER))
                         : PERSIST('~CLASS::XYZ::PERSIST::UID_Persons');
//