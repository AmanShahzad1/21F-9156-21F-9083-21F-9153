# Base Image
FROM ruby:3.1.2-slim

# Set working directory
WORKDIR /myapp

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libsqlite3-dev \
    yarn \
    entr && \
    rm -rf /var/lib/apt/lists/*  # Clean up

# Install RuboCop for linting
RUN gem install rubocop -v 1.24

# Copy Gemfile and Gemfile.lock to leverage caching
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy the app
COPY . .

# Expose app port (optional, not required for linting)
EXPOSE 3000

# Command to start Rails (not relevant for RuboCop)
CMD ["bash", "-c", "rm -f tmp/pids/server.pid && rails server -b 0.0.0.0 -p 3000"]
