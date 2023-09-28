IMPORT $;
//
Property := $.modProperty.File;
//
// Limpando os dados...
EXPORT isCleanFilter := Property.zip <> '' AND
                        Property.assessed_value <> 0 AND
                        Property.year_acquired <> 0 AND 
                        Property.land_square_footage <> 0 AND
                        Property.living_square_feet <> 0 AND 
                        Property.bedrooms <> 0 AND
                        Property.full_baths <> 0 AND
                        Property.year_Built <> 0;
//