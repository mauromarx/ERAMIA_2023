IMPORT $;
IMPORT ML_Core;
IMPORT LearningTrees AS LT;
//
// Função de predição de preços de imóveis
EXPORT fn_GetPriceReg(Zip,
                      Assess_val,
                      Year_acq,
                      Land_sq_ft,
                      Living_sq_ft,
                      Bedrooms,
                      Full_baths,
                      Half_baths,
                      Year_built) := FUNCTION
//
// Transformação dos parâmetros de entrada no formato de ML data frame				
  myInSet := [Zip, Assess_val, Year_acq, Land_sq_ft, Living_sq_ft, Bedrooms, Full_baths, Half_baths, Year_built];
  myInDS := DATASET(myInSet, {REAL8 myInValue});
	ML_Core.Types.NumericField PrepDataReg(RECORDOF(myInDS) Le, INTEGER cnt) := TRANSFORM
		SELF.wi     := 1,
		SELF.id	    := 1,
		SELF.number := cnt,
		SELF.value  := Le.myInValue;
	END;
	myNewIndDataReg := PROJECT(myInDS, PrepDataReg(LEFT,COUNTER));
//
// Predição e retorno do valor do imóvel consultado
	myModelR := DATASET('~CLASS::XYZ::ML::myModelR',ML_Core.Types.Layout_Model2,FLAT,PRELOAD);
	myLearnerR := LT.RegressionForest(10,,10,[1]);
	myPredictDeps := MyLearnerR.Predict(myModelR, myNewIndDataReg);
//
	RETURN OUTPUT(myPredictDeps,{preco:=ROUND(value)});
END;
//