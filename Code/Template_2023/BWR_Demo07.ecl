//
// *****  Estruturas de dados basicas em ECL
//
IMPORT $;
//
Persons := $.modPersons.File;
//
// *****  SHOW 11
// *****  Transformacoes basicas em ECL
// *****  Eliminacao de campos desnecessarios
ptable := TABLE(Persons,{ID,Firstname,LastName,Gender,DependentCount,BirthDate,StreetAddress,City,State,ZipCode});
ptable;                                                       //	SUBMIT 16a
// OUTPUT(ptable,,'~CLASS::XYZ::DEMO::PersonsTBL',OVERWRITE);    //	SUBMIT 16b
//
//
//
// *****  SHOW 12
// *****  Filtragem e Tabulaçao de datasets
// *****  Tabulação cruzada - "CrossTab Report" form
rec03 := RECORD
  Persons.Gender;
  cnt03 := COUNT(GROUP);                              //  GROUP - funcao agregada
END;
//
crosstab03 := TABLE(Persons,rec03,Gender);            // agrupando pessoas por genero
sortGender := SORT(crosstab03,Gender);
// crosstab03;                                                   //	SUBMIT 17a
// sortGender;                                                   //	SUBMIT 17b

rec04 := RECORD
  Persons.DependentCount;
  cnt04 := COUNT(GROUP);                              //  GROUP - funcao agregada
END;
//
crosstab04 := TABLE(Persons,rec04,DependentCount);    // agrupando pessoas por genero
sortDepCnt := SORT(crosstab04,DependentCount);
// crosstab04;                                                   //	SUBMIT 18a
// sortDepCnt;                                                   //	SUBMIT 18b


// *****  Funçoes de Agregação: MIN & MAX
MinVal := MIN(Persons,DependentCount);
MaxVal := MAX(Persons,DependentCount);
//
DepCntDS := DATASET([{'n. Minimum',MinVal},
                     {'n. Maximum',MaxVal}],
                     {STRING15 ValueType,INTEGER NumVal});
// DepCntDS;                                                     //	SUBMIT 19
//
//
//
// *****  SHOW 13
// *****  Filtragem com definição do tipo "boolean"
IsFloridian := Persons.State = 'FL';
IsBorn2000  := Persons.BirthDate <> '' AND Persons.BirthDate[..4] >= '2000';
IsFloridianYoung := Persons(IsFloridian AND IsBorn2000);

// *****  Tabulação cruzada
FYrec := RECORD
  IsFloridianYoung.Gender;
  UNSIGNED4 FYcnt := COUNT(GROUP);                     //  GROUP - funcao agregada
END;
//
crosstab05 := TABLE(IsFloridianYoung,FYrec,Gender);    // agrupando pessoas por genero
sortFYcnt := SORT(crosstab05,Gender);
// crosstab05;                                                   //	SUBMIT 20a
// sortFYcnt;                                                    //	SUBMIT 20b

SumVal := SUM(crosstab05,FYcnt);                       // somatoria de pessoas que atendam a condição
// SumVal;                                                       //	SUBMIT 20c
//