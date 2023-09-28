//
EXPORT modInline02 := MODULE
  EXPORT Layout := RECORD
    STRING10  Firstname;
    STRING  	Lastname;
    STRING  	Email;
    STRING    Phone;
  END;
  EXPORT File := DATASET('~CLASS::XYZ::DEMO::DatasetInline02',Layout,CSV(HEADING(1)));
END;
//