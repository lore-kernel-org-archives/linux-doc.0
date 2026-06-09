Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173BF47ECE6
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 15:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781017990; cv=none; b=KDRqGsbWDFZDlj2WGj/Tj/EAZ088Xb499AgBTUAQzJvwyFFQ6gZomLfNeuCyar8k08Ot5lsJWxVi0mPhXZqL2JvOJXPvI/KQ6UMqHBWXlBdosfz8a3sFrAwa23Pl2cv++CQ/4ubo2SJX1Hm5OWnNe04/JdfVKV/iLm8C8tLhmWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781017990; c=relaxed/simple;
	bh=ZcRVlQJeNRXK2M0MgaksgKzLa1cJRySbcnQ11oZN5aQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AuziXtudkh/4jomH0rpuihFNOWGS7jw/XjHZn+Gc+wIK1lgjOBinfgG8LhotvpVkPdNh5HKhI1DkbpJ1ABHJ1hO9FiJ12/H4iF8BZxYWIFgSC9z3MPFnbNUSZvklDeaVN1ybdDmu+yDCY/kDw8EuIzUIoYXVFdVEW5O4K01ymww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZQSoSbte; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZQSoSbte"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-68c5eecdd56so8513957a12.3
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 08:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781017984; x=1781622784; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q0DEjqI/MjSZk63smQxo8R3imVIUNR3yg/nfskjDHjk=;
        b=ZQSoSbteQ8H21of/x8ZZt+qEmd+YHGEieiLDylxtDMr5hWyTOxtcGnPn3V0dGzix4Z
         uW36JLKvtj5c/GDqqDN+v6ioOSle300/8cZW2wKxZjQQ1FYYhqNDnOQLL/qvuelM1RH5
         wMlxYOXb8umrwwU4kBF9d5CzWbbJbWnJK7ZPKlWMYIEt/xGMcfkdr9T6qs5s9ob5JZIL
         Ez9ePqAxD7+/evmPPrptV2Fm1taI5bGALmHtvmAkVLj0zKbUMLz7IlvnVsT/ZoIB6AL6
         gcuXOxEPz6j2gVlEQW0Rktn+g/MgNxtkdeCcbgnRy3nxS/D15guWvpEyXmz9BzCtsw3u
         byBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781017984; x=1781622784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q0DEjqI/MjSZk63smQxo8R3imVIUNR3yg/nfskjDHjk=;
        b=a41tmipYBONPcSS/Ciqf7XkNc8nvWZ1RvsSdnoLrD92uPVaMePqsXR8qK4Vbng/wQz
         RXH+Are2HhzxhKUn/zn055SNBoYfxOlDJL0up01145hf9j8A7VFnctEjYgy3PvH8EMnx
         B4QJmmdtODBnafko8KWXON86AYt0BmTGOhGc5SfdLU2SJwCW4Qwrm89bQaan0JdMRSIe
         0WYv9l1zIlhOEVEUD6ikuVV+RF2+7NMWX3M60nNtDde6KhVLfUcZgjNwBK3neFXX1JXr
         WbhZdWvrHpZIDhKqIyXLv0BxrtQ/xdqv7fgQ6Abx7AABV7dnwCz15yHPULITbYuYmfnr
         Zr9Q==
X-Forwarded-Encrypted: i=1; AFNElJ8ILEEZEoLXNh3YyTKiYY6xlBCACP7DqIfUhAx6AaVovOsDsI4jT86TU1xjxTdHJeVojz8uggh0U/k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3tWmkmmAEhpWLyWngejjmWFgQS8q9WG8KfDdYudnZk9aPXX+6
	7FSKkeSrrorL6ZGvdjAHOHKtx7sCC5XTztnZFjQR5v61c46YR41k4GPM
X-Gm-Gg: Acq92OH8ikuT41TRSztILyHzZv7efTe6ndEsuoJzeekqLj/8fKrtIeizp6egiDx3hKd
	8IAG++Kg9keNLnMLhP+UYJqUD/BpAi6UHkeY9w9te854AOnpjHkUUKbjdifSE35z2aBl7cnBxGr
	+M+pLIb2fGkoEkQfitO3pwgjxYvuO6+Frwq5M8RwylXXe82UcJ+V5pFiR0OQyKo8kJTeDP+1B0x
	pebQZ70G5jymxl6lGlhLdcYjOWDQW1yA+LuArDDvfY4Y8AmIUGlQvW6q8atVjVtOQpyA+4b591l
	AbvvLpu4CwqDPachWyxoncyV9XLfBsNl2Dcdor946RUerJMr9HMmTFVi+hguik+K5FNCLLoBDOk
	3ynANosGmNw+HasGyjnShAnjNNXSM+dbhhd592qRIkwkCIUi8dLNDETRgg1f4sz9m5R4/ZqwoCR
	1M1L09crKVnxNgXahwCtN/LY6JOEz6GO1uA1S89wwdH1c=
X-Received: by 2002:a17:907:78e:b0:bf0:701e:b148 with SMTP id a640c23a62f3a-bf3721590cfmr1063340066b.27.1781017983934;
        Tue, 09 Jun 2026 08:13:03 -0700 (PDT)
Received: from Ansuel-XPS24 ([2.195.136.12])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-bf0517721e5sm1073637866b.9.2026.06.09.08.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:13:03 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
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
	Saravana Kannan <saravanak@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v6 01/12] net: phylink: keep and use MAC supported_interfaces in phylink struct
Date: Tue,  9 Jun 2026 17:11:57 +0200
Message-ID: <20260609151212.29469-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260609151212.29469-1-ansuelsmth@gmail.com>
References: <20260609151212.29469-1-ansuelsmth@gmail.com>
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

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 087ac63f9193..4d59c0dd78db 100644
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
 
@@ -629,7 +634,7 @@ static int phylink_validate_mask(struct phylink *pl, struct phy_device *phy,
 static int phylink_validate(struct phylink *pl, unsigned long *supported,
 			    struct phylink_link_state *state)
 {
-	const unsigned long *interfaces = pl->config->supported_interfaces;
+	const unsigned long *interfaces = pl->supported_interfaces;
 
 	if (state->interface == PHY_INTERFACE_MODE_NA)
 		return phylink_validate_mask(pl, NULL, supported, state,
@@ -1868,6 +1873,9 @@ struct phylink *phylink_create(struct phylink_config *config,
 	mutex_init(&pl->state_mutex);
 	INIT_WORK(&pl->resolve, phylink_resolve);
 
+	phy_interface_copy(pl->supported_interfaces,
+			   config->supported_interfaces);
+
 	pl->config = config;
 	if (config->type == PHYLINK_NETDEV) {
 		pl->netdev = to_net_dev(config->dev);
@@ -2026,7 +2034,7 @@ static int phylink_validate_phy(struct phylink *pl, struct phy_device *phy,
 		 * those which the host supports.
 		 */
 		phy_interface_and(interfaces, phy->possible_interfaces,
-				  pl->config->supported_interfaces);
+				  pl->supported_interfaces);
 
 		if (phy_interface_empty(interfaces)) {
 			phylink_err(pl, "PHY has no common interfaces\n");
@@ -2828,12 +2836,12 @@ static phy_interface_t phylink_sfp_select_interface(struct phylink *pl,
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
 
@@ -3761,14 +3769,14 @@ static int phylink_sfp_config_optical(struct phylink *pl)
 
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
@@ -3939,7 +3947,7 @@ static int phylink_sfp_connect_phy(void *upstream, struct phy_device *phy)
 
 	/* Set the PHY's host supported interfaces */
 	phy_interface_and(phy->host_interfaces, phylink_sfp_interfaces,
-			  pl->config->supported_interfaces);
+			  pl->supported_interfaces);
 
 	/* Do the initial configuration */
 	return phylink_sfp_config_phy(pl, phy);
-- 
2.53.0

