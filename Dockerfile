FROM centos:centos6
MAINTAINER Juan Carlos Alonso Holmstron  "j.carlos.alonso.h@gmail.com"

# Environmental variables
ENV APP_NAME webapp
ENV APP_USER $APP_NAME
ENV APP_GROUP $APP_NAME
ENV APP_PATH /${APP_NAME}

# Arguments
ARG RUBY_VERSION

# Update system, despite a warning against this: https://docs.docker.com/articles/dockerfile_best-practices/#run
# The official CentOS Dockerfiles repo recommends it: https://github.com/CentOS/CentOS-Dockerfiles/blob/master/nginx/centos7/Dockerfile#L10
RUN yum -y update

# Install rbenv system dependencies
RUN yum install -y gcc-c++ patch readline readline-devel zlib zlib-devel libyaml-devel libffi-devel \
  openssl-devel make bzip2 autoconf automake libtool bison iconv-devel git-core tar

# Clean up yum cache
RUN yum clean all

# Create the unprivileged application user, group and directory, and switch user
RUN groupadd $APP_GROUP; useradd -g $APP_GROUP --home-dir $APP_PATH $APP_USER
ENV HOME $APP_PATH

# Setup unprivileged user environmental variables
ENV RBENV_ROOT ${HOME}/.rbenv
ENV PATH ${RBENV_ROOT}/bin:${RBENV_ROOT}/shims:$PATH

# Install rbenv, ruby-build
RUN git clone https://github.com/sstephenson/rbenv.git $RBENV_ROOT
RUN git clone https://github.com/sstephenson/ruby-build.git ${RBENV_ROOT}/plugins/ruby-build
RUN echo 'eval "$(rbenv init -)"' >> ~/.bash_profile

# Install ruby specified in .ruby-version
WORKDIR $APP_PATH
ENV CONFIGURE_OPTS --disable-install-doc
RUN rbenv install ${RUBY_VERSION}; rbenv global ${RUBY_VERSION}

# Set gem config
RUN mkdir $( dirname $(ruby -e 'print Gem::ConfigFile::SYSTEM_WIDE_CONFIG_FILE') )
RUN echo 'gem: --no-document' >> $(ruby -e 'print Gem::ConfigFile::SYSTEM_WIDE_CONFIG_FILE')

# Install bundler, rehash
RUN gem install bundler; rbenv rehash

# Copy App
COPY . ${APP_PATH}/

# Install Deps
RUN bundle install; rbenv rehash

# Build and install gem
RUN bundle exec rake install; rbenv rehash

CMD ["/bin/bash"]
