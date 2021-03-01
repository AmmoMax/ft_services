# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: amayor <amayor@student.21-school.ru>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/26 22:45:56 by amayor            #+#    #+#              #
#    Updated: 2021/03/01 16:15:32 by amayor           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.13

RUN apk add --update	wget \
						grafana

COPY grafana.ini /etc/
COPY entrypoint.sh .
COPY sample.yaml /usr/share/grafana/conf/provisioning/datasources

CMD ["sh", "entrypoint.sh"]