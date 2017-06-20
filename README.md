# Usage
* run the test

docker run -i --rm -v $(pwd):/root -w /root tedimaging/jmeter /opt/jmeter/bin/jmeter -n -t XXX.jmx -l XXX.jtl

* html report

docker run -i --rm -v $(pwd):/root -w /html tedimaging/jmeter ant -Dxml=/root/report/XXX.xml -Dhtml=/root/test_report/XXX.html

* junit report

docker run -i --rm -v $(pwd):/root -w /junit tedimaging/jmeter ant -Dxml=/root/junit/XXX.xml -Dout=/root/XXX.xml
