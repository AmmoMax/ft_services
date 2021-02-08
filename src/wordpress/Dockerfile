# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: amayor <amayor@student.21-school.ru>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/01/28 21:24:14 by amayor            #+#    #+#              #
#    Updated: 2021/02/07 23:55:37 by amayor           ###   ########.fr        #
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
						# php-imagick \
						php-xml \
						php-zip \
						wget \
						nginx && rm -rf /var/lib/apt/lists/*

COPY nginx.conf /etc/nginx/nginx.conf
COPY wp-config.php .
COPY setup_wp.sh .
COPY entrypoint.sh .

EXPOSE 5050

CMD ["sh", "entrypoint.sh"]