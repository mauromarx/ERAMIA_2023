//
EXPORT modInline01 := MODULE
  EXPORT Layout := RECORD
    STRING10  	Firstname;
    STRING     	Lastname;
    STRING1   	Gender;
    UNSIGNED1	  Age;
    STRING      Nationality;
    STRING      Occupation;
    STRING      Account;
    INTEGER  	  Balance;
    DECIMAL7_2 	Income;
  END;
  EXPORT File := DATASET('~CLASS::XYZ::DEMO::DatasetInline01',Layout,CSV(HEADING(1)));
END;
//