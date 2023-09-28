//
IMPORT $,Std;
//
EXPORT STD_Persons := MODULE
	EXPORT Layout := RECORD
		$.UID_Persons.RecID;
		$.UID_Persons.ID;
		STRING15    FirstName 	:= Std.Str.ToUpperCase($.UID_Persons.FirstName);
		STRING25    LastName 	  := Std.Str.ToUpperCase($.UID_Persons.LastName);
		STRING1     MiddleName 	:= Std.Str.ToUpperCase($.UID_Persons.MiddleName);
		STRING2     NameSuffix 	:= Std.Str.ToUpperCase($.UID_Persons.NameSuffix);
		UNSIGNED4   FileDate 	  := (UNSIGNED4)$.UID_Persons.FileDate;
		$.UID_Persons.BureauCode;
		$.UID_Persons.Gender;
		UNSIGNED4   BirthDate   := (UNSIGNED4)$.UID_Persons.BirthDate;
		$.UID_Persons.StreetAddress;
		$.UID_Persons.City;
		$.UID_Persons.State;
		UNSIGNED3   ZipCode 	  := (UNSIGNED3)$.UID_Persons.ZipCode;
	END;
	EXPORT File := TABLE($.UID_Persons,Layout)
                    :PERSIST('~CLASS::XYZ::PERSIST::STD_Persons');
END;
//