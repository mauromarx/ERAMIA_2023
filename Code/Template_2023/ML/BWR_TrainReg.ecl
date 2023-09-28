IMPORT $;
IMPORT ML_Core;
IMPORT LearningTrees AS LT;
//
// Selecionando o algoritmo
//   Sintaxe: RegressionForest(UNSIGNED numTrees=100, UNSIGNED featuresPerNode=0,
//                             UNSIGNED maxDepth=100, SET OF UNSIGNED nominalFields=[])
// myLearnerR := LT.RegressionForest();          // parâmetros default
// myLearnerR := LT.RegressionForest(,,,[1]);    // zip não é realmente quantitativo, mas qualitativo
myLearnerR := LT.RegressionForest(10,,10,[1]); 
//
//
// Obtendo o modelo treinado
myModelR := myLearnerR.GetModel($.modSegConvData.myIndTrainDataNF,$.modSegConvData.myDepTrainDataNF);
OUTPUT(myModelR,,'~CLASS::XYZ::ML::myModelR', NAMED('Modelo_Treinado'),OVERWRITE);
//
//
// Testando o modelo
predictedDeps := myLearnerR.Predict(myModelR,$.modSegConvData.myIndTestDataNF);
OUTPUT(predictedDeps, NAMED('Valores_Previstos'));
//
//
// Avaliando o modelo
assessmentR := ML_Core.Analysis.Regression.Accuracy(predictedDeps,$.modSegConvData.myDepTestDataNF);
OUTPUT(assessmentR, NAMED('Avaliacao_do_Modelo'));
//