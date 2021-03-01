# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: amayor <amayor@student.21-school.ru>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/27 23:20:10 by amayor            #+#    #+#              #
#    Updated: 2021/02/28 23:30:35 by amayor           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.13

RUN apk add --update wget

COPY entrypoint.sh .
COPY setup_influxdb.sh .

CMD ["sh", "entrypoint.sh"]