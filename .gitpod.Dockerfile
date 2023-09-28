FROM gitpod/workspace-full

RUN sudo apt-get -y update

# Install the latest hpccsystems clienttools and required ML bundles.
WORKDIR /tmp

RUN wget https://github.com/hpcc-systems/HPCC-Platform/releases/download/community_9.0.6-1/hpccsystems-platform-community_9.0.6-1focal_amd64_withsymbols.deb

RUN sudo apt-get install -y --fix-missing ./hpccsystems-platform-community_9.0.6-1focal_amd64_withsymbols.deb
RUN rm -f hpccsystems-platform-community_9.0.6-1focal_amd64_withsymbols.deb
COPY ./environment/*.xml /etc/HPCCSystems

# Machine Learning Bundles.
RUN ecl bundle install https://github.com/hpcc-systems/ML_Core.git
RUN ecl bundle install https://github.com/hpcc-systems/PBblas.git
RUN ecl bundle install https://github.com/hpcc-systems/LearningTrees.git
RUN ecl bundle install https://github.com/hpcc-systems/LinearRegression.git
# General Bundles
RUN ecl bundle install https://github.com/hpcc-systems/DataPatterns.git
# RUN ecl bundle install https://github.com/hpcc-systems/Visualizer.git
