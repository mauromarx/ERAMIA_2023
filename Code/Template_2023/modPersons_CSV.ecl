//
/*
	Raw Dataset: Persons_CSV    // ver BWR_Persons_CSV - usado para gerar dataset CSV
*/
//
EXPORT modPersons_CSV := MODULE
  EXPORT Layout_CSV := RECORD
    INTEGER4  ID;
    STRING15  FirstName;
    STRING25  LastName;
    STRING15  MiddleName;
    STRING2   NameSuffix;
    STRING8   FileDate;
    UNSIGNED2 BureauCode;
    STRING1   MaritalStatus;
    STRING1   Gender;
    UNSIGNED1 DependentCount;
    STRING8   BirthDate;
    STRING42  StreetAddress;
    STRING20  City;
    STRING2   State;
    STRING5   ZipCode;
  END;
  EXPORT File_CSV := DATASET('~CLASS::XYZ::OUT::Persons_CSV',Layout_CSV,CSV);
END;
//