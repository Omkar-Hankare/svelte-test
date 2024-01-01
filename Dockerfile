# Base image for Node.js
FROM node:18-alpine AS build

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy remaining project files
COPY . .

# Build the application
RUN npm run build

# Development stage
FROM build AS development

EXPOSE 3500

# Start dev server
CMD ["npm", "run", "dev", "--poll"]

# Production stage
FROM build AS production

# Copy built application files
COPY --from=build /app/build ./build

# Expose port 3000 (or your app's port)
EXPOSE 3000

# Start the application
CMD ["node", "./build"]
