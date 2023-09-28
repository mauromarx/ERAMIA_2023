IMPORT $;
IMPORT ML_Core;
//
PrepData := $.modPrepData.PrepData;
//
// Torne os dados aleatórios, ordenando os registros pelo número randômico
PrepDataSort := SORT(PrepData, rnd);
//
//
// Segregação dos dados - Considerando os primeiros 5.000 registros como amostra de Treinamento
myTrainData := PROJECT(PrepDataSort[1..5000], $.modPrepData.ML_Prop)
                          :PERSIST('~CLASS::XYZ::ML::Train');             // layout sem o campo rnd
//
// Segregação dos dados - Considerando os 2.000 registros seguintes como amostra de Teste
myTestData  := PROJECT(PrepDataSort[5001..7000], $.modPrepData.ML_Prop)
                          :PERSIST('~CLASS::XYZ::ML::Test');              // layout sem o campo rnd
//
//
// Conversão Matricial dos campos numéricos
ML_Core.ToField(myTrainData, myTrainDataNF);
ML_Core.ToField(myTestData, myTestDataNF);
//
//
EXPORT modSegConvData := MODULE
	EXPORT myIndTrainDataNF := myTrainDataNF(number < 10);    // excluindo o campo propertyid
//
	EXPORT myDepTrainDataNF := PROJECT(myTrainDataNF(number = 10), TRANSFORM(RECORDOF(LEFT),
                                                                      SELF.number := 1,
                                                                      SELF := LEFT));
//
	EXPORT myIndTestDataNF := myTestDataNF(number < 10);      // excluindo o campo propertyid
//
	EXPORT myDepTestDataNF := PROJECT(myTestDataNF(number = 10), TRANSFORM(RECORDOF(LEFT), 
                                                                    SELF.number := 1,
                                                                    SELF := LEFT));
END;
//