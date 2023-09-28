//
IMPORT $;
//
OUTPUT($.STD_Persons.File,,'~CLASS::XYZ::OUT::Persons_New',OVERWRITE);
//
BUILD($.IDX_Persons.IDX_LName_FName_St,OVERWRITE);
COUNT($.IDX_Persons.IDX_LName_FName_St);     //  963512
//