Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795052324;
	b=yF2TyiGY4SIPQJGf9DUa9wJFIlyVSbYV4OiWqI7vgK7BQmzIWVADIuNiFCkY1kyo5Va9
	 b3RvxkklalFsjb1YYvBkN8wAGXm0BM1/OAG1H7jZwiNm5lAHZV9AUPSz5eR+YW5qS3O5Q
	 2N5yKMwQSBnKu0LftD9uvUCHj8G9NgxF+m+ax6PpKoJIAxniVT0kQHf3qXtsvNrBTMCzJ
	 hindIExlHrLuR3udNJwa53rrbTWC3EAnYRYWWsX8RUDOvesswOE503t6z7eqhskiSWqk5
	 2IfRB0VFBxH/+eUub/DoJg+nXwBr8my/kfTKZW7dmW+ZjvBV3aVi9D76HZgvJNTJsHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795052324;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Gt22CS9KurBhOaCwllbQzvFCleXjrzTFFkshOQCBzQs=;
	b=rfVLqoVDvc5PXQZODaWfPfVo95SSwhoX41W1VUxephTWvj54Z+7XwI2SQFSTMXwJgHxo
	 nKD1QVhBrTWXGHdLJMAeivq7++faHsFj6UpLKABEnSFVE1JeWAtjfMqeepZL/5blmU9JL
	 DiAQSzOZ9Y7C5VNqDjUCdKgSNDF8WiFTUMM3hwbh1JErhGQXYAi6JAP7jsFF56F47oHXi
	 OAglEErYylADVnnh856bQSoA7jAigzh7stdAprwrVXJE3BGb/Cuq5/OQwL74BC6QU6Vz/
	 qgYDrsz7FtnGN062C1IDEtkGuer+5AtzQHbHoxfQKthu5dvhqL5qUKTAoZHU8hSeH4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=FqjNUR0p;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA345606A337
	for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 01:38:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA345606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=FqjNUR0p
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c4d21051042so280717066b.0
        for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 17:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1795052322; x=1795657122; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gt22CS9KurBhOaCwllbQzvFCleXjrzTFFkshOQCBzQs=;
        b=FqjNUR0pj/V1OQcCToct5qmQlcnfTIuMF3YJLs3SLeiXwOogpBpF9zrc2qap++7cQZ
         CqUgQcntRbQC8o0eOrBIfjgldAaa/N9tsLyGFWvaFwiS1oMZ5zY/e/nYWeI2XQNsmz9x
         iTd9Objy7p6pMimgGhJZxGXAmmBdKJ2mOgl7hTssvte0/F+h7NlI+d6oomZpr3LyzsEW
         QERcPEhre6rtIl/Xcx+fbEg/XYP0h1rzRp3ujeqPbu8554aijADJln85rL9nvJx5rI1u
         cN+PtcAQYivWMnvIJmLOrfYkzbl8y30hzOqMfdJcWaztMsE2tTuV3rnfmNxKACUq4tvD
         7Slw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795052322; x=1795657122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gt22CS9KurBhOaCwllbQzvFCleXjrzTFFkshOQCBzQs=;
        b=ivfoo+LB3qRJE9GrTvg/5k17vJqvxD9MsAkNpP/iVJGoPbWqK706CI4DPwk/Lm3iOO
         LmrDReTiJORPo4wKgUCPPqihwGXTD84Na6iHLa/yGjrIy5YD3xJA9ZOHnLfrPm6mUyPf
         I1btQn0Ru5iDJ/yTrI1AzBpygisnbKxW9nVs06YXb5Wrlkb6aJ7pwg25xSgi6t3Fo72+
         nVU1sYcJtOrKYsn0pu2QO7OPVTlTk0i76ScoQR2ySOZbJYZfbLRYJ3wciFTeK9aYMU1m
         cGyEnCH7gkmTB4ABosrEe4NjLmaVoyHEwtwVwOcZWvWZhcfq0Or2I+TY60yALFAkQYOT
         aWEw==
X-Forwarded-Encrypted: i=1; AL+hErEyvgZyWzbqIsVZtpXsSzkN/EaNioowPqZKXRn8af9BBoGjXO2YBcBMJZDNvQBaFU9IPXQxM1T8SRs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/AZKNqw1vt00MSwBvtkDf7hEYR1qXY93/BS27aaX6enwKu3ZXm
	So68yvz9goFdpWOJn38VBAec6PVA+x+t2jG7THdpIi+KiqObj9CWviE6fr1p/mz5hVQ=
X-Gm-Gg: AYBFou0jZXI8XfPEnPOqJSxekusufm0XYR4phePzgCgMx1mJUKQbnLnilSNwV/glL34
	BfmVVVTcF014VT6cGbRaQl6RHYJCnCfNcEtNvMhn0dy605dBeFaCc/1AHMDbwWqnktmxCMF5tkd
	1LjiPnOuQoVcow2O+he5YFDVdsTPNbYKAWrgmO/MvixYgY/CpQeGQeE8As9MPyRKheG9GnKVjX6
	9bHl0Yd/NlfcDxc882ArwLv/jmT/e2/5MuIVVyHuHIevT82Z6gaPGhHKiy7AZchdlARCDBLWjnN
	wCSU7MwWyr78ULaGoFQ6HggmJn3D//oK2guWUCdPY5YIS76qccSjY2QHi085R13T+GokNsZDjqB
	70mvqBaLip5Jkw3PQZoTkprzm5dQg34Pa4J2wS/zMbo5DNAzGeCjqFstKarm6MdO7lOEnlXcHXo
	yigJ7Z9UBwBCMQ7AzLRmoDsbVZqD4cIolar00J90mklHl3BxoHR4RRBzsdrfeLwhZgh+DbFppjX
	6rj5d1SUCcV53LDf9ijjd4wZ2KqSlrP4e1Q3O7TiLuBadMQ0bM/q1fxP9tjRDdfdlCNvTMx41GE
	+Ya6Ik3ChPmjQUPCjLnBZgVl0eWunbM4lQZd4gBeCg1ZOjl+scZPofjl88o=
X-Received: by 2002:a17:907:da17:b0:c50:4c04:36e3 with SMTP id a640c23a62f3a-c510e349068mr350958766b.37.1795052322240;
        Wed, 18 Nov 2026 17:38:42 -0800 (PST)
Received: from L9JK9NPFH9 ([104.28.20.56])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c51233c4080sm59785966b.16.2026.11.18.17.38.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 17:38:40 -0800 (PST)
From: Tianyi Gao <tianyi@cloudflare.com>
To: netdev@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Eric Dumazet <edumazet@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Simon Horman <horms@kernel.org>,
	David Keogh <dkeogh@amazon.com>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	David Woodhouse <dwmw2@infradead.org>,
	Dragos Tatulea <dtatulea@nvidia.com>,
	Nimrod Oren <noren@nvidia.com>,
	Alasdair McWilliam <alasdair@mcwilliam.dev>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Magnus Karlsson <magnus.karlsson@intel.com>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Alexei Starovoitov <ast@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Breno Leitao <leitao@debian.org>,
	=?UTF-8?q?Asbj=C3=B8rn=20Sloth=20T=C3=B8nnesen?= <ast@fiberby.net>,
	Danielle Ratson <danieller@nvidia.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	bpf@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kernel-team@cloudflare.com,
	nh-open-source@amazon.com,
	Stephen Hemminger <stephen@networkplumber.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	"Remy D. Farley" <one-d-wide@protonmail.com>,
	Amery Hung <ameryhung@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Andy Roulin <aroulin@nvidia.com>,
	Anil Kaushik <anilkaushikwireless@gmail.com>,
	Demos Ra <demosthenes.ra@gmail.com>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Hangbin Liu <hangbin.liu@linux.dev>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Joe Damato <joe@dama.to>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Li RongQing <lirongqing@baidu.com>,
	Louis Scalbert <louis.scalbert@6wind.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Martin Karsten <mkarsten@uwaterloo.ca>,
	Matt Bobrowski <mattbobrowski@google.com>,
	Michael Bommarito <michael.bommarito@gmail.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	Song Liu <song@kernel.org>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Wang Zhan <wang.zhan@smartx.com>,
	Yonghong Song <yonghong.song@linux.dev>,
	Zhou Qiuyue <n0ps1edzz@gmail.com>,
	Tianyi Gao <tianyi.gao@linux.dev>,
	Tianyi Gao <tianyi@cloudflare.com>
Subject: [PATCH net-next v2 02/11] net: reserve extra TX headroom for local egress
Date: Thu, 19 Nov 2026 01:38:21 +0000
Message-ID: <20261119013830.36935-3-tianyi@cloudflare.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261119013830.36935-1-tianyi@cloudflare.com>
References: <20261119013830.36935-1-tianyi@cloudflare.com>
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

From: David Keogh <dkeogh@amazon.com>

Use netdev_get_alloc_headroom() and netdev_get_alloc_headroom_hlen()
instead of LL_RESERVED_SPACE() and LL_RESERVED_SPACE_EX() where the
stack allocates packets on behalf of a local sender and sizes them for
the output device:

 - __ip_append_data() and __ip6_append_data(), covering UDP, ICMP,
   ping and raw sockets without IP_HDRINCL;
 - raw_send_hdrinc() and rawv6_send_hdrinc();
 - the three AF_PACKET transmit paths;
 - AF_XDP copy mode, which open-codes its own calculation from
   needed_headroom and now uses netdev_get_alloc_needed_headroom().

These are the main paths where a packet's headroom is decided by the
device's advertised requirement and nothing else. Adding the extra
reservation here means such packets reach the TC egress hook with room
for additional headers already in place.

Paths that check an existing packet against LL_RESERVED_SPACE() and
expand it on demand, such as ip_finish_output2() and the tunnel
transmit functions, are deliberately left alone. Using the larger value
there would force a reallocation of every packet that lacks the full
extra reservation, including TCP segments that already have enough
room for the headers an egress program actually pushes.

ip_do_fragment() and ip6_fragment() are also left alone. They use the
same value to check the headroom of existing fragments and to size new
ones. A larger value would send more packets to the slow path, which
copies them. A local sender's fragments normally come from
__ip_append_data() or __ip6_append_data().

Signed-off-by: David Keogh <dkeogh@amazon.com>
Co-developed-by: Tianyi Gao <tianyi@cloudflare.com>
Signed-off-by: Tianyi Gao <tianyi@cloudflare.com>
---
v2:
- Follow the renames in patch 1.
---
 net/ipv4/ip_output.c   | 2 +-
 net/ipv4/raw.c         | 2 +-
 net/ipv6/ip6_output.c  | 2 +-
 net/ipv6/raw.c         | 2 +-
 net/packet/af_packet.c | 7 ++++---
 net/xdp/xsk.c          | 6 ++++--
 6 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/net/ipv4/ip_output.c b/net/ipv4/ip_output.c
index 5d6f5f5fc0ed..dedea01c6adc 100644
--- a/net/ipv4/ip_output.c
+++ b/net/ipv4/ip_output.c
@@ -988,7 +988,7 @@ static int __ip_append_data(struct sock *sk,
 	mtu = cork->gso_size ? IP_MAX_MTU : cork->fragsize;
 	paged = !!cork->gso_size;
 
-	hh_len = LL_RESERVED_SPACE(rt->dst.dev);
+	hh_len = netdev_get_alloc_headroom(rt->dst.dev);
 
 	fragheaderlen = sizeof(struct iphdr) + (opt ? opt->optlen : 0);
 	maxfraglen = ((mtu - fragheaderlen) & ~7) + fragheaderlen;
diff --git a/net/ipv4/raw.c b/net/ipv4/raw.c
index f33a9dfc5309..85e2178f36d6 100644
--- a/net/ipv4/raw.c
+++ b/net/ipv4/raw.c
@@ -356,7 +356,7 @@ static int raw_send_hdrinc(struct sock *sk, struct flowi4 *fl4,
 	if (flags&MSG_PROBE)
 		goto out;
 
-	hlen = LL_RESERVED_SPACE(rt->dst.dev);
+	hlen = netdev_get_alloc_headroom(rt->dst.dev);
 	tlen = rt->dst.dev->needed_tailroom;
 	skb = sock_alloc_send_skb(sk,
 				  length + hlen + tlen + 15,
diff --git a/net/ipv6/ip6_output.c b/net/ipv6/ip6_output.c
index 3cc911f6618e..50393d9a81ee 100644
--- a/net/ipv6/ip6_output.c
+++ b/net/ipv6/ip6_output.c
@@ -1493,7 +1493,7 @@ static int __ip6_append_data(struct sock *sk,
 	mtu = cork->gso_size ? IP6_MAX_MTU : cork->fragsize;
 	orig_mtu = mtu;
 
-	hh_len = LL_RESERVED_SPACE(rt->dst.dev);
+	hh_len = netdev_get_alloc_headroom(rt->dst.dev);
 
 	fragheaderlen = sizeof(struct ipv6hdr) + rt->rt6i_nfheader_len +
 			(opt ? opt->opt_nflen : 0);
diff --git a/net/ipv6/raw.c b/net/ipv6/raw.c
index 00d832c7cdae..00cf7475462e 100644
--- a/net/ipv6/raw.c
+++ b/net/ipv6/raw.c
@@ -602,7 +602,7 @@ static int rawv6_send_hdrinc(struct sock *sk, struct msghdr *msg, int length,
 	struct sk_buff *skb;
 	int err;
 	struct rt6_info *rt = dst_rt6_info(*dstp);
-	int hlen = LL_RESERVED_SPACE(rt->dst.dev);
+	int hlen = netdev_get_alloc_headroom(rt->dst.dev);
 	int tlen = rt->dst.dev->needed_tailroom;
 
 	if (length > rt->dst.dev->mtu) {
diff --git a/net/packet/af_packet.c b/net/packet/af_packet.c
index 6ace2a5b2d17..a1932a0e5e42 100644
--- a/net/packet/af_packet.c
+++ b/net/packet/af_packet.c
@@ -2032,7 +2032,8 @@ static int packet_sendmsg_spkt(struct socket *sock, struct msghdr *msg,
 		goto out_unlock;
 
 	if (!skb) {
-		size_t reserved = LL_RESERVED_SPACE_EX(dev, hard_header_len);
+		size_t reserved =
+			netdev_get_alloc_headroom_hlen(dev, hard_header_len);
 		int tlen = dev->needed_tailroom;
 		unsigned int hhlen = dev->header_ops ? hard_header_len : 0;
 
@@ -2860,7 +2861,7 @@ static int tpacket_snd(struct packet_sock *po, struct msghdr *msg)
 			goto tpacket_error;
 
 		status = TP_STATUS_SEND_REQUEST;
-		hlen = LL_RESERVED_SPACE_EX(dev, hard_header_len);
+		hlen = netdev_get_alloc_headroom_hlen(dev, hard_header_len);
 		tlen = dev->needed_tailroom;
 		if (vnet_hdr_sz) {
 			data += vnet_hdr_sz;
@@ -3087,7 +3088,7 @@ static int packet_snd(struct socket *sock, struct msghdr *msg, size_t len)
 		goto out_unlock;
 
 	err = -ENOBUFS;
-	hlen = LL_RESERVED_SPACE_EX(dev, hard_header_len);
+	hlen = netdev_get_alloc_headroom_hlen(dev, hard_header_len);
 	tlen = dev->needed_tailroom;
 	linear = __virtio16_to_cpu(vio_le(), vnet_hdr.hdr_len);
 	linear = max(linear, min_t(int, len, hard_header_len));
diff --git a/net/xdp/xsk.c b/net/xdp/xsk.c
index f22f9a2cdbbe..5932add2879f 100644
--- a/net/xdp/xsk.c
+++ b/net/xdp/xsk.c
@@ -1047,7 +1047,8 @@ static struct sk_buff *xsk_build_skb_zerocopy(struct xdp_sock *xs,
 	buffer = xsk_buff_raw_get_data(pool, addr);
 
 	if (!skb) {
-		hr = max(NET_SKB_PAD, L1_CACHE_ALIGN(xs->dev->needed_headroom));
+		hr = netdev_get_alloc_needed_headroom(xs->dev);
+		hr = max(NET_SKB_PAD, L1_CACHE_ALIGN(hr));
 
 		skb = sock_alloc_send_skb(&xs->sk, hr, 1, &err);
 		if (unlikely(!skb))
@@ -1130,7 +1131,8 @@ static struct sk_buff *xsk_build_skb(struct xdp_sock *xs,
 		len = desc->len;
 
 		if (!skb) {
-			hr = max(NET_SKB_PAD, L1_CACHE_ALIGN(dev->needed_headroom));
+			hr = netdev_get_alloc_needed_headroom(dev);
+			hr = max(NET_SKB_PAD, L1_CACHE_ALIGN(hr));
 			tr = dev->needed_tailroom;
 			skb = sock_alloc_send_skb(&xs->sk, hr + len + tr, 1, &err);
 			if (unlikely(!skb))
-- 
2.56.0

