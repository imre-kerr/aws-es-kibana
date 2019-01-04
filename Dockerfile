FROM node:8-alpine

WORKDIR /app

RUN addgroup aws-es-kibana
RUN adduser -S -G aws-es-kibana aws-es-kibana
RUN chown aws-es-kibana:aws-es-kibana /app

COPY package.json /app
RUN npm install
COPY index.js /app

EXPOSE 9200

ENTRYPOINT ["node", "index.js"]
