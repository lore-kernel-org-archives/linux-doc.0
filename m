Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794590034;
	b=zRSKEYhNqyCia8K5v5qXBK802XuPbNwur5DaVBYcH2xka/mL4Qq/7T76t05IsfZc3E3z
	 ILJg0Tu5F+gFDLhwQ0Wxpp+rh5g2ougMff6rKqcFy7x45N8PKalc5lqotIPQXovyZg++x
	 i+2jTRepM1tgIjYU6A3Iao8XPuNwE7ZYUt9PM9uefZhW9jz4vtHMRlrGFdBaM+oj0cTSE
	 3ViZrIRcerimpd5egtt/TqJJfhjp606HHP9LaGnmhIIzFTsO0HCFwd0teDeaOh0Uk1sWE
	 X6ZPImJSBI/aVpZO5/zl48B6KIkclpYT+DKONDF+n+SOyLESuwLFfv+NEcW0jxc+vig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794590034;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=WndszmS84HjiqSPdoUwyV3DcA5YhceFMCYMxOP4FTNE=;
	b=yFjS4MRirf6iooqw1jvahMwm1MiaacrUIQbILmSxbYxIggF3Ewte7QTf+zBEayaLJKeW
	 aKivjvTbAeKdYPSpXfgGRBDbOlCZm6j4gWBAZAyLkISRG1TW2/9cqkxm3QY5KpEy7+diT
	 DhypSnORC8mOzB/OmdDS3sdBXJcsyxD/Y8xj2rnd/1D3doh3p31RywXgi6HCVxDiZlfF7
	 fCeODUXKlAkGWWaH5bAEjt9zi9+JXSyv2U08MSXu5Q3MsGmwaLqCcrpmOLzUOHJhkuSvh
	 4B26+go1/mZ0dOx7V5w3jPt6WUUBjobQeTgcX2ZqgyEGWkH8cRneWNqTDCok3gHUEqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=owj7+2Df;
	arc=none smtp.remote-ip=209.85.167.174
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7645560A6F71
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 17:13:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7645560A6F71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=owj7+2Df
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-4b28d9537bcso1565270b6e.0
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 09:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794590033; x=1795194833; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WndszmS84HjiqSPdoUwyV3DcA5YhceFMCYMxOP4FTNE=;
        b=owj7+2Dfmf835bdocKPx6HgeCYJj9vwIXyQDR/lGwQ1CLivf1zCoPclGyvaaliEXf7
         doZuUw3CqjvjoT+sjaLe/AfyUbxwilBkB3/WtREIUsNDgVvAn34NakRs14M6E60jA6dz
         Yd4U+UJ1sgCsUBP8xbopnVcKQbH1icRkxm8wSHdai+Y/Szip9jixkL+fgoNEwE+iDNnv
         /cQu86hstYhkwQAZku2h5zZ7zGmE5PGYKNMgWaiJzAuofNkMLiMZlkWYcS4sgLaX9prN
         uHF/3BAHTE7JgfRVJxami4+iPZxUVXPW1OCu853ZX4DrqSMjss/arXLzKbw82fET5Bk5
         DQaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794590033; x=1795194833;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WndszmS84HjiqSPdoUwyV3DcA5YhceFMCYMxOP4FTNE=;
        b=w3neI1lGP1fRxfOu77Ec0+TnfTGLBJ0dbGwygr9dH0+igbJP8uWfy7eap+b9y4VsNn
         hdIkor7NIq0RwAZvKMmX6IprFlbDxhiuczKUk7qhRV/elpRdKOh9qTj4LXyfNQWDlL4o
         qicR9qUpZPOKBb04zysNaRop0pNVaPOasRxUGGR+nPgNuyYDvWEcGuRq+jjAwcMAKdVo
         94Nr0xuL7FKO7Ltw0HWLKCA0mvZdFZcbQBoj7UX5VDbHddIEPar6tKdxaqjJV+dUCQh1
         jUxDohPu+xukPcEQECOF1gyYNOfusjE1HVy8inewxTwHmVYQzHJXEm2SS4ccKJYSFmkc
         Ad0g==
X-Forwarded-Encrypted: i=1; AL+hErEMOksYWKo/KbZQTpoZ0gom5KFr40mtq+eY/rWaXBKAy/cOciw4F6hySjk6z0+Fosqh86+ceQ0bKMY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xr7sxR7PSSLIGV4PV7C9XxlN++fhWDIE/tG9FDcaDzzJ86dRs
	vX26b4uKrUsjueXxDAICQS9yuZHxTvKX2pUUTGa0gnSQQw2/+iy/BN8B
X-Gm-Gg: AYBFou3e+liCNJNgHrhNNZUAfAs8Tt7Lg+sv6jF0TW2Yx1NnPOlM35xD+AgPtFqWYHE
	Rk4hraj5MuwvOfkNSo1MIrLNMR7/N2KL+u5imQ/fiyr+f0GLivZtPX/C5V/pYzTigT/RccJZVIz
	Tpl4X8NvtJz3Skq5STGDxBDraJs96YmlIX+Q2iGpOdnuVfIzdpom/MWDmiv7Gc+2vWgCWB2BVvA
	YfLzgbt0HUTDADwr5GEjFdDs4MMOr4sILPe1Ggol1FI7REUeciMnD/SRg8FHDQ21Y6rV4LbE+nv
	JNTqioiaIGd5E5p47/CW2tqtCukIBN9kt9mVsRpnIfBgwFmXbOhJ2j3VZmI/NImZjav39NAg8Id
	TUEms7oVvCjRFJP6N4ZQZvCEHOsQyzLhqwErDnz6zCRBzBwd7PsLOvh/dOmQ1dOxzrIIFGkDZBk
	R4g6eP/4Y1xZNVRfiX7730fOMFllLfcQ8RZP9wSEG5fOygtqPkm/TyQP7zZhWXOiE4kdWn9um6P
	jmTrOzXyqBZROI5Jbh+6R+jPz2pTnb5ibdOcOQLwonrASeY6laIJ1kicskZyzj225x73bnaoPwp
	ikFF4xeAKksQ/wDe3G2TVQTAFc2tB744vqGe5d3sNWRWmLHsbv2UDnMs3fZXB1bl9FBfHseping
	pQe28kdkymPKuAtkAYF8ZONr4pDwT6xOV4RfeVhpldxlT2F56qkPEt5SMQw4P3NzUU2bKfpjca6
	yGDK8qeXSEglsjHT7XNeS/k0k1fzNAcweVaMb4g1kzfay5D/B8BdBa9g==
X-Received: by 2002:a05:6808:c3d2:b0:550:6056:aa66 with SMTP id 5614622812f47-56cd761c123mr4042742b6e.16.1794590033339;
        Fri, 13 Nov 2026 09:13:53 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e7044690dsm2565805b6e.9.2026.11.13.09.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 09:13:51 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 10:12:07 -0700
Subject: [PATCH net-next v4 3/3] net: phy: dp83tg720: report inclusive RX
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
Message-Id: <20261113-submit-acx00-phy-stats-v1-v4-3-986b8a4a1871@gmail.com>
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
 James Hilliard <james.hilliard1@gmail.com>, stable+noautosel@kernel.org
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
Cc: <stable+noautosel@kernel.org> # Requires the new PHY receive-total statistics API
Cc: Oleksij Rempel <o.rempel@pengutronix.de>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/phy/dp83tg720.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/phy/dp83tg720.c b/drivers/net/phy/dp83tg720.c
index 807ff5525ecd..6c0c8c6007e6 100644
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

