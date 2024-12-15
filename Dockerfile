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

# Set Rails environment (default to development)
ARG RAILS_ENV=development
ENV RAILS_ENV=${RAILS_ENV}

# Copy Gemfile and Gemfile.lock first to take advantage of Docker caching
COPY Gemfile Gemfile.lock ./
RUN if [ "$RAILS_ENV" = "production" ]; then \
      bundle install --without development test; \
    else \
      bundle install; \
    fi

# Copy the entire app
COPY . .

# Precompile assets in production
RUN if [ "$RAILS_ENV" = "production" ]; then \
      SECRET_KEY_BASE=dummy bundle exec rake assets:precompile; \
    fi

# Expose the app port
EXPOSE 3000

# Allow hot-reloading for development
CMD ["bash", "-c", "rm -f tmp/pids/server.pid && rails server -b 0.0.0.0 -p 3000"]
