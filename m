Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B7B1FCD12
	for <linux-doc@vger.kernel.org>; Thu, 13 Mar 2025 07:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741849293; cv=none; b=V9bgI/hl1vdGqgBUrioXASu7vAeQ3sD8a3J1tAQJr5ybqQpzXEUlUHvTDlZIXnGFq1/2P2c/EpVIkgFAxQ4pGkVsN9ITiXUXHbEbX9wnrTRfdzpvPnJtOOgPoBWCkFOo0ooWQ6kigPTNJvqAIZstk2BIoq2BFCxvIZ6hfuimK58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741849293; c=relaxed/simple;
	bh=A53HI8g8TXDmrSrb60YtMTi8R2diB0tM4HU4FoVrwbo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=Yxtk+9UX7FhwAWgKiY1hfArRG6iB+FrJ4vRlNV60o6UEQhf9i67daAtvtywvQuBVs5TT70tH284RfRuLFRmt+UW7TArWF0s9E0rab017pqR3RWIlPiy2d41ONu4wYUle0Z4QaKm2VLHZ+8mXjPXaG0nIh7L9u7Kjqe2l8lerW/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=XfqLkaQ9; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="XfqLkaQ9"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2ff615a114bso3189876a91.0
        for <linux-doc@vger.kernel.org>; Thu, 13 Mar 2025 00:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1741849291; x=1742454091; darn=vger.kernel.org;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fDwrrcdF9GBvmBADJUBP7MW6rPk3woZkA2TcvHwrsYM=;
        b=XfqLkaQ97jZVZUvmodLSLNJ4wG6gBKLmb1/OT6mAql6WMkkDIsJtZ96uGFV4yfwjlv
         CwV4BGYc6bTfAPK7KCugnVHh13Bmbyr6mT9ar1Ap9IFZYbaX1mtMv14OyWHApXNx7Ycy
         AlspjUuXE7hj8pBXJWq5U8AuDr+ebr57XirfzoZBjiQeIh7QF3Zr183spHP6gkPsMvK1
         iQl/WhW7JeQtZWdOeWMjbyielu1DXjA1XpVBCIBfBUkfnMBXw4pkP6wm04bVqJxg+jNT
         fvCANCpvNmTWUn10B9sKX3FZKQx85VoT6HeCBkhrDy6dLhOqQ9Y8hnAz0+6PmT9z5fHm
         /bdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741849291; x=1742454091;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fDwrrcdF9GBvmBADJUBP7MW6rPk3woZkA2TcvHwrsYM=;
        b=d1+/9wE7ut01+3h9oJrzULsl+4iyicg1d5n2CYUf4ZDa5bYh3s4aPzGakh+cUwCbZ+
         g4kHJRkbMwul1c4eCFVO4GcmU1GT3H5564szQ2bxYGMmzvEOezieREyTYaxJah2KCVwk
         7Vs9hXX+QwwQ4Etgr1VEqSBVhtKUGrOHanOMSayiBTiG0IyMD1jW6UsKGn8faYjTATLL
         kQfMnYvA78VyPQxQFAFV111HP+pzMZ6o41l/h89+2DGjpDdno5cBtIqaqSJS7tehgYZU
         fPdl8NynqHabvw/OJJMFEDLvtnhg8FpVKr/Vp946EByXetvAtRICKGVf483GKHDQZTtM
         BcFw==
X-Forwarded-Encrypted: i=1; AJvYcCU/8K4b/on4nSItVUGZ5pKl7wD/llE5QfLQOTCGSf2KbpuIvg+K+vhC1+V0JPJl0xUU6zk39/M67NE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2xNXlJXEAJ/rSs20OmW7+aeabyQNzj/nu8lJ5RSCGZt6ffq/q
	bb+Y/N0Rdlfp+mkh6OEt6FNzU/AmJ8x3a2FikcV5sT/bbJcAZVFzuSuWw0BKrqs=
X-Gm-Gg: ASbGncu0WeGeURh/GqZqJl5tzhnJqvQrPreeXUGZDJPB5pN8poq1D9TsdLroYuE6OX5
	QDJpGLxldjoYwN/I5mTQF7gNzDz/8aPuteeB/Ytxdru9snhAc8LZHRcCR3wF9PGffZ9+Su3gCOQ
	xxyw7PlGfbPiu6WDRLDIWqWJXBBbz83gG8lCgIDp+iPisO3N6kAwBWClUJAq7LorqI4iIgMX0Lb
	VoVJOQX6Kw1nAdQ06EDghuGlrllTv4CQMoRPfIlSfzvDGq0t7Rlfq/SssylX2M0IZTfpmq5NCfV
	Q5RiJhnNtRIN8aQBmyaq203RlIeTt/6Xrznz1CAIBb32UlnA
X-Google-Smtp-Source: AGHT+IGaJtk0WNynsJ9JKCAqWUVuEtMPgSG06nZ5ziS8mniutUxDW6cCWzTaKgfpp9YCPQ2Z9T9CgA==
X-Received: by 2002:a17:90b:5247:b0:2fa:6793:e860 with SMTP id 98e67ed59e1d1-30135da61b6mr2252846a91.0.1741849291028;
        Thu, 13 Mar 2025 00:01:31 -0700 (PDT)
Received: from localhost ([157.82.205.237])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-30118218423sm3400131a91.2.2025.03.13.00.01.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Mar 2025 00:01:30 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Thu, 13 Mar 2025 16:01:04 +0900
Subject: [PATCH net-next v10 01/10] virtio_net: Add functions for hashing
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250313-rss-v10-1-3185d73a9af0@daynix.com>
References: <20250313-rss-v10-0-3185d73a9af0@daynix.com>
In-Reply-To: <20250313-rss-v10-0-3185d73a9af0@daynix.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Jason Wang <jasowang@redhat.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Shuah Khan <shuah@kernel.org>, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, kvm@vger.kernel.org, 
 virtualization@lists.linux-foundation.org, linux-kselftest@vger.kernel.org, 
 Yuri Benditovich <yuri.benditovich@daynix.com>, 
 Andrew Melnychenko <andrew@daynix.com>, 
 Stephen Hemminger <stephen@networkplumber.org>, gur.stavi@huawei.com, 
 Lei Yang <leiyang@redhat.com>, Simon Horman <horms@kernel.org>, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.15-dev-edae6

They are useful to implement VIRTIO_NET_F_RSS and
VIRTIO_NET_F_HASH_REPORT.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Tested-by: Lei Yang <leiyang@redhat.com>
---
 include/linux/virtio_net.h | 188 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 188 insertions(+)

diff --git a/include/linux/virtio_net.h b/include/linux/virtio_net.h
index 02a9f4dc594d..426f33b4b824 100644
--- a/include/linux/virtio_net.h
+++ b/include/linux/virtio_net.h
@@ -9,6 +9,194 @@
 #include <uapi/linux/tcp.h>
 #include <uapi/linux/virtio_net.h>
 
+struct virtio_net_hash {
+	u32 value;
+	u16 report;
+};
+
+struct virtio_net_toeplitz_state {
+	u32 hash;
+	const u32 *key;
+};
+
+#define VIRTIO_NET_SUPPORTED_HASH_TYPES (VIRTIO_NET_RSS_HASH_TYPE_IPv4 | \
+					 VIRTIO_NET_RSS_HASH_TYPE_TCPv4 | \
+					 VIRTIO_NET_RSS_HASH_TYPE_UDPv4 | \
+					 VIRTIO_NET_RSS_HASH_TYPE_IPv6 | \
+					 VIRTIO_NET_RSS_HASH_TYPE_TCPv6 | \
+					 VIRTIO_NET_RSS_HASH_TYPE_UDPv6)
+
+#define VIRTIO_NET_RSS_MAX_KEY_SIZE 40
+
+static inline void virtio_net_toeplitz_convert_key(u32 *input, size_t len)
+{
+	while (len >= sizeof(*input)) {
+		*input = be32_to_cpu((__force __be32)*input);
+		input++;
+		len -= sizeof(*input);
+	}
+}
+
+static inline void virtio_net_toeplitz_calc(struct virtio_net_toeplitz_state *state,
+					    const __be32 *input, size_t len)
+{
+	while (len >= sizeof(*input)) {
+		for (u32 map = be32_to_cpu(*input); map; map &= (map - 1)) {
+			u32 i = ffs(map);
+
+			state->hash ^= state->key[0] << (32 - i) |
+				       (u32)((u64)state->key[1] >> i);
+		}
+
+		state->key++;
+		input++;
+		len -= sizeof(*input);
+	}
+}
+
+static inline u8 virtio_net_hash_key_length(u32 types)
+{
+	size_t len = 0;
+
+	if (types & VIRTIO_NET_HASH_REPORT_IPv4)
+		len = max(len,
+			  sizeof(struct flow_dissector_key_ipv4_addrs));
+
+	if (types &
+	    (VIRTIO_NET_HASH_REPORT_TCPv4 | VIRTIO_NET_HASH_REPORT_UDPv4))
+		len = max(len,
+			  sizeof(struct flow_dissector_key_ipv4_addrs) +
+			  sizeof(struct flow_dissector_key_ports));
+
+	if (types & VIRTIO_NET_HASH_REPORT_IPv6)
+		len = max(len,
+			  sizeof(struct flow_dissector_key_ipv6_addrs));
+
+	if (types &
+	    (VIRTIO_NET_HASH_REPORT_TCPv6 | VIRTIO_NET_HASH_REPORT_UDPv6))
+		len = max(len,
+			  sizeof(struct flow_dissector_key_ipv6_addrs) +
+			  sizeof(struct flow_dissector_key_ports));
+
+	return len + sizeof(u32);
+}
+
+static inline u32 virtio_net_hash_report(u32 types,
+					 const struct flow_keys_basic *keys)
+{
+	switch (keys->basic.n_proto) {
+	case cpu_to_be16(ETH_P_IP):
+		if (!(keys->control.flags & FLOW_DIS_IS_FRAGMENT)) {
+			if (keys->basic.ip_proto == IPPROTO_TCP &&
+			    (types & VIRTIO_NET_RSS_HASH_TYPE_TCPv4))
+				return VIRTIO_NET_HASH_REPORT_TCPv4;
+
+			if (keys->basic.ip_proto == IPPROTO_UDP &&
+			    (types & VIRTIO_NET_RSS_HASH_TYPE_UDPv4))
+				return VIRTIO_NET_HASH_REPORT_UDPv4;
+		}
+
+		if (types & VIRTIO_NET_RSS_HASH_TYPE_IPv4)
+			return VIRTIO_NET_HASH_REPORT_IPv4;
+
+		return VIRTIO_NET_HASH_REPORT_NONE;
+
+	case cpu_to_be16(ETH_P_IPV6):
+		if (!(keys->control.flags & FLOW_DIS_IS_FRAGMENT)) {
+			if (keys->basic.ip_proto == IPPROTO_TCP &&
+			    (types & VIRTIO_NET_RSS_HASH_TYPE_TCPv6))
+				return VIRTIO_NET_HASH_REPORT_TCPv6;
+
+			if (keys->basic.ip_proto == IPPROTO_UDP &&
+			    (types & VIRTIO_NET_RSS_HASH_TYPE_UDPv6))
+				return VIRTIO_NET_HASH_REPORT_UDPv6;
+		}
+
+		if (types & VIRTIO_NET_RSS_HASH_TYPE_IPv6)
+			return VIRTIO_NET_HASH_REPORT_IPv6;
+
+		return VIRTIO_NET_HASH_REPORT_NONE;
+
+	default:
+		return VIRTIO_NET_HASH_REPORT_NONE;
+	}
+}
+
+static inline void virtio_net_hash_rss(const struct sk_buff *skb,
+				       u32 types, const u32 *key,
+				       struct virtio_net_hash *hash)
+{
+	struct virtio_net_toeplitz_state toeplitz_state = { .key = key };
+	struct flow_keys flow;
+	struct flow_keys_basic flow_basic;
+	u16 report;
+
+	if (!skb_flow_dissect_flow_keys(skb, &flow, 0)) {
+		hash->report = VIRTIO_NET_HASH_REPORT_NONE;
+		return;
+	}
+
+	flow_basic = (struct flow_keys_basic) {
+		.control = flow.control,
+		.basic = flow.basic
+	};
+
+	report = virtio_net_hash_report(types, &flow_basic);
+
+	switch (report) {
+	case VIRTIO_NET_HASH_REPORT_IPv4:
+		virtio_net_toeplitz_calc(&toeplitz_state,
+					 (__be32 *)&flow.addrs.v4addrs,
+					 sizeof(flow.addrs.v4addrs));
+		break;
+
+	case VIRTIO_NET_HASH_REPORT_TCPv4:
+		virtio_net_toeplitz_calc(&toeplitz_state,
+					 (__be32 *)&flow.addrs.v4addrs,
+					 sizeof(flow.addrs.v4addrs));
+		virtio_net_toeplitz_calc(&toeplitz_state, &flow.ports.ports,
+					 sizeof(flow.ports.ports));
+		break;
+
+	case VIRTIO_NET_HASH_REPORT_UDPv4:
+		virtio_net_toeplitz_calc(&toeplitz_state,
+					 (__be32 *)&flow.addrs.v4addrs,
+					 sizeof(flow.addrs.v4addrs));
+		virtio_net_toeplitz_calc(&toeplitz_state, &flow.ports.ports,
+					 sizeof(flow.ports.ports));
+		break;
+
+	case VIRTIO_NET_HASH_REPORT_IPv6:
+		virtio_net_toeplitz_calc(&toeplitz_state,
+					 (__be32 *)&flow.addrs.v6addrs,
+					 sizeof(flow.addrs.v6addrs));
+		break;
+
+	case VIRTIO_NET_HASH_REPORT_TCPv6:
+		virtio_net_toeplitz_calc(&toeplitz_state,
+					 (__be32 *)&flow.addrs.v6addrs,
+					 sizeof(flow.addrs.v6addrs));
+		virtio_net_toeplitz_calc(&toeplitz_state, &flow.ports.ports,
+					 sizeof(flow.ports.ports));
+		break;
+
+	case VIRTIO_NET_HASH_REPORT_UDPv6:
+		virtio_net_toeplitz_calc(&toeplitz_state,
+					 (__be32 *)&flow.addrs.v6addrs,
+					 sizeof(flow.addrs.v6addrs));
+		virtio_net_toeplitz_calc(&toeplitz_state, &flow.ports.ports,
+					 sizeof(flow.ports.ports));
+		break;
+
+	default:
+		hash->report = VIRTIO_NET_HASH_REPORT_NONE;
+		return;
+	}
+
+	hash->value = toeplitz_state.hash;
+	hash->report = report;
+}
+
 static inline bool virtio_net_hdr_match_proto(__be16 protocol, __u8 gso_type)
 {
 	switch (gso_type & ~VIRTIO_NET_HDR_GSO_ECN) {

-- 
2.48.1

