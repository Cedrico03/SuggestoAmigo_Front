FROM node:lts-alpine

# install simple http server for serving static content
RUN npm install -g http-server

# make the 'app' folder the current working directory
WORKDIR /frontend

# copy project files and folders to the current working directory (i.e. 'app' folder)
COPY frontend/dist /frontend

EXPOSE 3012

CMD [ "http-server", "--cors", "-p 3012", "/frontend" ]