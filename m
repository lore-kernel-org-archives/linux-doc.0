Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0C14756C7
	for <linux-doc@vger.kernel.org>; Fri,  7 Aug 2026 13:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786108410; cv=none; b=JDuh62wFCQ+BpiCR/vHLtkcQ5gGjxuOu5A9tDO57CP/h02/duhRbbE24iddOrDIh/i4Bu7r7pLxriej5zjJ5ul1EoBbqT2Z5K+1BHskzfCWnb51FWjaaDGu+1uOw34BLmehh2gycfI8lEu2tU60+lO298xh2L8rqkmj+YNLBuMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786108410; c=relaxed/simple;
	bh=NH+vbbaxZiG6Y0t+Ae1nwybjPC/wrZUjqEzfT2sfGrs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qvxw6esNxUQ8OjfEXNXZgL5dwT2YJ6hLc3/sCADK5xsql45FA/unjWxklYOb/lFEc01/j9uS1S5BTyx22sGbMdJPvl1tRxYHgm5baWeEe2eO1D5g3Yw0wZfvnMq9yJKfL/DJhLq+Gvlsk1OHccvp8GYJD/gxcUNauFyKUpKXVIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IlmkawxR; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IlmkawxR"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49553515a8bso50273625e9.1
        for <linux-doc@vger.kernel.org>; Fri, 07 Aug 2026 06:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786108394; x=1786713194; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tBl3GBctv61bQMyEd2S/uBaFdUwcRcdsqM3BfaYguhk=;
        b=IlmkawxRsT62aobFbJ4plJeaOL3z5PJhXmki8EuAS2bL+/Q1hCJC4VJ8UKl/pH2EHZ
         hCr+sorVfmZoc09ADNHqMufsitwgkaiEhMHI18verzjY5+vJRPogmKaPNUbLrY0oyXpR
         /iQCrXyHX6DwGzTeCmZsq3WFH5GV/wcH/NsH4t/7oBY3hy+Uj/McjYtwKAwSvE9opqSA
         d3on5MehzZQ1+dw9n8EoBun3OHP7KVfbpVmH6INCGbgYkamHTtLAvmRpmBk9REN5Q1Yh
         9oj//QXRk71UbqyIMyViEvkmut1FRXN1sAgwTWSITzbMW6rnFkhdJ4epCBxbEqdTtYYC
         IgtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786108394; x=1786713194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tBl3GBctv61bQMyEd2S/uBaFdUwcRcdsqM3BfaYguhk=;
        b=FQxRBcCqawplbHkoJOWljidJkq0N/X9UHZK76gSlDcTWepIpVsCLStH63lmsUqJXXg
         gNscMfNyPMTEhaGo9DkuO0UV7uw8L0am1kR/UuAPnFlmyK5SyVY8VjSwou+Ah05Vz423
         Zun0LJEuy6O5qfPVnnZ1nZ+cdPB3HV5ht93wn+w0iYOSqWSDESxCqQ8K5ip913g7nGlG
         rYOD2w2TWYRTU3T+yoq/Oiz/sn8E7ssyu+BwOgXAB8Ebqa9NNhShZp6GpQz79R1d5CD7
         NwXaenZsRMg3h/3rfwNK3Zqcig222TsNYbBOHQf/vL7JbDcNa4cQlX2GRpKaGQeut1ZL
         zNaA==
X-Forwarded-Encrypted: i=1; AHgh+RpkvAPPq/8XGWs7wINAt5vTR00vAdM+K9QdEZEeuBZyyVFMLdy7rYoKd+WrCTQVz0ApCe+M3YIftrg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBJ/DEEmY6ARVQw7dsijj8IHa9g4rGeEHFThzn/wjW8ozHF96s
	Z3y6d4gUWl30Gh+BL0wJbc8v3XUZQhXvcb6P5VMrzuuoQafEjaxXW46O
X-Gm-Gg: AR+sD13WAuPWuqiu0JSAfaWnPunBzuKmL/1ifcdoK4G7JR7QXZQVQUVmTfGu6SSy2K0
	7qyz+gEnjdkUPfhDDwpL75zlJ9geT40rQ8sJXnMLFBJac4y9HkL1lVV28rwGjaeopWDb22/yiaK
	MZDvGo0NE4okSlwSOAymBsk6VdlCh5E7fHIZ+HwJ0SjFa5eozGnLh41KXFlH9uOBCsERJ/lr24C
	6TomNCQ584mBoXDSXsO98LpreiYAZdR/eEmvhGUXMonrVBfkatcMNl9HvPAWze7AwBnK+QFyg6z
	h5BbdUkrs3aeWAUjjHumFRcH3x8mRxt2SjlIVzzZYZ8fD5kUSxhRZuoZ6YX/gmLg0XRZeUNPoXN
	lY4rjSgzq21k4ljVT4KeMERdgOH1sDRXm35F6nussuxhJFriM5UzGRvmecn4GcdJhuzGU9bl9WT
	6AC7IQx9hIPbxHZg5NBfmyiRaa9QruPBoh9Vfltc+Mh6flv4GbBzEiHdbx22+PnJMy36EKPYlxs
	Rt1zflKP9VFa3Vr6PFUob/9Cj5ed+zFKRSvM09WWP/mzhBrl6edxA==
X-Received: by 2002:a7b:cc0b:0:b0:496:cb48:5eb8 with SMTP id 5b1f17b1804b1-49959e38ecamr104184045e9.15.1786108394327;
        Fri, 07 Aug 2026 06:13:14 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-19-255-168.retail.telecomitalia.it. [87.19.255.168])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4995c7b2b68sm58827665e9.4.2026.08.07.06.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 06:13:13 -0700 (PDT)
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
Subject: [PATCH net-next v11 01/12] net: phylink: keep and use MAC supported_interfaces in phylink struct
Date: Fri,  7 Aug 2026 15:12:43 +0200
Message-ID: <20260807131301.192060-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260807131301.192060-1-ansuelsmth@gmail.com>
References: <20260807131301.192060-1-ansuelsmth@gmail.com>
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

