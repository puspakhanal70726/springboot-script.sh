   #!/bin/bash
yum install python2 -y
yum install java -y
cd /usr/bin
ln -s python2 python
ln -s pip2 pip
pip install awscli --upgrade --user
export PATH=~/.local/bin:$PATH
source ~/.bash_profile
cd ~
KEY=`aws s3 ls s3://puspa --recursive |sort | tail -n 1 | awk '{print $4}'`
aws s3 cp s3://puspa/$KEY .
java -jar $KEY
~
