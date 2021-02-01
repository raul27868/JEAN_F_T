FROM php:5.4-apache

#Instalar modulos de perl 
RUN apt-get update \
    && apt-get install -yq \
        build-essential \
        cpanminus 
RUN cpanm install JSON 
#RUN cpanm install XML::Simple 







  
#Generar la imagen
# docker build --rm -f Dockerfile --tag raulreyero/jean_f_t:v2 .


#Subir a docker hub
#docker push raulreyero/jean_f_t:v2

#Descargar imagen desde dockerhub
#docker pull raulreyero/jean_f_t:v2

 