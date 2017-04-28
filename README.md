# docker-jmeter
docker jmeter 
# Build docker
clone and make
# Usage
* run the test

docker run -i --rm -v $(pwd):/root -w /root ted/jmeter /opt/jmeter/bin/jmeter -n -t XXX.jmx -l test_report/XXX.jtl

* html report

docker run -i --rm -v $(pwd):/root ted/jmeter ant -Dxml=/root/report/XXX.xml -Dhtml=/root/test_report/XXX.html

* junit report

docker run -i --rm -v $(pwd):/root -w /junit ted/jmeter ant -Dxml=/root/junit/XXX.xml -Dout=/root/XXX.xml
