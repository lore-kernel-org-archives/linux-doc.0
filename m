Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795543179;
	b=Py4t+LtX82KQ6vpYHoaWZc7lDa33LN5KIRqu+8YzKDHz0id3SM/FwsMBNlOJpTFNMn3a
	 py/exGnw175AnzBynJs2kP1Xgt8CB3n8EWZV17Duo/DiHlCkogqihxWoXy3hu3lbw8qk8
	 xqV4YkXgf3DGixhjzC6/Xx70XRz9+4Sh0rxXdv5rKyEUU4rLz7H0nFhApM/s+5Or5f0pJ
	 7yT9CANqIgV0d6aHDdrFqyY0Upq3VO9Q4O+vl1+tBySfuN3D1K1dsErFyzyuJ0vurCZDR
	 7jXMnXSoH2ZndrBnqZ2mSiFGKRr8k6+4iJ+9el+csBeLFKS02z589gTOJQv/xCRxiWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795543179;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uaTj/IgjFnkwmASVrKkLUw8romAE2cVY2R2st4Lr99E=;
	b=YkIzGmIbLUved21HTINOGHD6lZZizpubChE8hi7LZy84UO7nKzXdugKAmyUgxl25zW2q
	 2zCJbnZympSMHLJEi1zdiU7b5Rd3X7dt5wf829ANtTYf+Z0LLTCnfhXzOWTKPncZ1ByLG
	 9jKsumJ+OPQhQST5nJZS7Iz2oqk45o6NHSvB1ybd1VHDW1K/eGEtxQGYOonH0r/eJ8c+m
	 NbVIA+p83kUBCpPf71aNmhVshuIeZwyhlRP9LPg6xsxMAz+YG6bdjrxTDeEJrYYdsWhqj
	 eB+mduJ53NlogUpuDRSIXusdADZlpXcgp9TAjAXHixVN4UpOsiDahCYD9Xoum1zdbfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=ablhK58t;
	arc=none smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7B6606A31E
	for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 17:59:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB7B6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=ablhK58t
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6ba38c41804so5607275a12.3
        for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 09:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1795543177; x=1796147977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uaTj/IgjFnkwmASVrKkLUw8romAE2cVY2R2st4Lr99E=;
        b=ablhK58t8MX2Gx9UkaoIkzL9AwdBhG+jhN7/JyA92ASWxcX3KuQRaPXU/sv2p/Doui
         LLdVv4w2HJP3jvDcSLlkR4x0f8lxYbu2Th76mnUvU/1//q548yfXfPf1y47o0t/nr213
         cx9qQE4fdbqjJTN3b7qTXmJQWEChes/ZHF7nVn3lPKUZO+BXU4yK5htEeRzA00bLNlbm
         Rexd5gkY+Z30hujxDUGmX6ycFjtvJwWguQ0qIa/LbA/5TLbclZWcNh3mZUtjFnPIx8fT
         JDnsdEg/PGybouR5+vOCHt8e5VCYcnhMNGBpMblnEPhIqr/ThraupuDOkUyqhAwu5NfE
         nKzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795543177; x=1796147977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uaTj/IgjFnkwmASVrKkLUw8romAE2cVY2R2st4Lr99E=;
        b=zIUZ7doadMzggpaQRvSxRF1jpAWfURhRJpv7KNS+9cP5MDlLRKMKhcO1yP23NcHI5Q
         FWULtDLJPdtKgyLxoQjhqOXttejOn/gGKe3+FghVN7LLc7iZ1Slz23wPg6b6cJnMEMe3
         rE1Hr0qKRqXBpQEHRhfTq+40Tun7VfWlnQB8Mn08ZsnEyqzBfqPsPw4s4ZNu16XLf/J3
         MjHq/xKgVLpNFftRmOhpEi+hWGnjWk/9jw/9ylPdHVTVbaEH+8U1ZIC+AgnV9qPxM+zv
         oeHmipeOoZMQgqxHucFrQNIr+QOSKT9/G1yX7c8wFmFmLFE0XQn3jy2IXOQQ1EIdhvF5
         BkOQ==
X-Forwarded-Encrypted: i=1; AL+hErEhi1xGav9zbI5HXbr7XFgs1pUxxROJ81Pm9hrCk+vXySOwyIFyUEI1DLEX9ThHNxRKmiZ1Lp1pqbw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8qr/J7MmoKDD1Qb7ZQP3wuesVYU0hXH3nz6bhFSrtC1gDiWdDA
	sVVch4u8ClAaVuJbDmW1A3s91rEKRaiGPoyOu7b5BZZ2O4PjO+qZ2tssOVuZbJKQzfM=
X-Gm-Gg: AZFdTZfMe6RNHN1pzCXUnrRmPvVBCxMrSJWcSYtBC86sTdMPV181Q6tx+eKeyrlWwNt
	/8DWt+DL+h+fWvvQIyDfn0ExPPuMHZdTylSurATzGtCOk654mHE3qcuLcS8yWfBk5qUZXSXA4R/
	xXQgAv6dKGhR2AAYSgDUnSr3zNLvURpANe+QLQJjz/2SxR8TG4K8qiTAv9o4slG+3UCKXRlDXEl
	fPDA43vuKQhHL3oBAJppBnjqkekLzP2UCz1hsYdzB+PPYOWGscWULrOG7+Jo0y8HRDwwpUiebtK
	9+OZH0pJQSRCgnHl2mbUWp0T/gefAEjrhVpEK586AwFZhbOVxvvgfUIXocC5irpzG1cYs4JnInZ
	CwqVYsJhYUAHQOQOpOstso/tVa7o83qda+b0JnHLqkbWYaEP7duZIF6DzsVJELt6cPAP6qCPIs0
	UKFzPehiKXyVYJsE3k1oUndJliAT6xO5G8Rs+omaT1V165nV1CamGNv7Wf4vy74heiTMOnnF95E
	T/EPJz7ImDZVr/NSYyn/TtoF33Lm+C4GTta1gFIMuIKjtrqLAY6M8tSg7qrkqufyrWRnnhUHi2Y
	sbAmpfhMLIvNyzzhpX9J8i2hgF2H71iWbKN0o7EF5XKZjkA=
X-Received: by 2002:a05:6402:2389:b0:6bb:1e07:2eae with SMTP id 4fb4d7f45d1cf-6bb1e073294mr273795a12.9.1795543177340;
        Tue, 24 Nov 2026 09:59:37 -0800 (PST)
Received: from L9JK9NPFH9 ([2a09:bac6:37ad:1e5a::306:5])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba3711ad52sm7205762a12.35.2026.11.24.09.59.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Nov 2026 09:59:36 -0800 (PST)
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
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Jeff Layton <jlayton@kernel.org>,
	Tianyi Gao <tianyi.gao@linux.dev>,
	Tianyi Gao <tianyi@cloudflare.com>
Subject: [PATCH net-next v3 10/11] netlink: specs: rt-link: add veth attributes
Date: Tue, 24 Nov 2026 17:58:23 +0000
Message-ID: <20261124175824.60470-11-tianyi@cloudflare.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261124175824.60470-1-tianyi@cloudflare.com>
References: <20261124175824.60470-1-tianyi@cloudflare.com>
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

Describe the veth attributes in rt-link.yaml, so that YNL can set and
read them. The next patch uses them to test VETH_INFO_TX_EXTRA_HEADROOM.

YNL includes linux/veth.h from the source tree with get_hdr_inc, which
needs the source header guard to differ from the installed one. Prefix
the guard with _UAPI, as commit 8066e388be48 ("net: add UAPI to the
header guard in various network headers") did for other network
headers. headers_install strips the prefix, so the installed header does
not change.

Signed-off-by: Tianyi Gao <tianyi@cloudflare.com>
---
v3:
- Add the maximum of tx-extra-headroom (Sashiko).

v2:
- New patch.
---
 Documentation/netlink/specs/rt-link.yaml | 16 ++++++++++++++++
 include/uapi/linux/veth.h                |  4 ++--
 tools/net/ynl/Makefile.deps              |  3 ++-
 3 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/Documentation/netlink/specs/rt-link.yaml b/Documentation/netlink/specs/rt-link.yaml
index 81b58633911d..c7967a9b3cc6 100644
--- a/Documentation/netlink/specs/rt-link.yaml
+++ b/Documentation/netlink/specs/rt-link.yaml
@@ -2368,6 +2368,19 @@ attribute-sets:
         name: mode
         type: u8
         enum: ovpn-mode
+  -
+    name: linkinfo-veth-attrs
+    name-prefix: veth-info-
+    header: linux/veth.h
+    attributes:
+      -
+        name: peer
+        type: binary
+      -
+        name: tx-extra-headroom
+        type: uint
+        checks:
+          max: 512
 
 sub-messages:
   -
@@ -2427,6 +2440,9 @@ sub-messages:
       -
         value: ovpn
         attribute-set: linkinfo-ovpn-attrs
+      -
+        value: veth
+        attribute-set: linkinfo-veth-attrs
   -
     name: linkinfo-member-data-msg
     formats:
diff --git a/include/uapi/linux/veth.h b/include/uapi/linux/veth.h
index 04cb408e5b3a..d22a29b1bbb2 100644
--- a/include/uapi/linux/veth.h
+++ b/include/uapi/linux/veth.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-#ifndef __NET_VETH_H_
-#define __NET_VETH_H_
+#ifndef _UAPI__NET_VETH_H_
+#define _UAPI__NET_VETH_H_
 
 enum {
 	VETH_INFO_UNSPEC,
diff --git a/tools/net/ynl/Makefile.deps b/tools/net/ynl/Makefile.deps
index f8850444d240..39abd83c014f 100644
--- a/tools/net/ynl/Makefile.deps
+++ b/tools/net/ynl/Makefile.deps
@@ -43,7 +43,8 @@ CFLAGS_psp:=$(call get_hdr_inc,_LINUX_PSP_H,psp.h)
 CFLAGS_rt-addr:=$(call get_hdr_inc,__LINUX_RTNETLINK_H,rtnetlink.h) \
 	$(call get_hdr_inc,__LINUX_IF_ADDR_H,if_addr.h)
 CFLAGS_rt-link:=$(call get_hdr_inc,__LINUX_RTNETLINK_H,rtnetlink.h) \
-	$(call get_hdr_inc,_LINUX_IF_LINK_H,if_link.h)
+	$(call get_hdr_inc,_LINUX_IF_LINK_H,if_link.h) \
+	$(call get_hdr_inc,__NET_VETH_H_,veth.h)
 CFLAGS_rt-neigh:=$(call get_hdr_inc,__LINUX_RTNETLINK_H,rtnetlink.h) \
 	$(call get_hdr_inc,__LINUX_NEIGHBOUR_H,neighbour.h)
 CFLAGS_rt-nexthop:=$(call get_hdr_inc,__LINUX_RTNETLINK_H,rtnetlink.h) \
-- 
2.56.0

