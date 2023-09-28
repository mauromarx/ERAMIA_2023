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
// *****  SHOW 06
// *****  Transformacoes basicas em ECL
// *****  Adicao de campo no dataset
TRrec := RECORD
  UNSIGNED    RecID;          // novo campo (field)
  STRING10  	Firstname;
	STRING     	Lastname;
	STRING1   	Gender;
	UNSIGNED1	  Age;
  STRING      Nationality;
  STRING      Occupation;
  STRING      Account;        // em outro exemplo: comentar
	INTEGER  	  Balance;        // em outro exemplo: comentar
	DECIMAL7_2 	Income;         // em outro exemplo: comentar
END;
//

IMPORT STD;                   // Biblioteca STD
//
TRrec MyTransf1(rec Le, UNSIGNED cnt) := TRANSFORM
  SELF.RecID 		  := cnt;
	SELF.Firstname 	:= STD.Str.ToUpperCase(Le.Firstname);
	SELF.Lastname 	:= STD.Str.ToUpperCase(Le.LastName);
  SELF 			      := Le;
END;
//
// *****  Project & Transform do dataset
TRds := PROJECT(ds,MyTransf1(LEFT,COUNTER));
// TRds;                                                      //	SUBMIT 07
//
//
//
// *****  SHOW 07
// *****  Uniao de 02 datasets
EPrec := RECORD
	STRING10  Firstname;
	STRING  	Lastname;
	STRING  	Email;
  STRING    Phone;
END;
//
// Declaracao do novo DATASET
EPds := DATASET([{'ISAAC','NEWTON','isaac.newton@cam.ac.uk','16431727'},
                 {'ALBERT','EINSTEIN','albert.einstein@princeton.edu','18791955'},
                 {'MARIE','CURIE','marie.curie@sorbonne.fr','18671934'},
                 {'VICTOR','HUGO','victor.hugo@lacroix.fr','18021885'},
                 {'JANE','AUSTEN','jane.austen@hampshire.uk','17751817'},
                 {'EMILY','BRONTE','emily.bronte@thornton.uk','18181848'},
                 {'JANE','DOE','jane.doe@hotmail.com',''},
                 {'JOHN','WAYNE','john.wayne@paramount.com','12345678'}],EPrec);    // Joe Doe ???
// EPds;			                                                //	SUBMIT 08
//
//
//
// *****  SHOW 08
// *****  Fazendo a uniao de datasets
NEWrec := RECORD
  TRrec;
  EPrec.Email;
  EPrec.Phone;
END;
//
NEWrec MyTransf2(TRrec Le, EPrec Ri) := TRANSFORM
  SELF := Le;
  SELF := Ri;
END;
//
JOINds := JOIN(TRds,EPds,LEFT.Firstname = RIGHT.Firstname AND
                         LEFT.Lastname = RIGHT.Lastname,
                         MyTransf2(LEFT,RIGHT));
// JOINds;			                                              //	SUBMIT 09a
//
// *****  Ordenacao de valores do dataset: RecID
sort05 := SORT(JOINds,RecID);
// sort05;                                                    //	SUBMIT 09b


// Join de Inclusao: todos os registros que atendam a condição e os demais que não atendam
JOINdsFull := JOIN(TRds,EPds,LEFT.Firstname = RIGHT.Firstname AND 
                             LEFT.Lastname = RIGHT.Lastname,
                             MyTransf2(LEFT,RIGHT),
                             FULL OUTER);
// JOINdsFull;			                                          //	SUBMIT 10a
//
// *****  Ordenacao de valores do dataset: RecID
sort06 := SORT(JOINdsFull,RecID);
// sort06;                                                    //	SUBMIT 10b
//