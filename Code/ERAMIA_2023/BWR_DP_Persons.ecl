//
IMPORT $,STD;
//
Persons            := $.modPersons_CSV.File_CSV;
bestrecordPersons  := STD.DataPatterns.BestRecordStructure(Persons);
profilePersons     := STD.DataPatterns.Profile(Persons);
//
//
OUTPUT(bestrecordPersons,  ALL, NAMED('bestrecordPersons'));
OUTPUT(profilePersons,     ALL, NAMED('profilePersons'));
//