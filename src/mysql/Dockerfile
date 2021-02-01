# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: amayor <amayor@student.21-school.ru>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/01/28 22:34:52 by amayor            #+#    #+#              #
#    Updated: 2021/02/01 12:06:41 by amayor           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.13

RUN apk add --update mysql mysql-client && rm -f /var/cache/apk/*

COPY startup.sh .
COPY entrypoint.sh .

EXPOSE 3306

CMD ["sh", "entrypoint.sh"]