# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: amayor <amayor@student.21-school.ru>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/26 22:45:56 by amayor            #+#    #+#              #
#    Updated: 2021/02/27 00:04:53 by amayor           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.13

RUN apk add --update	wget \
						grafana

COPY grafana.ini /etc/
COPY entrypoint.sh .

CMD ["sh", "entrypoint.sh"]