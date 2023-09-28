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
// *****  SHOW 02
// *****  Filtragem e Tabulacao de datasets
recset1 := ds(Age>65);
// recset1; // o mesmo que: OUTPUT(recset1);                  //	SUBMIT 02

recset2 := ds(Age>65,Gender='F');
// recset2;                                                   //	SUBMIT 03

//  ***** Definicao do tipo "boolean"
IsSeniorMale := ds.Age>65 AND ds.Gender='M';
recset3 := ds(IsSeniorMale);
// recset3;                                                   //	SUBMIT 04

//  ***** Definicao do tipo "set"
SetGender := ['M','F'];
recset4 := ds(Gender IN SetGender);
// recset4;						// Definicao do tipo "recordset"        //	SUBMIT 05a
// COUNT(recset4);    // Equivale a: OUTPUT(COUNT(recset4));  //	SUBMIT 05b
//
//
//
// *****  SHOW 03
// *****  Tabulacao cruzada - "CrossTab Report" form
rec01 := RECORD
  ds.Nationality;
  cnt01 := COUNT(GROUP);                     //  GROUP - funcao agregada
END;
//
crosstab01 := TABLE(ds,rec01,Nationality);   // agrupando pessoas por nacionalidade
// crosstab01;                                                //	SUBMIT 06

rec02 := RECORD
  ds.Occupation;
  cnt02 := COUNT(GROUP);                     //  GROUP - funcao agregada
END;
//
crosstab02 := TABLE(ds,rec02,Occupation);    // agrupando pessoas por ocupacao
// crosstab02;                                                //	SUBMIT 07
//