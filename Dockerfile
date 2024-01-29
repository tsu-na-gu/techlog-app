# Use an official Ruby runtime as a parent image
ARG RUBY_VERSION=3.2.2
FROM registry.docker.com/library/ruby:$RUBY_VERSION-slim as base

# Set the working directory in the container
WORKDIR /rails

# Set production environment variables
ENV RAILS_ENV=production \
    BUNDLE_DEPLOYMENT=1 \
    BUNDLE_PATH=/usr/local/bundle \
    BUNDLE_WITHOUT=development:test

# Start a new build stage
FROM base as build

# Install necessary packages for the application
RUN apt-get update -qq && \
    apt-get install -y curl gnupg2 build-essential git libpq-dev libvips pkg-config

# Install Node.js (specific version) and npm
ARG NODE_VERSION=20.11.0
ARG YARN_VERSION=latest
ENV PATH=/usr/local/node/bin:$PATH
RUN curl -sL https://github.com/nodenv/node-build/archive/master.tar.gz | tar xz -C /tmp/ && \
    /tmp/node-build-master/bin/node-build "${NODE_VERSION}" /usr/local/node && \
    npm install -g yarn@$YARN_VERSION && \
    rm -rf /tmp/node-build-master


# Copy the Gemfile and Gemfile.lock into the container
COPY Gemfile Gemfile.lock ./

# Install gems
RUN bundle install && \
    rm -rf ~/.bundle/ "${BUNDLE_PATH}"/ruby/*/cache "${BUNDLE_PATH}"/ruby/*/bundler/gems/*/.git

# Copy the main application into the container
COPY . .

# Precompile assets
RUN SECRET_KEY_BASE_DUMMY=1 ./bin/rails assets:precompile

# Final stage for app image
FROM base

# Install packages needed for deployment
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y libvips postgresql-client && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/archives

# Copy built artifacts from the previous stage
COPY --from=build /usr/local/bundle /usr/local/bundle
COPY --from=build /rails /rails

# Specify the command to run on container start
CMD ["./bin/rails", "server"]
