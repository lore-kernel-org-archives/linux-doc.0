Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794529963;
	b=e/82KpDJfR9VmRHzYwgyIOMCzAz6XbkO5+rHjmuW9CjQ/B4nv0/mQLEpNmi1Ik52SqqO
	 Qc1RpSgiussHZYdbke9RSWMmUKhrmJgOzFmduBcPpo+itC0uVKNHYKto8ArJtOib/q22+
	 uy7gObPgjs9p+fpZKOFp/uHKb1DqkiTPh8Tezy0i6qAsueH2p+x5Hv1jdK+sdDk2sLpAh
	 h7+qmOmlhOS8L6SERvSJophmYk7kFg7sBVza2LqwCy2kx8y16OZCoS9GBs7mbIGjhGOpi
	 +atjvo4aEx++VkWNIlvbQZTqTXzatBQstcz+3ATzYXRNXl7c2wpc3fU0axbvgN8sByw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794529963;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=di0YXOvt1TX8fBMVPqb7dX4e39H6bFtaLw/ptG6JcXE=;
	b=QIlq6SWHLT021Kyg9qOpL4q09p7OxoNhqv/ex4pXD7bJ61w4Z9xq/cRO/P5QwSJkPpqO
	 tD7wzjJER8WajUa2DBkKPlZRGE7No/S3gpmW//X1OGoL7Vy0YAd9wXKm76TukMIW7Dq6w
	 pgpnJ1VDo0xhETP/tKlgK6kl2uPCuSTsrh4MBoG+uvpkJrrkIKGevCprPCbYohVFZymYG
	 QuVu8eEIM44Ng6WKR8odA0umThvEq4HrlIL50ckrJU7JqncfyvtPuMVPb2ZOop/2MzIXF
	 /YEU5SXwquTw21qO/H0+/NwW0KfjfKOTnYI9lVWREdsbtb2miYIJMrgRzzR2o6pnThA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hTp29Dl3;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3770A60A3807
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 00:32:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3770A60A3807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hTp29Dl3
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a215e64962so5832625e9.1
        for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 16:32:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794529961; x=1795134761; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=di0YXOvt1TX8fBMVPqb7dX4e39H6bFtaLw/ptG6JcXE=;
        b=hTp29Dl3/fXwSC7T1y4v/ZOkf3y2Vs9AD5XVW6sK8tx/9Rd2znf2jvXkFcEnCV99c7
         43Wrvh+i/LIwGppmZT3IoAC7o+9UwWqw/Qwo9UEd25nwMjgAKmCNk9zwwAczTUqSf2E8
         mMuLPFzFlnwRwVLeg0pUCeUg/LFKVRFpzFm6q1LiBhOZVH1oZgqL9IhG9OlGzi9KBB2m
         jNd/628/BaUWjS3x8zw118tRw/p42CEXa2awQrPMrJva/pWpVphkYA7bdM7foEvCF0pW
         XUU6Q425Gq3BR5i4Yc5XzgRXocEsdDgdaDdJDE6/3oY1a6Ymehx9ePjVM/MDM7ZBOCYt
         Wd3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794529961; x=1795134761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=di0YXOvt1TX8fBMVPqb7dX4e39H6bFtaLw/ptG6JcXE=;
        b=cXUhTtGXoN0sp7VcREiB33orNBe1Y6MXwKR/LamzwPISkXMfMk+/xreMljq4IbLZD5
         4jPeOl9MGAZP2/VF9u/WWSF8QrdpciKyY8LxmuZJdm0HyoqLjdjsBZyomGUp5fZRZPED
         b86Uhc4RJcaWpm3b8iKwBymXzet4j/C1kxG/TiXguENc5w3jxjo6UlnDT27xFgokIwWn
         vAKOo46qod+sKIbPijYgUiA7frP8r3tcH0aF3NgW6on8iFu73S5JOjYfrzYc3Ib89rfM
         rLq2265BhP8wGvk+xu6kxxqetFd38qSAVkS/wxen9LZfRS/DLnIrktDU6c8shrWUVDC5
         BEhQ==
X-Forwarded-Encrypted: i=1; AL+hErFiN1x+So6u+C+MNLCOVfTLXVgbxYN3GYY40isN89GrBrkU7kb45L2+Q7RadJhEcmrArz4XYpBZ/mU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/DFnoqsljPl57B90e1+AUjh8I1c4Sh6/j1JVE51ZilXxrqujuO
	O0XLRigy1KauIL76+jxMzYqHYJh5wcWet4WIjoLakhtKnwSqSVI2/7Dx
X-Gm-Gg: AYBFou1hV/gqq8ISZnJQICKha2aTyD9+YnYUuDIUGwV9F1N9Ml0rjFz/J9RYiS1h2cR
	u+FZevgX7xfPXr4xdb0rufiUt47gvbG8GaGzGMidZ3Uc7MbdAkqoL0QxCy4G8qeyKC2hAzYD/ol
	z7S4b0LAz5ZKtv8UFU7NYKpPT3K8FY+rgPT/SwfpA/qtv6Ic2OLoapTY6cVX92Asn5FZkF0BtGN
	+UWcKOjTYVZPAvIZPAIV24V10V9uEpQ8u2gqpqs+Y3CO2fieJ8upjxNYQVApcJVdc4H7ZMqy5RB
	kRfjgMvZYM43vqUlIkO68YGap1KhvGVqwlaZ8mZ6Y/tsUxSMk+xnNKZz/2b+j0pX/nmcHMhKngZ
	nHUekTlbulk8LVZHpUO68pn1WqAGE8Evnc+w88dLbOeskfZID8RnpWjUBwK+uDxIl7LmBngWANk
	RyvXtAumpOksL4Jbbc0uuN6DlbutBKMljBVvZsCSPGPQqSvxV3SRgYY43+jMTVX0Gn2rAKHsbew
	OAi8hpiJ11egC0HYslAu1sO4F4w8CjLDzMXA8YhZI/hbTahhosZzvLvmSEx3ozRQhbCsp5ZLNRa
	KS94OZ0jF6fnQipX1XqCa6S2ylz3qzJn+kMTW2wjyBRGGaJ3GhTtSAtM8oJkzVUrs0f3GtklMLV
	K7ZWvLcdgQ8X0gtZkEd2AgyhZ1sipxyrYeL4Y0zLrykbWxUDbWdjJFdU=
X-Received: by 2002:a05:600c:c167:b0:4a1:fe55:88ef with SMTP id 5b1f17b1804b1-4bb55a92fa1mr18062495e9.20.1794529960557;
        Thu, 12 Nov 2026 16:32:40 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-212-171-11-167.retail.telecomitalia.it. [212.171.11.167])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm2029768f8f.23.2026.11.12.16.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:32:39 -0800 (PST)
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
Subject: [PATCH net-next v19 05/15] net: phylink: save phylink instance fwnode on phylink_create
Date: Fri, 13 Nov 2026 01:31:55 +0100
Message-ID: <20261113003217.197757-6-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261113003217.197757-1-ansuelsmth@gmail.com>
References: <20261113003217.197757-1-ansuelsmth@gmail.com>
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

The firmware node associated with the phylink instance might differ from
the device firmware node passed in phylink_config as such device can
reference the parent switch or other platform peripherals.

Some function might need to reference this firmware node after
phylink_create so add a dedicated fwnode entry in phylink internal struct
and save it on phylink_create().

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 64b00d324988..e2e0b313fd61 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -47,6 +47,7 @@ struct phylink {
 	const struct phylink_mac_ops *mac_ops;
 	struct phylink_config *config;
 	struct phylink_pcs *pcs;
+	struct fwnode_handle *fwnode;
 	struct device *dev;
 	unsigned int old_link_state:1;
 
@@ -2185,6 +2186,7 @@ struct phylink *phylink_create(struct phylink_config *config,
 	INIT_LIST_HEAD(&pl->pcs_list);
 
 	pl->config = config;
+	pl->fwnode = fwnode_handle_get((struct fwnode_handle *)fwnode);
 	if (config->type == PHYLINK_NETDEV) {
 		pl->netdev = to_net_dev(config->dev);
 		netif_carrier_off(pl->netdev);
@@ -2272,6 +2274,7 @@ struct phylink *phylink_create(struct phylink_config *config,
 	list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list)
 		list_del(&pcs->list);
 free_pl:
+	fwnode_handle_put(pl->fwnode);
 	kfree(pl);
 	return ERR_PTR(ret);
 }
@@ -2311,6 +2314,8 @@ void phylink_destroy(struct phylink *pl)
 	list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list)
 		list_del(&pcs->list);
 
+	fwnode_handle_put(pl->fwnode);
+
 	kfree(pl);
 }
 EXPORT_SYMBOL_GPL(phylink_destroy);
-- 
2.55.0

