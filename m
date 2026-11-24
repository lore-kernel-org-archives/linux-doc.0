Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795531655;
	b=SGmn9RJuv4LeuEdaA6LcPH3EMfrhMzxb90nPRY6cUgxUo8So/FDAxoTqtNcrH9dFoEUN
	 j30XbyEbK+ETup5UYY7Lg4hssHqOBvVU9GYiNxUiJKKUvQjhDFvrPzrwfBq9EojGTXQ9Q
	 qSCQk5RaSkMAYiT4hP4UDkvqTHR2VjbujbZgPgrfCwHp9n0paU7lT2b4P0dS9nKQWA3Z2
	 V8EpeSfnF/3usPoF4C4gskAtqWvNzofaWgJ9VLR9gnA1s/WAuZk1Cd8VWbDeoB5HFbD6N
	 dck99hj/QbsfdytuBaC6E6hVRh65RrzYji5eAd53XRK040we+QGd/cOR6jDZDwWt4vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795531655;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=yF49Z1BigzOsvjFQC+5yrWqssjl3iTCT5GlauHiBNgU=;
	b=p0p3RfqzK3aIybqp1R6N2cZA+9ScY98h55sFA5oskn2rQslOsrZ2zHHqjrOwzEBTuHE1
	 mmZiJGhliLl67wjdNfYkG7qWTyahZHvsfMUn0hmNl2yX6WmtSk10AdldVVScuSyS5FOHK
	 B++f46FZXP9OMUcC0kqM9F1VW7Ij2lJdIPCvfGA8w78dDq7+KIidlI/SEl/QRNa7fEez8
	 bQvBGsGwRm91IpITAnrzkh0f7t9wTiUPDHS7ulMB2DXbuTNNCqKFSU5JUxi+QPILsDX43
	 YIngQfwKKyVa2rUlFzx2twTEutOeGR3VTT04MOrNMtFzxaS8oyiaiwt7EYQBf30/4ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JJURJPKz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01DC606A31E;
	Tue, 24 Nov 2026 14:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JJURJPKz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20B151F000C0;
	Tue, 24 Nov 2026 14:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795531655;
	bh=yF49Z1BigzOsvjFQC+5yrWqssjl3iTCT5GlauHiBNgU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=JJURJPKzk5VxQ2NUQyKsRXz/HG+t2htw2wOXyITw2ENEnBufzQNwol4wUk6k2Yy7a
	 L3iz//qxA2+y82R7MNQ5s7EfxM2/EY9RD7v6R6ws6GBLAG4BemPIRmOpQPEmy7jeof
	 DUQB1uaEhwwOZTiACOqmtET9qmP4tIGos8LM9QZJB+LGmB+2t2FQOzBYJpYUYzvTek
	 N0FIirMUoaq/AqOeBb5XYs5oZi7k8FoZZRZRvkw9y6O6zKqRvxWtDtL0k7g8cy54cY
	 s/QdRiAN+f3hT9kv8zMAIgY97fcrAGvH0r4VVZMwk0q+ufQvAn0cdtx0TsmI/D+7Sw
	 XYi1RPDUSvKHw==
Subject: Re: [PATCH net v7] arp: Do not update neighbours from ARP in L2
 multicast/broadcast frames
From: netdev-bot+sashiko@kernel.org
To: starchang@google.com
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, willemb@google.com, horms@kernel.org, dsahern@kernel.org,
 idosch@nvidia.com, ja@ssi.bg, johannes@sipsolutions.net, corbet@lwn.net,
 skhan@linuxfoundation.org, rdunlap@infradead.org, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, wangroger@google.com
Date: Tue, 24 Nov 2026 14:47:33 +0000
Message-ID: <179553165359.3135.5730863120205025514@kernel.org>
In-Reply-To: <20261123144535.155300-1-starchang@google.com>
References: <20261123144535.155300-1-starchang@google.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 2 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] When drop_unicast_in_l2_multicast is set, every ARP frame that
  arrives as L2 broadcast/multicast and that arp_process() does not…
- [Medium] The patch reuses the existing IP-only
  drop_unicast_in_l2_multicast knob to block all ARP neighbour learning…
- [Low] The documentation and in-function comments do not match the new
  behaviour.

--

arp: Do not update neighbours from ARP in L2 multicast/broadcast frames

This patch extends the drop_unicast_in_l2_multicast sysctl to ARP. When
the sysctl is set, ARP packets received in link-layer broadcast or
multicast frames are no longer passed to neigh_event_ns() or
neigh_update(), so they cannot create or change neighbour entries.
Requests for local and proxied addresses are still answered.

> diff --git a/Documentation/networking/ip-sysctl.rst b/Documentation/networking/ip-sysctl.rst
> index d3523c9064a22..fd2ffb2d28126 100644
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

[Severity: Low]
This isn't a bug, but should this text also mention proxied addresses?

The commit message says "Requests for local and proxied addresses are
still answered". In arp_process(), the IN_DEV_FORWARD branch still handles
BMC frames when arp_fwd_proxy(), arp_fwd_pvlan() or pneigh_lookup()
matches. It either replies through arp_send_dst() or defers through
pneigh_enqueue().

Separately, the comment block above the request handling in arp_process()
still says:

 *  and in the case of requests for us we add the requester to the arp
 *  cache.

That is no longer true when bmc_no_learn is set. Could that comment be
updated too?

> diff --git a/net/ipv4/arp.c b/net/ipv4/arp.c
> index 3bc8db6ccd68e..cc69ea07fc2de 100644
> --- a/net/ipv4/arp.c
> +++ b/net/ipv4/arp.c

[ ... ]

> @@ -794,6 +795,10 @@ static int arp_process(struct net *net, struct sock *sk, struct sk_buff *skb)
>  	    (!IN_DEV_ROUTE_LOCALNET(in_dev) && ipv4_is_loopback(tip)))
>  		goto out_free_skb;
>  
> +	bmc_no_learn = (skb->pkt_type == PACKET_BROADCAST ||
> +			skb->pkt_type == PACKET_MULTICAST) &&
> +		       IN_DEV_ORCONF(in_dev, DROP_UNICAST_IN_L2_MULTICAST);
> +

[ ... ]

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

[Severity: Medium]
Is this exit also meant to catch broadcast ARP replies and gratuitous ARP?

ARPOP_REPLY never enters the request branch. So every reply or
announcement that arrives in a BMC frame now leaves here, before the
neigh_update() block. That also skips the existing handling for broadcast
replies further down:

		if (arp->ar_op != htons(ARPOP_REPLY) ||
		    skb->pkt_type != PACKET_HOST)
			state = NUD_STALE;
		neigh_update(n, sha, state,
			     override ? NEIGH_UPDATE_F_OVERRIDE : 0, 0);

On hosts that already have drop_unicast_in_l2_multicast enabled (commonly
Wi-Fi clients), some behaviour seems to change:

IPv4 link-local peers that broadcast their ARP replies, as RFC 3927
section 2.5 requires, would never resolve. Our INCOMPLETE entry never gets
an lladdr and goes to FAILED. Before this patch, the broadcast reply
resolved it as NUD_STALE.

Gratuitous ARP and announcements sent after an IP takeover or MAC change
are ignored. Examples are arp_notify, bonding, VRRP/keepalived failover
and VM migration. Traffic keeps going to the old MAC until NUD probing
fails.

arp_accept no longer has any effect for BMC frames on such interfaces.

This changes the semantics of an existing IP-only knob, and the patch
carries a Fixes: tag, so it will likely be backported to stable. Should
the commit message and the ip-sysctl.rst text describe these effects?

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

[Severity: Medium]
Should these packets be consumed instead of dropped?

With the sysctl set, every BMC ARP that arp_process() does not answer now
takes goto out_drop_dst. Ordinary broadcast who-has requests for other
hosts on the LAN are the common case. They end in kfree_skb() with
SKB_DROP_REASON_NOT_SPECIFIED and return NET_RX_DROP. Before this patch,
the same frames went through consume_skb() and returned NET_RX_SUCCESS.

Normal background ARP would then show up as unexplained drops in
drop_monitor, dropwatch and the skb:kfree_skb tracepoint.

NF_HOOK returns the okfn result, so arp_rcv() also returns NET_RX_DROP to
netif_receive_skb(). Drivers that count that return value would then
increment rx_dropped. One example is rx_default_dqrr() in dpaa_eth.c:

	if (unlikely(netif_receive_skb(skb) == NET_RX_DROP)) {
		percpu_stats->rx_dropped++;

arp_rcv() in the same file avoids this on purpose for ARP that it
ignores:

	/* do not tweak dropwatch on an ARP we will ignore */
	if (dev->flags & IFF_NOARP ||
	    skb->pkt_type == PACKET_OTHERHOST ||
	    skb->pkt_type == PACKET_LOOPBACK)
		goto consumeskb;

The other users of the same sysctl, ip_rcv_finish_core() and
ip6_rcv_core(), use SKB_DROP_REASON_UNICAST_IN_L2_MULTICAST when they
drop.

The ip-sysctl.rst text and the commit message say these ARP packets are
not used for neighbour entries. Neither says they are dropped. The v6
changelog does say "Drop the frame and release reply_dst on that path", so
the drop looks intentional.

If the drop is intended, could it at least use a specific drop reason?
Otherwise, could this path go to out_consume_skb, so the frame is consumed
and NET_RX_SUCCESS is returned?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261123144535.155300-1-starchang%40google.com
