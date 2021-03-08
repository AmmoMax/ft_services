# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: amayor <amayor@student.21-school.ru>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/27 23:20:10 by amayor            #+#    #+#              #
#    Updated: 2021/03/08 14:29:22 by amayor           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.13

RUN apk add --update	wget \
						telegraf \
						supervisor

ADD https://dl.influxdata.com/influxdb/releases/influxdb2-2.0.4-linux-amd64.tar.gz .

COPY entrypoint.sh .
COPY setup_influxdb.sh .
COPY telegraf.conf .
COPY supervisord.conf /etc/supervisord.conf

CMD ["sh", "entrypoint.sh"]