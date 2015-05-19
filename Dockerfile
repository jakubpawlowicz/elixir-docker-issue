FROM centos:latest

ENV PATH /usr/local/elixir/bin:$PATH
ENV LANG en_US.utf8

RUN yum install -y wget unzip epel-release

# Install Erlang
RUN wget http://packages.erlang-solutions.com/erlang-solutions-1.0-1.noarch.rpm
RUN rpm -Uvh erlang-solutions-1.0-1.noarch.rpm
RUN yum install -y erlang

# Install Elixir
RUN wget https://github.com/elixir-lang/elixir/releases/download/v1.0.4/Precompiled.zip
RUN mkdir -p /usr/local/elixir
RUN cd /usr/local/elixir && unzip /Precompiled.zip

# Install hex & rebar
RUN mix local.hex <<< 'Y'
RUN mix local.rebar <<< 'Y'

# Set up the app
WORKDIR /app

ADD mix.exs mix.exs
RUN mix deps.get
RUN mix compile
# Comment out the line above and uncomment line below to compile dependencies correctly
# RUN elixir --erl "-smp disable" /usr/local/elixir/bin/mix compile

ADD . /app
