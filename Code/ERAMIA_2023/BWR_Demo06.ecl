//
// *****  Estruturas de dados basicas em ECL
//
IMPORT $;
//
Persons := $.modPersons.File;
//
// *****  SHOW 09
// *****  Conteudo do dataset: Persons
OUTPUT(Persons, NAMED('Persons'));                            //	SUBMIT 11a
COUNT(Persons);     // 963.512 registros                      //	SUBMIT 11b
SIZEOF($.modPersons.Layout);     // Layout => 151             //	SUBMIT 11c

// OUTPUT(Persons,{ID,FirstName,LastName,Gender,DependentCount,BirthDate}, NAMED('Personal_Info'));     //	SUBMIT 12a
// OUTPUT(Persons,{ID,StreetAddress,City,State,ZipCode}, NAMED('Address_Info'));                        //	SUBMIT 12b
//
//
//
// *****  SHOW 10
// *****  Queries - Consultas Básicas
// OUTPUT(Persons(State='FL',City='MIAMI'), NAMED('FL_Miami'));  //	SUBMIT 13a
// COUNT(Persons(State='FL',City='MIAMI'));                      //	SUBMIT 13b  = 2821

// OUTPUT(Persons(ZipCode='33102'), NAMED('ZipCode_33102'));     //	SUBMIT 14a
// COUNT(Persons(ZipCode='33102'));                              //	SUBMIT 14b  = 53

// OUTPUT(Persons(FirstName[1]='B'), NAMED('FirstName_B'));      //	SUBMIT 15a
// COUNT(Persons(FirstName[1]='B'));                             //	SUBMIT 15b  = 35619
//