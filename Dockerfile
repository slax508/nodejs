# Use Node.js Alpine base image
FROM node:16-alpine

# Create and set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package.json package-lock.json /app/

# Install dependencies
RUN npm install --production 

# Copy the entire codebase to the working directory
COPY . .

# Expose the port your container app
EXPOSE 3000    

# Define the command to start your application (replace "start" with the actual command to start your app)
CMD ["npm", "app.js"]
