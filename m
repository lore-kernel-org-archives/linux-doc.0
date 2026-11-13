Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794590031;
	b=BL/+YPyOa1MUvidGVudOJn+1WAkekSZFQeFR3bLHjuhEjfgkyS+Ws/KKcj1yuTHq6riy
	 7uRFegKHUmo+pwUbD09epCRE05urFODpDX2v0ftK8Q9HCGiNZFa/gW5d5ZL3tLf+F3rmk
	 XWg8wE7QNAYTZoFkc7eCwWCgiTqzBRU9PWPahKILcusW6GRJ3OTsxyQhh793DKSufBxBO
	 0teVtzRNGozaVAbbwQYwAGMsu2Akm8T2JmgEWRocTJ86fLYhb2WMMDmIgZqlL93UeCeqU
	 NHM7T4qz3ZH9yhhyVMvbwitA1vFUsHgDe0hkyFUUtOXOrAetQ0hwBtoGcQMFX5Cu7Og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794590031;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=qCcEEZhb+6X/eOhEZOJf7Q7PZICUyrmwcXum+u7HmKU=;
	b=t/QKtlWT9MDwoXTRKrTP1nN/Ugp6O2sbv2goCspPJ5eeIjiSMiQo3B4JJ6XOYuEnqWGh
	 7uP1/s5CGI5HrP8XF3HN3jPQruHuTnL+XCCHFDNVRBvUK+0csbwcH/WrK+V90HFAtRbor
	 xPakDuIw6xXMpA/u1P9mnF5PTS/0Vd5St7T828ubJKAJ5S4/99Wo5U5PjreVuD9+K5TFt
	 mWhSJG+l16+tINzlTseKzc3kONi4Is2xobmGWYcDIEt3fCPz5jfkWASlmTfoN/I/LNgAU
	 ki2Ax3Jfts2t+wc+nNzw9LB9fDVGy1ZyACVH0Y2lOgPN2ooO5ab8LMD/c9W3JOdWJ+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="CKD/anro";
	arc=none smtp.remote-ip=209.85.210.48
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4522660A3816
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 17:13:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4522660A3816
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CKD/anro
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-84a248254f4so1321347a34.0
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 09:13:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794590029; x=1795194829; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qCcEEZhb+6X/eOhEZOJf7Q7PZICUyrmwcXum+u7HmKU=;
        b=CKD/anrooXAdTesQ5AHoN/+Wi6tR8Oawe0LHd6426sI1K2mO4CfKcooXALBiCwfMi0
         7fatyoeP+ALyXYlyV2F9x97jo69fNpLAEWOGnlE1fxsenB/CgAebftVlrjVJEa3ViFpj
         x3Wtb7Ljq9WbosO4KRE4+Isi1ODihnJ7AfxWJQ+rxmZAlgIP61PgjC/YpANd96DDhn0O
         JnPiBYxvy5mLS2Voj4kpE+YypdsC32S0RQbqEU/SIp/V7I8eAuQaG7+57/tmXggzGtbU
         ZzVD+uJZTVu4s4uyGeISbxipdpjB2Ph3ZHDLtyuvZqAp/B12qB3WeRaWTIxj5sT46f9b
         tXBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794590029; x=1795194829;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qCcEEZhb+6X/eOhEZOJf7Q7PZICUyrmwcXum+u7HmKU=;
        b=Q6rCATSoQMqUl5KLPrR/TdWMnk1tpccE2ukzCRye46L3UKZmUyEgoF15+4kLELEN49
         sl47WrsZ8yErO3b1bdzS7MXmLQp+gmNh49rSQhzciZGP3DvovcNcG+kKO8nALusKRCU/
         WOYLh2QBab2y5XoGS1Ku+rm2iNs9fZJfcgvDOwXACAK8GUgwFJw5IkAezhG/ELxQAr5m
         8pSSu2UW6FOVG/EqNDvNS5k+Unn7v5LREdDtrCzbIX5HPKwFVEBlJj/qkXgl7fadvMrP
         s3+jjxZwfQ/6PL04JFIB554D0KtAOY91xOk5S7LhgYLgHsgkjIPjvF3bMP+a1T8aqohu
         Sx6w==
X-Forwarded-Encrypted: i=1; AL+hErFQz61EM1lBqigbmLAD/8UbuiCAUM4PWI5RVr/ynTqyKg5Z0gnAqzpTIxes6BUr+e2MZOO4V9Idf10=@vger.kernel.org
X-Gm-Message-State: APuU4Z9guMa4gOqtCOJ9XP7siuwr7VcXyq7j1joZLThz0aqT8bv3nyTe
	UN0vQXyPKKFrsUmz/IXpK0yLLRQo3xOoKsAOqul5Wqf7g7V+ro175LAqV9JlBpgE
X-Gm-Gg: AYBFou3so9YRZGXu1xK+/OgaHXpDJOyE2QHLAReXTNEclfuH5F4ldMoRKk4xmLmvNNh
	BJdL/EH3Z6yFKjq/KSmf46yn9r4SQ4EMJdUpa26a0uSBo8QsImem9RfTq53P8JJZvmHeyHAwywU
	AfMcDrDe6hl9Zm5oI/u4QXihdwpMTqzP2270W1d17I9Cy6THZGmbJy8gcSI3O8+hKK3czrHk2fn
	eGvzGYebb8FE4CsSNDmmk9MBBrYRN6WrszSMbDmgcL8y68c02gBN7A+ezX+8+U2NrMF4j0KGbQv
	x0rB1O/wGlepKKtPsSHhoZaC3PkLsKD85mmldO7k6xZM0cl36+buUHxVA1e/2OymWkHTRJ0AJ25
	CGxibWDfrEBRNZIpR/h/mnnwZAs509sNwkShEP2G+2tBClYYAqK/CAFeu0gIrRqnhKrR/6LbZPe
	OcdwRhVt0+o6CJcOEQC5X7wZqABbwbOdeLryY/sf/rYSIt4M4txM9kdVFHKIjBQ9e3Uie8bNjrl
	DKgqzcgLb6rgF/RZYrrRrK+3co5BvXHfSOXLOG/8tCpjuDEhDJ07DOOl37Ki3fpXYitz5cFIgvM
	jRYABzViaHZCjKYhwDiPhn3ib+GezRh5OPAGGJi96IQwe50lxKuTBjhnn8rczLKmpOGjuttTEpm
	igMwdizk67KlMXCsKt4dGEIOg+WdNjEuilyM1z/BeMmFb0Z18+vzbqpXUkiHxzpDe3VQLZNWSwk
	XN15sf19kV8m3ervKF/zv4cnd1hq4CL5UseUJv0jj2U62R2573kSZm
X-Received: by 2002:a05:6808:4f25:b0:4c3:9892:96fe with SMTP id 5614622812f47-56e605b4ec0mr2987668b6e.3.1794590029081;
        Fri, 13 Nov 2026 09:13:49 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e7044690dsm2565805b6e.9.2026.11.13.09.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 09:13:48 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 10:12:05 -0700
Subject: [PATCH net-next v4 1/3] ethtool: add PHY receive frame and byte
 totals
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
Message-Id: <20261113-submit-acx00-phy-stats-v1-v4-1-986b8a4a1871@gmail.com>
References: <20261113-submit-acx00-phy-stats-v1-v4-0-986b8a4a1871@gmail.com>
In-Reply-To: <20261113-submit-acx00-phy-stats-v1-v4-0-986b8a4a1871@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The generic PHY receive packet and byte counters describe successfully
received traffic. Some PHYs instead count all received frames and bytes,
including frames with errors. A frame error count cannot recover the
number of successfully received bytes because damaged frames have
different lengths.

Add optional receive-total counters to ethtool_phy_stats and the phydev
statistics group. Count frame bytes including the Ethernet header, padding
and FCS, and excluding the preamble and start frame delimiter. These
counters describe reception at the PHY, before MAC or host filtering.
Clarify the same byte boundaries for the successful-only receive counter.

Append the new attributes so existing statistic IDs and their meanings
remain unchanged. Publish the names through the existing statistics string
set, and retain the unset-counter convention so drivers can report either
set of counters independently. Correct the documented group name to
phydev, matching the existing name exported by the kernel.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 Documentation/networking/ethtool-netlink.rst | 16 +++++++++++++++-
 include/linux/ethtool.h                      | 10 +++++++++-
 include/uapi/linux/ethtool_netlink.h         |  2 ++
 net/ethtool/stats.c                          |  8 +++++++-
 4 files changed, 33 insertions(+), 3 deletions(-)

diff --git a/Documentation/networking/ethtool-netlink.rst b/Documentation/networking/ethtool-netlink.rst
index eba226c79ec3..40dd454d4ad3 100644
--- a/Documentation/networking/ethtool-netlink.rst
+++ b/Documentation/networking/ethtool-netlink.rst
@@ -1665,7 +1665,7 @@ the ``ETHTOOL_A_STATS_GROUPS`` bitset. Currently defined values are:
  ETHTOOL_STATS_ETH_PHY  eth-phy  Basic IEEE 802.3 PHY statistics (30.3.2.1.*)
  ETHTOOL_STATS_ETH_CTRL eth-ctrl Basic IEEE 802.3 MAC Ctrl statistics (30.3.3.*)
  ETHTOOL_STATS_RMON     rmon     RMON (RFC 2819) statistics
- ETHTOOL_STATS_PHY      phy      Additional PHY statistics, not defined by IEEE
+ ETHTOOL_STATS_PHY      phydev   Additional PHY statistics, not defined by IEEE
  ====================== ======== ===============================================
 
 Each group should have a corresponding ``ETHTOOL_A_STATS_GRP`` in the reply.
@@ -1683,6 +1683,20 @@ by ``ETHTOOL_A_STATS_GRP_SS_ID``. Complex statistics (such as RMON histogram
 entries) are also listed inside ``ETHTOOL_A_STATS_GRP`` and do not have
 a string defined in the string set.
 
+The ``phydev`` group provides separate counters for successfully received
+traffic and total received traffic. ``ETHTOOL_A_STATS_PHY_RX_PKTS``
+(``RxFrames``) and ``ETHTOOL_A_STATS_PHY_RX_BYTES`` (``RxOctets``) count
+successfully received frames and bytes. ``ETHTOOL_A_STATS_PHY_RX_PKTS_TOTAL``
+(``RxFramesTotal``) and ``ETHTOOL_A_STATS_PHY_RX_BYTES_TOTAL`` (``RxOctetsTotal``)
+include frames with errors. Both byte counters include the Ethernet header,
+padding and FCS, but exclude the preamble and start frame delimiter. These
+totals describe reception at the PHY, independently of subsequent filtering
+or drops at the MAC or host.
+
+Each counter is optional. Drivers leave unsupported counters at
+``ETHTOOL_STAT_NOT_SET``, and the kernel omits them from the reply. A PHY can
+report total received traffic even when it cannot separate successful traffic.
+
 RMON "histogram" counters count number of packets within given size range.
 Because RFC does not specify the ranges beyond the standard 1518 MTU devices
 differ in definition of buckets. For this reason the definition of packet ranges
diff --git a/include/linux/ethtool.h b/include/linux/ethtool.h
index c3a41fbd5426..f3e0fac8fdfd 100644
--- a/include/linux/ethtool.h
+++ b/include/linux/ethtool.h
@@ -481,11 +481,17 @@ struct ethtool_eth_phy_stats {
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
+ * @rx_packets_total: Total received frames, including frames with errors
+ * @rx_bytes_total: Total received frame bytes, including frames with errors.
+ *	Includes the Ethernet header, padding and FCS, but excludes the preamble
+ *	and start frame delimiter.
  *
  * This structure provides a standardized interface for reporting
  * PHY-level statistics counters. It is designed to expose statistics
@@ -499,6 +505,8 @@ struct ethtool_phy_stats {
 	u64 tx_packets;
 	u64 tx_bytes;
 	u64 tx_errors;
+	u64 rx_packets_total;
+	u64 rx_bytes_total;
 };
 
 /* Basic IEEE 802.3 MAC Ctrl statistics (30.3.3.*), not otherwise exposed
diff --git a/include/uapi/linux/ethtool_netlink.h b/include/uapi/linux/ethtool_netlink.h
index fa5d645140a4..db26cff28f12 100644
--- a/include/uapi/linux/ethtool_netlink.h
+++ b/include/uapi/linux/ethtool_netlink.h
@@ -202,6 +202,8 @@ enum {
 	ETHTOOL_A_STATS_PHY_TX_PKTS,
 	ETHTOOL_A_STATS_PHY_TX_BYTES,
 	ETHTOOL_A_STATS_PHY_TX_ERRORS,
+	ETHTOOL_A_STATS_PHY_RX_PKTS_TOTAL,
+	ETHTOOL_A_STATS_PHY_RX_BYTES_TOTAL,
 
 	/* add new constants above here */
 	__ETHTOOL_A_STATS_PHY_CNT,
diff --git a/net/ethtool/stats.c b/net/ethtool/stats.c
index 9b0d8cb07675..b4c4bdd8fc4b 100644
--- a/net/ethtool/stats.c
+++ b/net/ethtool/stats.c
@@ -88,6 +88,8 @@ const char stats_phy_names[__ETHTOOL_A_STATS_PHY_CNT][ETH_GSTRING_LEN] = {
 	[ETHTOOL_A_STATS_PHY_TX_PKTS]		= "TxFrames",
 	[ETHTOOL_A_STATS_PHY_TX_BYTES]		= "TxOctets",
 	[ETHTOOL_A_STATS_PHY_TX_ERRORS]		= "TxErrors",
+	[ETHTOOL_A_STATS_PHY_RX_PKTS_TOTAL]	= "RxFramesTotal",
+	[ETHTOOL_A_STATS_PHY_RX_BYTES_TOTAL]	= "RxOctetsTotal",
 };
 
 const struct nla_policy ethnl_stats_get_policy[ETHTOOL_A_STATS_SRC + 1] = {
@@ -295,7 +297,11 @@ static int stats_put_phydev_stats(struct sk_buff *skb,
 	    stat_put(skb, ETHTOOL_A_STATS_PHY_TX_BYTES,
 		     data->phydev_stats.tx_bytes) ||
 	    stat_put(skb, ETHTOOL_A_STATS_PHY_TX_ERRORS,
-		     data->phydev_stats.tx_errors))
+		     data->phydev_stats.tx_errors) ||
+	    stat_put(skb, ETHTOOL_A_STATS_PHY_RX_PKTS_TOTAL,
+		     data->phydev_stats.rx_packets_total) ||
+	    stat_put(skb, ETHTOOL_A_STATS_PHY_RX_BYTES_TOTAL,
+		     data->phydev_stats.rx_bytes_total))
 		return -EMSGSIZE;
 	return 0;
 }

-- 
2.53.0

