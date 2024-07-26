FROM node:10-alpine

RUN npm cache clean --force && \
	npm config set strict-ssl false && \
	apk add wget unzip && \
	wget --no-check-certificate https://github.com/prabushitha/gremlin-visualizer/archive/master.zip && \
	unzip master.zip && \
	cd gremlin-visualizer-master && \
	npm install && \
 	npm audit fix --force

EXPOSE 3000 3001

WORKDIR /gremlin-visualizer-master

CMD npm start
