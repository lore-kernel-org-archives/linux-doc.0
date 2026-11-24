Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.238.174.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795527991;
	b=P/nOZV0ZBg6XL9n5BQL+/RPCc+DQZxvi4R+FZN8CLbU5qJc7zMoi8AM4Vq+cIHvwohFc
	 Pse81k5GCuBJ896jvCojVUJ3bRHsPwAa20v71wz6hWXwb9sr+QOL8wU1eTdtR8YIh7Piu
	 2+oveB9I2+2NFqu8cfV2Ta3xxQonPTkAOtxdaKggNdTQ4wCMbqpAmsY1/xPRtzOuhTbnV
	 5KF6BvlddlEnaRWvUL5PXvaIswDOHq7Q40aOaH3eLQMlrSsMeHR+I/f2XKRc8dnT06kwz
	 VKLZ9Q2kMRQbu+SDufH9x2C75nqIMmjZEKMdX2hGJUEXHgBZ7XUp6M0C8W5wlKwGYmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795527991;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:Date:
	 From:To:cc:Subject:In-Reply-To:Message-ID:References:MIME-Version:
	 Content-Type;
	bh=ZiUQPSPqBbX0yaOGXpiqmIhuEj+1E9hKrqAwIjuoBrI=;
	b=BQT4vCNm1nMFzzHf4rIvfM+P/NL2AKz1SybqW2QYM1t9sHwOw+9/zYFy2/9m9FiEBPr1
	 EbvaIdhzUtInsN1FmgLVXPBslnWf4ezjSM1NGlO3IcZoQoGZn85IkKgwZuEf1MMXaQwDO
	 BNqJoU4AIUhLmtUCiBmQv9aUnnNi9FPZhVs7Qrcq4M00TM0xU7sDMfOh8BeelnHsZwnLr
	 hmJYoHCH2hBGweNxBrnpngqLDHZfVJju8UIld/32zxadbKRX2OetXAw8/xbp6AeDihUe8
	 HDodNFeLCAoinTgdX1XI+Yarde+z0Yn/FQ8Ud/xdhr1PgJQ6OdktuYFncEPnfh4A7/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ssi.bg;
	spf=pass smtp.mailfrom=ssi.bg;
	dkim=pass header.d=ssi.bg header.i=@ssi.bg header.a=rsa-sha256 header.s=ssi header.b=5ZIn1CK9;
	arc=none smtp.remote-ip=193.238.174.39
Received: from mx.ssi.bg (mx.ssi.bg [193.238.174.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53687606A334;
	Tue, 24 Nov 2026 13:46:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53687606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ssi.bg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ssi.bg
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=ssi.bg header.i=@ssi.bg header.a=rsa-sha256 header.s=ssi header.b=5ZIn1CK9
Received: from mx.ssi.bg (localhost [127.0.0.1])
	by mx.ssi.bg (Potsfix) with ESMTP id 2778121FCE;
	Tue, 24 Nov 2026 15:46:22 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ssi.bg; h=cc:cc
	:content-type:content-type:date:from:from:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=ssi;
	 bh=ZiUQPSPqBbX0yaOGXpiqmIhuEj+1E9hKrqAwIjuoBrI=; b=5ZIn1CK9CYAS
	d/9rC8lAoBrYNO4WMJjFjxnwwGPvQF7lY7znmMUbTYktV+F84r/SbN+dEH6Bna1k
	MTpyrI9ojg+NbBu7yuPFo8F4slpSZKkGKSlsHIyfsaeK3zpVAKdbQrhHHXQfjv7v
	BqdgaPEcMPmnKDotIxKJiDvV6UYJhz7a8kIAUJd+Aji7DY+QI2dJ3mTrPd3UDsfT
	Bwg574hJ8bZ++YF+GD/OrbI/RyLXp4w7vsh5fcWYpX61eFmM6E6PszKJTpyDyi+w
	P3Z3QZ5uUTRfgK4FeUixhZrLz9EvVDIHDYRbxLoMtsw3d8M4mClQsD1ImfUhKD3e
	SjRQsKMTlmrXzu01tcO/6JksJip20g9TFWAJaG56c/DIXX1mTSruahkbVGmyYx8N
	eYCcirsK8+RxfPMZiyEEtEoYA35yYX7Nepke9I3kG2/cPp57nuwlE7dMtY6/q1A3
	QFqp/gxJSwEH4iQqof0LiUeh13mdhuPFLbY0i+n3zQsPjhLFLXgBX4T8qhUHofiJ
	t61n31ev+ex9vjM4sXgJ3Q6La1I4KUiRUePPMUvWKwtbyjKtq1ZGu9MPpaIfgrVd
	Rpi6DQCTIQKbWVK3dktAgJoWZJeyCq6sNLNTJMdKwnR0hDgwWjrIPBsoMXXQ+r2r
	0BjWDZOoLmUIyupMMHnpxxmV0fscNMA=
Received: from box.ssi.bg (box.ssi.bg [193.238.174.46])
	by mx.ssi.bg (Potsfix) with ESMTPS;
	Tue, 24 Nov 2026 15:46:21 +0200 (EET)
Received: from ja.ssi.bg (unknown [213.16.62.126])
	by box.ssi.bg (Potsfix) with ESMTPSA id AD65360E20;
	Tue, 24 Nov 2026 15:46:21 +0200 (EET)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by ja.ssi.bg (8.18.2/8.18.2) with ESMTP id 6AODkCPe076447;
	Tue, 24 Nov 2026 15:46:12 +0200
Date: Tue, 24 Nov 2026 15:46:12 +0200 (EET)
From: Julian Anastasov <ja@ssi.bg>
To: Star Chang <starchang@google.com>
cc: "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Willem de Bruijn <willemb@google.com>,
        Simon Horman <horms@kernel.org>, David Ahern <dsahern@kernel.org>,
        Ido Schimmel <idosch@nvidia.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, netdev@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        wangroger@google.com
Subject: Re: [PATCH net v7] arp: Do not update neighbours from ARP in L2
 multicast/broadcast frames
In-Reply-To: <20261123144535.155300-1-starchang@google.com>
Message-ID: <dba6db1a-7a30-97a8-f610-132cc7544d2f@ssi.bg>
References: <20261123144535.155300-1-starchang@google.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


	Hello,

On Mon, 23 Nov 2026, Star Chang wrote:

> The drop_unicast_in_l2_multicast sysctl drops unicast IP packets that
> are received in link-layer multicast or broadcast frames. On Wi-Fi this
> protects against the "Hole-196" attack, where any station that knows
> the group key injects frames as group-addressed traffic.
> 
> ARP is not covered. A broadcast ARP request or reply with sip set to
> the gateway address and sha set to the attacker MAC still creates or
> updates the gateway neighbour entry, so the attacker can poison the
> ARP cache of other stations. ARP requests are legitimately broadcast
> and cannot be dropped, and drop_gratuitous_arp only catches sip == tip.
> 
> This was found in an internal security review and reproduced in a lab
> on a WPA2-PSK network: a group-addressed ARP reply injected by another
> station changed the victim's gateway neighbour entry to the attacker
> MAC. There are no kernel messages, only the wrong neighbour entry.
> 
> When drop_unicast_in_l2_multicast is set, do not pass ARP packets
> received in L2 multicast/broadcast frames to neigh_event_ns() or
> neigh_update(), so they can neither create nor change neighbour
> entries. Requests for local and proxied addresses are still answered;
> neighbours are learned from unicast replies to our own requests.
> 
> Fixes: 12b74dfadb5a ("ipv4: add option to drop unicast encapsulated in L2 multicast")
> Suggested-by: Julian Anastasov <ja@ssi.bg>
> Signed-off-by: Star Chang <starchang@google.com>

	The patch looks good to me, thanks!

Reviewed-by: Julian Anastasov <ja@ssi.bg>

> ---
> v7:
>  - Rebase on net, arp_process() changed (Julian)
>  - Add an empty line before out_free_skb (Julian)
>  - Mention how the issue was found in the commit message
> v6: https://lore.kernel.org/netdev/20261123063608.3665186-1-starchang@google.com/
>  - Instead of dropping L2 BMC ARP replies, skip neigh_event_ns() and
>    neigh_update() for any ARP received in L2 BMC frames, which also
>    covers broadcast requests with sip = gateway (Julian)
>  - Drop the frame and release reply_dst on that path (Julian)
> v5: https://lore.kernel.org/netdev/20261030031136.607720-1-starchang@google.com/
> v4: https://lore.kernel.org/netdev/20261027015619.1745984-1-starchang@google.com/
> v3: https://lore.kernel.org/netdev/20261026150539.1357037-1-starchang@google.com/
> 
>  Documentation/networking/ip-sysctl.rst |  4 ++-
>  net/ipv4/arp.c                         | 39 +++++++++++++++++++-------
>  2 files changed, 32 insertions(+), 11 deletions(-)
> 
> diff --git a/Documentation/networking/ip-sysctl.rst b/Documentation/networking/ip-sysctl.rst
> index d3523c9064a2..fd2ffb2d2812 100644
> --- a/Documentation/networking/ip-sysctl.rst
> +++ b/Documentation/networking/ip-sysctl.rst
> @@ -2302,7 +2302,9 @@ promote_secondaries - BOOLEAN
>  
>  drop_unicast_in_l2_multicast - BOOLEAN
>  	Drop any unicast IP packets that are received in link-layer
> -	multicast (or broadcast) frames.
> +	multicast (or broadcast) frames. ARP packets received in such
> +	frames are not used to create or update neighbour entries,
> +	but ARP requests for local addresses are still answered.
>  
>  	This behavior (for multicast) is actually a SHOULD in RFC
>  	1122, but is disabled by default for compatibility reasons.
> diff --git a/net/ipv4/arp.c b/net/ipv4/arp.c
> index 3bc8db6ccd68..cc69ea07fc2d 100644
> --- a/net/ipv4/arp.c
> +++ b/net/ipv4/arp.c
> @@ -715,6 +715,7 @@ static int arp_process(struct net *net, struct sock *sk, struct sk_buff *skb)
>  	struct neighbour *n;
>  	struct arphdr *arp;
>  	struct rtable *rt;
> +	bool bmc_no_learn;
>  	__be32 sip, tip;
>  	int addr_type;
>  
> @@ -794,6 +795,10 @@ static int arp_process(struct net *net, struct sock *sk, struct sk_buff *skb)
>  	    (!IN_DEV_ROUTE_LOCALNET(in_dev) && ipv4_is_loopback(tip)))
>  		goto out_free_skb;
>  
> +	bmc_no_learn = (skb->pkt_type == PACKET_BROADCAST ||
> +			skb->pkt_type == PACKET_MULTICAST) &&
> +		       IN_DEV_ORCONF(in_dev, DROP_UNICAST_IN_L2_MULTICAST);
> +
>   /*
>    *	For some 802.11 wireless deployments (and possibly other networks),
>    *	there will be an ARP proxy and gratuitous ARP frames are attacks
> @@ -853,14 +858,19 @@ static int arp_process(struct net *net, struct sock *sk, struct sk_buff *skb)
>  			if (!dont_send && IN_DEV_ARPFILTER(in_dev))
>  				dont_send = arp_filter(sip, tip, dev);
>  			if (!dont_send) {
> -				n = neigh_event_ns(tbl, sha, &sip, dev);
> -				if (n) {
> -					arp_send_dst(ARPOP_REPLY, ETH_P_ARP,
> -						     sip, dev, tip, sha,
> -						     dev->dev_addr, sha,
> -						     reply_dst);
> -					neigh_release(n);
> +				n = NULL;
> +				/* Do not learn the sender from a BMC frame */
> +				if (!bmc_no_learn) {
> +					n = neigh_event_ns(tbl, sha, &sip, dev);
> +					if (!n)
> +						goto out_consume_skb;
>  				}
> +				arp_send_dst(ARPOP_REPLY, ETH_P_ARP,
> +					     sip, dev, tip, sha,
> +					     dev->dev_addr, sha,
> +					     reply_dst);
> +				if (n)
> +					neigh_release(n);
>  			}
>  			goto out_consume_skb;
>  		} else if (IN_DEV_FORWARD(in_dev)) {
> @@ -869,9 +879,11 @@ static int arp_process(struct net *net, struct sock *sk, struct sk_buff *skb)
>  			     arp_fwd_pvlan(in_dev, dev, rt, sip, tip) ||
>  			     (rt->dst.dev != dev &&
>  			      pneigh_lookup(tbl, &tip, dev)))) {
> -				n = neigh_event_ns(tbl, sha, &sip, dev);
> -				if (n)
> -					neigh_release(n);
> +				if (!bmc_no_learn) {
> +					n = neigh_event_ns(tbl, sha, &sip, dev);
> +					if (n)
> +						neigh_release(n);
> +				}
>  
>  				if (NEIGH_CB(skb)->flags & LOCALLY_ENQUEUED ||
>  				    skb->pkt_type == PACKET_HOST ||
> @@ -890,6 +902,10 @@ static int arp_process(struct net *net, struct sock *sk, struct sk_buff *skb)
>  		}
>  	}
>  
> +	/* ARP received in L2 BMC frames must not change the neighbour table */
> +	if (bmc_no_learn)
> +		goto out_drop_dst;
> +
>  	/* Update our ARP tables */
>  
>  	n = ipv4_neigh_lookup(dev, &sip);
> @@ -953,6 +969,9 @@ static int arp_process(struct net *net, struct sock *sk, struct sk_buff *skb)
>  	dst_release(reply_dst);
>  	return NET_RX_SUCCESS;
>  
> +out_drop_dst:
> +	dst_release(reply_dst);
> +
>  out_free_skb:
>  	kfree_skb(skb);
>  	return NET_RX_DROP;
> -- 
> 2.56.1.750.gf70dc682cf-goog

Regards

--
Julian Anastasov <ja@ssi.bg>

