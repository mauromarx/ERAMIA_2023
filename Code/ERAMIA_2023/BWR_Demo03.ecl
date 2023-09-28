//
// *****  Estruturas de dados basicas em ECL
//
// *****  SHOW 01
// *****  Estrutura RECORD
rec := RECORD
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
//
// *****  Declaracao DATASET
ds := DATASET([{'Isaac','Newton','M',84,'english','scientist','cc100',100,3500.00},
               {'Albert','Einstein','M',76,'german','scientist','cc200',-100,4000.30},
               {'Marie','Curie','F',66,'polish','scientist','cc300',200,3640.10},
               {'John','Doe','U',65,'american','retired','cc800',750,3211.11},   //  Duplicado para exemplo: Dedup03
               {'Victor','Hugo','M',83,'french','writer','cc400',150,1900.00},
               {'Jane','Austen','F',41,'english','writer','cc500',180,2000.00},
               {'Emily','Bronte','F',30,'english','writer','cc600',120,1800.00},
               {'Jane','Doe','',25,'brazilian','unemployed','cc700',-500,0.00},
               {'John','Doe','U',65,'american','retired','cc800',750,3211.11}],rec);
//
// OUTPUT(ds);                                                //	SUBMIT 00
ds;			                                                      //	SUBMIT 01
//
//
//
// *****  SHOW 04
// *****  Transformacoes basicas em ECL
// *****  Eliminacao de campos desnecessarios - "Vertical Slice" form
mytable := TABLE(ds,{Firstname,Lastname,Account,Balance,Income});
mytable;                                                      //	SUBMIT 02

// *****  Ordenacao de valores do dataset: Full = FirstName & LastName
//        {'John','Doe','U',65,'american','retired','cc800',750,3211.11},   //  Duplicado para remocao pelo Dedup Full
sort03 := SORT(mytable,FirstName,LastName);
// sort03;                                                    //	SUBMIT 05a
//
// *****  Remocao de duplicidades: Full = FirstName & LastName
dedup03a := DEDUP(sort03,FirstName,LastName);
// dedup03a;                                                   //	SUBMIT 05b
//
// *****  Remocao de duplicidades com "Palavras Chaves": LEFT & RIGHT (outro exemplo: LEFT.Lastname = RIGHT.Firstname)
dedup03b := DEDUP(sort03, LEFT.FirstName = RIGHT.FirstName AND
                          LEFT.LastName = RIGHT.LastName)
              :PERSIST('~CLASS::XYZ::PERSIST::DedupPersons');
// dedup03b;                                                   //	SUBMIT 05c
//