FROM node:8
ADD package.json /tmp/package.json
ADD package-lock.json /tmp/package-lock.json
RUN cd /tmp && \
  npm install && \
  mkdir -p /usr/src/app && \
  cp -a /tmp/node_modules /usr/src/app

WORKDIR /usr/src/app
ADD . /usr/src/app
RUN npm run build && chmod u+x ./BaiduPCS-Go
RUN rm -rf ./build && rm -rf ./test && rm -rf ./src

ENV PORT=80
ENV CORS=0
CMD [ "npm", "start" ]
