Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794278930;
	b=y1EELFpwXpLT9KIlLVvCmw6zKQWcY+SiPx5ffgd+/gY3xetwvmuqP/fRmIuT4OXIpJ6k
	 fmJJgiQVNTFO0yjxhe7WpjgQHu6NvGAhNcGEFWCkDy3LayPs1uAZUcqmRTCqeA4rGvknT
	 5hwAy9AuCRV+Gir0KW8pJUzsLV2BH/gRS9dMpAM6RCkWFJLmbsLdwWZ6CkH+J5divwL0+
	 r9acKIRbjybFA6sARgQ0aCmVLHVpFarXtrhiorCMII9VKikeAdWrnOfwjU93Tt/1/fKN3
	 Qa34NjAFQMcKYWF5C379QF4yPoH4zvSJ0d4nzZgvwnzJxGCJXmXVUjKTSS4zT3AvyxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794278930;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=OgSry7e2g9JnvLRslnsp0vdPuCB33JbamklOGcvQymQ=;
	b=fCnhUkUwMitwpX9/MR2wJgRS+k+/ccvWMR7R6nHDI05z/7fi5gusn0KB9KemYqlpd25Q
	 8zd19KfpuO7CX0JW8114f3Vhzd3mtrd7vLBU6jKlZeqPaMsIuAhAZF0x6Fxc+N0tbWesb
	 seHvUhF6p3goXD6s5LvmOCJCOPi67p1ldBG3jZe34C6KHDaxy3rw/zSTAF9vc1FDiTvxN
	 HDWGywgK69FSV3iyywZ604RJ82WOpd4FBhssLrV/OTDhQl79EanV6rf95f47LVCwi4TrC
	 zEgAa0YnSXkVCIFEoL+eO2wun1Uycd03UiZH2eAg1WOYHhCaAU9wncogQm4w3oyBEtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qMaP2fWa;
	arc=none smtp.remote-ip=209.85.167.178
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846A960A2625
	for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 02:48:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 846A960A2625
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qMaP2fWa
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-53aa0802881so720770b6e.0
        for <linux-doc@vger.kernel.org>; Mon, 09 Nov 2026 18:48:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794278928; x=1794883728; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OgSry7e2g9JnvLRslnsp0vdPuCB33JbamklOGcvQymQ=;
        b=qMaP2fWa1IdIP/qpMN2FaoqsVUe90F4WS+2YQT/gI47mTIIiROmHTv/9fKDHOzNFZx
         vN4+GXG9a5foFAn1JP2X5owDAeGW0GK4Z8ALOURw0QMtH3HqRKgmPsYfA7qLrl/4NkjB
         ibFNL/J+MYlFTVVXtY38+1aUyZnWoCr24llQbUfCfky/b7fHrl/OaAb5xV8eYEnpkU6Z
         VrWaFqfjl/uiQkytrUZydtLRLvcfcNT8rFAPiPVjcKaLutVjDYoI7Q+ugFstmU9yqmd1
         /v0aG7rWIUGy0aDh/Et6Fns3P0sYYs8uc6YXk0PaVJPicHMPHW4RWxUsPJkMUrnuu8r6
         LRGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794278928; x=1794883728;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OgSry7e2g9JnvLRslnsp0vdPuCB33JbamklOGcvQymQ=;
        b=FPoYsHj2QaZmUdOz/gidh4S/PARIy4Ievz0sBjJTY8G+tR+aXjGfeh5y8YxEtDlFGn
         6MECCvlPiD/DHKEThQJ9KX2PPT4OtzM/MrLOwiKRdZTrWlXwmUEWxGggUniO2kVV21Dr
         N4re2M90Ia1We8uAjMem3sh1WCCSZZaeogfJKafVnvjFu7huQcNi8c8Jc52/mBFf4DZD
         ElL8wBRmaXXwpND3cNQbcv38hLRYobqwufaMttayhDbaUihCEf3QUB/qZpHSIrarlpG1
         sKn064ORfGcc+QbagEwYPm8iavOawYa9/llSV48JjmAKC4MksMH29MQ4sj9f0yzXUnPH
         VQCQ==
X-Forwarded-Encrypted: i=1; AL+hErF1pOcbIfO1WaEcVldypVPKAXGAUZxVMNPC5whqVVqdHSdBBGsjBFhQPrmksi4BAFoZ4Ro8Isht5qc=@vger.kernel.org
X-Gm-Message-State: APuU4Z971udVYMXVwXdv6gCywv3nT6VS+1fMaT9PdCGPlvfL0bMhIESh
	fd8G5Al+YnvIeN+bBK1LvaDz8nS8tyY3FpaVOExB71WtD97+k4ZKOvdO
X-Gm-Gg: AYBFou0o09f41Wk8JUZ2Yb432JJnY6ebq5nk5nIrtsTu3HzvHB/RMMnDFMabaEKmjJY
	U7tY91O2wwkD3oEuLETVmYHh9pFEBvDqh/6FCNH/QX3XzjH7k3sV5V3xdw4e01cuoKUlLMYK3L4
	wLtpo73hYSNLRzMlXlqYzk7HvsOisGChM89yq/adGW8dRqAIlzJh2ywPzpqHI4xMkHsDwNFKFe1
	ZL9vMe5dVbKYtvW2N3vVhsN8QaoCa41uJ69bMERWq3TjZTZ72s4Q8QjtvL6Qf3bgtxUk/TKrecL
	kht6Kurx30ORxCFDOdnvyOQrWqdPxNh8N5D6zWojo6aSGS+7swOj/LG/noDY6s1aiD+HNvd+iJL
	5LvxLveTmO29+EyMhPs412dHoFP0lu66g4kIBRLNcgcV0zPy6wLbh+uHCvXuA7IbJW460wnN0aM
	2n2wbr451fWX+RJlGtyOSu6p09x/IkfY2LdLw2KRrqEi7jr20jzye9xU43li6SAuakXwVSbW9YP
	Rw5GWNV+GL6pY3ZfKK9/7Fm+Zz6N9Vwjay00I6MFzAo0e0ycUnBfqfC8BzODlWiNRlpOesiNkKO
	oxQYHJyd8+8QYihqWVTEJJ/eHtSZkgT63h9ddQaPHPVC++EQ9rzootm8F6pRup0OLfH4jPDkif0
	i/c+dMHTioh9VjW5Yy7thFSRcPyWiYZ80EV/Jy6uVkw3cIIwyQ3sTYrS2KdXWjXGr7qMAQOUo+g
	h4JJ7pbL0XQLmAC+BjFgyC/tQnMBzoY0rB/qc6scSVKb5DbAm6jecK
X-Received: by 2002:a05:6808:c234:b0:53b:f634:83b2 with SMTP id 5614622812f47-5683c70cda6mr1164034b6e.0.1794278928446;
        Mon, 09 Nov 2026 18:48:48 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905f39c60sm943233b6e.14.2026.11.09.18.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 18:48:47 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 09 Nov 2026 19:48:34 -0700
Subject: [PATCH net-next v3 3/3] net: phy: dp83tg720: report inclusive RX
 packet totals
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
Message-Id: <20261109-submit-acx00-phy-stats-v1-v3-3-fbc6327c5be4@gmail.com>
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

The DP83TG720S-Q1 datasheet describes PKT_STAT_4 and PKT_STAT_5
(0x063c and 0x063d) as the total received packet count, including packets
with errors. The driver currently reports this count through rx_packets,
which is defined as successfully received packets.

Report the accumulated count through rx_packets_total instead. This
exposes it as RxFramesTotal rather than RxFrames in the ethtool phydev
statistics group, matching the hardware counter's semantics.

Fixes: 677d895af1cc ("net: phy: dp83tg720: add statistics support")
Link: https://www.ti.com/lit/ds/symlink/dp83tg720s-q1.pdf
Cc: Oleksij Rempel <o.rempel@pengutronix.de>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/phy/dp83tg720.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/phy/dp83tg720.c b/drivers/net/phy/dp83tg720.c
index 391c1d868808..5824eff92937 100644
--- a/drivers/net/phy/dp83tg720.c
+++ b/drivers/net/phy/dp83tg720.c
@@ -309,7 +309,7 @@ static void dp83tg720_get_phy_stats(struct phy_device *phydev,
 
 	stats->tx_packets = priv->stats.tx_pkt_cnt;
 	stats->tx_errors = priv->stats.tx_err_pkt_cnt;
-	stats->rx_packets = priv->stats.rx_pkt_cnt;
+	stats->rx_packets_total = priv->stats.rx_pkt_cnt;
 	stats->rx_errors = priv->stats.rx_err_pkt_cnt;
 }
 

-- 
2.53.0

