Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4FE3B635A
	for <linux-doc@vger.kernel.org>; Fri, 14 Aug 2026 19:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786735770; cv=none; b=Q8J2lEX8VeUq00nwBIK7BtnhPc43rzLUO/8amztvtFWNnAA5cVyhCKbwPz+1HoFKZOWYMBJJciUws9+ktCJBd7ilAZSUoWJs4/8mWPUTP7jZWXgR0bvnQhPIT90uaJR6IysxhZQ2N0NVM1mR40QewQwDvzKNoJSsIxe73WSjJTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786735770; c=relaxed/simple;
	bh=GhZD17cuw5gYUVnyHmaSI6jBf22mSnRirzc/2LtRvPA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RuEtnDZOTGBL7Opao8RP41PJ/emkUpCe1xDt+GXZ5ilKvLrtZ6Z6Eh6PCgDH5s5upNVCnZaoBfNdJYRfDAuPSrgkmwaitzwtqsqbZwSAvleuqt+SEeABD0l3y/EQCeDep+uPc8IKtqGNh1i4/XoLsHL368kmCFp/Ua6yp4NfoSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QOPsqEvR; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QOPsqEvR"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4954b3c5cbeso897225e9.1
        for <linux-doc@vger.kernel.org>; Fri, 14 Aug 2026 12:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786735763; x=1787340563; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ECtMwAmDF1K5nODesCePL78MgfJUPMGWesJDcm6OOPY=;
        b=QOPsqEvRJFzQUX9vjFED9pbpo1XrEuAIvh0I+Nz/3aduc2wa6PzhB/ncpoHNXXgLGv
         5W2KAnz8/XunoXxScZQmfVGRKqXukI463JdBNhTVMdzB0X/gp52r/YlM8DjNXki+8Egk
         dBA5pwn9/1wsrG4vUQ9LjZkvEv06+IUdAfgxlQlzCuzVRGbTzR6HGAYE5VdwAgKL8Yl8
         844B5Fw58gCetE3bW6863HtZnXh7VCPrpZjf6FTIbYwQmnmvcZbbabGNNRLKSXlvThAi
         jG/wrn8qt8x84l7RE+YpsC9HlTHP7OZYqVBTmfMt0lA2xDE8v21O3N+mSnamROnSIY84
         zwCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786735763; x=1787340563;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ECtMwAmDF1K5nODesCePL78MgfJUPMGWesJDcm6OOPY=;
        b=PrY7LTCPxwp8gDS3Hpas1PS7lvLafboo+3aevfnqh9G+HP3q7fv0vuO6/xKd40Jk5s
         QF7V2wkpeOSobkDuZHvABNYInLNr9BhZ2ArlXKvS8/hpxPCUaisTJfWO3HD7p9I3UCuM
         rHfwM5OH95yfwykguJ4wVj4o0RLk+1ePyo0luUZuLO7tcqk9cQGjAoVjA1SSode6Wylc
         vMjQZkI1WaoEcF1m6CQoep22gi8kHJwUO+kvMBM6gAmSmlTVe6IJao6jnO7H45Xjjms8
         fpXQCn2PZ7uPOh9qQGsLMjyFfbuwHlhtpdZJKZ6p1JsKHwD6TK731q0Pq9fkDehVrFQV
         8uGw==
X-Forwarded-Encrypted: i=1; AHgh+Rr70nBJmqvEG9Vr5yy4nOxrooZH31LBZn0McezwRIp7NbPyq2qj3Q//CjlqoVY1EOhUbO6Ld/+4WK0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlURs1tiPuwgVaXJqdkTxRMQqmQGH4OQq/ot8woVkye/gH0IR1
	FkmKhIWNceb677tJB5KtBoyiTR83r5IsiYW9ZG8GtN/reSVxIUO7P6g80zELvQnx+6RG8g==
X-Gm-Gg: AR+sD10/NK4cBbBBsZtnNhSdS6VaPGtHRz01z+6efwgAefw8SiHu3KrzU66MVHVqzZt
	GxQx9taiN3rO0dZMQNIanYU1pDuvwCFZJKhg+sE2FtZ1jNOWiyY6OX+zcNb1kGEG9jFb3veIs6r
	GI8MzM2iabhxvmm4GiTcDpevWoxUjRmHpsTglcBzzfdPopJwlSs5qjqhCbFu28fUXnGqlqbhZfV
	jVfpSqysTICZDmfADr/FrYb1wobhEZnU9RWPHpfjjPg2EPoQq06mAORBsPS/WCXpxYOphQnb2zy
	MHGL+hTcfn7K/+8CU/vJgZ/JdtceWskghzDdtlTrLsjUP2bVXkyhzGRqDWwBor6ZxBe8i7A0fZT
	t+HFiMuwiT6eAyXF8pJt7q4lQoFK6Yu0DjrR57Rs9H5Vr2WxmX2Pcvuw8J7OxRzGvKEyDgrEwoa
	9lHHpSGzK7HS3f2LaCAW7rLtuEQlspwgjhrdSxgz4YMZk=
X-Received: by 2002:a05:600c:3b1f:b0:490:ec79:3046 with SMTP id 5b1f17b1804b1-499878d463cmr57282875e9.0.1786735763094;
        Fri, 14 Aug 2026 12:29:23 -0700 (PDT)
Received: from localhost ([2620:10d:c092:500::4:391e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49988b2a509sm73702315e9.14.2026.08.14.12.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 12:29:22 -0700 (PDT)
From: Gustavo Luiz Duarte <gustavold@gmail.com>
Date: Fri, 14 Aug 2026 20:28:53 +0100
Subject: [PATCH net-next v3 2/7] netconsole: use the address family instead
 of the ipv6 flag
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260814-netcons_ipv6-v3-2-bc0915e8c75f@gmail.com>
References: <20260814-netcons_ipv6-v3-0-bc0915e8c75f@gmail.com>
In-Reply-To: <20260814-netcons_ipv6-v3-0-bc0915e8c75f@gmail.com>
To: Breno Leitao <leitao@debian.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Gustavo Luiz Duarte <gustavold@gmail.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.15.2

Now that we have the address family in inet_addr, use that and remove
nt->ipv6.

We no longer need netcons_local_ip_unset() to check that all bytes are
zeroes, as that is now denoted by (family == AF_UNSPEC).

Reviewed-by: Breno Leitao <leitao@debian.org>
Signed-off-by: Gustavo Luiz Duarte <gustavold@gmail.com>
---
 drivers/net/netconsole.c | 82 ++++++++++++++----------------------------------
 1 file changed, 23 insertions(+), 59 deletions(-)

diff --git a/drivers/net/netconsole.c b/drivers/net/netconsole.c
index 432b66cf111a..351754d53cf9 100644
--- a/drivers/net/netconsole.c
+++ b/drivers/net/netconsole.c
@@ -195,7 +195,6 @@ struct netcons_userdata {
  *		local_mac	(read-only)
  * @local_ip:	Source IP address of the target (read-write).
  * @remote_ip:	Destination IP address of the target (read-write).
- * @ipv6:	Whether the target addresses are IPv6 (read-write).
  * @local_port:	Source UDP port of the target (read-write).
  * @remote_port: Destination UDP port of the target (read-write).
  * @remote_mac:	Destination ethernet address of the target (read-write).
@@ -226,7 +225,6 @@ struct netconsole_target {
 	bool			release;
 	struct netpoll		np;
 	struct inet_addr	local_ip, remote_ip;
-	bool			ipv6;
 	u16			local_port, remote_port;
 	u8			remote_mac[ETH_ALEN];
 	/* protected by target_list_lock; +1 gives scnprintf() room for its
@@ -476,23 +474,6 @@ static int netcons_take_ipv4(struct netconsole_target *nt,
 	return 0;
 }
 
-/*
- * Test whether the caller left nt->local_ip unset, so that
- * netcons_netpoll_setup() should auto-populate it from the egress device.
- *
- * nt->local_ip is a union of __be32 (IPv4) and struct in6_addr (IPv6),
- * so an IPv6 address whose first 4 bytes are zero (e.g. ::1, ::2,
- * IPv4-mapped ::ffff:a.b.c.d) must not be tested via the IPv4 arm —
- * doing so would misclassify a caller-supplied address as unset and
- * silently overwrite it with whatever address the device exposes.
- */
-static bool netcons_local_ip_unset(const struct netconsole_target *nt)
-{
-	if (nt->ipv6)
-		return ipv6_addr_any(&nt->local_ip.in6);
-	return !nt->local_ip.ip;
-}
-
 static int netcons_netpoll_setup(struct netconsole_target *nt)
 {
 	struct net *net = current->nsproxy->net_ns;
@@ -538,16 +519,13 @@ static int netcons_netpoll_setup(struct netconsole_target *nt)
 		rtnl_lock();
 	}
 
-	if (netcons_local_ip_unset(nt)) {
-		if (!nt->ipv6) {
-			err = netcons_take_ipv4(nt, ndev);
-			if (err)
-				goto put;
-		} else {
+	if (nt->local_ip.family == AF_UNSPEC) {
+		if (nt->remote_ip.family == AF_INET6)
 			err = netcons_take_ipv6(nt, ndev);
-			if (err)
-				goto put;
-		}
+		else
+			err = netcons_take_ipv4(nt, ndev);
+		if (err)
+			goto put;
 		ip_overwritten = true;
 	}
 
@@ -729,22 +707,22 @@ static void netconsole_print_banner(struct netconsole_target *nt)
 	struct netpoll *np = &nt->np;
 
 	np_info(np, "local port %d\n", nt->local_port);
-	if (nt->ipv6)
+	if (nt->local_ip.family == AF_INET6)
 		np_info(np, "local IPv6 address %pI6c\n", &nt->local_ip.in6);
 	else
 		np_info(np, "local IPv4 address %pI4\n", &nt->local_ip.ip);
 	np_info(np, "interface name '%s'\n", np->dev_name);
 	np_info(np, "local ethernet address '%pM'\n", np->dev_mac);
 	np_info(np, "remote port %d\n", nt->remote_port);
-	if (nt->ipv6)
+	if (nt->remote_ip.family == AF_INET6)
 		np_info(np, "remote IPv6 address %pI6c\n", &nt->remote_ip.in6);
 	else
 		np_info(np, "remote IPv4 address %pI4\n", &nt->remote_ip.ip);
 	np_info(np, "remote ethernet address %pM\n", nt->remote_mac);
 }
 
-/* Parse the string and populate the `inet_addr` struct. Return 0 if IPv4 is
- * populated, 1 if IPv6 is populated, and -1 upon failure.
+/* Parse the string and populate the `inet_addr` struct. Return 0 on success
+ * and -1 upon failure.
  */
 static int netpoll_parse_ip_addr(const char *str, struct inet_addr *addr)
 {
@@ -768,7 +746,7 @@ static int netpoll_parse_ip_addr(const char *str, struct inet_addr *addr)
 	    in6_pton(str, len, (void *)&addr->in6, -1, &end) > 0 &&
 	    (!end || *end == 0 || *end == '\n')) {
 		addr->family = AF_INET6;
-		return 1;
+		return 0;
 	}
 
 	return -1;
@@ -874,7 +852,7 @@ static ssize_t local_ip_show(struct config_item *item, char *buf)
 {
 	struct netconsole_target *nt = to_target(item);
 
-	if (nt->ipv6)
+	if (nt->local_ip.family == AF_INET6)
 		return sysfs_emit(buf, "%pI6c\n", &nt->local_ip.in6);
 	else
 		return sysfs_emit(buf, "%pI4\n", &nt->local_ip.ip);
@@ -884,7 +862,7 @@ static ssize_t remote_ip_show(struct config_item *item, char *buf)
 {
 	struct netconsole_target *nt = to_target(item);
 
-	if (nt->ipv6)
+	if (nt->remote_ip.family == AF_INET6)
 		return sysfs_emit(buf, "%pI6c\n", &nt->remote_ip.in6);
 	else
 		return sysfs_emit(buf, "%pI4\n", &nt->remote_ip.ip);
@@ -1232,7 +1210,6 @@ static ssize_t local_ip_store(struct config_item *item, const char *buf,
 {
 	struct netconsole_target *nt = to_target(item);
 	ssize_t ret = -EINVAL;
-	int ipv6;
 
 	dynamic_netconsole_mutex_lock();
 	if (nt->state == STATE_ENABLED) {
@@ -1241,10 +1218,8 @@ static ssize_t local_ip_store(struct config_item *item, const char *buf,
 		goto out_unlock;
 	}
 
-	ipv6 = netpoll_parse_ip_addr(buf, &nt->local_ip);
-	if (ipv6 == -1)
+	if (netpoll_parse_ip_addr(buf, &nt->local_ip) < 0)
 		goto out_unlock;
-	nt->ipv6 = !!ipv6;
 
 	ret = count;
 out_unlock:
@@ -1257,7 +1232,6 @@ static ssize_t remote_ip_store(struct config_item *item, const char *buf,
 {
 	struct netconsole_target *nt = to_target(item);
 	ssize_t ret = -EINVAL;
-	int ipv6;
 
 	dynamic_netconsole_mutex_lock();
 	if (nt->state == STATE_ENABLED) {
@@ -1266,10 +1240,8 @@ static ssize_t remote_ip_store(struct config_item *item, const char *buf,
 		goto out_unlock;
 	}
 
-	ipv6 = netpoll_parse_ip_addr(buf, &nt->remote_ip);
-	if (ipv6 == -1)
+	if (netpoll_parse_ip_addr(buf, &nt->remote_ip) < 0)
 		goto out_unlock;
-	nt->ipv6 = !!ipv6;
 
 	ret = count;
 out_unlock:
@@ -2078,7 +2050,7 @@ static void netpoll_udp_checksum(struct netconsole_target *nt,
 
 	/* check needs to be set, since it will be consumed in csum_partial */
 	udph->check = 0;
-	if (nt->ipv6)
+	if (nt->remote_ip.family == AF_INET6)
 		udph->check = csum_ipv6_magic(&nt->local_ip.in6,
 					      &nt->remote_ip.in6,
 					      udp_len, IPPROTO_UDP,
@@ -2119,7 +2091,7 @@ static void push_eth(struct netconsole_target *nt, struct sk_buff *skb)
 	skb_reset_mac_header(skb);
 	ether_addr_copy(eth->h_source, np->dev->dev_addr);
 	ether_addr_copy(eth->h_dest, nt->remote_mac);
-	if (nt->ipv6)
+	if (nt->remote_ip.family == AF_INET6)
 		eth->h_proto = htons(ETH_P_IPV6);
 	else
 		eth->h_proto = htons(ETH_P_IP);
@@ -2188,7 +2160,7 @@ static int netpoll_send_udp(struct netconsole_target *nt, const char *msg,
 		WARN_ON_ONCE(!irqs_disabled());
 
 	udp_len = len + sizeof(struct udphdr);
-	if (nt->ipv6)
+	if (nt->remote_ip.family == AF_INET6)
 		ip_len = udp_len + sizeof(struct ipv6hdr);
 	else
 		ip_len = udp_len + sizeof(struct iphdr);
@@ -2204,7 +2176,7 @@ static int netpoll_send_udp(struct netconsole_target *nt, const char *msg,
 	skb_put(skb, len);
 
 	push_udp(nt, skb, len);
-	if (nt->ipv6)
+	if (nt->remote_ip.family == AF_INET6)
 		push_ipv6(nt, skb, len);
 	else
 		push_ipv4(nt, skb, len);
@@ -2533,10 +2505,8 @@ __releases(&target_list_lock)
 static int netconsole_parser_cmdline(struct netconsole_target *nt, char *opt)
 {
 	struct netpoll *np = &nt->np;
-	bool ipversion_set = false;
 	char *cur = opt;
 	char *delim;
-	int ipv6;
 
 	if (*cur != '@') {
 		delim = strchr(cur, '@');
@@ -2550,16 +2520,12 @@ static int netconsole_parser_cmdline(struct netconsole_target *nt, char *opt)
 	cur++;
 
 	if (*cur != '/') {
-		ipversion_set = true;
 		delim = strchr(cur, '/');
 		if (!delim)
 			goto parse_failed;
 		*delim = 0;
-		ipv6 = netpoll_parse_ip_addr(cur, &nt->local_ip);
-		if (ipv6 < 0)
+		if (netpoll_parse_ip_addr(cur, &nt->local_ip) < 0)
 			goto parse_failed;
-		else
-			nt->ipv6 = (bool)ipv6;
 		cur = delim;
 	}
 	cur++;
@@ -2601,13 +2567,11 @@ static int netconsole_parser_cmdline(struct netconsole_target *nt, char *opt)
 	if (!delim)
 		goto parse_failed;
 	*delim = 0;
-	ipv6 = netpoll_parse_ip_addr(cur, &nt->remote_ip);
-	if (ipv6 < 0)
+	if (netpoll_parse_ip_addr(cur, &nt->remote_ip) < 0)
 		goto parse_failed;
-	else if (ipversion_set && nt->ipv6 != (bool)ipv6)
+	if (nt->local_ip.family != AF_UNSPEC &&
+	    nt->local_ip.family != nt->remote_ip.family)
 		goto parse_failed;
-	else
-		nt->ipv6 = (bool)ipv6;
 	cur = delim + 1;
 
 	if (*cur != 0) {

-- 
2.55.0

