Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794868003;
	b=V5+CQZUOnRB1AIda9SpuUN1P/ixmNUOMEqmT3dvxMxOySCaQpO/VjF0sldjZcJ4BpzAm
	 caoSoCw05n/10TD7SP/8kzvS0CjpqcQ5j8qcD07BtWmB2FaUG7N872EIHx71lvbKyIojE
	 I2sLeXAviMaVxhJVelw2CnA2LSYSIwGqFW7zFx7gS8o1u2/U/sJFK66p+4QCntkxm8i8G
	 Vbi1y8rxqJlgQmS1f3dx/4NEHXjpYzuHH6/XlPnzV2hykdU9Ia8j5CMjkcRkcyIYs3iOq
	 J7uz2zIwyM4+yeSRfv+ju2ug5JIBckXQ6taWkuyWC6Y3/WXEDiaq5aPeAlsfSFY308g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794868003;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=42NWJDQZ2EtkvUcsZu/X6ZQPyfzCVmcoYq5gbzwq5uY=;
	b=LjWb+t3k2g7IXh5WmpUlZZj8746DNQi7hpQl3fTAM7KVhMUx3srKo3eEZJbsUeaYQmky
	 r7FLt0ICl5ZKejzdKozzMklwNhI5HG78wBrnlTA3ndI0+TBtEoQ9ZPTEB9/0F0XWCcvVA
	 oCI0NpFty+rem6rLdlxN/xjiwNb888zUeULxwpYMxxv1hb9A26eaWh6hHBffHUvukzJhj
	 mTxUiW6MwGTFMSg4GOO3uWSdTjFQNN5kigmLh+g3CZbPqs6CwS8rykRy61YUeyuUOBf9Q
	 itWKigE0+61dRUYwgKIZSkv554/tBuqa/ciZYL2hDrOWQEfLWL3H07HaWcc+4FqhcyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=g1b55Vy4;
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810DE606A8AF
	for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 22:26:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 810DE606A8AF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=g1b55Vy4
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3ace1f3897cso2198058a91.0
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 14:26:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794868001; x=1795472801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=42NWJDQZ2EtkvUcsZu/X6ZQPyfzCVmcoYq5gbzwq5uY=;
        b=HP/5TSHitX48fsrmZlrmzCygrX0Eq9bsQbuOBrZVpuE/dbuRNSwjjV6cYjZHgToxGC
         WHaKMSji/spn/Smr2s8z1qzgqj/AswTDGCQC5F2mXxSYTEkhGRvcFiRYxrrR2dLNzv35
         QvevPxxtN4YR0hxQnUgRw5v9jFwEA2skj/bzHPV22C9rP8l2qL6qxeVY8KpgOaZDieh6
         hEn0Oom1E7wPfi05/0yXgovmunkZRt8uzj8ZwTLYi7F3oaC4p22xAQRduVQuNQoRnUvO
         LrJElksDLGEf2Y7oqOKDkYwzQdpZvkLhAxhfIObmjtSpuDCRgqalSblQnPt33dRdbaob
         QI0Q==
X-Forwarded-Encrypted: i=1; AL+hErHswTDNS9mGezANZ+hNV/uVT2W85H4HW0ZcK0cZ28dFco6gFgulbKKNhiHgEAXDHMPZB5wuaZzB6yM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+2y5JfvM5HGXDFc+F3+2odKGgfQwUO2JpfnIdAxiWybtuU4wQs
	tB3Iw6oFrgTx01S+Yb8oWgTCzOGm+ocq/TbQUZDUMeJsq7541g7m8a9p5GISerEnqsp6skvLJgI
	WSlq3ZrwXlou2lEE0grPZvWFlgVd44+8TiTZJNH7NUtZP7UMVqNFVD9dQL9lnpgBEdkLzNsqDQj
	n8TCRsm3LsxiXe65uep2sxg2aJoJGMOwxfGByJ7qnCeSp6dOBAMOGoQvGFFmeBnWtCSLzb+TSuW
	5i67R42zvpbG/T8ITIF
X-Gm-Gg: AZFdTZeIOeab52IIwG9Vm2IRvvUXyZg6VZEEAmKXjqcYYiaovzQSqS1+J6QWxKKl5cG
	xGE8F71DxNSyFO3cxubpmbaEOZgNGkLRcH8y51/536x7naNTOt5aqEP+X9wHuD3BovUxkTp0FZN
	qNdxMrH5t3sbkUYdFeOX+tuVQqliC1Zz6IH4/xTt94mtYV+33opYaVbO7Pudv7yph6DYayFwGFJ
	fcSgDKCxBFZegsEgx8MXj7DRac5K2unNu/i6htdQSf513uY4q9MVZPzpPM6v7bGZFbGCWkdOq8T
	/zE/JA/DQFLPPOepnyFiqYg2+PZYoJeHfSPC3vkPWnRFCka8Lc7pXRr7/67K9LdIliSl8PtK14n
	9WGB9MzGxdVjSsjGlfsvDV2/HabW41waEzcURSDbUvGBtg4H+O88lgi6mjg1MFScSlFLo+bpP3d
	Bjp1uV+FQIx4P91nmnGHKVXFORMADtdwWQMiNk++dy
X-Received: by 2002:a17:90b:2e83:b0:3ab:b764:826c with SMTP id 98e67ed59e1d1-3b1b0a1f097mr12360866a91.12.1794868000629;
        Mon, 16 Nov 2026 14:26:40 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 41be03b00d2f7-cdded5aaa8esm59991a12.11.2026.11.16.14.26.39
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 14:26:40 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36f479b9819so2242736eec.1
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 14:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794867998; x=1795472798; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=42NWJDQZ2EtkvUcsZu/X6ZQPyfzCVmcoYq5gbzwq5uY=;
        b=g1b55Vy4GK1Siewxd/rgDAzsV5Q/ROCAgEryWCDkR8jpb7VrUTnU6kopTt1lWtahnY
         bQj7vzSoxUJs4aq+yGyfW9qO37Ir0yn+nseFdypXis2KsN+Li1rktx53wOfmdGCAtjvr
         aTXjWRJ0UCP1SQ3uIMeyuJZD7LvnjMRemvq4Q=
X-Forwarded-Encrypted: i=1; AL+hErFkaOQOuGIwt6Qw6cJ8lbd27W1IipU3KJQ3Mb/iPE0NQ0SI5bLfqIZEEwMkKTuabDvBhf5TBUEU0Rg=@vger.kernel.org
X-Received: by 2002:a05:7301:5401:b0:35c:8b96:94d9 with SMTP id 5a478bee46e88-37966f31fddmr10107863eec.19.1794867997680;
        Mon, 16 Nov 2026 14:26:37 -0800 (PST)
X-Received: by 2002:a05:7301:5401:b0:35c:8b96:94d9 with SMTP id 5a478bee46e88-37966f31fddmr10107844eec.19.1794867996950;
        Mon, 16 Nov 2026 14:26:36 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm50176624eec.19.2026.11.16.14.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 14:26:35 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	netfilter-devel@vger.kernel.org (open list:NETFILTER),
	coreteam@netfilter.org (open list:NETFILTER)
Subject: [PATCH net-next 6/9] net: flow_offload: allow drivers to validate and invalidate cached paths
Date: Mon, 16 Nov 2026 14:25:16 -0800
Message-ID: <20261116222519.1416501-7-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116222519.1416501-1-florian.fainelli@broadcom.com>
References: <20261116222519.1416501-1-florian.fainelli@broadcom.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

A classifier does not necessarily contain the mark, DSCP and output-
interface inputs used to select its forwarding path. A partial driver
FIB lookup cannot establish that a cached software route is stale.

Provide optional owner validation and invalidation callbacks. Validation
runs under RCU without sleeping and distinguishes a proven stale path
from unavailable context. Retain direct-path dst references for hardware
flowtables and validate the actual cached routes, cookies and direct
Ethernet neighbours in both directions on demand.

Mark references retained only for driver validation. They must not opt
plain direct flows into packet-path or GC route checks after unrelated
IPv4 generation changes. Keep the existing checks for direct tunnel,
neighbour and XFRM routes. The explicit owner callback bypasses that
policy and validates the retained dst itself. Other hardware users and
tables without a validating driver keep their existing automatic-check
behaviour. Software-only direct flows retain their previous reference
policy. Release retained references with the flow.

Netfilter implements invalidation by marking the owning connection for
teardown. Owners keep cookies valid through an RCU grace period after
DESTROY; drivers stop issuing notifications when their rules are
destroyed.

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 include/net/flow_offload.h            | 12 ++++++
 include/net/netfilter/nf_flow_table.h |  8 ++--
 net/netfilter/nf_flow_table_core.c    | 12 +++---
 net/netfilter/nf_flow_table_offload.c | 58 +++++++++++++++++++++++++++
 net/netfilter/nft_flow_offload.c      |  6 ++-
 5 files changed, 87 insertions(+), 9 deletions(-)

diff --git a/include/net/flow_offload.h b/include/net/flow_offload.h
index 70a02ee14308..09301a924014 100644
--- a/include/net/flow_offload.h
+++ b/include/net/flow_offload.h
@@ -697,6 +697,18 @@ struct flow_cls_offload {
 	bool use_act_stats;
 	unsigned long cookie;
 	struct flow_rule *rule;
+	/* Optional owner notification when a rule no longer represents the path.
+	 * Call under RCU; the owner retains the cookie and callback until a
+	 * grace period after DESTROY. Drivers must stop new calls at DESTROY.
+	 * The callback must not sleep or call back into the offload driver.
+	 */
+	void (*invalidate)(unsigned long cookie);
+	/* Optional cached-path validation, called under RCU during REPLACE.
+	 * Return 0 for a valid path, -ESTALE for a demonstrably stale path,
+	 * or -EOPNOTSUPP when validation is unavailable. Do not sleep or
+	 * call back into the driver. The callback does not invalidate its owner.
+	 */
+	int (*validate)(unsigned long cookie);
 	struct flow_stats stats;
 	u32 classid;
 };
diff --git a/include/net/netfilter/nf_flow_table.h b/include/net/netfilter/nf_flow_table.h
index 5b22d31cb140..99cb087ff0b2 100644
--- a/include/net/netfilter/nf_flow_table.h
+++ b/include/net/netfilter/nf_flow_table.h
@@ -154,7 +154,8 @@ struct flow_offload_tuple {
 					encap_num:2,
 					needs_gso_segment:1,
 					tun_num:2,
-					in_vlan_ingress:2;
+					in_vlan_ingress:2,
+					dst_validation_only:1;
 	u16				mtu;
 	u32				dst_cookie;
 	struct dst_entry		*dst_cache;
@@ -305,7 +306,7 @@ nf_flow_table_offload_del_cb(struct nf_flowtable *flow_table,
 }
 
 void flow_offload_route_init(struct flow_offload *flow,
-			     struct nf_flow_route *route);
+			     struct nf_flow_route *route, bool keep_dst);
 
 int flow_offload_add(struct nf_flowtable *flow_table, struct flow_offload *flow);
 void flow_offload_refresh(struct nf_flowtable *flow_table,
@@ -313,7 +314,8 @@ void flow_offload_refresh(struct nf_flowtable *flow_table,
 
 static inline bool nf_flow_dst_check(struct flow_offload_tuple *tuple)
 {
-	if (!tuple->dst_cache)
+	/* A driver-only reference must not change direct-path/GC semantics. */
+	if (!tuple->dst_cache || tuple->dst_validation_only)
 		return true;
 
 	return dst_check(tuple->dst_cache, tuple->dst_cookie);
diff --git a/net/netfilter/nf_flow_table_core.c b/net/netfilter/nf_flow_table_core.c
index 4c82097cd50b..b16a336101af 100644
--- a/net/netfilter/nf_flow_table_core.c
+++ b/net/netfilter/nf_flow_table_core.c
@@ -96,7 +96,7 @@ static struct dst_entry *nft_route_dst_fetch(struct nf_flow_route *route,
 
 static int flow_offload_fill_route(struct flow_offload *flow,
 				   struct nf_flow_route *route,
-				   enum flow_offload_tuple_dir dir)
+				   enum flow_offload_tuple_dir dir, bool keep_dst)
 {
 	struct flow_offload_tuple *flow_tuple = &flow->tuplehash[dir].tuple;
 	struct dst_entry *dst = nft_route_dst_fetch(route, dir);
@@ -127,7 +127,9 @@ static int flow_offload_fill_route(struct flow_offload *flow,
 
 	switch (route->tuple[dir].xmit_type) {
 	case FLOW_OFFLOAD_XMIT_DIRECT:
-		if (route->tuple[!dir].in.num_tuns) {
+		flow_tuple->dst_validation_only = keep_dst &&
+			!route->tuple[!dir].in.num_tuns;
+		if (keep_dst || route->tuple[!dir].in.num_tuns) {
 			flow_tuple->dst_cache = dst;
 			flow_tuple->dst_cookie =
 				flow_offload_dst_cookie(flow_tuple);
@@ -162,10 +164,10 @@ static void nft_flow_dst_release(struct flow_offload *flow,
 }
 
 void flow_offload_route_init(struct flow_offload *flow,
-			     struct nf_flow_route *route)
+			     struct nf_flow_route *route, bool keep_dst)
 {
-	flow_offload_fill_route(flow, route, FLOW_OFFLOAD_DIR_ORIGINAL);
-	flow_offload_fill_route(flow, route, FLOW_OFFLOAD_DIR_REPLY);
+	flow_offload_fill_route(flow, route, FLOW_OFFLOAD_DIR_ORIGINAL, keep_dst);
+	flow_offload_fill_route(flow, route, FLOW_OFFLOAD_DIR_REPLY, keep_dst);
 	flow->type = NF_FLOW_OFFLOAD_ROUTE;
 }
 EXPORT_SYMBOL_GPL(flow_offload_route_init);
diff --git a/net/netfilter/nf_flow_table_offload.c b/net/netfilter/nf_flow_table_offload.c
index 4365859220e6..1f3adf70f598 100644
--- a/net/netfilter/nf_flow_table_offload.c
+++ b/net/netfilter/nf_flow_table_offload.c
@@ -885,6 +885,62 @@ static int nf_flow_offload_alloc(const struct flow_offload_work *offload,
 	return 0;
 }
 
+static struct flow_offload *nf_flow_offload_cookie_flow(unsigned long cookie)
+{
+	struct flow_offload_tuple *tuple = (struct flow_offload_tuple *)cookie;
+	struct flow_offload_tuple_rhash *tuplehash;
+	struct flow_offload *flow;
+
+	tuplehash = container_of(tuple, struct flow_offload_tuple_rhash, tuple);
+	flow = container_of(tuplehash, struct flow_offload, tuplehash[tuple->dir]);
+	return flow;
+}
+
+static void nf_flow_offload_invalidate(unsigned long cookie)
+{
+	flow_offload_teardown(nf_flow_offload_cookie_flow(cookie));
+}
+
+static int nf_flow_offload_validate(unsigned long cookie)
+{
+	struct flow_offload *flow = nf_flow_offload_cookie_flow(cookie);
+	unsigned int dir;
+
+	for (dir = 0; dir < FLOW_OFFLOAD_DIR_MAX; dir++) {
+		struct flow_offload_tuple *tuple = &flow->tuplehash[dir].tuple;
+		struct flow_offload_tuple *other = &flow->tuplehash[!dir].tuple;
+		struct dst_entry *dst = tuple->dst_cache;
+		struct neighbour *neigh;
+		u8 mac[ETH_ALEN];
+		bool valid;
+
+		if (!dst)
+			return -EOPNOTSUPP;
+		/* This is the actual route selected with the packet's policy
+		 * context, including mark, DSCP and the reverse lookup's oif.
+		 */
+		if (!dst_check(dst, tuple->dst_cookie))
+			return -ESTALE;
+		if (tuple->xmit_type != FLOW_OFFLOAD_XMIT_DIRECT)
+			continue;
+		/* A stacked path may have a different final Ethernet neighbour.
+		 * Do not mistake that unsupported context for a stale owner.
+		 */
+		if (dst->dev->ifindex != tuple->out.ifidx)
+			return -EOPNOTSUPP;
+		neigh = dst_neigh_lookup(dst, &other->src_v4);
+		if (!neigh)
+			return -ESTALE;
+		neigh_ha_snapshot(mac, neigh, dst->dev);
+		valid = (READ_ONCE(neigh->nud_state) & NUD_VALID) &&
+			ether_addr_equal(mac, tuple->out.h_dest);
+		neigh_release(neigh);
+		if (!valid)
+			return -ESTALE;
+	}
+	return 0;
+}
+
 static void nf_flow_offload_init(struct flow_cls_offload *cls_flow,
 				 __be16 proto, int priority,
 				 enum flow_cls_command cmd,
@@ -896,6 +952,8 @@ static void nf_flow_offload_init(struct flow_cls_offload *cls_flow,
 	cls_flow->common.extack = extack;
 	cls_flow->command = cmd;
 	cls_flow->cookie = (unsigned long)tuple;
+	cls_flow->invalidate = nf_flow_offload_invalidate;
+	cls_flow->validate = nf_flow_offload_validate;
 }
 
 static int nf_flow_offload_tuple(struct nf_flowtable *flowtable,
diff --git a/net/netfilter/nft_flow_offload.c b/net/netfilter/nft_flow_offload.c
index d3c5651dd699..05207ca808ee 100644
--- a/net/netfilter/nft_flow_offload.c
+++ b/net/netfilter/nft_flow_offload.c
@@ -113,7 +113,11 @@ static void nft_flow_offload_eval(const struct nft_expr *expr,
 	if (!flow)
 		goto err_flow_alloc;
 
-	flow_offload_route_init(flow, &route);
+	/* Hardware admission may validate the route used to build a direct path.
+	 * Keep its reference and cookie instead of reconstructing a lookup with
+	 * incomplete policy-routing inputs in the driver.
+	 */
+	flow_offload_route_init(flow, &route, nf_flowtable_hw_offload(flowtable));
 	if (tcph)
 		flow_offload_ct_tcp(ct);
 
-- 
2.53.0

