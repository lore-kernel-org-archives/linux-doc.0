Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794868400;
	b=ojvooiZ5IOr3A8YK48bt0b4nn2Hgda1FvjKJcVvK9ZOkhpVsmuqiZ5Y2OXpGhvGChHLP
	 gkMZNNhtkvEQjLVNZEdmZr1xwMzTAaKYshyUE0W/cisO9lvqVuDSWSqUf/Avd0QryT9u9
	 CCi7d4bD2TADwnotCwutSU6Ux+yUYx8pa3vJH4VSLglwHfTPYeKPcIfPZyw9vSyf345Rv
	 QKPECTU5O/l2CBp0RYFkEHENzTEYHAKQkFOSTAD0pHYMYKOMP3becSakK+WyOQmrYp8sR
	 zHQ+TMl1/8vNhGq1qRGO0B83zycFtz40x7/gGrobZSegeBVKUaaTXrhLzrqt2gslb2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794868400;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=WsVmZB0UH8bgbSx0D+T0vzINQcKZFGUzB4qEYlW4WKE=;
	b=VQ4VGcSqKfUhelQp9oejgGOWKSYIvZBxuEDoO2wbgkjO9XlUr09ZwdboaTlOLrMdsoJP
	 qEJ59bo9pWiaa7Bz2GmM0peILllvRaaBLtCjHWCIVHj4/Wg5HdOZppA1JarWm10ZqMO6F
	 0zq5mzgUc2MNZ1T0fcpJeZC82xhOdeP6Jd9Lx3fybaiOAC2xCsbYAu8xh3xSx4tA1ImPf
	 HjJfbQo7br39Pqx71qZoVLT8iUI/FlVXGkN3elLTFEdrwPxYo4rtf/wJ4kOVGxegmBbHD
	 B8YEQ3vbTEyGkdPyarXMo+61E5AmEGHJPZH6KcR/TYnK3LXzMc+bbpMrxV4opFCnNgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=YlWrKEQC;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE988606A88E
	for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 22:33:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE988606A88E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=YlWrKEQC
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3b094e649d3so3380179a91.0
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 14:33:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794868399; x=1795473199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WsVmZB0UH8bgbSx0D+T0vzINQcKZFGUzB4qEYlW4WKE=;
        b=2XkoJh2h7CwqEdmtLCvn0+fJskK5pPYvu131tQz4t/00NY//sLiqx4A9K/PCJlwBej
         0BtzOeyGF0W7rdbbrY+dwfyJejFyH3U7ZtUda7CeCJYNWEiipzP8sqMOopUTxO7CYmGx
         wqrnQ6RcuWiWqr7lYXIbBYIE1vmuvUyNYAdh2EC8COTyjv+9CS8Mkw5kQvzH11eWrvuq
         bU7uSOuQiMlil7hzpXGcPEbyWbK1/hVrebw4YYh69LpkDnLfrUPIjmN7FhcjY3l8JlVX
         HKrxZaeo9bWo+xoGMTYEV5sB9u4+Gns4RFr4PhRlqhoC0TQAZIp72sV8vqv5XZ6X1qM8
         m7ng==
X-Forwarded-Encrypted: i=1; AL+hErG698O0fxiws7hRgJa0rKOtebh0e8UvxmszC9i4nt1DvTqnTthVAEbz7yyJGbOxHZXUro41JbXS3y8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/TRm5CejdcC5RTDI7dGsk17SDhq9UdES75uYyM7wR01+6Zohq
	7bVa8Wipj1eUFCq4OeFbgpEON3JdjngEhbRh3b0BRukk4oq+BbGl/xz/t3eLcaqyzWnxzNImTgo
	eQvgGxjLCbZDMdjkkt0xb6Yz8SHsu+DXGuvYLKvk2CSNmE56PjHA0UP8av2q5T3KsRlaaOj6MCN
	NRkTkLg+mTXJq4UOLq+Yp8JtijwWXyyWEr+UIq9Q0O/XVCMtqqVB+3RIVLiKo7/7Ucwx6ZVLYXV
	paHiOt0oTGzNnhNUE0a
X-Gm-Gg: AZFdTZd55MLtAzUaVJ3QMyAtk/wbiOJ0hWejbi/oFCmkh46MR1u7ItBItBJYy689qF8
	nxjozEGxmDLO1ww1Td7sqDFIh2Vgyy4l7q9/ZAlIpCDwIWfWgrMSlrZQ8XhcFGUUl0zP+JMagHa
	EyB5DB8HBPDc3RgHZUsiqL55nx+ZJRTCSc4WsJadCFGVq8Pa6xIY1H6pMG+7e2UAHf9VWB0rGCP
	LNd3ECdDQ6odbukv0awuYqcyhNR5w1K/b0YlOuEz8KxXyGeMFSXha0+LeoOcKThvH1MU1SWTEAj
	Es0/ebGgtFdWhqyluxM+J/0BoQAPj+JlPrdm9kHCuiYUArPIemvNG/cwwuiTr1qI/O03tYByM7a
	8ErLHs0xlXln2B/iturnWUPeep+y5NlICLQbzNwQ8IYhp4rEgrQlkMjn6HAMviQI29Jkcd8BVGL
	dHwMpFetNiUFOGtd77XmEadcE+ize2yigRzvUQgZTy
X-Received: by 2002:a17:90b:4acb:b0:3ae:533e:7e40 with SMTP id 98e67ed59e1d1-3b1b0b666demr12600583a91.23.1794868398862;
        Mon, 16 Nov 2026 14:33:18 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1b1ed0b73sm6366487a91.0.2026.11.16.14.33.17
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 14:33:18 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4c55ba309c2so4788079b6e.1
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 14:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794868396; x=1795473196; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WsVmZB0UH8bgbSx0D+T0vzINQcKZFGUzB4qEYlW4WKE=;
        b=YlWrKEQCZj1WaKU6BIRaq5LzE8ywqmxoBgYNMyuMHY1PCinpqfFzC2+dLmSOVPpb5B
         e0un+mkBN0y63+xjy1/IIHahi6B54KfEzhK3cRI2PV6EgmXNAojJ6tRX7kMkfyyKcWTs
         rgP3gNMWkuIlGBdSW29B2tkxL9aho35NZXtAQ=
X-Forwarded-Encrypted: i=1; AL+hErGCEc9lmOX+5JdidCqOFxRdsyDShGcLfLHuNJoONvfTgxu8XuyEb9TtPMQWswQFBQapyg8II6U8fP4=@vger.kernel.org
X-Received: by 2002:a05:7301:d185:b0:36b:fca0:80b3 with SMTP id 5a478bee46e88-37966961040mr12994346eec.22.1794867985469;
        Mon, 16 Nov 2026 14:26:25 -0800 (PST)
X-Received: by 2002:a05:7301:d185:b0:36b:fca0:80b3 with SMTP id 5a478bee46e88-37966961040mr12994310eec.22.1794867984774;
        Mon, 16 Nov 2026 14:26:24 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm50176624eec.19.2026.11.16.14.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 14:26:24 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	netfilter-devel@vger.kernel.org (open list:NETFILTER),
	coreteam@netfilter.org (open list:NETFILTER)
Subject: [PATCH net-next 1/9] net: ethernet: bgmac: validate RX length against the DMA packet capacity
Date: Mon, 16 Nov 2026 14:25:11 -0800
Message-ID: <20261116222519.1416501-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116222519.1416501-1-florian.fainelli@broadcom.com>
References: <20261116222519.1416501-1-florian.fainelli@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

BGMAC_RX_ALLOC_SIZE includes skb_shared_info and alignment space beyond
the DMA receive buffer. An invalid completion length can pass that check
and reach skb_put() with more data than the skb tailroom permits.

Limit received frames to BGMAC_RX_MAX_FRAME_SIZE and reject lengths too
short for the FCS subtraction. Keep invalid DMA completions visible
through rate-limited diagnostics and RX error counters.

Fixes: 6a6c708469c9 ("bgmac: add check for oversized packets")

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/net/ethernet/broadcom/bgmac.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bgmac.c b/drivers/net/ethernet/broadcom/bgmac.c
index 9ef239bc487d..1c502bd64d7d 100644
--- a/drivers/net/ethernet/broadcom/bgmac.c
+++ b/drivers/net/ethernet/broadcom/bgmac.c
@@ -457,10 +457,14 @@ static int bgmac_dma_rx_read(struct bgmac *bgmac, struct bgmac_dma_ring *ring,
 				break;
 			}
 
-			if (len > BGMAC_RX_ALLOC_SIZE) {
+			/* The allocation also contains headroom and skb_shared_info;
+			 * only the mapped packet area may be supplied by the DMA.
+			 */
+			if (unlikely(len > BGMAC_RX_MAX_FRAME_SIZE || len < ETH_FCS_LEN)) {
 				if (net_ratelimit())
-					netdev_err(bgmac->net_dev, "Found oversized packet at slot %d, DMA issue!\n",
-						   ring->start);
+					netdev_err(bgmac->net_dev,
+						   "Invalid RX length %u at slot %d (flags %#x)\n",
+						   len, ring->start, flags);
 				put_page(virt_to_head_page(buf));
 				bgmac->net_dev->stats.rx_length_errors++;
 				bgmac->net_dev->stats.rx_errors++;
-- 
2.53.0

