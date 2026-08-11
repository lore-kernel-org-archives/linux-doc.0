Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D66942A15B
	for <linux-doc@vger.kernel.org>; Tue, 11 Aug 2026 09:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786440543; cv=none; b=a/b2WWH0B6X4KdTjcgpZzDQgM2UgVHdc1askNUQaiXs/MUMemsv7HD2Y0Vjzl26GXCM+sF60PRo5BFeFa1e0iyYTiPgKanE6/8XkNVmc3QdNfcZzfduthIYfDjLUQbCRL9Iy0qDt3BslaHGox2wZYIRI9tMdsKhcEleIzAWrVC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786440543; c=relaxed/simple;
	bh=NH+vbbaxZiG6Y0t+Ae1nwybjPC/wrZUjqEzfT2sfGrs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KYYUV/UFtkcvnNB62wPPN0dxrsC6PnbG9aDLrQb+iWYUj99EGRwnE8osEzYwxBcaRPngnB3WKkQxW2Ty4M9pufzAmcRAgLaW9yL1ZBNlvO6euyjBNmyPZ4dGWdCKnKTgf8St7A8aa9F43xU/z7ESCityzyuok0mEukRuMA2KZIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fQ+zB2XY; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fQ+zB2XY"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-495757ccbc1so31420515e9.2
        for <linux-doc@vger.kernel.org>; Tue, 11 Aug 2026 02:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786440539; x=1787045339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tBl3GBctv61bQMyEd2S/uBaFdUwcRcdsqM3BfaYguhk=;
        b=fQ+zB2XYNzxkn4unpGKpdgrc/Ca9BfWnw89y4oqBf5ExMj9MmAQPU/FYZLEf+3EokN
         NJn+X9YmYGrXVUpmu9I338bIFeOnIMDuVbQWSk/h0siZHJpczLXRq8TuBAUbAhbTm4o7
         XsluDR8z6IeXHsGBJaG35lKdyTbdoWvv9e63jDPu7EFNocH82qH+Eva2Gjk5NSWtPF+d
         hvmBZfkJP0hy6MmdmXgJdprOtVYFwTrEaPX/6BN68V1RC0kNfYaxgOkCSVJVZoKS2xpS
         IwOzgRJ34R7kX9g0LWoA8f0FatyQnztVOmgIMm9A0sx/fLOPohCJIQuDAZY3CP2c7Bj2
         a1NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786440539; x=1787045339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tBl3GBctv61bQMyEd2S/uBaFdUwcRcdsqM3BfaYguhk=;
        b=cH8jWjrUU6/lldyl7gkDorGh6WBFHO+5fpr1sGMbj4HMQ3u0zyMZrau6v1fLdxSLB2
         QKr6ZMXHpIbB30RLastVgIXQjkjiFai78TPy9TFI89ad30TVypW+Gp8T2nQuIgPArVGc
         71WZRiCK8QR63eXh/u6hXHbo0Hf2oC3yLU5lqiJwS+A68AWdvr1YFuGWSYm4Gp9PNrGR
         Whq4VsGLWkqtHTt9fjlrnRHTzA8cJ6fY3XVqSFg3ikUv12j0nMlWFE4f4EoNax0cAjIk
         waIabOMohFPo6doBFMtqIoYMJZSctSuJ59+JCb9kOYE+J06WWWOY2d12ZWDR81YEGHJ1
         TdFA==
X-Forwarded-Encrypted: i=1; AHgh+RruVzcH6e8DBJAdTG46MNnOrRMOpu69K0UrPX8Aa3bQzpi+o7Hh0reoAgZpfZU3sRXdwHisXWJJ1VU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrcvftYeZ7eEKIH0rcPU/70fm+bCdj6kg/gn9A3aEnSJJm3Bmp
	VkuV8fnVIVEqoRqRoMko+Y1dU5kQftTYHqQIMNpU0Ke2VGXWWfeq5CF7
X-Gm-Gg: AR+sD10HmfJymopgqAd0Lb/yIKVwzrOQUkrWaw/GHMT8aReDR1TIMstpWdQS0WqsDwN
	825cZTdyyw69h0in9sDrTu/8WrK4f0xHK0a/fl+yzDfSK5dOwdWJ4BTI96vChJPVciZiM60NdAI
	3WgaJWfsoIFhrwG5MfVnw616+A9ybPrAXf0Q5pZH/3XPRQWqaCYqoPIDV7YDb+zwQeUirtjTSRl
	Fa2QZ4lvs2jnD5ZdyAFCAd56Cv+3DIZAyXkKbtshDUevMJyReL70xi46lB5DWEQKrvd+5J9sPyE
	Le35clcyrRLAn5B50nHQCG5VvbZqxv8/NMk3d5oLjSPZFnqWoPzI9Cwp260NMpNr9P+SNaXVp1s
	xpw7AUIX7RgLDWOf9mMlRyftaO0/vubm1UqDKMuwpQo61vA32sCRIcfB3CHZBZWAG+pjLBr7gz1
	97Bc+62NeMO4/HD1/WX3Rj6NMXVF5sDBxV7EUhPRzKHIIjYy9nsWYJ6bi2XVz+nBLEEQCCPn869
	NsY7HqEcuwY3ihN58TkpxyyIEhQS4pOYTTaCfoYhEl7vbhI
X-Received: by 2002:a05:600c:848a:b0:495:69eb:27fe with SMTP id 5b1f17b1804b1-49978463ca6mr33817265e9.11.1786440539279;
        Tue, 11 Aug 2026 02:28:59 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-20-3-207.retail.telecomitalia.it. [87.20.3.207])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4997402a89bsm56135735e9.0.2026.08.11.02.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 02:28:58 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
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
Subject: [PATCH net-next v13 01/12] net: phylink: keep and use MAC supported_interfaces in phylink struct
Date: Tue, 11 Aug 2026 11:28:26 +0200
Message-ID: <20260811092843.673837-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260811092843.673837-1-ansuelsmth@gmail.com>
References: <20260811092843.673837-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add in phylink struct a copy of supported_interfaces from phylink_config
and make use of that instead of relying on phylink_config value.

This in preparation for support of PCS handling internally to phylink
where a PCS can be removed or added after the phylink is created and we
need both a reference of the supported_interfaces value from
phylink_config and an internal value that can be updated with the new
PCS info.

Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index b241768edbcb..b7180ae76cc8 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -60,6 +60,11 @@ struct phylink {
 	/* The link configuration settings */
 	struct phylink_link_state link_config;
 
+	/* What interface are supported by the current link.
+	 * Can change on removal or addition of new PCS.
+	 */
+	DECLARE_PHY_INTERFACE_MASK(supported_interfaces);
+
 	/* The current settings */
 	phy_interface_t cur_interface;
 
@@ -628,7 +633,7 @@ static int phylink_validate_mask(struct phylink *pl, struct phy_device *phy,
 static int phylink_validate(struct phylink *pl, unsigned long *supported,
 			    struct phylink_link_state *state)
 {
-	const unsigned long *interfaces = pl->config->supported_interfaces;
+	const unsigned long *interfaces = pl->supported_interfaces;
 
 	if (state->interface == PHY_INTERFACE_MODE_NA)
 		return phylink_validate_mask(pl, NULL, supported, state,
@@ -1878,6 +1883,9 @@ struct phylink *phylink_create(struct phylink_config *config,
 		goto free_pl;
 	}
 
+	phy_interface_copy(pl->supported_interfaces,
+			   pl->config->supported_interfaces);
+
 	pl->mac_supports_eee_ops = phylink_mac_implements_lpi(mac_ops);
 	pl->mac_supports_eee = pl->mac_supports_eee_ops &&
 			       pl->config->lpi_capabilities &&
@@ -2024,7 +2032,7 @@ static int phylink_validate_phy(struct phylink *pl, struct phy_device *phy,
 		 * those which the host supports.
 		 */
 		phy_interface_and(interfaces, phy->possible_interfaces,
-				  pl->config->supported_interfaces);
+				  pl->supported_interfaces);
 
 		if (phy_interface_empty(interfaces)) {
 			phylink_err(pl, "PHY has no common interfaces\n");
@@ -2824,12 +2832,12 @@ static phy_interface_t phylink_sfp_select_interface(struct phylink *pl,
 		return interface;
 	}
 
-	if (!test_bit(interface, pl->config->supported_interfaces)) {
+	if (!test_bit(interface, pl->supported_interfaces)) {
 		phylink_err(pl,
 			    "selection of interface failed, SFP selected %s (%u) but MAC supports %*pbl\n",
 			    phy_modes(interface), interface,
 			    (int)PHY_INTERFACE_MODE_MAX,
-			    pl->config->supported_interfaces);
+			    pl->supported_interfaces);
 		return PHY_INTERFACE_MODE_NA;
 	}
 
@@ -3757,14 +3765,14 @@ static int phylink_sfp_config_optical(struct phylink *pl)
 
 	phylink_dbg(pl, "optical SFP: interfaces=[mac=%*pbl, sfp=%*pbl]\n",
 		    (int)PHY_INTERFACE_MODE_MAX,
-		    pl->config->supported_interfaces,
+		    pl->supported_interfaces,
 		    (int)PHY_INTERFACE_MODE_MAX,
 		    pl->sfp_interfaces);
 
 	/* Find the union of the supported interfaces by the PCS/MAC and
 	 * the SFP module.
 	 */
-	phy_interface_and(pl->sfp_interfaces, pl->config->supported_interfaces,
+	phy_interface_and(pl->sfp_interfaces, pl->supported_interfaces,
 			  pl->sfp_interfaces);
 	if (phy_interface_empty(pl->sfp_interfaces)) {
 		phylink_err(pl, "unsupported SFP module: no common interface modes\n");
@@ -3935,7 +3943,7 @@ static int phylink_sfp_connect_phy(void *upstream, struct phy_device *phy)
 
 	/* Set the PHY's host supported interfaces */
 	phy_interface_and(phy->host_interfaces, phylink_sfp_interfaces,
-			  pl->config->supported_interfaces);
+			  pl->supported_interfaces);
 
 	/* Do the initial configuration */
 	return phylink_sfp_config_phy(pl, phy);
-- 
2.53.0

