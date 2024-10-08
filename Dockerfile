# Use an official Node runtime as the base image
FROM node:20-alpine

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Build the React application
RUN npm run build

# Install serve to serve the React application
RUN npm install -g serve

# Expose port 3000 to the outside world
EXPOSE 5173

# Command to run the app
CMD ["npm", "run", "dev"]
