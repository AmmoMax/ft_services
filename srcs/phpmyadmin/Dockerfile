# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: amayor <amayor@student.21-school.ru>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/15 23:42:04 by amayor            #+#    #+#              #
#    Updated: 2021/03/08 18:07:26 by amayor           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.13

RUN apk add --update 	nginx \
						php7 \
						php-mbstring \
						php-xml \
						php-fpm \
						curl \
						php7-json \
						php7-iconv \
						php-mysqli \
						php7-simplexml \
						php7-tokenizer \
						php7-xmlwriter \
						php7-session \
						supervisor

COPY nginx.conf /etc/nginx/nginx.conf
COPY entrypoint.sh .
COPY config.inc.php .
COPY supervisord.conf /etc/supervisord.conf

EXPOSE 5000

CMD ["sh", "entrypoint.sh"]