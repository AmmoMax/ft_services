# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: amayor <amayor@student.21-school.ru>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/01/28 21:24:14 by amayor            #+#    #+#              #
#    Updated: 2021/02/05 23:12:12 by amayor           ###   ########.fr        #
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

EXPOSE 1609

# CMD ["ping", "8.8.8.8"]
CMD ["sh", "entrypoint.sh"]