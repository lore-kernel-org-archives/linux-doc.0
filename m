Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795052350;
	b=3sb6Srhbw+11t5g47YeRd0P4EZshyhQQdStlGJXZX93/UeSKg21BM38d1f5gN4rGKrL7
	 lI8I8d61mVuobOa72eOk+NF7Fm/LP239NDtwytQ5Oo39gq3lgwWPv4+BUf4u+7VWXs4nD
	 3uPBVPWOsImATj6xpRaxVBp5XpIWGWq0xpkcwPET+4qutmrhQrNAiR3xv0TjMk53BTwkE
	 yBiwJMsEKFdvaQQguVQ/55ZWYa3JxK0qvXAro0N5LkapJaV/EmwaE4VLNIMrpLxCbJhB5
	 vIMVU854xIZaA/nF3V6aGhQqkAXpCCXsB6qGMi8b1dQZIrmeiDDfvTDNTE4rH7zKPrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795052350;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Z7qXRKp5SZinXOoTS4Hu0OjgCXPeE5hw4AaK2FgUeD4=;
	b=cZ0g0yz3qagfz1aZ8NiRjkodyCXl5Y4F/MmI4bjjXHgHqOeBrIAnK3ZvSz59SPqncFJI
	 rh0Xtql8taUlOa3VxCrCocH/o7rdpo7705lrctwWneI6Lb7gAOovfS/0URkniK83LWlZu
	 n4XszGOT+Nf22vAkAOTNII8qF6H+YiX/SYXM1VBd9+JG0qbYiVSFnKhuXhLDe8G+KwtEY
	 TqhSbsSEiLcFBOA84CBePHhI4KtgqSMlr3w0NtTZ4QnmpvDww4lq5koZQzFsPF3h6mRv9
	 Viq2McdooWLGm7KO7AgoMdwX3Kd5StkR/V/EI7BB0cN2qypkCu219AlgpvFw7XoSTqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=LttS7ehO;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23DC60A2614
	for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 01:39:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D23DC60A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=LttS7ehO
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4d581da0aaso206782666b.2
        for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 17:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1795052348; x=1795657148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z7qXRKp5SZinXOoTS4Hu0OjgCXPeE5hw4AaK2FgUeD4=;
        b=LttS7ehOHe22GxKUfz3V86dN1Orih0pj1MfLLknYUWQ0A7nfKW0m2VJyPK8/qVxLB5
         aY9TjKabMRh3Zj8zYdyglhC/g1u3w/Br3YrQ1X8+L32qCWqE8ww/uTysr9ZHLXw9M0j1
         dQPhlQ1F5/N8jbEL+PQyCAAHFF7uCNEDRT5JrPc1WwYdmhk+nwmAB4+J3WZml2+d5p0f
         7k/xf2oWQ33Jss5YSUFDBHrWINe0lnun4cW+rkOM7aJGHllqqHP4Ojp8ZLB6WBG1q0Gc
         MsZInUHw047fvZj7H+M8uJspu/KedpUx5VsxrpTjwpPLs2QZcfurh6MDWV9EOiPzNGg4
         rPeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795052348; x=1795657148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z7qXRKp5SZinXOoTS4Hu0OjgCXPeE5hw4AaK2FgUeD4=;
        b=vvu99+i0A6BOdhX4ZlzoFJB15knYASW2+0ZWP5KZYwreUrwmQHf3YPlvCJEPLmuG/4
         fWgM6VIPr0HMBHeWjXYOjtTtvb+IAGdPsbfTjXD51zPTfGFp6VNMEWaxjBRCkn21a/uw
         aRIO8QfU/97Y8UTM9s8yVA7yywdGCP/fngFRdZr3pchhGdDe6Usvm2RihRaoioNbQaTC
         ORHBaabgoEkS7BfUk4nLuBYOc1DD/oMyPEToUX6bJcthItHhTDPg1+d/boSZb1VImEhh
         7x5E9IP5fmh0oa8iSpt1LJw7Q9o+iG1LuZQqJfHmvZKAE9/8xHXzZ5EbScwqllWMALAI
         inDQ==
X-Forwarded-Encrypted: i=1; AL+hErEfT/neB6ehALy5FNB3551TyefXGU7wpUzt6kjZOquyyn980+9ODDpyH5hJdwyDFgsGU9Mah6IS01c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+klD54hjrgIvHuLnCuu5qxVXqc/nU68v4CTguMjNKOkudMKvsQ
	YNjuZD1Z7vzrD+9uch+tyUq7YURc3EpQ4W9YqYVjWLvY0sGq+cbIA6NljZENOBc7KU4=
X-Gm-Gg: AYBFou3mv6LV9ip58O85JtlDSXmlXuruhLjCKcME973tU5bsoqwq6hqBAwZQ6dkMYTi
	j9+4dQh1zBUC1X0LUv8exTGUXg7+scljks7fRfCFu/SsupRWOcDFjAXq44vnVZBA9AwitdMOIB4
	ntOFIf+eHtDm1czd+xK4DMIuY0yvaau79Uj/XehwuRHOuClhhsiqlQ6QPUGj8wEHd0cKJ+Soyc8
	/QJ2Jp3LwRlTAjq2DHwoDdSD+EJrwmunSpQlCSHkBaJMQiP35A6cNPGZHDWvcIPvmuYgEsU3yf3
	Fg969OKZb1wkP+y8DYBAKkgXoHzTm+Gnm+JaL0Mda8kac4avLJcPjzx2EhS7Q07hEIraSLEwa7G
	b8y2i/OIDU/vew40Jtlb1rQN04b9ziyzRTuQGWQArE7JzPe7Yae4qffC3qYczRrrqZUAVu2/lqt
	iXEJR1zSEJAHkQrsVE96uEaFm4WFzKafM4gkzytDHNA7KPTGxMUrv3yksOkerD8oIixw3BCYqQu
	eF595+r+xU7ZMPWlD/eEL5dsGp4229D8X+PZKZG4j6JkA7M4KBJyZlVKz4gd13dJiYPJK7Hf6Sx
	KBXFuYbjDyj9Z0l69RYz+TCAf8Qhh+X6kv2vyWY2CiNXPU4qz8wGJxOb8A==
X-Received: by 2002:a17:907:d409:b0:c50:5802:f665 with SMTP id a640c23a62f3a-c510e199db4mr418626366b.15.1795052348318;
        Wed, 18 Nov 2026 17:39:08 -0800 (PST)
Received: from L9JK9NPFH9 ([104.28.20.56])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c51233c4080sm59785966b.16.2026.11.18.17.39.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 17:39:07 -0800 (PST)
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
Subject: [PATCH net-next v2 10/11] netlink: specs: rt-link: add veth attributes
Date: Thu, 19 Nov 2026 01:38:29 +0000
Message-ID: <20261119013830.36935-11-tianyi@cloudflare.com>
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
v2:
- New patch.
---
 Documentation/netlink/specs/rt-link.yaml | 14 ++++++++++++++
 include/uapi/linux/veth.h                |  4 ++--
 tools/net/ynl/Makefile.deps              |  3 ++-
 3 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/Documentation/netlink/specs/rt-link.yaml b/Documentation/netlink/specs/rt-link.yaml
index 81b58633911d..36dece251778 100644
--- a/Documentation/netlink/specs/rt-link.yaml
+++ b/Documentation/netlink/specs/rt-link.yaml
@@ -2368,6 +2368,17 @@ attribute-sets:
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
 
 sub-messages:
   -
@@ -2427,6 +2438,9 @@ sub-messages:
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

