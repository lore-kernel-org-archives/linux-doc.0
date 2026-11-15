Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794728761;
	b=WfotuyKjUv9Jpk1TIdw+QU2iA2KZUPeqcT4LwFeqpNvyvYURloJIELl8LFC2xMhzl/vY
	 GUL0YPFUlvlVWn5EweeWpgmbhjgzIZCn196C78ZPTW8OdAfQmPOUjnbc+ibhLvR6KM7hb
	 kv1y52CdKLd81ExtjHzlZv5nhyYty34jCGdoRJN/m4dJjCJ6L+e+i9WZqa4lImyxLJyPQ
	 E9yono7TzjRVkirGkwTFbxC2rd5RNSQump11ll/wIEmk9PByM5Wwx0oSkSIixbbROxp3R
	 Qu51+RlgZiKxKrjWlhgK5ND/fJbWYpJk0U5gkeIJMgvVzQayFermxGKt7WyfejVp1MQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794728761;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=bXCmFppnlOHgAEmurgNladif/HYZYEFCrgJ8BcZWPv4=;
	b=boiXimmkikYbNCaRDUSEI99aoRhpbvEOKsncuICloZQ/lTCyl8Y0kIopjktGkYj1AFN8
	 ornZlLWWQlbPR85LxYSj7IPdkPOzKH6H7dsqItkH//qgdGkMe63SuAkGFPfEwybqwS4gf
	 KfN8lyTddhREJ9zs7KUkKhTHBw/GbDDGgZUv06mcVIZc3mIw5O3mXi4UDsB80JakvF8Hm
	 9aVz+B0ntGi3HYtqYtVFvcogrRQWaY6P9DhUHIyj5uZ7BaSkimoI4kj11W+bCf4drBWJ8
	 H+wLXvm1hjxwZL/bSxw65URgvNwNOyi9z94uK/9gfwdYSVSBlDPaKRAX7fPjPf/F+qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CrbACdJm;
	arc=none smtp.remote-ip=209.85.161.44
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69B1606A89A
	for <linux-doc@vger.kernel.org>; Sun, 15 Nov 2026 07:46:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B69B1606A89A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CrbACdJm
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-71aed54d4c5so70039eaf.0
        for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 23:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794728760; x=1795333560; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bXCmFppnlOHgAEmurgNladif/HYZYEFCrgJ8BcZWPv4=;
        b=CrbACdJmIISrCeuPJihcOxY+P7oEzmYBO/8U4A7vqDSB4myAAzYVUCqgXtJWZeOm95
         76FysGZ9fNXGfIgHrVt807DwQRefZwLSTz7LlDfHEelYnq7czbaKcluZdap7w8xV+n6h
         6hwXMbdHIUrdBfLHsLmXMM6l0gx+1N/Wjf46LmJLqwewst7JR7FeM/3RY5esQJG2WyBP
         7icIMhrnLT+2/145sOy7Tes9R4PTlcBzrWknzwsmSZx7RqhljOGKuOsKf2hlmFDEkjyY
         VuppOABeog5pSUvbfdPdA9j4dTelNTqvJtStr3h/SaYkGsUYcb1+tN1mjmJtuff2gZR+
         mBKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794728760; x=1795333560;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bXCmFppnlOHgAEmurgNladif/HYZYEFCrgJ8BcZWPv4=;
        b=vkzaevGp12klx3aBZNAeR0QDuUnNIeqbug7+aKleVFBNJ2jdxfQUmsENVyiHxcpFYo
         wnrqn1NDoK8uuA5eRfHw7R0SzBy4H10itw4WGuIp+vaQkpKXq7Ney458BnuQlNBZmPjB
         Zh2wvxIxC5sFUuhksdzw8o9HFp+ZYQjnRiO6Qu9RU3ZEE8jUz8PTAAlxEeHp1Vm+I/QU
         HY0yjPizrJ+ZNaZyOzVLplUY1uLuWYIzKGo+7OWjYw8WaLgCb5ynxbQ2Fop6pNgpB9ts
         TDVK+b3KBRav2eM1OFUN+r40ZjWncnjvT6pvmWbIfmjDzwvvmn2JTn3e3ByHnHGMIw/d
         gyPg==
X-Forwarded-Encrypted: i=1; AL+hErFr20Me1D9jTsTKmbqnKnwJ+ZU5MSPw3d9SXav5Jkg4L29mF+gLrpmTPuB52oLCrl8SZM1KkNzCPJ0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gbg8hZUXlShcInnRFLwCdKNExOeqd38twG2so29AZ6bfIOOHV
	oQLkVwj/m/92im1+DHudZJkeqosIxVe5DkkAhQrllJHdz1/FzdoICGeH
X-Gm-Gg: AYBFou2NE5Fr1Zcl7DdCaHP+45nm8fIWn5d1b59J5aLUJQkYW76JEmCND6aKTTnYHOQ
	/kdIzpE0evW+tzXxx78tYTlKOSLRjjmI8Rb74SQ+My4/PgBmWZp7P7OXsUFxZxlN30KXpt6AzcM
	0uL+XZPkP8dfKtpHtthoYprRlMljCG1vkNtgfJPlYN0sHfqmJtXgXBz8IHRJMr4xVBTuxhjHH9e
	56+Em4cPZcNwg7+ntCWepj/lIvwWg75+dtsGNVlf3rTDjCTPBnI3r2amE75WzOMOacCuNvvhpSY
	6nu4ZfWMbC9CHsIbFnmeNqygUVpfXDK6RzqM3KxPByimzT77m3HGSwiMu3R32UJqS85BiVxrh8L
	6ORM0x9k3PKhdWaOMtflGKblGzyEtKQ9X0XHvdy5YEqlI8soQM+8MIPnOTMLKJPEKHWDndCI5yV
	66tSSlDdR+ehJh8QgGiDo1OHFbwZGsr75g/WSh4Vuhd8WhcTq6nnekb1utS06qF2BHvat7dq4x3
	L46odphaiAIROhghL9AJcg45500Cprx1DaHRzxbQBH0z4l4NcMT2+DcQeYqNJP5x5ZQoS19Oea9
	vEcFpHMCd13JtSoXiJeHk1B3mdF6A/M5R8N+tReJUp/xgAOdY2tEfN6EEWPQSR6ExjgOzH4M+4L
	LgNQwXNp9CGGJgQ2nRo0m9yz8R3IpXCMgz8e0jnsmNn6zLRxiId6/t2pPxiek7L7K61Iltvg7X8
	lDgwyGwC29NePQ9UUGXnmO4CASKF2Objm4f0xqmUnjFIJtVqtZJGfolFnXxLpt3PXnQP9Dau6R
X-Received: by 2002:a05:6820:162c:b0:71a:dd93:2974 with SMTP id 006d021491bc7-71add932e3cmr1368333eaf.0.1794728759631;
        Sat, 14 Nov 2026 23:45:59 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe233371fsm4831390fac.16.2026.11.14.23.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:45:59 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 00:45:46 -0700
Subject: [PATCH net-next v5 2/3] ethtool: add a PHY receive byte total
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261115-submit-acx00-phy-stats-v1-v5-2-ed81a7f54373@gmail.com>
References: <20261115-submit-acx00-phy-stats-v1-v5-0-ed81a7f54373@gmail.com>
In-Reply-To: <20261115-submit-acx00-phy-stats-v1-v5-0-ed81a7f54373@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 linux-doc@vger.kernel.org
X-Mailer: b4 0.15.2

The generic PHY receive-byte counter describes successfully received
traffic. Some PHYs instead count bytes in all received frames, including
frames with errors. Unlike frame counts, the successful-byte count cannot
be derived by subtracting a frame error count because damaged frames have
different lengths.

Add an optional rx_bytes_total counter to ethtool_phy_stats and the phydev
statistics group. Count frame bytes including the Ethernet header, padding
and FCS, and excluding the preamble and start frame delimiter. The counter
describes reception at the PHY, before MAC or host filtering. Clarify the
same byte boundaries for the successful-only receive counter.

Append the new attribute so existing statistic IDs and their meanings
remain unchanged. Publish its name through the existing statistics string
set and retain the unset-counter convention.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 Documentation/networking/ethtool-netlink.rst | 13 +++++++++++++
 include/linux/ethtool.h                      |  8 +++++++-
 include/uapi/linux/ethtool_netlink.h         |  1 +
 net/ethtool/stats.c                          |  5 ++++-
 4 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/Documentation/networking/ethtool-netlink.rst b/Documentation/networking/ethtool-netlink.rst
index 8659761ebc69..1dad86561823 100644
--- a/Documentation/networking/ethtool-netlink.rst
+++ b/Documentation/networking/ethtool-netlink.rst
@@ -1683,6 +1683,19 @@ by ``ETHTOOL_A_STATS_GRP_SS_ID``. Complex statistics (such as RMON histogram
 entries) are also listed inside ``ETHTOOL_A_STATS_GRP`` and do not have
 a string defined in the string set.
 
+The ``phydev`` group provides separate counters for successfully received
+bytes and total received bytes. ``ETHTOOL_A_STATS_PHY_RX_BYTES`` (``RxOctets``)
+counts bytes in successfully received frames, while
+``ETHTOOL_A_STATS_PHY_RX_BYTES_TOTAL`` (``RxOctetsTotal``) also includes bytes
+in frames with errors. Both include the Ethernet header, padding and FCS,
+but exclude the preamble and start frame delimiter. These counters describe
+reception at the PHY, independently of subsequent filtering or drops at
+the MAC or host.
+
+Each counter is optional. Drivers leave unsupported counters at
+``ETHTOOL_STAT_NOT_SET``, and the kernel omits them from the reply. A PHY can
+report total received bytes even when it cannot separate successful bytes.
+
 RMON "histogram" counters count number of packets within given size range.
 Because RFC does not specify the ranges beyond the standard 1518 MTU devices
 differ in definition of buckets. For this reason the definition of packet ranges
diff --git a/include/linux/ethtool.h b/include/linux/ethtool.h
index c3a41fbd5426..fedc127d9a8a 100644
--- a/include/linux/ethtool.h
+++ b/include/linux/ethtool.h
@@ -481,11 +481,16 @@ struct ethtool_eth_phy_stats {
 /**
  * struct ethtool_phy_stats - PHY-level statistics counters
  * @rx_packets: Total successfully received frames
- * @rx_bytes: Total successfully received bytes
+ * @rx_bytes: Total successfully received frame bytes. Includes the Ethernet
+ *	header, padding and FCS, but excludes the preamble and start frame
+ *	delimiter.
  * @rx_errors: Total received frames with errors (e.g., CRC errors)
  * @tx_packets: Total successfully transmitted frames
  * @tx_bytes: Total successfully transmitted bytes
  * @tx_errors: Total transmitted frames with errors
+ * @rx_bytes_total: Total received frame bytes, including frames with errors.
+ *	Includes the Ethernet header, padding and FCS, but excludes the preamble
+ *	and start frame delimiter.
  *
  * This structure provides a standardized interface for reporting
  * PHY-level statistics counters. It is designed to expose statistics
@@ -499,6 +504,7 @@ struct ethtool_phy_stats {
 	u64 tx_packets;
 	u64 tx_bytes;
 	u64 tx_errors;
+	u64 rx_bytes_total;
 };
 
 /* Basic IEEE 802.3 MAC Ctrl statistics (30.3.3.*), not otherwise exposed
diff --git a/include/uapi/linux/ethtool_netlink.h b/include/uapi/linux/ethtool_netlink.h
index fa5d645140a4..2e81f7345f72 100644
--- a/include/uapi/linux/ethtool_netlink.h
+++ b/include/uapi/linux/ethtool_netlink.h
@@ -202,6 +202,7 @@ enum {
 	ETHTOOL_A_STATS_PHY_TX_PKTS,
 	ETHTOOL_A_STATS_PHY_TX_BYTES,
 	ETHTOOL_A_STATS_PHY_TX_ERRORS,
+	ETHTOOL_A_STATS_PHY_RX_BYTES_TOTAL,
 
 	/* add new constants above here */
 	__ETHTOOL_A_STATS_PHY_CNT,
diff --git a/net/ethtool/stats.c b/net/ethtool/stats.c
index 9b0d8cb07675..9b9ada615ac2 100644
--- a/net/ethtool/stats.c
+++ b/net/ethtool/stats.c
@@ -88,6 +88,7 @@ const char stats_phy_names[__ETHTOOL_A_STATS_PHY_CNT][ETH_GSTRING_LEN] = {
 	[ETHTOOL_A_STATS_PHY_TX_PKTS]		= "TxFrames",
 	[ETHTOOL_A_STATS_PHY_TX_BYTES]		= "TxOctets",
 	[ETHTOOL_A_STATS_PHY_TX_ERRORS]		= "TxErrors",
+	[ETHTOOL_A_STATS_PHY_RX_BYTES_TOTAL]	= "RxOctetsTotal",
 };
 
 const struct nla_policy ethnl_stats_get_policy[ETHTOOL_A_STATS_SRC + 1] = {
@@ -295,7 +296,9 @@ static int stats_put_phydev_stats(struct sk_buff *skb,
 	    stat_put(skb, ETHTOOL_A_STATS_PHY_TX_BYTES,
 		     data->phydev_stats.tx_bytes) ||
 	    stat_put(skb, ETHTOOL_A_STATS_PHY_TX_ERRORS,
-		     data->phydev_stats.tx_errors))
+		     data->phydev_stats.tx_errors) ||
+	    stat_put(skb, ETHTOOL_A_STATS_PHY_RX_BYTES_TOTAL,
+		     data->phydev_stats.rx_bytes_total))
 		return -EMSGSIZE;
 	return 0;
 }

-- 
2.53.0

