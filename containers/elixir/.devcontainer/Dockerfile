FROM <domain>/development-ubuntu:<version>
ADD README.md .
RUN apt-get -y install gnupg 
RUN wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb 
RUN dpkg -i erlang-solutions_1.0_all.deb  
RUN apt-get -y update   
RUN apt-get -y install esl-erlang 
RUN echo $(erl -version)

RUN  apt-get -y install elixir && \
    echo $(elixir -v)
    
RUN mix local.hex --force
RUN mix local.rebar --force
RUN mix archive.install hex mix_templates --force
RUN mix archive.install hex mix_generator --force
