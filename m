Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794653098;
	b=z7hdclamVyGiLdWmLrtFnxXCJ6P3xcQkmeVV3CmFoTrl0DFUyUcfXm9k35yDY/C9ee92
	 eFBQDVLfaq7PNEMbRzpLh6NfFmvlI960M4CW+dk+6QnYI9BYCHMxo6Mnr1SBTjOvsFval
	 du3lZR6mA0Xm45ls6nME3lXYfO85dK3wsksvDLQb+EcD9T4n+Nkgcgsb74cWsEpUgKNuM
	 BFJPZTLL2wyPfUVHCT7hYgOZTELztz64K3n3r2dZFzOepytWfpyoM92vR6cGi2BPr+26u
	 7jD8FEcEhyZO9Q4pTeN+B5OxIVcnfFU4qf9REGnyW2Kx0gE7VT4gwOunNx6SHS0vCYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794653098;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=geHgxObFWVvRZemosAYU/Jzp3fHhQwXYyeBLmeYyX4s=;
	b=taZLsLN6+JdCvk6OLVLrbfJd50cTtsARgz8W+0tRdSUVc5qwpXO9RLbf31kYJDp/tDzN
	 Z4aGIhuBwUuMEgkpG6SyrZQjauutcWWIQXbZnjjH3nnN1YohKH5d+2NVnBrStZWGDfE40
	 ZqZSD1JQvHBZVwY8J9U0cdaOmcxG/k9Xum2EvC8Q2FzisdmjyhDU+nfm1Tmj0JO2izdXv
	 os+ZzMSUt6hgXwfpOaeQKDbOD90ePxK9cYkcjW4ixAJuhmgMtmZqUiwoZEKe2Al4ET9xu
	 XbqTk2vuLlifswmOHcYpcbBhzQix3SxFJxCbyqI1t4SMiR30oEN/b6+qTgiq/k5DZlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pntf8LZb;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBE2606CE2C
	for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 10:44:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FBE2606CE2C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pntf8LZb
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so11622165e9.2
        for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 02:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794653096; x=1795257896; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=geHgxObFWVvRZemosAYU/Jzp3fHhQwXYyeBLmeYyX4s=;
        b=Pntf8LZbqHpOVNNd/h1jSZzUejSxbTz5brbrkG3Tq+qe6YNq1BxEBY9d8GUioE+sSg
         Xw3DmSOCiVbkQPhvxxQ0o9r03NqpkIcU6OIFqUSdd0Mv1xrCQCygv9CfMdX/LI8iwqao
         sYht5dHs8vHj72C87rB6RlPbiYRxfZhlOYxN5P7EZzppWGI4wI69FXXpKTdJOS2pS+Sj
         7M3mSjyPHH48IdKyUCU6l879Fv43QlS23+qH2nLdwyLRuOD2hxZQsBX7lM2mpONYB3en
         m0AiIXxCvT5mi5zLPcCy03cIxq77yaHPFmnS3PBu+plfy7NXAyyC00Y9Nwb3r9NOQUSA
         VqVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794653096; x=1795257896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=geHgxObFWVvRZemosAYU/Jzp3fHhQwXYyeBLmeYyX4s=;
        b=O3W1buJfO/qNpVlFnGo6ZyObnuGWuxPmBIUf41gW/6UUdwDmpVh+ghK/IVEcMb2jCl
         /JhT8YcnQ2BVKNdJVWYRaTedaZvNZSd3oK7UrpSKVaVIytTXHBLFF5EEdqGxU98zrJIb
         yK2z4nWTFiw635LyXqxk6eAuGSgDUCvMFVPrEVD7utuNCpde8FJY19P/vBzOQscngJM9
         LSlbK2wtPspQyk/dYPowGQlC799qpqD+NwR3BnA1kaJoaeGhijZah1IBShgYzwM3oICD
         sqs7QjJpWNjW9vgH6B5ZKJjboCeV/r6pGq52MLCGidEw5GLwmUUfOtFmffES1bvZGAbv
         dGoA==
X-Forwarded-Encrypted: i=1; AL+hErHpgfg9B3YoET+TmZlNo2vgQ8GePIIB3ED37FADjFhetUPXUVJfR9bhFJo3EkF9fLdE54LE6msLX1M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xfxYh4UgqhWZREN69MlvAxdm/p0p5L8j41cp+Qakd4+Sgtr9x
	Zi8X6KaPbI47AT99AioPa/lUenEJYeGCYaaKUWC9/82OUpEUO3XLjnF2
X-Gm-Gg: AYBFou3v0ePFFoUvTqsDoSyBSePWxyW7N3FTXD+bNlid26wl6TAfmVzWg292c92950C
	XUhn+2Q6ZT6jPNiaAcEMfH0+vLHe/mroLCm59u1PUPiHZHgHI716k0Tu119mFhMWP8fMkWB44XB
	YhkJ1w4lq0IqdjM3uk0mGuOeV1F41OkdrU4HGRH4Q83FzDpdUNTscAEVEHbxfIulevIyRjqD7ms
	5YwqZgvDgxESHmcfzJ1mHDsGR+P0abxrROLbfnz6FfhWyuC0FxlAd0xBw41r5tRI4JjsuVH7l+e
	FVTy+Fnwnp6AStRjuM27RmVb71DRa1xD+o3smylqfMMJFDs0xInRT68CNYWKu1E9lbPNyByuE8K
	G2t7VKKBeHBuZwwMdzv54Bl4igONC6aMN4OxmoPdqJ3K7Gato/zaDqbqIfzDeYoOp7pwCyURHJF
	kg+885B/NQc96OWd3IaTLQavCkZp4jsM1PNN8eeouk+R3r3RJj1v+ctmo55grAQv/yOHfl2Wmc7
	l6p+pYKMQvjT3kjliJPFJnUfqmlC3N8EyKTJsUvv4IcC2zp+RAC6sxMtdfMk1vq3FjAsP1G6h4B
	SpkU1L1W3rfTENuC2EMb3BGHAPX0UCSDiSZF1lAdwkDzfPgZAnubtievjXCexF3ALnDJyNsHJcE
	na7BbuJHeI0rOKjUPs0o823OzyTl1oezW7Q==
X-Received: by 2002:a05:600c:4e8e:b0:4a3:59c9:a743 with SMTP id 5b1f17b1804b1-4bb55a8faffmr109717835e9.27.1794653096148;
        Sat, 14 Nov 2026 02:44:56 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb56719391sm52858285e9.1.2026.11.14.02.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 02:44:55 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
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
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v20 11/15] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Sat, 14 Nov 2026 11:43:50 +0100
Message-ID: <20261114104426.235620-12-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261114104426.235620-1-ansuelsmth@gmail.com>
References: <20261114104426.235620-1-ansuelsmth@gmail.com>
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

List all the files of the Ethernet PCS subsystem and add myself as
maintainer.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 893b0670a7b6..44c116f6cfd8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10033,6 +10033,15 @@ F:	include/uapi/linux/if_bridge.h
 F:	include/linux/netfilter_bridge/
 F:	net/bridge/
 
+ETHERNET PCS SUBSYSTEM
+M:	Christian Marangi <ansuelsmth@gmail.com>
+L:	netdev@vger.kernel.org
+S:	Maintained
+F:	Documentation/networking/pcs.rst
+F:	drivers/net/pcs/pcs.c
+F:	include/linux/pcs/pcs-provider.h
+F:	include/linux/pcs/pcs.h
+
 ETHERNET PHY LIBRARY
 M:	Andrew Lunn <andrew@lunn.ch>
 M:	Heiner Kallweit <hkallweit1@gmail.com>
-- 
2.55.0

