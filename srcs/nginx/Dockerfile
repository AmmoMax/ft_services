# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: amayor <amayor@student.21-school.ru>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/01/24 20:10:58 by amayor            #+#    #+#              #
#    Updated: 2021/03/08 19:16:52 by amayor           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


FROM alpine:3.13

RUN apk update && apk add	nginx \
							openssl \
							openssh \
							supervisor
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/C=RU/ST=Moscow/L=Moscow/O=Amayor Inc/OU=amayor/CN=amayor.com" -keyout /etc/ssl/private/amayor_nginx-selfsigned.key -out /etc/ssl/certs/amayor_nginx-selfsigned.crt

COPY nginx.conf /etc/nginx/nginx.conf
COPY entrypoint.sh .
COPY supervisord.conf /etc/supervisord.conf

EXPOSE 80
EXPOSE 443
EXPOSE 22

CMD ["sh", "entrypoint.sh"]