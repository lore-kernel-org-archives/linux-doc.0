Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846868;
	b=2wxLBJ3xdp86aelFNdl1HRtcl7CFNFyjoseeTI5ughP/Vzb5ah4aIAwuVGNmDoZJtUBE
	 lErKJZuL2IiwA6H1EZ/XRxEcdN5A1HLeRqiDzRm1K69ivj61YrXVosMflijP8mPk5ap87
	 ToRO6FuZask43SJmDVY9K2GABdNa2AtEOfVa2FGzoSQB/iqiQ1hCodh957xBl6m1zgT8l
	 NAGTI68o/Pn5mcDR6jCHuELVfQ7Cwn1b1jg4SdpMuZZRvdAk28sUDiBkOcr41Jd2NZ607
	 Nazb0DrYNzQR2huG1yQwvapzXOJTgFwY3nEVnzyIOM2AmuKGN8AG99FHY8uzQuWhn8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846868;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=l3AZy4riXXi7OLtUVBY6GfrY+Mq1552Tq5et+9Ive2c=;
	b=hmaRyLDi14Hsh4FO9ivBtMKzX4+U1q67tkE7vcaRWNb9b9suBZ1vsQk/Px3m6k+I0cd5
	 I/rOGXZaz2Al7NDHZ1IQG0X5H16hz9ycgt0otWtfYjk0uftjOP1hpw61AjeBQDOu4cU9W
	 7ZJT34D/Bd8tBcbKEjlq2W3Oc4tuFSO4lTiMuGwdLdiWSdcSRNCbksc7LCAvwnVBeEhqu
	 CZn3zb9f1ayIgmqTSt7jrdqxuyQ+c8RcmqsYHbZL9zagGxFGfoYpYhItN40c4O7Z+7CzP
	 6LFVQSpdLuw/NePwFDT7SM27B02+bbCBiMfxJ5FjtM+vQS5X02XJhJWkpDXsAN6vaQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eUiA67bS;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45B5606A896
	for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 16:34:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A45B5606A896
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eUiA67bS
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48fd2e38825so2367647f8f.2
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 08:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794846866; x=1795451666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=l3AZy4riXXi7OLtUVBY6GfrY+Mq1552Tq5et+9Ive2c=;
        b=eUiA67bSs16wP2EwEdR29sel2q5XJAk6uGpuvPkK4qT8eWxm6L1gfo791jYjsLlO03
         FQgc3x+hARkL9OxXwByJ3c6Mv4oI0h+i8mSshaqyLuf6trjlDM7meZwQwrGfYfwRVH5C
         Vl4KEttTTTrxdrjrxaTyXYpz2sIzq3LLtyWOzOdoA58vqUrK1rHl1UUGfk1KyBZAuECp
         b41Xe3aF/SM08eze/I7rqrMo/TTFt8KPUuwguM40G88jladpoKhxUCIwtzb9MOH6i5DN
         nwLspvPUZ9k3ixcBExdrk4QcaEa48QYn4fp6MREOUriz9isXNhZGB3yBAH2It8B+XXbU
         Bbqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846866; x=1795451666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=l3AZy4riXXi7OLtUVBY6GfrY+Mq1552Tq5et+9Ive2c=;
        b=bNO6+5i7sqIlppT26S3yCYBrwcJ3vPbO6lsu58Q91JVxekk7Kmp7J+rMbAd30/dcN7
         n1jSutAJnBto+bLK+nu48nejAdIjnk42p6clmmBFM6LtigZ8IRyHTIN4YZz8c7EpJsvb
         24vpGqvkG/E/Qoa/BB7oi+uUs9X4XWNWpEJa1G0EkdbtzcAF4pq/zHvcjP7FbckKbMbW
         OygtX5pkXVhe+gPsv7oDS6aiTc8mp5Vd7qBM9OHZvAgEevWKTd5Hh935fPDSqxw00hl7
         KL5u27UoRhESezCjK/osGpSpzvaiwt2oDh3eGv4VyfgKJNxWh/yfL9Lbw50sCsgKYbpb
         4nlw==
X-Forwarded-Encrypted: i=1; AL+hErG4YH047GZ3O6pEdAP9p6QLdyifc8ngKGgmXObiLkvtbhgotAa0OSFqd8Lw456qnLHTk9TKicVODZ8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ood3nNWL2z05hT/lAXTWq7klL4jDpHqsHGtnkdwWtgkiuzvDr
	wR9M0kkm3/ePjMUm5whn1HrIyh5ebUdYDyo2fq6/5lrIOPL1E+shOMbw
X-Gm-Gg: AZFdTZfK/zUXv5z7M5fLgOPJzFxqLAN8Sjb32oiA3cS+d8+cutzIHg2BTw1ga9DHnvv
	h/PXr9CRMWwKw5qb+hquknwySuJ6AdiLyannSoiiT8P9mpe4gXkgNuGV58qxg5VMXOJRwg1fBrc
	02PQt9UXCVImzmqham5hMKaV0U656zfSR/E6Nz1+8dlNVYmkDduEualcFKW7mMfdfYpdv7jEtPu
	mWol8gDaoo2kcds20ZYMYdx7E/WyM/zjmdXkgRkPnj1EvkW/X+DXmQJdFq+NRBokgYzAUlVuiO6
	lTWhhRtiefeNeu/81BtkvtlpsUYpTbbDz3nbuvffvAkT4gmKHLfMPr7B/U4toL8IbLYBy/1ToH9
	Wtnw84qnbcTtO2tCmQ3ENHc3XFoqdPsljJ7s2wXXgi8pEMoKfnXM45f2N1IMh3Vbo1D56eTfxTQ
	7eewYOvJAfWliimWzclIvP/9nX5KGNOzGi7eMkX0KVwYGM2DkFUTHP8/h0j5jjo5JkBCtcm36km
	Dk+DMr3JPAu3jDXyckWGVcPcarCP/6xzXlt5bUf1SU5mcSkOrZuT1awA79TNWe0OLgBzBxgbx9w
	mS5OwmvxA32DxM+JuENA7wzVMasR9Lr+ggKLqJFeHiGSB1k6THxBNfyvrJrTRZXjdtzV3MhuE1V
	25dzeD7zn8lsSeOSjsQ4oUTNdNKcNeG2oyQ==
X-Received: by 2002:a05:6000:46db:b0:492:9630:6a7f with SMTP id ffacd0b85a97d-49c73350ba7mr14457094f8f.55.1794846865873;
        Mon, 16 Nov 2026 08:34:25 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm23840506f8f.8.2026.11.16.08.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:34:24 -0800 (PST)
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
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v21 02/15] net: phylink: keep and use MAC supported_interfaces in phylink struct
Date: Mon, 16 Nov 2026 17:33:45 +0100
Message-ID: <20261116163412.551438-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116163412.551438-1-ansuelsmth@gmail.com>
References: <20261116163412.551438-1-ansuelsmth@gmail.com>
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
 drivers/net/phy/phylink.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index d9d0ace2042e..f482dc608810 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -63,6 +63,11 @@ struct phylink {
 	/* The link configuration settings */
 	struct phylink_link_state link_config;
 
+	/* What interface are supported by the current link.
+	 * Can change on removal or addition of new PCS.
+	 */
+	DECLARE_PHY_INTERFACE_MASK(supported_interfaces);
+
 	/* The current settings */
 	phy_interface_t cur_interface;
 
@@ -633,7 +638,7 @@ static int phylink_validate_mask(struct phylink *pl, struct phy_device *phy,
 static int phylink_validate(struct phylink *pl, unsigned long *supported,
 			    struct phylink_link_state *state)
 {
-	const unsigned long *interfaces = pl->config->supported_interfaces;
+	const unsigned long *interfaces = pl->supported_interfaces;
 
 	if (state->interface == PHY_INTERFACE_MODE_NA)
 		return phylink_validate_mask(pl, NULL, supported, state,
@@ -1788,7 +1793,7 @@ static int phylink_create_sfp_cage_port(struct phylink *pl)
 	port->is_mii = true;
 	port->active = true;
 
-	phy_interface_and(port->interfaces, pl->config->supported_interfaces,
+	phy_interface_and(port->interfaces, pl->supported_interfaces,
 			  phylink_sfp_interfaces);
 	phy_port_update_supported(port);
 
@@ -2091,6 +2096,9 @@ struct phylink *phylink_create(struct phylink_config *config,
 	__set_bit(PHYLINK_DISABLE_STOPPED, &pl->phylink_disable_state);
 	timer_setup(&pl->link_poll, phylink_fixed_poll, 0);
 
+	phy_interface_copy(pl->supported_interfaces,
+			   pl->config->supported_interfaces);
+
 	linkmode_fill(pl->supported);
 	linkmode_copy(pl->link_config.advertising, pl->supported);
 	phylink_validate(pl, pl->supported, &pl->link_config);
@@ -2218,7 +2226,7 @@ static int phylink_validate_phy(struct phylink *pl, struct phy_device *phy,
 		 * those which the host supports.
 		 */
 		phy_interface_and(interfaces, phy->possible_interfaces,
-				  pl->config->supported_interfaces);
+				  pl->supported_interfaces);
 
 		if (phy_interface_empty(interfaces)) {
 			phylink_err(pl, "PHY has no common interfaces\n");
@@ -3037,12 +3045,12 @@ static phy_interface_t phylink_sfp_select_interface(struct phylink *pl,
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
 
@@ -3921,14 +3929,14 @@ static int phylink_sfp_config_optical(struct phylink *pl)
 
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
@@ -4166,7 +4174,7 @@ static int phylink_sfp_connect_phy(void *upstream, struct phy_device *phy)
 
 	/* Set the PHY's host supported interfaces */
 	phy_interface_and(phy->host_interfaces, phylink_sfp_interfaces,
-			  pl->config->supported_interfaces);
+			  pl->supported_interfaces);
 
 	phy_set_upstream_port(phy, pl->sfp_cage_port);
 
-- 
2.55.0

