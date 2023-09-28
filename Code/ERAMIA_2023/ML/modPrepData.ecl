IMPORT $;
//
Property := $.modProperty.File;
//
EXPORT modPrepData := MODULE
	EXPORT ML_Prop := RECORD
		UNSIGNED8 PropertyID;
		UNSIGNED3 zip; 			            // variável Categórica
		UNSIGNED4 assessed_value;
		UNSIGNED2 year_acquired;
		UNSIGNED4 land_square_footage;
		UNSIGNED4 living_square_feet;
		UNSIGNED2 bedrooms;
		UNSIGNED2 full_baths;
		UNSIGNED2 half_baths;
		UNSIGNED2 year_built;
		UNSIGNED4 total_value; 		      // variável Dependente (a ser determinada)
	END;
//
  EXPORT ML_PropExt := RECORD(ML_Prop)
    UNSIGNED4 rnd;                  // número randômico
  END;
//
	EXPORT PrepData := PROJECT($.CleanProperty, TRANSFORM(ML_PropExt,
                                                  SELF.rnd := RANDOM(),
                                                  SELF.zip := (UNSIGNED3)LEFT.zip,
                                                  SELF := LEFT))
                        :PERSIST('~CLASS::XYZ::ML::PrepData');
//
END;
//