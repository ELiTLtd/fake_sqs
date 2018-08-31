FROM ruby:2.2.2

RUN apt-get update -qq
RUN apt-get install -y build-essential libpq-dev

ENV app /app

RUN mkdir $app
WORKDIR $app
ADD . $app

RUN bundle install

EXPOSE 4568

CMD cd bin ; exec fake_sqs
