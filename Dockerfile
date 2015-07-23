FROM gcr.io/google_appengine/nodejs

COPY package.json /app/
RUN npm install -g npm@3.0-latest --loglevel verbose
# Access registry over http (not https) to prevent hang: https://github.com/npm/npm/issues/7862#issuecomment-120387186
# RUN npm config set registry http://registry.npmjs.org/
RUN npm install --production --loglevel verbose
COPY . /app/
CMD npm start
