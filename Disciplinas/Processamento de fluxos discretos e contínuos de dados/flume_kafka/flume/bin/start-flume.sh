flume-ng agent \
	--conf ${FLUME_CONF_DIR}/ \
	--conf-file ${FLUME_CONF_DIR}/hello.conf \
	--name a1 \
	-Dflume.root.logger=INFO,console