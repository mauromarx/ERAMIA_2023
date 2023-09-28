//
IMPORT $;
//
EXPORT Fetch_Persons (STRING25 LastName_Value, STRING15 FirstName_Value, STRING2 State_Value) := FUNCTION
//
	basekey := $.IDX_Persons.IDX_LName_FName_St;
//	
	FilteredKey := IF(State_Value = '', basekey(LastName = LastName_Value),
                    IF(FirstName_Value = '',
                       basekey(LastName = LastName_Value AND State = State_Value AND NOT FirstName = FirstName_Value),
                       basekey(LastName = LastName_Value AND State = State_Value AND FirstName = FirstName_Value))
                   );
//
	RETURN OUTPUT(FilteredKey);
END;
//