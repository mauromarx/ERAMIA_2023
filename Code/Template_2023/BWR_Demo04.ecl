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
               {'John','Doe','U',65,'american','retired','cc900',1000,3211.11},   //  Adicionado para exemplo: Rollup
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
// *****  SHOW 05
// *****  Transformacoes basicas em ECL
// *****  Funcao ROLLUP & TRANSFORM
// *****  Ordenacao de valores do dataset: Full = FirstName & LastName
//        {'John','Doe','U',65,'american','retired','cc900',1000,3211.11},   //  Adicionado para transformacao pelo Rollup
sort04 := SORT(ds,FirstName,LastName);
// sort04;                                                    //	SUBMIT 06a
//
rec RollTransf(rec Le, rec Ri) := TRANSFORM
	SELF.Account  := Le.Account + ',' + Ri.Account;
	SELF.Balance  := Le.Balance + Ri.Balance;
	SELF          := Le;
END;
//
rollup01 := ROLLUP(sort04,
                   LEFT.FirstName = RIGHT.FirstName AND
                   LEFT.LastName  = RIGHT.LastName,
                   RollTransf(LEFT,RIGHT));
// rollup01;                                                   //	SUBMIT 06b
//