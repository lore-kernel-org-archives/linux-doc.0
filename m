Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445140;
	b=k1Bl7YQXaTZPZY2j8q87lp6Z1XjtonoCOTks1hTWs6AoXxNG1tLL9/2SNHmK0mNGPhXi
	 Fx5bm4JSbTdq1A9VDHVHdZ6kW10d4edTm6KXEkcPBH4hNqI4HhqlfQUm4V8Epz0xk8OwS
	 HL0jIKj7wh0HYfidAP24/2VOID0jMqf3QuJJ6UDVVEcmnae31s48fvzd4/OK5HOHahWUK
	 Ybenl45SQ8OME9QxNTzHh07If0NaSWGA9Q1htRjRCUk/Tig0rcUnXHR0sscdPoG0j07vN
	 68GaiQMftp2RMuV+tgJF5auyLONbL+D8maJ/yTBtkUXsEd5Lh5q5wN7xbd3RBLopFQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445140;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=HgymT9X4GLVCIEw/A5amCe6qZlzOlDVRvVwfoXilmPY=;
	b=AI+h80dfLPt4qdefdciIcTdvcCOhBencbuD0LFS5+8jVe0PHpGmFKYCXR9K+9+qlyD63
	 CG2ceRdIqUhA11SOlvO+s1vv4hoOaIW+z6biBVhWFyewMfkodB7l+LdlcPi4x182AIZsV
	 +mB3CMPps4xCYXlUIsfdBCjlQjuyDMBVgxvQm8YjITvBCNAYI/SeaIte+8hanWiDzf5ZM
	 JyZ70Bxxph4MgDq+pz7uDjrYDezzLDgJvcxwp4Fx/Nd7fRSUDSZ3ibS2gjry3Zmzsz+pZ
	 +PoshKEsK4uJ/55BdRnewl1n0i6Nz1vrY9k6yD6u2+0hElFmjjmY4mprYnJp7wIIKNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--starchang.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZIHYubhv;
	arc=none smtp.remote-ip=209.85.210.197
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92313606A32D
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 14:45:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92313606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--starchang.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZIHYubhv
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a59717b0c0so2405238b3a.3
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 06:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795445139; x=1796049939; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HgymT9X4GLVCIEw/A5amCe6qZlzOlDVRvVwfoXilmPY=;
        b=ZIHYubhvLp+vswPrauUvTV78Che5NPhf+XNJK5EgPL25dhbOPx5W4Fp83LqTdXDwOs
         r+wefDmK25nWYKSlI5gID5ptgCb3yj12S4Od2NVNgFpqdFYTMWvJ6+akALEWgvGCvQZg
         uVZ5CBJezmnF5d6Y7pz3XWfWqQwdS4hTua4q8xSjRsCxf9kYAt676D4USV5cg4X9WxQF
         MelaPYhufjjLau6KH3IVjZheiHIn1VBbKPZfDR+uSHeCykp3YnDBnAILarAswKiChS4r
         vwu2y4nqgNaIhK9GQYptHc8CrL4/Ktln1/rdfYaLeBZJ2gZuF5/GiDGHP36m2g/djVvb
         4nnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445139; x=1796049939;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HgymT9X4GLVCIEw/A5amCe6qZlzOlDVRvVwfoXilmPY=;
        b=B0Av9qXf54+OnIXeHA2flNbgZomsACao54Sx3+fXHWaHRwJcdxeQsLFfvopoW6gpZE
         WAClZj/v4ElIWzvDJSCiVIVlMLHUo1Da5z8ocvwGWe5bIDas8sL77kgvxNyBu6X3CEJT
         KsDhGcwdVFO2HWdYJIej2xtRXdPXdQVx0Oiepd8MvHcH8RJIb13piXN29rcjqH9E0h4S
         2of+NskZtPo15Nd3ZaEx3ekF/TI4MfdIBsksmnqetv0FgemgLPqADppfUaEPCKQobNUw
         am86pk2536k7vLYtOEdVTV+4x3aB2OMbPghA5CzeycmXMyck5vcTVjPr7aFj1fqEFUvJ
         VAGA==
X-Forwarded-Encrypted: i=1; AL+hErFY6xoLg+VeY7FKXDzSBIDJuL/yTSPHbqTYq+mq/0dM/lxJPqaw+tP1CIoHCTXeTz1NSn4XnqQiqhE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/J5kQIs7gu8tTPjjy0u4NFuH9IDzfb/MjXK0G7yi731gw6subY
	gcwlnQ6HMFrVe7zTa24V7C0Zqzob9NdeVjBfK1WVkPOZdjHjV3BennxMWZz5uNjcLUEg2y2yPjM
	1z8cGZJ5SzyuL9dNs8w==
X-Received: from pfbw1.prod.google.com ([2002:a05:6a00:b481:b0:88b:8b90:725d])
 (user=starchang job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6300:8052:b0:3e2:827c:2fe2 with SMTP id adf61e73a8af0-4014a470489mr10760040637.1.1795445138722;
 Mon, 23 Nov 2026 06:45:38 -0800 (PST)
Date: Mon, 23 Nov 2026 14:45:35 +0000
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261123144535.155300-1-starchang@google.com>
Subject: [PATCH net v7] arp: Do not update neighbours from ARP in L2
 multicast/broadcast frames
From: Star Chang <starchang@google.com>
To: "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Willem de Bruijn <willemb@google.com>, Simon Horman <horms@kernel.org>, 
	David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, Julian Anastasov <ja@ssi.bg>, 
	Johannes Berg <johannes@sipsolutions.net>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, wangroger@google.com, starchang@google.com
Content-Type: text/plain; charset="UTF-8"

The drop_unicast_in_l2_multicast sysctl drops unicast IP packets that
are received in link-layer multicast or broadcast frames. On Wi-Fi this
protects against the "Hole-196" attack, where any station that knows
the group key injects frames as group-addressed traffic.

ARP is not covered. A broadcast ARP request or reply with sip set to
the gateway address and sha set to the attacker MAC still creates or
updates the gateway neighbour entry, so the attacker can poison the
ARP cache of other stations. ARP requests are legitimately broadcast
and cannot be dropped, and drop_gratuitous_arp only catches sip == tip.

This was found in an internal security review and reproduced in a lab
on a WPA2-PSK network: a group-addressed ARP reply injected by another
station changed the victim's gateway neighbour entry to the attacker
MAC. There are no kernel messages, only the wrong neighbour entry.

When drop_unicast_in_l2_multicast is set, do not pass ARP packets
received in L2 multicast/broadcast frames to neigh_event_ns() or
neigh_update(), so they can neither create nor change neighbour
entries. Requests for local and proxied addresses are still answered;
neighbours are learned from unicast replies to our own requests.

Fixes: 12b74dfadb5a ("ipv4: add option to drop unicast encapsulated in L2 multicast")
Suggested-by: Julian Anastasov <ja@ssi.bg>
Signed-off-by: Star Chang <starchang@google.com>
---
v7:
 - Rebase on net, arp_process() changed (Julian)
 - Add an empty line before out_free_skb (Julian)
 - Mention how the issue was found in the commit message
v6: https://lore.kernel.org/netdev/20261123063608.3665186-1-starchang@google.com/
 - Instead of dropping L2 BMC ARP replies, skip neigh_event_ns() and
   neigh_update() for any ARP received in L2 BMC frames, which also
   covers broadcast requests with sip = gateway (Julian)
 - Drop the frame and release reply_dst on that path (Julian)
v5: https://lore.kernel.org/netdev/20261030031136.607720-1-starchang@google.com/
v4: https://lore.kernel.org/netdev/20261027015619.1745984-1-starchang@google.com/
v3: https://lore.kernel.org/netdev/20261026150539.1357037-1-starchang@google.com/

 Documentation/networking/ip-sysctl.rst |  4 ++-
 net/ipv4/arp.c                         | 39 +++++++++++++++++++-------
 2 files changed, 32 insertions(+), 11 deletions(-)

diff --git a/Documentation/networking/ip-sysctl.rst b/Documentation/networking/ip-sysctl.rst
index d3523c9064a2..fd2ffb2d2812 100644
--- a/Documentation/networking/ip-sysctl.rst
+++ b/Documentation/networking/ip-sysctl.rst
@@ -2302,7 +2302,9 @@ promote_secondaries - BOOLEAN
 
 drop_unicast_in_l2_multicast - BOOLEAN
 	Drop any unicast IP packets that are received in link-layer
-	multicast (or broadcast) frames.
+	multicast (or broadcast) frames. ARP packets received in such
+	frames are not used to create or update neighbour entries,
+	but ARP requests for local addresses are still answered.
 
 	This behavior (for multicast) is actually a SHOULD in RFC
 	1122, but is disabled by default for compatibility reasons.
diff --git a/net/ipv4/arp.c b/net/ipv4/arp.c
index 3bc8db6ccd68..cc69ea07fc2d 100644
--- a/net/ipv4/arp.c
+++ b/net/ipv4/arp.c
@@ -715,6 +715,7 @@ static int arp_process(struct net *net, struct sock *sk, struct sk_buff *skb)
 	struct neighbour *n;
 	struct arphdr *arp;
 	struct rtable *rt;
+	bool bmc_no_learn;
 	__be32 sip, tip;
 	int addr_type;
 
@@ -794,6 +795,10 @@ static int arp_process(struct net *net, struct sock *sk, struct sk_buff *skb)
 	    (!IN_DEV_ROUTE_LOCALNET(in_dev) && ipv4_is_loopback(tip)))
 		goto out_free_skb;
 
+	bmc_no_learn = (skb->pkt_type == PACKET_BROADCAST ||
+			skb->pkt_type == PACKET_MULTICAST) &&
+		       IN_DEV_ORCONF(in_dev, DROP_UNICAST_IN_L2_MULTICAST);
+
  /*
   *	For some 802.11 wireless deployments (and possibly other networks),
   *	there will be an ARP proxy and gratuitous ARP frames are attacks
@@ -853,14 +858,19 @@ static int arp_process(struct net *net, struct sock *sk, struct sk_buff *skb)
 			if (!dont_send && IN_DEV_ARPFILTER(in_dev))
 				dont_send = arp_filter(sip, tip, dev);
 			if (!dont_send) {
-				n = neigh_event_ns(tbl, sha, &sip, dev);
-				if (n) {
-					arp_send_dst(ARPOP_REPLY, ETH_P_ARP,
-						     sip, dev, tip, sha,
-						     dev->dev_addr, sha,
-						     reply_dst);
-					neigh_release(n);
+				n = NULL;
+				/* Do not learn the sender from a BMC frame */
+				if (!bmc_no_learn) {
+					n = neigh_event_ns(tbl, sha, &sip, dev);
+					if (!n)
+						goto out_consume_skb;
 				}
+				arp_send_dst(ARPOP_REPLY, ETH_P_ARP,
+					     sip, dev, tip, sha,
+					     dev->dev_addr, sha,
+					     reply_dst);
+				if (n)
+					neigh_release(n);
 			}
 			goto out_consume_skb;
 		} else if (IN_DEV_FORWARD(in_dev)) {
@@ -869,9 +879,11 @@ static int arp_process(struct net *net, struct sock *sk, struct sk_buff *skb)
 			     arp_fwd_pvlan(in_dev, dev, rt, sip, tip) ||
 			     (rt->dst.dev != dev &&
 			      pneigh_lookup(tbl, &tip, dev)))) {
-				n = neigh_event_ns(tbl, sha, &sip, dev);
-				if (n)
-					neigh_release(n);
+				if (!bmc_no_learn) {
+					n = neigh_event_ns(tbl, sha, &sip, dev);
+					if (n)
+						neigh_release(n);
+				}
 
 				if (NEIGH_CB(skb)->flags & LOCALLY_ENQUEUED ||
 				    skb->pkt_type == PACKET_HOST ||
@@ -890,6 +902,10 @@ static int arp_process(struct net *net, struct sock *sk, struct sk_buff *skb)
 		}
 	}
 
+	/* ARP received in L2 BMC frames must not change the neighbour table */
+	if (bmc_no_learn)
+		goto out_drop_dst;
+
 	/* Update our ARP tables */
 
 	n = ipv4_neigh_lookup(dev, &sip);
@@ -953,6 +969,9 @@ static int arp_process(struct net *net, struct sock *sk, struct sk_buff *skb)
 	dst_release(reply_dst);
 	return NET_RX_SUCCESS;
 
+out_drop_dst:
+	dst_release(reply_dst);
+
 out_free_skb:
 	kfree_skb(skb);
 	return NET_RX_DROP;
-- 
2.56.1.750.gf70dc682cf-goog

