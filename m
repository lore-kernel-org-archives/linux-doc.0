Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794819607;
	b=oGiV6hRPeLVxnsUPbeauL3TVRxIFw8sUJxPMabLePXKkK7g8wZr5Gai/7SLmXPgxLSRD
	 +F7aizwhrXcKOLl7U1tC1zQXCCGqNUudHQ0kKD8Ez4R/FVEdkZ1jSKM+NDs8JagS0k1Dj
	 d+gLuUDcZWFw1ldRCulWYTU1sei0VMwOUasbV9XRCVwqhXsQSSYeySXnD59jRedGSeTTQ
	 56Irz59tmWtE6+EnRAGopHnSvZ+QIV6Y3PlV0OK3vlY+6tj5w55tQ4gMASLIrFtHgtN+N
	 m4pmps9LwkdYfbmGj4u92MYrecOjmVqj94QMlYy3ZWv1SvPazcYAwnjA4bDi37DFyIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794819607;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=muvZdkuFtn0hfXPNvFEMPR8KK69nJzaQNXj8cS0B7Og=;
	b=VBnRzcL1yOOEDCNez2npIeoavdgGPJzFqgB9eysbQGopOv/Epk31uMcGJUPRxe+3cmYw
	 SG9ml0DboxJaVsUE7AO8yBRu3uBJHKycRZGOb/C3guG1+inoK6F0LWbtv73x6vr/rLcVk
	 472HqZ1Wu1MTWCQe6nO92J+lCYd88+8iUoOszjtdc4N1kFZdLe4dH3zOY7nZFZvtB/wWP
	 6Kkj9gM7RIwFaBHh7Wh1USLqOHQCp5Juchu6fryUSl2owOJPd2eVQCx75WoMAs3I10PvS
	 9M5e7hYjcC9UxzJqKCGzR7oLQvuMQzRUoY91vCn1s6FERhIjpRd7NdhKnNg/ZS9GQDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ntpUZCCb;
	arc=none smtp.remote-ip=209.85.167.176
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41682606A88A
	for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 09:00:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41682606A88A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ntpUZCCb
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-571eb508e44so492607b6e.3
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 01:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794819606; x=1795424406; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=muvZdkuFtn0hfXPNvFEMPR8KK69nJzaQNXj8cS0B7Og=;
        b=ntpUZCCbXm2wFhbFbXhsgDTYNZw2HUGWwUUSI1oSVaNaS9so3zTtXeSudQXXoe+UBf
         Gfiusd+Co2+kmkuAsIQnUcjr1kF7T6FsXcXTbOWDCfK2fy6p59B2mnYdGl8b1f6W2aGu
         nH+Dd4hUUABrz9JMx9W8SVvgirD5x5KLgWo8ACb/I5IgI6ClVp2y09eIODbmF6qwqS7R
         1HNijtv7tuMN32q6NnPYe68MyuYAagEaTQD0UD9cpEeSiuA9vLSA+4h5i9rYaqbOImsQ
         z94qxCJb3F4FZzrEhETMsravLSPaxpVXOV7eiIHRVSx6TsJPtaco9zPon1VrBL7ROL5c
         FSJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794819606; x=1795424406;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=muvZdkuFtn0hfXPNvFEMPR8KK69nJzaQNXj8cS0B7Og=;
        b=hAejWgDOdcBvgb5N97T74MY+FGC5nJzWT23oAU576g/0FvmXVXmepTyt2b6aasRxpm
         yd2xz9tP2AXH+ZzVVv/1WWThESOwmo23uHCQDrPDMVUo3sORQ+H7PkAdAFTBq/uPsK2I
         Z6lZ6Y+K84KPxR+mbDFOARM+W2BOSXnNosmZ7wU8BYua0dfthNe5X//NoSlgrkSPokJS
         GdC+fgovBM+p3gU2owIOij7gyBlSciinMNGktXVcvA5rdc7YnhNAWlLzjFHY/KTgc7vn
         pFt8yMU1Bnpjz2bbQuI5zBwFwa0Z2xs84EGAd96cN2lrTeAmO3wPKheKWjqqw2Z8ItJb
         39gQ==
X-Forwarded-Encrypted: i=1; AL+hErFtCp+R1GFly5HJ2MYduJXVOVF2FSo8wLqoHBzXH9wCY3Uo1OgK5l7OwdABp/ymIallyBlFd68vU6I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/DaOK+gRz5mBQO+WMfHpm2aebfknPbqvGoIAacLURbPSdk17FW
	Q5a3Ao7f+x/jxTooBytaJq6ofwNoSdcR/v2evqqHw5KqTrJ0VbDIyuL3
X-Gm-Gg: AYBFou3Bvsph9huFOhoc/ewhWe7PY4bHCWhBkvZBTpdhKSRTn1+pNBb3TgmE1WpryzN
	zBtrU5ddtR5Hfy9CnhFvKx2gRr+4yJzL3TCIeEFNfd5iIfIxzk8VQ2nyboylN4k3UxOxxBNNgtX
	saOkUUNBLw4CxY8OtPYwaKoGhYd9YitNqzfA4m2YJd3L6eOBMDW8/3U02lW5mhU6yAUOjL6L9Kz
	X0hTZTPNM5/h+K66+mwUXJIMKJBzcY1YbHi2aN6WDDc3hSurljt7blhnQ+7liQfyp8qNx/wZNvp
	YAJulV3ejL+Nor3qUm16tIBmMD9Bq1BOwrTwprEiWg5Y45FuK4SOrAF7gdFD9pHgiuF/lQ6vPhl
	z1CYsSpuw05jzcbwizhrriqek5FInEltPr18C2d/HSRnA8yn42xIULl3TFnc0m7bTDuBSSt1mPo
	sfGpM8OBegARX4ILPC3xR+pNN+r7K4P0+E/iJfWJiSOSLv1pPzRZhzwDDGTTS8WRLEDVnHHO0rd
	Da08RgrRhDxf1ptAEtKOd5dADYM7IkLukh5oqThdv0S/2tQFeHo8RqyZ9OQmekPGFhnS+RKHC6T
	eNwhiK4xDaltBtdhZSxVosJKh1BMkGPVlWA+DlV2bpdy51heCzDeOh/pTbPt9bU92ceRZRKtiQZ
	6lSk/M/sFrbyqRQ0Iw36thvtiTO3o3WnD/2c9WTAWCY7d3cMbOdYk4+6ZAhI8En/b2+Xtx3vM5v
	BiIjRACJL7c1Z7S8QL0A/OwKehBCNIfI6PlgVBX1ZAPkm7hdwWTms63R0UyvtTJWK+zSdgYkKu
X-Received: by 2002:a05:6808:4f60:b0:572:d0fb:ae61 with SMTP id 5614622812f47-572d10afddemr4314071b6e.49.1794819605661;
        Mon, 16 Nov 2026 01:00:05 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5750329397bsm719177b6e.6.2026.11.16.01.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:00:05 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 16 Nov 2026 01:59:58 -0700
Subject: [PATCH net-next v6 2/3] ethtool: include errored frames in PHY
 receive byte counts
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
Message-Id: <20261116-submit-acx00-phy-stats-v1-v6-2-8feef8e76cd5@gmail.com>
References: <20261116-submit-acx00-phy-stats-v1-v6-0-8feef8e76cd5@gmail.com>
In-Reply-To: <20261116-submit-acx00-phy-stats-v1-v6-0-8feef8e76cd5@gmail.com>
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
X-Mailer: b4 0.17-dev

Some PHYs count bytes in all received frames, including frames with
errors. A successful-byte count cannot be derived by subtracting a frame
error count because the lengths of damaged frames are not available
separately.

No in-tree PHY driver currently reports rx_bytes. Define this existing
counter to include bytes in frames with errors so drivers can report
their hardware byte count through it. The counter describes reception at
the PHY, independently of MAC or host filtering.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 include/linux/ethtool.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/ethtool.h b/include/linux/ethtool.h
index c3a41fbd5426..9c3f079d9573 100644
--- a/include/linux/ethtool.h
+++ b/include/linux/ethtool.h
@@ -481,7 +481,7 @@ struct ethtool_eth_phy_stats {
 /**
  * struct ethtool_phy_stats - PHY-level statistics counters
  * @rx_packets: Total successfully received frames
- * @rx_bytes: Total successfully received bytes
+ * @rx_bytes: Total received bytes
  * @rx_errors: Total received frames with errors (e.g., CRC errors)
  * @tx_packets: Total successfully transmitted frames
  * @tx_bytes: Total successfully transmitted bytes

-- 
2.53.0

