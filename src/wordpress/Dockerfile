# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: amayor <amayor@student.21-school.ru>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/01/28 21:24:14 by amayor            #+#    #+#              #
#    Updated: 2021/03/05 23:40:18 by amayor           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.13

RUN apk add --update 	php7 \
						curl \
						php-dom \
						php-fpm \
						php-json \
						php-mbstring \
						php-mysqli \
						php-xml \
						php-zip \
						wget \
						nginx

COPY nginx.conf /etc/nginx/nginx.conf
COPY wp-config.php .
COPY setup_wp.sh .
COPY entrypoint.sh .

EXPOSE 5050

CMD ["sh", "entrypoint.sh"]