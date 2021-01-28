# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: amayor <amayor@student.21-school.ru>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/01/28 21:24:14 by amayor            #+#    #+#              #
#    Updated: 2021/01/28 21:25:36 by amayor           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.13

RUN apk update && php7.3 \
					curl \
					php-dom \
					php-fpm \
					php-json \
					php-mbstring \
					php-mysqli \
					php-imagick \
					php-xml \
					php-zip \
					wget && rm -rf /var/lib/apt/lists/*

