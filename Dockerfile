FROM	java:8

ENV		DEBIAN_FRONTEND noninteractive

ENV		JMETER_VERSION	3.1
ENV		JMETER_HOME		/opt/jmeter
ENV		JMETER_DOWNLOAD_URL  http://mirror.serversupportforum.de/apache/jmeter/binaries/apache-jmeter-${JMETER_VERSION}.tgz

# install needed debian packages & clean up
RUN		apt-get update && \
		apt-get install -y --no-install-recommends curl tar ca-certificates unzip ant && \
		apt-get clean autoclean && \
        	apt-get autoremove --yes && \
        	rm -rf /var/lib/{apt,dpkg,cache,log}/

# download and extract jmeter 
RUN		mkdir -p ${JMETER_HOME} && \
		curl -L --silent ${JMETER_DOWNLOAD_URL} | tar -xz --strip=1 -C ${JMETER_HOME} && \
		curl -L --silent http://jmeter-plugins.org/downloads/file/JMeterPlugins-ExtrasLibs-1.4.0.zip -o /tmp/jmeter-plugins-standard.zip && \
		unzip -o -d ${JMETER_HOME}/ /tmp/jmeter-plugins-standard.zip && \
		rm /tmp/jmeter-plugins-standard.zip

# Set ant build.xml
RUN		cd ${JMETER_HOME} && curl https://raw.githubusercontent.com/imaging8896/docker-jmeter/master/build.xml > build.xml

# Set jmeter property
RUN		echo log_file= >> ${JMETER_HOME}/bin/jmeter.properties

WORKDIR		${JMETER_HOME}
