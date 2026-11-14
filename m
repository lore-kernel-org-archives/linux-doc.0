Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794680872;
	b=0hTexXKNYpcyfa+1+NGBPVSkS6HcyXM7Hdu4zlQWYi2bPJuiNf5l3hymN0cRiDfyJKiL
	 XtZlj2Ca1V7SlZ6GMtQ46l/7RedlZ8/8uqOo6fgWbo9Xfn6z3M5mmDKRztahvkEqOJGtU
	 44YyYbw0lwJGFZmVEr8Qe38oVoGYyt0OU9rdATC1yrWOsxue93ujx3UhYo4Izu9LrEUDh
	 UdK55fPQfFSm8SGxHbDGO+Tx+7zT1mbOlM1yodZW7NGUA55pThN8sHWXCF62o9I/47TG1
	 i7GTNYy0TQQbI6/90rIgXVuuRwFGTUWxXY0uhCE9K+OTTWe4eAmfkjSZiHmXoj+PkYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794680872;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=COpZlkF3gjNsbleKennDYj+Fmu6LFoVwH+euJBJfJOY=;
	b=AxcjziBFpNfI2fGSwqJVMlH7RHh4HrVLB4dNkMvfXjTVQ89zGGkN7OWISWgZHAnLGXav
	 cSAQ6klWg1wsx9DmqSscu25cEWrAnj7DPNVg1kjCzznSI825h/xII/J+CtAY/bj8kUJS8
	 PYAQdrrc9/cCliGYHzfywxSO9m6TLzjlJzFq7O6KX4c06N0m+d5KjNQ1ZJKFD6qpnBCk7
	 gwf0MP82MyRiaFBAf/uVi6wLnWkl0fp1eCiaOxLpxwSHOM42w/ZsvL4mDUeG+oXhAaB0D
	 A5Ooj7vpLsaaOeQxwHRKZbNKvIeTt4T2uB8hUvvt7TAb2MMFJ5NmBYXmMIW5IVKVDbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=u1ahjrHa;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F834606A895
	for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 18:27:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F834606A895
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=u1ahjrHa
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c50cc7540b7so11029766b.0
        for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 10:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794680870; x=1795285670; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=COpZlkF3gjNsbleKennDYj+Fmu6LFoVwH+euJBJfJOY=;
        b=u1ahjrHa4S10vwFHPp1YcfCzotsvWJ6wsT46BsGRopHXst2ygrEwQhtTPt0JmMxOwi
         Jp6fzNbsLPDoaSvVc7BTnyuqGCTz30vGlb9gh5w90VrPa4tpIuLkFOCx+mNb7DkDxFaL
         KIaO2j7tH5pb1t3EBb+yHIwuBKfeOxjFPcVVlVR048Xvq0dov7DPDrcWspBWn7LKz3GT
         eCfieLZlG3IQ2tpk/VC9nMEqa/6ijt2+T3n5YZJttlmr6b2bF6YJ1epTfewEBsHVCcWc
         hWRzRdGyfnusjN6nmxxMoOCPM8G96Tj5MvKU7C07RpIksijy4LvH59BR6wHXj+DcLz0h
         NzNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794680870; x=1795285670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=COpZlkF3gjNsbleKennDYj+Fmu6LFoVwH+euJBJfJOY=;
        b=zzTxGbzitgT1kFXCtIExMug/wQlyRAn50DyMv1DBb6tKk3evDezv+ZBBXEIqhPDNoI
         d2usF08LaFRTxJ34ft8nCuYd2RAWD6z6wBSki3lKky759V2031au1YlhDZslhyJQJqas
         MnG/zYgvETttV+379e7uqSryV+OdD7oluUL8TohZV2OKSMZRIsMdtOXIiPOhHO9685us
         rtuw9iriHIMdKe1p0pDCBm/RmEi7PPNcIJ0HuvtaER7vfV0W6HgOQ2DIoy29CatydqyG
         kGqxoGMxalxx6KaKrQdxbCKwn9DSscgi81Vn5KDpXKhuoYAI4pqtUkqxLSReCjl8l+gU
         Gn9g==
X-Forwarded-Encrypted: i=1; AL+hErEbZRi8MzYHlnjLt0yg8UtFuI8wy+X7AfjHv6oc03K8KgweJy59L49656yShZ0ctxfy//PsbX3TjVE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8KAit+40BY5CNSClkI6pA5WicOscHu8Wi8ZRkjcTgNQsMQyM/6
	cT+efXdrsWtQ6SchLhAjHuaO/T/teEHzuJrFxyObnNYjRLpWFSgz85fldmtrK2ndIA==
X-Gm-Gg: AYBFou1TpIWx+/a5xbN81Ey7UduItswXke9KOk2Cfhhc8nLWJLaxIvc6G02gtqud5R4
	BM9J5MZd3/hvk+xWs02JXhDi98R5essEyCbmxpGrtkCWkYZqndcUbEGOD61MgyEsIvRCWb/PBhX
	h277spLnUKeDfwDBT82NJ6sUniLEX9gkO1wmcZkxmEjtv6277kH+0QWXPPCKN9PCXcyFU+jrQMj
	mYSxLbVq9OcC/4SmZ7G/BbYSHauNO1SYeFCPFiKIeYMtB3DqvSoIKeIiBc95qfj2kCBn6sIMY+b
	z8Vx/7BvSb2sP38pD6HckpHVJ8lxmug2lPy3IBDxoEb1EEJXEvW9ayGmhpOQgD+8C9kwLUHkrkz
	4FqZpSeOySj3bdHYUOMhPNESjxjGQVrHNKy2gqiXhUbeqEuQyySBGJ3WfKnGvrUIVwAf6luCw80
	FdG1N+zHv/5GDOnkyuwuxHgCzCeQTSD0yzCQULtXBY+FKu+hFFKyHCB5aYslYS93WNVzNFR7k/a
	1NJlo9mYh8gboDdp7M9vdeZIHNPOzP62lKLDMJuxtVjnFTtruKgXcDZBhJ/C556sa7ScmPqUMOh
	MKgfkjF2piqy+XC+4RWfQ21LQ1u/1WkeF9G3uZoTv9yjibVMwdmmHbaeLGl+hV12xaIkuCs+sNN
	5zcza29zMRG5wruvs2p3kI1kHZr2ve7heapDrw8kky808FyxyRY/dE8UOG3tPql0OxU5o9ApO/j
	tKEcPnNBvCVBb//014rckbArbvLfi+2HUElh+z1GcZVkp/ibdAPgPtSb1deTRjfWTnUesv0Bhfc
	WXjV2bLyNEgHfOViPVTCJvAghXXSM5Mw+ifIDKvD8DOAUWWcFL9asZOWWuBslAEu3XXeqyyI++l
	rPM=
X-Received: by 2002:a17:907:ea93:b0:c41:4c20:5a80 with SMTP id a640c23a62f3a-c50963bdb9bmr585583166b.44.1794680869556;
        Sat, 14 Nov 2026 10:27:49 -0800 (PST)
Received: from Desktop.fritz.box ([185.181.130.189])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b56df7sm245554366b.47.2026.11.14.10.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 10:27:49 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	andrew+netdev@lunn.ch,
	dsahern@kernel.org,
	idosch@nvidia.com,
	ncardwell@google.com,
	kuniyu@google.com,
	richardbgobert@gmail.com,
	willemb@google.com,
	ecree.xilinx@gmail.com,
	linux-net-drivers@amd.com,
	saeedm@nvidia.com,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	leon@kernel.org,
	linux-rdma@vger.kernel.org,
	alexei.starovoitov@gmail.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	martin.lau@linux.dev,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	corbet@lwn.net,
	rdunlap@infradead.org,
	skhan@linuxfoundation.org,
	shuah@kernel.org,
	bpf@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2 1/2] net: keep the TCP fixed-ID flags on the header they describe
Date: Sat, 14 Nov 2026 19:27:44 +0100
Message-ID: <f7d096c63c6a0b7a23a4dcea9a3de0915a48ac56.1794139176.git.julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1794139176.git.julius@bairaktaris.de>
References: <cover.1794139176.git.julius@bairaktaris.de>
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

Commit 3271f19bf7b9 ("net: gso: restore ids of outer ip headers
correctly") made SKB_GSO_TCP_FIXEDID describe the outermost IPv4 header
and added SKB_GSO_TCP_FIXEDID_INNER for the inner header of an
encapsulated packet. Every path that adds or removes a header then has to
move the flags, and none does. A TCP stream that GRO merged with fixed
IDs and that is forwarded into an IPIP tunnel, or into an ESP tunnel mode
SA with crypto offload, is segmented with one outer ID for all segments
and with incrementing inner IDs. Decapsulation leaves the state of the
removed outer header on the new outer one, and the inner header of a GRE
or UDP tunnel, which segmentation reads at encap_level 0, gets the state
of the outer header.

Let SKB_GSO_TCP_FIXEDID describe the innermost IPv4 header again, as it
did before that commit, and replace SKB_GSO_TCP_FIXEDID_INNER with
SKB_GSO_TCP_FIXEDID_OUTER for the outer header of an encapsulated
packet. A new outer header then has no flag and gets incrementing IDs,
so encapsulation needs no change, and decapsulation clears the outer
flag in iptunnel_pull_offloads() and bpf_skb_net_shrink(). Convert mlx5
and sfc, the two drivers that use the inner flag.

Fixes: 3271f19bf7b9 ("net: gso: restore ids of outer ip headers correctly")
Suggested-by: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 Documentation/networking/segmentation-offloads.rst |  4 ++--
 drivers/net/ethernet/mellanox/mlx5/core/en_rx.c    |  8 ++------
 drivers/net/ethernet/sfc/ef100_tx.c                | 12 +++---------
 include/linux/netdevice.h                          |  2 +-
 include/linux/skbuff.h                             |  4 +++-
 include/net/ip_tunnels.h                           |  1 +
 net/core/filter.c                                  |  1 +
 net/ipv4/af_inet.c                                 |  8 +++++---
 net/ipv4/tcp_offload.c                             |  6 ++++--
 9 files changed, 22 insertions(+), 24 deletions(-)

diff --git a/Documentation/networking/segmentation-offloads.rst b/Documentation/networking/segmentation-offloads.rst
index 25a8b7eca847a..0f20bb643145d 100644
--- a/Documentation/networking/segmentation-offloads.rst
+++ b/Documentation/networking/segmentation-offloads.rst
@@ -49,8 +49,8 @@ The default behavior is to increment the IP ID with every segment.  If the
 GSO type SKB_GSO_TCP_FIXEDID is specified then we will not increment the IP
 ID and all segments will use the same IP ID.
 
-For encapsulated packets, SKB_GSO_TCP_FIXEDID refers only to the outer header.
-SKB_GSO_TCP_FIXEDID_INNER can be used to specify the same for the inner header.
+For encapsulated packets, SKB_GSO_TCP_FIXEDID refers only to the inner header.
+SKB_GSO_TCP_FIXEDID_OUTER can be used to specify the same for the outer header.
 Any combination of these two GSO types is allowed.
 
 If a device has NETIF_F_TSO_MANGLEID set then the IP ID can be ignored when
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_rx.c b/drivers/net/ethernet/mellanox/mlx5/core/en_rx.c
index 22fea4739a2c9..b804a759710e0 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en_rx.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en_rx.c
@@ -1175,12 +1175,8 @@ static void mlx5e_shampo_update_ipv4_tcp_hdr(struct mlx5e_rq *rq, struct iphdr *
 	tcp->check = ~tcp_v4_check(skb->len - tcp_off, ipv4->saddr,
 				   ipv4->daddr, 0);
 	skb_shinfo(skb)->gso_type |= SKB_GSO_TCPV4;
-	if (ntohs(ipv4->id) == rq->hw_gro_data->second_ip_id) {
-		bool encap = rq->hw_gro_data->fk.control.flags & FLOW_DIS_ENCAPSULATION;
-
-		skb_shinfo(skb)->gso_type |= encap ? SKB_GSO_TCP_FIXEDID_INNER :
-						     SKB_GSO_TCP_FIXEDID;
-	}
+	if (ntohs(ipv4->id) == rq->hw_gro_data->second_ip_id)
+		skb_shinfo(skb)->gso_type |= SKB_GSO_TCP_FIXEDID;
 
 	skb->csum_start = (unsigned char *)tcp - skb->head;
 	skb->csum_offset = offsetof(struct tcphdr, check);
diff --git a/drivers/net/ethernet/sfc/ef100_tx.c b/drivers/net/ethernet/sfc/ef100_tx.c
index 03005757c060d..162cfa54f2d04 100644
--- a/drivers/net/ethernet/sfc/ef100_tx.c
+++ b/drivers/net/ethernet/sfc/ef100_tx.c
@@ -201,16 +201,10 @@ static void ef100_make_tso_desc(struct efx_nic *efx,
 	bool outer_csum;
 	u32 paylen;
 
-	if (encap) {
-		if (skb_shinfo(skb)->gso_type & SKB_GSO_TCP_FIXEDID_INNER)
-			mangleid = ESE_GZ_TX_DESC_IP4_ID_NO_OP;
-		if (skb_shinfo(skb)->gso_type & SKB_GSO_TCP_FIXEDID)
-			mangleid_outer = ESE_GZ_TX_DESC_IP4_ID_NO_OP;
-	} else {
-		if (skb_shinfo(skb)->gso_type & SKB_GSO_TCP_FIXEDID)
-			mangleid = ESE_GZ_TX_DESC_IP4_ID_NO_OP;
+	if (skb_shinfo(skb)->gso_type & SKB_GSO_TCP_FIXEDID)
+		mangleid = ESE_GZ_TX_DESC_IP4_ID_NO_OP;
+	if (!encap || (skb_shinfo(skb)->gso_type & SKB_GSO_TCP_FIXEDID_OUTER))
 		mangleid_outer = ESE_GZ_TX_DESC_IP4_ID_NO_OP;
-	}
 
 	if (efx->net_dev->features & NETIF_F_HW_VLAN_CTAG_TX)
 		vlan_enable = skb_vlan_tag_present(skb);
diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 435be7880d7e5..7ecf0f9c5f655 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -5536,7 +5536,7 @@ static inline bool net_gso_ok(netdev_features_t features, int gso_type)
 {
 	netdev_features_t feature;
 
-	if (gso_type & (SKB_GSO_TCP_FIXEDID | SKB_GSO_TCP_FIXEDID_INNER))
+	if (gso_type & (SKB_GSO_TCP_FIXEDID | SKB_GSO_TCP_FIXEDID_OUTER))
 		gso_type |= __SKB_GSO_TCP_FIXEDID;
 
 	feature = ((netdev_features_t)gso_type << NETIF_F_GSO_SHIFT) & NETIF_F_GSO_MASK;
diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
index 6787fcf6ac3e4..6eb913ebc7d53 100644
--- a/include/linux/skbuff.h
+++ b/include/linux/skbuff.h
@@ -716,9 +716,11 @@ enum {
 
 	/* These indirectly map onto the same netdev feature.
 	 * If NETIF_F_TSO_MANGLEID is set it may mangle both inner and outer IDs.
+	 * SKB_GSO_TCP_FIXEDID stays with the innermost IPv4 header, so there is
+	 * nothing to do on encapsulation. Decapsulation clears the outer flag.
 	 */
 	SKB_GSO_TCP_FIXEDID = 1 << 30,
-	SKB_GSO_TCP_FIXEDID_INNER = 1 << 31,
+	SKB_GSO_TCP_FIXEDID_OUTER = 1 << 31,
 };
 
 #if BITS_PER_LONG > 32
diff --git a/include/net/ip_tunnels.h b/include/net/ip_tunnels.h
index 5cccf4c0e6913..a8e1cd7021fcf 100644
--- a/include/net/ip_tunnels.h
+++ b/include/net/ip_tunnels.h
@@ -667,6 +667,7 @@ static inline int iptunnel_pull_offloads(struct sk_buff *skb)
 			return err;
 		skb_shinfo(skb)->gso_type &= ~(NETIF_F_GSO_ENCAP_ALL >>
 					       NETIF_F_GSO_SHIFT);
+		skb_shinfo(skb)->gso_type &= ~SKB_GSO_TCP_FIXEDID_OUTER;
 	}
 
 	skb->encapsulation = 0;
diff --git a/net/core/filter.c b/net/core/filter.c
index 52e6ea6d50455..340b2e64d818e 100644
--- a/net/core/filter.c
+++ b/net/core/filter.c
@@ -3867,6 +3867,7 @@ static int bpf_skb_net_shrink(struct sk_buff *skb, u32 off, u32 len_diff,
 		/* Clear encapsulation flag only when no tunnel GSO flags remain */
 		if (flags & (BPF_F_ADJ_ROOM_DECAP_L4_MASK |
 			     BPF_F_ADJ_ROOM_DECAP_IPXIP_MASK)) {
+			shinfo->gso_type &= ~SKB_GSO_TCP_FIXEDID_OUTER;
 			if (!(shinfo->gso_type & (SKB_GSO_UDP_TUNNEL |
 						  SKB_GSO_UDP_TUNNEL_CSUM |
 						  SKB_GSO_GRE |
diff --git a/net/ipv4/af_inet.c b/net/ipv4/af_inet.c
index 7677b0343abd4..d5769a5fdc314 100644
--- a/net/ipv4/af_inet.c
+++ b/net/ipv4/af_inet.c
@@ -1402,10 +1402,12 @@ struct sk_buff *inet_gso_segment(struct sk_buff *skb,
 
 	segs = ERR_PTR(-EPROTONOSUPPORT);
 
-	fixedid = !!(skb_shinfo(skb)->gso_type & (SKB_GSO_TCP_FIXEDID << encap));
-
-	if (!skb->encapsulation || encap)
+	if (!skb->encapsulation || encap) {
 		udpfrag = !!(skb_shinfo(skb)->gso_type & SKB_GSO_UDP);
+		fixedid = !!(skb_shinfo(skb)->gso_type & SKB_GSO_TCP_FIXEDID);
+	} else {
+		fixedid = !!(skb_shinfo(skb)->gso_type & SKB_GSO_TCP_FIXEDID_OUTER);
+	}
 
 	ops = rcu_dereference(inet_offloads[proto]);
 	if (likely(ops && ops->callbacks.gso_segment)) {
diff --git a/net/ipv4/tcp_offload.c b/net/ipv4/tcp_offload.c
index b84fcd07c7230..79190044f6fe9 100644
--- a/net/ipv4/tcp_offload.c
+++ b/net/ipv4/tcp_offload.c
@@ -459,6 +459,7 @@ INDIRECT_CALLABLE_SCOPE int tcp4_gro_complete(struct sk_buff *skb, int thoff)
 {
 	const u16 offset = NAPI_GRO_CB(skb)->network_offsets[skb->encapsulation];
 	const struct iphdr *iph = (struct iphdr *)(skb->data + offset);
+	const u8 fixedid = NAPI_GRO_CB(skb)->ip_fixedid;
 	struct tcphdr *th = tcp_hdr(skb);
 
 	if (unlikely(NAPI_GRO_CB(skb)->is_flist)) {
@@ -473,9 +474,10 @@ INDIRECT_CALLABLE_SCOPE int tcp4_gro_complete(struct sk_buff *skb, int thoff)
 	th->check = ~tcp_v4_check(skb->len - thoff, iph->saddr,
 				  iph->daddr, 0);
 
-	BUILD_BUG_ON(SKB_GSO_TCP_FIXEDID << 1 != SKB_GSO_TCP_FIXEDID_INNER);
+	/* Bit 0 of ip_fixedid is the outermost header, bit 1 is the inner one. */
 	skb_shinfo(skb)->gso_type |= SKB_GSO_TCPV4 |
-			(NAPI_GRO_CB(skb)->ip_fixedid * SKB_GSO_TCP_FIXEDID);
+		(((fixedid >> skb->encapsulation) & 1) * SKB_GSO_TCP_FIXEDID) |
+		((fixedid & skb->encapsulation) * SKB_GSO_TCP_FIXEDID_OUTER);
 
 	tcp_gro_complete(skb);
 	return 0;
-- 
2.53.0

