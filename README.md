# HPCC Systems Workshop

ECL course material for community workshops. The training cluster utilized during the workshop is: *TrainingCluster*. After completing this course, you should use: *localhost*.

# During the workshop GitPod will be used as main environment:
1. By using your GitHub credentials, just click on the following link for instantiate a environment via GitPod:
https://gitpod.io/#https://github.com/mauromarx/Template_2023

**Note I**: Alternatively, you can use the ECL IDE:
1. Download and install the latest ECL IDE version available from https://hpccsystems.com/download#HPCC-Platform. For detailed information on how to setup the ECL IDE, please watch this instructional video: https://www.youtube.com/watch?v=TT7rCcyWTAo
2. Download and install the latest git version available from https://git-scm.com/downloads
3. Install the required bundles using the ecl command line interface with administrator rights from your clienttools/bin folder (for further details, please visit: https://hpccsystems.com/download/free-modules):

```
- General Bundles:
cd “C:\Program Files (x86)\HPCCSystems\9.0.6\clienttools\bin"
ecl bundle install https://github.com/hpcc-systems/DataPatterns.git
ecl bundle install https://github.com/hpcc-systems/Visualizer.git

- Machine Learning Bundles:
cd “C:\Program Files (x86)\HPCCSystems\9.0.6\clienttools\bin"
ecl bundle install https://github.com/hpcc-systems/ML_Core.git
ecl bundle install https://github.com/hpcc-systems/PBblas.git
ecl bundle install https://github.com/hpcc-systems/LearningTrees.git
ecl bundle install https://github.com/hpcc-systems/LinearRegression.git
```
**Note II**: The '*persons*' and '*property.csv*' datasets are already sprayed and available in the training cluster utilized during the workshop.
