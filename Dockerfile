FROM ruby:2.7.1

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client yarn

RUN mkdir /qconcursos
WORKDIR /qconcursos

COPY Gemfile Gemfile.lock ./
RUN gem install bundler --no-document
RUN bundle install --no-binstubs --jobs $(nproc) --retry 3

COPY . .

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
