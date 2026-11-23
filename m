Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795415773;
	b=TXzrW5L00FA8VJ1/b+bF+SN7pasWacf5FBOjp1bSGpkpX/V3PLq9yHRYYhC5g7azPRAG
	 mxlSY4xcVKLBqfgXoWQtpH9P7NszkNKr/BO10DHYCTsWYL+5UkLyBycWB7nbwF7qN2ave
	 nKZc4T30OR1x5qdHFBliMoGtMGd0881hDRhLtmHqN6SyrKX3yIzZC5xLCSmDXfk5d/fhb
	 tie//rsl9LDWTOYyzH7nbGtO3PMEKcnW2+Qr46F1BB1pyc9qK4CGqNrTFvDy4wH7VMRpp
	 7h0aMKC/AjREEBcYBR7TcHTh6w/hw5d1QSpHzfTLOW8KwzNyXVVRfhMB5LDS/nnVZzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795415773;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=BrBSPPpRxeUHkZ8Aspm71PBog/B6QtNxw8MB+kxwe5s=;
	b=bEej2z0rUkJ9IC1Zc8e8KTykmWLwvP4k+WkVNfFHE63RIIZlmEitGX14Yz2Dol0Ip89j
	 1rFyPZve+voviSE4TfCGqQcf7/loWfaudnhXAqngFlHZFMUeJ/Fy0jpo7xRLUDHC4ljBZ
	 rbpbLXlYyVhPM9PfHIaxby/cJSQb+Ud8YhMxX5ICnER1R7DYO/fOqfUdCtF/uKgmn/1Tq
	 +eIWHt1uECAHyrj6TJMm0Bnl9v9kRF1Nx7owAqeNM4t6053YoQlFX8vp75/0/K2xVcCYs
	 r7dAN+PPG60g6p8iSW0jrAtbRxEavDrZmvqW9KSSzpgbgYhPIQQ3BMWLMEus9jHjZjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--starchang.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ndf82j9A;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4162F606A31E
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 06:36:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4162F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--starchang.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ndf82j9A
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-55bf11583d9so3136533b6e.1
        for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 22:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795415772; x=1796020572; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BrBSPPpRxeUHkZ8Aspm71PBog/B6QtNxw8MB+kxwe5s=;
        b=ndf82j9AD419mQdAmC6YLQ7YDAJmogSheYNYRMMJyb1tGQ6Z3uKEVwr02fSesodckD
         u8a7mmizquPt/l6tI0UGe53paB0APeUL58w12k1NlcV1vT2F3Xr8a+RbUZe5mLoLt9qX
         wHA1jPpedn12bHqJvNAxCRVbrr9LhcBtczwB+BwN108APCiOWZxPLjYNeCOyoCAwQzpu
         QigWr6Ba/sT0Ys6laFaKXpsEAjd7RH0815FN8vJtgc9JSK9+h4IKsAJmsrI7rkrsAPYl
         XJJs+cW++2gS9pBKcc7CGypjxUmSn2c5lF9ucSf7KuYz8NTrfv/Y1HkbiqfzObQpFQ12
         47Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795415772; x=1796020572;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BrBSPPpRxeUHkZ8Aspm71PBog/B6QtNxw8MB+kxwe5s=;
        b=fycEv4dZrgSzFf7CTe45eRZ2WNEyoo8Oz9djZ5Z0QUYxjyuoXvnwbFZdNvvCG1vEwj
         9s0bPFV28D6XLH7I8qlcgTmd0XgmyKsztqXklGBS9MMMemlEJHZYK5tSgTrW4kqpwSXd
         9t23O1zWItyyV6QwzPOwLkOULxms4u5IplW6dUY4zn+mrsHl4+M/OEA+LblETsTdtizZ
         MW/ad+sti7212KgIsymedXpy9ghlr4wAd+QsrD4INAupTU7tWbLvMPNGYEC4XAQjDb/9
         x9pKEYgS9MSB9tiCLkN8rxelC3Q7aynaqC5lJlMgtIsYIcrIJhryrUYDa0hkjPzd0w+4
         hmoA==
X-Forwarded-Encrypted: i=1; AL+hErGlkenacYV8YBzoMdqug5SA0YMXZsXQ00S/WkaSOPuB1ZCYmfdji0zEUUO/2lsc+yXlBzNrJ8fAJrI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+v59AJelwb0aXoIhieP2W06CaDqZzHa0NToVPVzEXu8gbzHIzQ
	l6AjRw6XO+HARgkUq93Ug8bxFfylFhLFfYmZPyD5S219bddeKZZd0YFt4elQD7qTuuZKF66ZfKu
	XACSIlgFfWLpUSO4wGw==
X-Received: from oibdu15.prod.google.com ([2002:a05:6808:628f:b0:56d:b7b4:fabf])
 (user=starchang job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:199f:b0:568:2782:d1b4 with SMTP id 5614622812f47-57a0bd95bcemr8831086b6e.32.1795415771832;
 Sun, 22 Nov 2026 22:36:11 -0800 (PST)
Date: Mon, 23 Nov 2026 06:36:08 +0000
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
Message-ID: <20261123063608.3665186-1-starchang@google.com>
Subject: [PATCH net v6] arp: Do not update neighbours from ARP in L2
 multicast/broadcast frames
From: Star Chang <starchang@google.com>
To: "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>, David Ahern <dsahern@kernel.org>, 
	Ido Schimmel <idosch@nvidia.com>, Julian Anastasov <ja@ssi.bg>, Johannes Berg <johannes@sipsolutions.net>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, netdev@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, wangroger@google.com, 
	starchang@google.com
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

When drop_unicast_in_l2_multicast is set, do not pass ARP packets
received in L2 multicast/broadcast frames to neigh_event_ns() or
neigh_update(), so they can neither create nor change neighbour
entries. Requests for local and proxied addresses are still answered;
neighbours are learned from unicast replies to our own requests.

Fixes: 12b74dfadb5a ("ipv4: add option to drop unicast encapsulated in L2 multicast")
Suggested-by: Julian Anastasov <ja@ssi.bg>
Signed-off-by: Star Chang <starchang@google.com>
---
v6:
 - Instead of dropping L2 BMC ARP replies, skip neigh_event_ns() and
   neigh_update() for any ARP received in L2 BMC frames, which also
   covers broadcast requests with sip = gateway (Julian)
 - Drop the frame and release reply_dst on that path (Julian)
v5: https://lore.kernel.org/netdev/20261030031136.607720-1-starchang@google.com/
v4: https://lore.kernel.org/netdev/20261027015619.1745984-1-starchang@google.com/
v3: https://lore.kernel.org/netdev/20261026150539.1357037-1-starchang@google.com/

 Documentation/networking/ip-sysctl.rst |  4 ++-
 net/ipv4/arp.c                         | 38 +++++++++++++++++++-------
 2 files changed, 31 insertions(+), 11 deletions(-)

diff --git a/Documentation/networking/ip-sysctl.rst b/Documentation/networking/ip-sysctl.rst
index 208f46967ee5..d603588266b4 100644
--- a/Documentation/networking/ip-sysctl.rst
+++ b/Documentation/networking/ip-sysctl.rst
@@ -2298,7 +2298,9 @@ promote_secondaries - BOOLEAN
 
 drop_unicast_in_l2_multicast - BOOLEAN
 	Drop any unicast IP packets that are received in link-layer
-	multicast (or broadcast) frames.
+	multicast (or broadcast) frames. ARP packets received in such
+	frames are not used to create or update neighbour entries,
+	but ARP requests for local addresses are still answered.
 
 	This behavior (for multicast) is actually a SHOULD in RFC
 	1122, but is disabled by default for compatibility reasons.
diff --git a/net/ipv4/arp.c b/net/ipv4/arp.c
index d409f606aec0..17b5f32736aa 100644
--- a/net/ipv4/arp.c
+++ b/net/ipv4/arp.c
@@ -714,6 +714,7 @@ static int arp_process(struct net *net, struct sock *sk, struct sk_buff *skb)
 	struct neighbour *n;
 	struct dst_entry *reply_dst = NULL;
 	bool is_garp = false;
+	bool bmc_no_learn;
 
 	/* arp_rcv below verifies the ARP header and verifies the device
 	 * is ARP'able.
@@ -791,6 +792,10 @@ static int arp_process(struct net *net, struct sock *sk, struct sk_buff *skb)
 	    (!IN_DEV_ROUTE_LOCALNET(in_dev) && ipv4_is_loopback(tip)))
 		goto out_free_skb;
 
+	bmc_no_learn = (skb->pkt_type == PACKET_BROADCAST ||
+			   skb->pkt_type == PACKET_MULTICAST) &&
+			  IN_DEV_ORCONF(in_dev, DROP_UNICAST_IN_L2_MULTICAST);
+
  /*
   *	For some 802.11 wireless deployments (and possibly other networks),
   *	there will be an ARP proxy and gratuitous ARP frames are attacks
@@ -850,14 +855,19 @@ static int arp_process(struct net *net, struct sock *sk, struct sk_buff *skb)
 			if (!dont_send && IN_DEV_ARPFILTER(in_dev))
 				dont_send = arp_filter(sip, tip, dev);
 			if (!dont_send) {
-				n = neigh_event_ns(&arp_tbl, sha, &sip, dev);
-				if (n) {
-					arp_send_dst(ARPOP_REPLY, ETH_P_ARP,
-						     sip, dev, tip, sha,
-						     dev->dev_addr, sha,
-						     reply_dst);
-					neigh_release(n);
+				n = NULL;
+				/* Do not learn the sender from a BMC frame */
+				if (!bmc_no_learn) {
+					n = neigh_event_ns(&arp_tbl, sha, &sip, dev);
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
@@ -866,9 +876,11 @@ static int arp_process(struct net *net, struct sock *sk, struct sk_buff *skb)
 			     arp_fwd_pvlan(in_dev, dev, rt, sip, tip) ||
 			     (rt->dst.dev != dev &&
 			      pneigh_lookup(&arp_tbl, net, &tip, dev)))) {
-				n = neigh_event_ns(&arp_tbl, sha, &sip, dev);
-				if (n)
-					neigh_release(n);
+				if (!bmc_no_learn) {
+					n = neigh_event_ns(&arp_tbl, sha, &sip, dev);
+					if (n)
+						neigh_release(n);
+				}
 
 				if (NEIGH_CB(skb)->flags & LOCALLY_ENQUEUED ||
 				    skb->pkt_type == PACKET_HOST ||
@@ -887,6 +899,10 @@ static int arp_process(struct net *net, struct sock *sk, struct sk_buff *skb)
 		}
 	}
 
+	/* ARP received in L2 BMC frames must not change the neighbour table */
+	if (bmc_no_learn)
+		goto out_drop_dst;
+
 	/* Update our ARP tables */
 
 	n = __neigh_lookup(&arp_tbl, &sip, dev, 0);
@@ -945,6 +961,8 @@ static int arp_process(struct net *net, struct sock *sk, struct sk_buff *skb)
 	dst_release(reply_dst);
 	return NET_RX_SUCCESS;
 
+out_drop_dst:
+	dst_release(reply_dst);
 out_free_skb:
 	kfree_skb(skb);
 	return NET_RX_DROP;
-- 
2.56.1.750.gf70dc682cf-goog

