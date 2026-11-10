Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794278927;
	b=1apq13vQOaKRtpiYUrgHg/i9F8a+TtUNnfNQ9A2fhtxSYwx3ZbApk2fIsNhNK8Qhe6/v
	 C+koxWELySim+TqpnJ2AuqazioY/Qa5PVUac+NJpd3JqRwW7kFp8W/5EhMIQlp0zpka9R
	 OiXqwZ5jKEwJkRqV3OpUrj2Q3jnfns2QA1z5EYUH7zdYH7F8Eno6MBHMc/20jWE/J1SAo
	 lOCyBjJI8rsGM/7X9F11eRz/PUBfHG6AB/GvuHOnFcbBKSJd5LmJUpT/IIUKNI3CiHfwu
	 CQa7T2RKQIYmN3sEtiBhOTvUtxyRsIrM0smo9RRGX9xPm3l4TP2YItt4umIwCaXZDtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794278927;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=BHRxQlIaiWajaJuO9JYYnnOOia0A4g77AOl1VTZui+U=;
	b=mlcQiNWt16JWAnBoNLvF3Vs47ccMgJQP0kGPEPvraQFSqjqgdZizx0MaMSEm8xLXg9wk
	 l/H0G5VRceafb3BTcmM8ZwMh0ZLcT03eYg7BPrOgGGJr8Z9k8Wlxb4UUayB9OYyKpCDM1
	 eOfQpj8G1v7N0jGlzDkcCslA/782ny/nta5TK3KICRe1QsSNkwowuYLpo0d38rRveRsHl
	 Os5ymi1Ch6MoihkTHKIpfGb7KXULMa76vLWOcA4c585hq2+dU4w+A4COfkY1j3lQibdgN
	 grQ3apJxBwnfwvn29iQJI4QfY+Wdh3sQpqlHk7cCZ5rpuB1hkUvtIlGpYo8GlDjQZWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pgnnhYpa;
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0AEA606A339
	for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 02:48:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0AEA606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pgnnhYpa
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-8241a56cd70so994630a34.3
        for <linux-doc@vger.kernel.org>; Mon, 09 Nov 2026 18:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794278926; x=1794883726; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BHRxQlIaiWajaJuO9JYYnnOOia0A4g77AOl1VTZui+U=;
        b=pgnnhYpa+hViaNS9YaeVgJvvlt7DjPCEg6CEV7E4a+d7qOuc8AwIxeO70v6WkSc00c
         hNi/hRTrFAPFYd31SrjR/9LifMXpww+K5MEztQGhcvebaKRNFDZ4n4IryECMD67n94Qc
         KLyfDK/fZe0lwqE8cMK8MTMB5VWMPnunpjRMgqECqMGSedq45BJ4LSiolx3b2YF30f+C
         mHmBqajenZ+nYlt2tgZzhtc7QVGit30OlT9dkNvVEUzWMLnj576mJWu90paFS6K4LGSy
         VGKcH1HMOc2OHN53EiYmBR+Lego24QpY+yxHr3sypaM1E7aSeCJiXEzVOavSLGDC+zB2
         KrTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794278926; x=1794883726;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BHRxQlIaiWajaJuO9JYYnnOOia0A4g77AOl1VTZui+U=;
        b=fUcqDSmHTM2fRoTkPsHHEivrYtkouj5xVDz7BnbJZcJzIgfjQXUweVeM831OJqr1i8
         8/ojXbr1xtux4ed5uGhMRwIobvx7ouicudD3GJOlEL1wEpn6eWaJ+CPZzNPYWoMFwn5N
         RRtE0/e4Zm/6tpF2DBAciiWpQatmFY95fETk+UDV1iZerOLMrag0KP+UbiWsdWeaxoq8
         Jg0O6NMLLotceTVU/FT6MOBfP2zf1r/rWStJvBA3GSs31whb4gWhoh/lb9YDUSLWAo0S
         Gf5LFsgmXxma5OT/9A0xxSkpZkChwF6M8IxCsH4LSoPo+Gto4f6WHzGuAfkTEmWz0ZKH
         YkwA==
X-Forwarded-Encrypted: i=1; AL+hErHRl8wjuEOMaBgCJLF/bO6Smc8bh3QNB8Y17cfAEaM8FwcyMybbv0xIoCkS3J2QJWqNpAJTkqiCeVQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9eN2NctMxQt+RDYnqtdvpwbZWC0IxTdf/IZld7F4/IrC2UiQlM
	WU5dQ3OpZSokljLNLMowYULAnHUBfqZXhQLhbKiW0bBXtVdDFkMSyx65
X-Gm-Gg: AYBFou1yHFFn34aFG2T7Kg+e0Zs66pDuWDJ+iD4duLRLK6XjSh2DGCfowtfYucrxFdy
	NCAUXo6Ia53rnv7C7M1OAciUjNb1kAO9AjxM4zJ0PJmIhxLhH8yWVTh3QODCBhNirKf+guMfbvp
	aL0UdvGeCVfbriCcOuYMWPj+PXixtDf2a0cEy4iSIbWY5slqO3Mqlbzc/1Shb7Iprg/ZL0b28Qv
	h/JCQRj87KOA2jb1i6OlOpn9vNzNbtgXPI9DNHB0zuGEDEP/+cRdKH5gQC7i2x+b/zwQ0NE7Qbs
	SeQbBtUITFc1PF9mAVi/JrqY8yPK1dTJ5SeOlQHiUK3PdR1vF9/nhCoa9HtXIZIeHpjx8Hs8ub3
	u9RSRCvY00/Ccbw5OCj4TTmaJq5N4LlbKUGmX0w0/Nc88Ap8EzapH6pHSGCCI/bqChEdFUJ78DR
	k5WlEzivqzWNdlJypjIG3u9tzqkyuVEfHYEI06eIDTaqQGo5o340+MnJq8TfqPxjn9+IGAty2aq
	h99h7Jdw0/UZ7TMNY8YNoD+n44uZvuJs7oRhTrNP4p8MeHbBm7fVjaBOXCkBLKiMZ680njk4aIS
	DZo09FsAvqMSuLNmc1sTr4+Q2WideKyGRKMJbE1H1CyGFSwktjxDgFS5FYlxsGWM1QoX++xLFOo
	DhBgT4Q1IwEZT+0olXNrcjYij6scwTi7vFqV7pWeVIA0FOghZZaVOAZ7crjoJI8nN6Dn8u0Gh1z
	rs60JsaOb3slggDxjgZsBL9YSL49lQJ7biRDcFOVgDsh4Wx2QJVbu2
X-Received: by 2002:a05:6808:11c6:b0:4f4:6421:5efe with SMTP id 5614622812f47-5683cc5d435mr1120533b6e.36.1794278925766;
        Mon, 09 Nov 2026 18:48:45 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905f39c60sm943233b6e.14.2026.11.09.18.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 18:48:45 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 09 Nov 2026 19:48:32 -0700
Subject: [PATCH net-next v3 1/3] ethtool: add PHY receive frame and byte
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
Message-Id: <20261109-submit-acx00-phy-stats-v1-v3-1-fbc6327c5be4@gmail.com>
References: <20261109-submit-acx00-phy-stats-v1-v3-0-fbc6327c5be4@gmail.com>
In-Reply-To: <20261109-submit-acx00-phy-stats-v1-v3-0-fbc6327c5be4@gmail.com>
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

Append the new attributes so existing statistic IDs and their meanings
remain unchanged. Publish the names through the existing statistics string
set, and retain the unset-counter convention so drivers can report either
set of counters independently.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 Documentation/networking/ethtool-netlink.rst | 16 +++++++++++++++-
 include/linux/ethtool.h                      |  6 ++++++
 include/uapi/linux/ethtool_netlink.h         |  2 ++
 net/ethtool/stats.c                          |  8 +++++++-
 4 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/Documentation/networking/ethtool-netlink.rst b/Documentation/networking/ethtool-netlink.rst
index eba226c79ec3..5528d0f7afdd 100644
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
+include frames with errors. The total byte count includes the Ethernet header,
+padding and FCS, but excludes the preamble and start frame delimiter. These
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
index c3a41fbd5426..7a7b434ab1fa 100644
--- a/include/linux/ethtool.h
+++ b/include/linux/ethtool.h
@@ -486,6 +486,10 @@ struct ethtool_eth_phy_stats {
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
@@ -499,6 +503,8 @@ struct ethtool_phy_stats {
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

