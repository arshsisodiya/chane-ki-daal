# inherit prebuilt image
FROM prajwals3/projectfizilion:latest

# env setup
RUN mkdir /Helios && chmod 777 /Helios
ENV PATH="/Helios/bin:$PATH"
WORKDIR /Helios

# clone repo
RUN git clone https://github.com/arshsisodiya/chane-ki-daal.git -b master /Helios

# Copies session and config(if it exists)
COPY ./sample_config.env ./userbot.session* ./config.env* /Helios/

# install required pypi modules
RUN pip3 install -r requirements.txt

# Finalization
CMD ["python3","-m","userbot"]
