FROM node:20.19.5-alpine3.22 AS build
WORKDIR /opt/server
COPY package.json .
COPY *.js .
RUN npm install
 

FROM node:20.19.5-alpine3.22
RUN addgroup -S roboshop && adduser -S roboshop -G roboshop && \
WORKDIR /opt/server
COPY --from=build /opt/server /opt/server
EXPOSE 8080
LABEL com.project="roboshop" \
      component="cart" \
      created_by="prasad"
ENV REDIS_HOST="redis" \
    CATALOGUE="catalogue" \
    CATALOGUE_PORT="8080"
     
RUN chown -R roboshop:roboshop /opt/server
USER roboshop     
CMD ["node", "server.js"]
ENTRYPOINT [ "node" ]











# FROM node:20
# WORKDIR /opt/server
# EXPOSE 8080
# COPY package.json .
# COPY *.js .
# RUN npm install
# ENV REDIS_HOST="redis" \
#     CATALOGUE="catalogue" \
#     CATALOGUE_PORT="8080"
# CMD ["node", "server.js"]