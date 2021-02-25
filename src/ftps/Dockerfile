# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: amayor <amayor@student.21-school.ru>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/22 22:41:55 by amayor            #+#    #+#              #
#    Updated: 2021/02/25 23:40:37 by amayor           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.13

RUN apk add --update	vsftpd \
						openssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/C=RU/ST=Moscow/L=Moscow/O=Amayor Inc/OU=amayor/CN=amayor.com" -keyout /etc/ssl/private/amayor_nginx-selfsigned.key -out /etc/ssl/certs/amayor_nginx-selfsigned.crt

COPY entrypoint.sh .
COPY vsftpd.conf .

EXPOSE 21 15001

CMD ["sh", "entrypoint.sh"]