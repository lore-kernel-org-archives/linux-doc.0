Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794529950;
	b=liCZU1ECY3xAKjh3ELnuyVZhtuY0kWQ9GyvNo+XspMBmCBBI7Uz5k1s2wD7b+BOIDJv5
	 V4lp1oacqhXB+8aH26UAzC81KBulkR+lbwffBUj21UWZFFl6KzCH0bXujOL3a3YDOrR7F
	 /TjERwf9f2qwf70BTrgxhxV3yuGayvfC9Q0DUeMiITSYWSo+afJJ6/zVIa3eeV5iYCMR/
	 uJLag0XKaGHjUFLz/jNES1hyLfY2mHkdifNneKkwyIAF6B0bG4+YKfefkAoJgOAsC75K+
	 URZIXKyMA2aCTseFw/hmSBYjuVcIfoDqjWyikTKn6UBNq2k+jsECQzkmmHiBn9i/ixQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794529950;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TeLAZiZGj+97MWa7ReJZxgbnws7A1jvXyF4Ap0n10zw=;
	b=IeuAW0k5AxaemLQ0pvWssPRLYuixUI6kALOq0OrrvlK23/3bsFV1cefwAODGsltM4+Pn
	 pd/G0rYdw+WEp9o7y7AIx9GUH6b4rRin5KCMRnbIKwgX2lH2SqQby0gS2OT+T9TkzK8AJ
	 p6WBHwxo9KySB7ODVpW0SjkKaiNvYUJjDlSznJb79YQmGQYtS2VcAvTYJDaR11wjh59AC
	 UHd9YdymCZNatMQUxtRmBaYpZpFHsKiz4dW4qvqEu/TyoUat18xsB1YhGeSToVNaG5rFl
	 t6dptZV80phcUZxFTm/msGhWfhYAMQlldP1K5DrHu1MHI+zImAaPwF12BKVMtJXO8CA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YgtYRthJ;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948C9606A88A
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 00:32:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 948C9606A88A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YgtYRthJ
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-49318428d98so121494f8f.1
        for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 16:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794529948; x=1795134748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TeLAZiZGj+97MWa7ReJZxgbnws7A1jvXyF4Ap0n10zw=;
        b=YgtYRthJ9KcY0Ug3eON2U/WiEMJk0eyukjogIRhwpFdpaRh+y/a05eu12eaa57EsIK
         nLy+YCPFBp4SkS10Q06RBlSN0GIgit+mD0F6oEDnHuBfooCRFll2j+7ZgnjBnpZK0E7Z
         GT5onKdKyeDJ5egfGwBFi4LVqIYd19nvce/qNu3pJWbHo0dflE9MIqQmPDqRaiT6rumb
         x2SoVmT7MjlC3Gm4zaRkfSXiL4nzUE9KvxEqmCB4qcX7Z80W84Rt4fnRoPioJmvVKm05
         PAYkB1KdFk+3JOF2zUe3w48GVXfiSBIV5dCd+aWrbgOUyzuoXSkoXo2sb05hmsDyTzZg
         L5Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794529948; x=1795134748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TeLAZiZGj+97MWa7ReJZxgbnws7A1jvXyF4Ap0n10zw=;
        b=pXaSOg+VizQlRF+fcexzYRAEkxOODOLJpih3dMjadQ/P6L6WQQJTxY8pXGP3AGTp4x
         dZPKAusORrrCis3OIXrd4Dr5MnB2iEldyPJrY29w1WKFf4XFabrvQMiu7OVrw76jL77+
         5stVH7gmaqbRwIOab+vq5mf6Wt6Y4mPefDUm9nN9QcEOFGGl5vZIjDdV3LTExGb2kqhJ
         0aJGzHSicBfaNwlUkilb42EawqD7WTO7aGjb4a8Ynk51fhtwQTPDLfzzEMlSFdqdzL5H
         n0CDK3zuD4mkc1mwpQlgpkFDN8YTk7gmEwOFGJ1mnrNapzCEhLQB6aypbDeTMKXzbF1T
         6QWQ==
X-Forwarded-Encrypted: i=1; AL+hErH2dzUp3rOn2MxPTv9aHLsL732Xj+MsjuX/RHAWd9QXrteRS5IxE0awz2ch7r0mqy+z1y2h8OG6q7Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z88IiFjE8DWmuwVgnJXUcSjJPpdpElJastnMJQV1UODdBx83EM7
	d91y3clC2jiNmkOGII4bVu5DX6HwXIohsjQA/1aubJGe10iVBYReoI8b
X-Gm-Gg: AYBFou1kzg+6LD+cDYAqGBNPh3KpZK/+y8fyb9Y6WoE8vgnjLjt3E+0MLmSo99ugYkG
	vdVikBOyI0I2hzo+4XXmvGIwSI3rWQZCHN6UHuc9iHjwBufreADIUq3GgsDCDvh8Xpa/rD5Gns6
	gkrEQ3ODbtx4Lup1nMVGd3nXYq61m+bIdN336dBi3qStlZcx66EHsnrbeSWzZkfBbqefUC5TWrL
	By43BSVXwHbWpP9HfXyLFmq5jdKLMLkQwXUj+6JB5IGk4ylYrW9hmR7AaT8v5gybGtrxFot6bo6
	Xcg+0h2PVQ+w/hpwGGgguhepFhjnlteLXoJsfgwPFksrcdZi+YUvNY6fwFVMMe/engb5a5GgreX
	g11Eh29AVKbkM7IF0MJ73AdsQN/ZLnh3bgMI+HruQq4xbIiWRfe0z6ezf8eVqKdt7iC3erRgEcv
	Au3C1rklOkZqxeyhtc6zIdoYtFJwYyNm8Zyu3FpGWSUKLDnm176Iws23STtH1++JWGc6LcJhvCF
	GGHd6WPSpujoG+Kf0Lc03N6QVn1BNfMvBUJlP6LJsEOMF0QnCpSg0EeTbE/IlsqY4El4xc0QooG
	ZvYkdmLiW5NC/BxtkF4tHDG7FdHcNX5yOvVLSiYu1qs64NskP9nPq0oWB8VbuQICUgavJVYt/oq
	mC8yFbrZeBMhcg+QuAHWpLYpFbqPV4P8GUwO5oHYaupGDbGpRrcwfQg==
X-Received: by 2002:a05:6000:46ca:b0:493:bd29:a6e3 with SMTP id ffacd0b85a97d-49c70ed913cmr1444486f8f.15.1794529948033;
        Thu, 12 Nov 2026 16:32:28 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-212-171-11-167.retail.telecomitalia.it. [212.171.11.167])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm2029768f8f.23.2026.11.12.16.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:32:27 -0800 (PST)
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
Subject: [PATCH net-next v19 01/15] net: phylink: keep and use MAC supported_interfaces in phylink struct
Date: Fri, 13 Nov 2026 01:31:51 +0100
Message-ID: <20261113003217.197757-2-ansuelsmth@gmail.com>
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
index e7734e45376c..5d649903be9e 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -62,6 +62,11 @@ struct phylink {
 	/* The link configuration settings */
 	struct phylink_link_state link_config;
 
+	/* What interface are supported by the current link.
+	 * Can change on removal or addition of new PCS.
+	 */
+	DECLARE_PHY_INTERFACE_MASK(supported_interfaces);
+
 	/* The current settings */
 	phy_interface_t cur_interface;
 
@@ -632,7 +637,7 @@ static int phylink_validate_mask(struct phylink *pl, struct phy_device *phy,
 static int phylink_validate(struct phylink *pl, unsigned long *supported,
 			    struct phylink_link_state *state)
 {
-	const unsigned long *interfaces = pl->config->supported_interfaces;
+	const unsigned long *interfaces = pl->supported_interfaces;
 
 	if (state->interface == PHY_INTERFACE_MODE_NA)
 		return phylink_validate_mask(pl, NULL, supported, state,
@@ -2090,6 +2095,9 @@ struct phylink *phylink_create(struct phylink_config *config,
 	__set_bit(PHYLINK_DISABLE_STOPPED, &pl->phylink_disable_state);
 	timer_setup(&pl->link_poll, phylink_fixed_poll, 0);
 
+	phy_interface_copy(pl->supported_interfaces,
+			   pl->config->supported_interfaces);
+
 	linkmode_fill(pl->supported);
 	linkmode_copy(pl->link_config.advertising, pl->supported);
 	phylink_validate(pl, pl->supported, &pl->link_config);
@@ -2212,7 +2220,7 @@ static int phylink_validate_phy(struct phylink *pl, struct phy_device *phy,
 		 * those which the host supports.
 		 */
 		phy_interface_and(interfaces, phy->possible_interfaces,
-				  pl->config->supported_interfaces);
+				  pl->supported_interfaces);
 
 		if (phy_interface_empty(interfaces)) {
 			phylink_err(pl, "PHY has no common interfaces\n");
@@ -3026,12 +3034,12 @@ static phy_interface_t phylink_sfp_select_interface(struct phylink *pl,
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
 
@@ -3910,14 +3918,14 @@ static int phylink_sfp_config_optical(struct phylink *pl)
 
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
@@ -4155,7 +4163,7 @@ static int phylink_sfp_connect_phy(void *upstream, struct phy_device *phy)
 
 	/* Set the PHY's host supported interfaces */
 	phy_interface_and(phy->host_interfaces, phylink_sfp_interfaces,
-			  pl->config->supported_interfaces);
+			  pl->supported_interfaces);
 
 	phy_set_upstream_port(phy, pl->sfp_cage_port);
 
-- 
2.55.0

