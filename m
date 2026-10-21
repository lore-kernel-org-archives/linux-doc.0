Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792605940;
	b=eGaQZ2dRen+GBeiv+S/qxtaa/xV0WWuGiLdYPCuaraPLJ5+06D1oTbyRz4+dAxUzqLb+
	 MkFW3PRIWcY6EOZG1M88of0SiYUxTjAHk01lX+NrEVkmnG8DGLYI1HBFIl+Ri9Bwv5cRG
	 fG0rJdYhpYeEey/mOMD2uU+Iy6xeByqe4NmVPxDcAp3ytGvQLC5TU+OVVrN0wUkkPUa35
	 xIoA0otMQ/dEGb+ZyRK/5BUlNB/JnSu+0sLQWuymWHJixgjWTPrlixHT+KXBaij4ZzpY2
	 sLvmOu8SgpJK0AUiogUNXbcEc32kaj3Yb8ffwE9utJwG3AziUdEGxEfeCkFtBlY0M/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792605940;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=36CIvPZFqSR3d1bRp5FOUkDzIh2a6VXH38LqlQMMHgo=;
	b=Bd1eOiZmjnSu+rGYTNc4/gfYADOKpTSf2IzpuSuyUfUQtsyFW3m3iw85eVXOsiZZ8cWb
	 xNqxUVDoIAsSL/56WuuHmqs05E2ft3FOsws/l1LsJJxi2m2jsabv8O4mzqDmDFIdT53dw
	 ZZRC1DWvTX3f28KtRf28MwCd5/infssRm1AmHP221o4oOTQlFwZSzU7pO9V3D7wlNDfZ/
	 gYJ6vfs8myZCj5GuhNgfFrvho1vANcKxb45WFj2vdIithRcjZ/6wt1r7IXCVHNkBtbwH3
	 y2XSlSytqlbT9tfRaHNb3LPmg/qRqrH8e+Sc6gw4Xa4yw290IsU4haXZ/CHC+1F+l4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qc4ZTUYU;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6C2606A335
	for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 18:05:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D6C2606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qc4ZTUYU
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1682bff3cso5735205e9.1
        for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 11:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792605933; x=1793210733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=36CIvPZFqSR3d1bRp5FOUkDzIh2a6VXH38LqlQMMHgo=;
        b=qc4ZTUYUtGBB48YloE+K0yBo9J5Ll7KjPH93H7mZt7pvpD0QD4DqCJEB+kKxPfziZA
         xlN0wB+iMjfxQvbswipWTCR3WZ7SCRmmc1D3tHgPnikQtaHeDP44PML6bUmtBLTbA6U3
         UdTun/vxjIpnqBvAS1kpG6RmAEeRDNSx/knlx1t+N8SH4oPWEB8jW2V4t06LBprss9nA
         b5eRhKau1OqtphqKj9cS+O+hhE2tYWCeQH9ZUbz46Vk73rldwslq12AwYEn6SkZGN7/f
         LxjEPlpGYL4713pUWpZ+JPhuPWAjpVwpScOCEhkYnSId84tcd2vaJgQInXzvbNL8Td7f
         HwKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792605933; x=1793210733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=36CIvPZFqSR3d1bRp5FOUkDzIh2a6VXH38LqlQMMHgo=;
        b=jDuJUiwDIowIxcQA052X7N706RutE2DboskKMflJaAv16X1x9IaWQI6ga929zxyyrD
         tOJn3kMXhmUqgCi+T4mRT+H7I9Z8bLwybs2BZdRZx7AUojI6kqOlBsD/w+TDrTGwhfwf
         SGwbicyvdzGmXDIM33XaIQMpM/L46h9A3Xc11iPnVE+vWuqFqIEof6OYyQ/6Gfv+9ZjW
         5eRFSZ6TSNMN4ju2IliKX6wItDiFrHN+/lAWQEUsoQ+hN37UirPE2GgU/TXFRBUgQrsN
         mIjBgZLHYKzvebFnv8DOt6+oSdCBVxvZaiCDBL00H+G+OOBKB01IIAE1uMhr1SFoDBog
         H/qQ==
X-Forwarded-Encrypted: i=1; AKwUvBw/6aqS/5M+i+CI2TbubZp9/BdP//ni9CSDUpv2AsMOnO7exRxyNjrS4k5WGJvlupySoXXQD12OPKA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKl49aospA3fhUPFX370Lj7YmVzHQtcYPniW5zb6Dzu8KyVst6D
	nmV5zSKQoRyIxHcqy1I7bHfJIi/oYWtkf53/J5gy+Xf+fZCGwSogp3KF
X-Gm-Gg: AYBFou1PhgXrcYh3LbMCAvOTlxbqEP2a9GFQH9uv8+KRDtz740rcPWLGsjQq9kkxpOs
	FNuTICCI7xe+5jTJfVDZRMboxF07HW+ygwa2rDWpFUms6WTUL6YnGwgvK/JS16icG4uCkhPvl5v
	E479/Z5RfEu8NfmxrZ3VTJ8Eoq8FDuEqERGlrNgGQrjCXw10mfcHH00C+yaxeLXD8z1gHhF7lSE
	kWWU0U9CRJZerpmEVfy02oi+lh2CMtXlH+X2Hnuw3TFfXkK475WkAD5h48KPKyjh946PbJXU52r
	JbE5VQYHTl4Z2APYuiUEbxOlggn3iwWyGG6tv+JUOdvbGFUmzyzRXWRz8x4d8L3fAPMeF9eIQVN
	SiCnm7ZvmhzW4qoMFM21Jms3MAGNRkvCEm6/YNxKUYsApeddBD3PkjJF81d8KD6tBjftmja+EdM
	PMjU0K5GDeYzzjfDwkpPRKoJu8YCz8oVf+f7OtblPwlvoZLrhu+sHopTFIpX+J0CR398peu2qFt
	VMeRU5KnZ7N72Pc17Woj6GDzRNEcicgb8CLyjc1b4fZDQ038aBrvJ/8dzOIrHQMXW2k4jNJbJ0O
	RzNGJbCVP4DpfAtwS3QUhRX0vpEDWgh3vAo/sWPf0Rmz+4L0+qjffRCO4nmoOB3TVUyMLuiOOC4
	EadrpTE5V8dCrpvwJrqiOqvrdGXTVd071
X-Received: by 2002:a05:600d:864b:20b0:4a2:1e1:d55 with SMTP id 5b1f17b1804b1-4a201e10debmr28279805e9.28.1792605932936;
        Wed, 21 Oct 2026 11:05:32 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c6:e6ea:6401:f04a:ac6f:988e:f33d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fcd13891sm47007775e9.2.2026.10.21.11.05.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 11:05:32 -0700 (PDT)
From: Nick Simpson <nick.simo@gmail.com>
To: Magnus Karlsson <magnus.karlsson@intel.com>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>
Cc: Stanislav Fomichev <sdf@fomichev.me>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Jason Xing <kerneljasonxing@gmail.com>,
	Song Yoong Siang <yoong.siang.song@intel.com>,
	Rusty Russell <rusty@rustcorp.com.au>,
	Max Krasnyansky <maxk@qualcomm.com>,
	Sridhar Samudrala <sri@us.ibm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	netdev@vger.kernel.org,
	linux-doc@vger.kernel.org,
	bpf@vger.kernel.org,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net 3/3] ipv6: validate checksum_start before fragmenting
Date: Wed, 21 Oct 2026 19:03:29 +0100
Message-ID: <20261021180329.26358-4-nick.simo@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261021180329.26358-1-nick.simo@gmail.com>
References: <20261021180329.26358-1-nick.simo@gmail.com>
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

ip6_fragment() and br_ip6_fragment() complete CHECKSUM_PARTIAL skbs with
skb_checksum_help() without checking where csum_start points. After
reassembly by nf_defrag_ipv6, the IPv6 header has moved forward by the
8 bytes of the fragment header while csum_start has not, so a
CHECKSUM_PARTIAL skb from an untrusted source (tun/tap or packet sockets
with a virtio_net_hdr, or AF_XDP TX metadata) can have csum_start inside
the IPv6 header, and the checksum is then written into a header that the
forward hook has already accepted. When csum_start lies before the
network header, skb_checksum_help() warns.

Add the IPv6 counterpart of ip_check_csum_start() from
commit 6785011f8b16 ("ipv4: validate checksum_start before completing
checksum") to the two IPv6 fragmentation paths: refuse to complete a
checksum that starts inside the unfragmentable part of the packet (the
IPv6 header and the extension headers before the fragment header) and
drop the packet instead.

For IPv4, ip_check_csum_start() is also called from nfnetlink_queue,
xt_CHECKSUM and xfrm_output; their IPv6 counterparts are not changed
here. A reassembled packet that is not fragmented again, such as an
atomic fragment, and an unfragmented packet whose checksum is completed
at egress are not covered either; those have to be handled where the
CHECKSUM_PARTIAL skb is created, or by a check at reassembly time.

The problem was found with LLM-assisted code review.

Fixes: f43798c27684 ("tun: Allow GSO using virtio_net_hdr")
Fixes: bfd5f4a3d605 ("packet: Add GSO/csum offload support.")
Fixes: 48eb03dd2630 ("xsk: Add TX timestamp and TX checksum offload support")
Assisted-by: LLM
Signed-off-by: Nick Simpson <nick.simo@gmail.com>
---
 include/net/ipv6.h    | 12 ++++++++++++
 net/ipv6/ip6_output.c | 10 +++++++---
 net/ipv6/netfilter.c  | 10 +++++++---
 3 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/include/net/ipv6.h b/include/net/ipv6.h
index 3de07e738538..949695cb6764 100644
--- a/include/net/ipv6.h
+++ b/include/net/ipv6.h
@@ -1029,6 +1029,18 @@ int ip6_xmit(const struct sock *sk, struct sk_buff *skb, struct flowi6 *fl6,
 
 int ip6_find_1stfragopt(struct sk_buff *skb, u8 **nexthdr);
 
+/* Refuse to complete a checksum that starts inside the unfragmentable
+ * part of the packet, i.e. the IPv6 header and the extension headers
+ * that precede the fragment header.
+ */
+static inline int ip6_check_csum_start(const struct sk_buff *skb,
+				       unsigned int hlen)
+{
+	if (unlikely(skb->csum_start < skb->network_header + hlen))
+		return -EINVAL;
+	return 0;
+}
+
 int ip6_append_data(struct sock *sk,
 		    int getfrag(void *from, char *to, int offset, int len,
 				int odd, struct sk_buff *skb),
diff --git a/net/ipv6/ip6_output.c b/net/ipv6/ip6_output.c
index 550965058991..55d7af9084d5 100644
--- a/net/ipv6/ip6_output.c
+++ b/net/ipv6/ip6_output.c
@@ -942,9 +942,13 @@ int ip6_fragment(struct net *net, struct sock *sk, struct sk_buff *skb,
 	frag_id = ipv6_select_ident(net, &ipv6_hdr(skb)->daddr,
 				    &ipv6_hdr(skb)->saddr);
 
-	if (skb->ip_summed == CHECKSUM_PARTIAL &&
-	    (err = skb_checksum_help(skb)))
-		goto fail;
+	if (skb->ip_summed == CHECKSUM_PARTIAL) {
+		err = ip6_check_csum_start(skb, hlen);
+		if (!err)
+			err = skb_checksum_help(skb);
+		if (err)
+			goto fail;
+	}
 
 	prevhdr = skb_network_header(skb) + nexthdr_offset;
 	hroom = LL_RESERVED_SPACE(rt->dst.dev);
diff --git a/net/ipv6/netfilter.c b/net/ipv6/netfilter.c
index a7025ec87035..8476e4ba399c 100644
--- a/net/ipv6/netfilter.c
+++ b/net/ipv6/netfilter.c
@@ -144,9 +144,13 @@ int br_ip6_fragment(struct net *net, struct sock *sk, struct sk_buff *skb,
 	frag_id = ipv6_select_ident(net, &ipv6_hdr(skb)->daddr,
 				    &ipv6_hdr(skb)->saddr);
 
-	if (skb->ip_summed == CHECKSUM_PARTIAL &&
-	    (err = skb_checksum_help(skb)))
-		goto blackhole;
+	if (skb->ip_summed == CHECKSUM_PARTIAL) {
+		err = ip6_check_csum_start(skb, hlen);
+		if (!err)
+			err = skb_checksum_help(skb);
+		if (err)
+			goto blackhole;
+	}
 
 	prevhdr = skb_network_header(skb) + nexthdr_offset;
 	hroom = LL_RESERVED_SPACE(skb->dev);
-- 
2.53.0

