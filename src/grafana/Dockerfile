# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: amayor <amayor@student.21-school.ru>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/26 22:45:56 by amayor            #+#    #+#              #
#    Updated: 2021/03/05 18:28:58 by amayor           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.13

RUN apk add --update	wget \
						grafana

COPY grafana.ini /etc/
COPY entrypoint.sh .
COPY sample.yaml /usr/share/grafana/conf/provisioning/datasources
COPY dashboards.yaml /usr/share/grafana/conf/provisioning/dashboards
COPY dashboards /var/lib/grafana/dashboards/

CMD ["sh", "entrypoint.sh"]