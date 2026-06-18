Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5E23F58C4
	for <linux-doc@vger.kernel.org>; Thu, 18 Jun 2026 12:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781787501; cv=none; b=MAl5K0r9Nmga3rZ3mEoniPDZSBCAVAgTAtzoB0/4A7CZFXZ+hBSzcZ+3wp0Qg7cdAMSAjCieP+LFhiPhwlQexZHqCJjHE1lO2PiWygk4Ck+ML2enpgBAw+mOx/j6FcVL2rrzOnT7Kc5SFBkPBa9Ston9ylxCUXwp9K12uLl00Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781787501; c=relaxed/simple;
	bh=4eefkNAfstnaWyC3I23kUkVKigZEIWwvbR5gE2d2aQo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ONh0UZwPZdczAxKZFKYx3Gv8ed9NgxJzAcj3GKzwVPheduBrMO+Du5m+7WSru0ErCCDGha6uL5LiHCY5d4qxSAQvfR81gxWHdT0vWWXTeqA4Q0uyC7Mv02Nyky0hWoG8ttxg8SWVQzRxwqQHObkRxYxZtjp89V4P/fSHCkIbkxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LBplTvyg; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LBplTvyg"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490c1915793so7200615e9.2
        for <linux-doc@vger.kernel.org>; Thu, 18 Jun 2026 05:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781787496; x=1782392296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=puwAHt6DIGuC1Wf1TrT+M8/3nufhWyiZt6erLHCVM5o=;
        b=LBplTvyg1vgDp7Y25fVZCx27ZGsunvkSz4fiBZF+8Dn60rEOBm1jGNLyyxd/2RbB6f
         7f5KtNvLs0rvquzLXxFmw3XhHjcHNO1O1+mLXm4bKpTF6A8Dmc4GuOpkOEQ9XThIRW7L
         ZhmxyH3IXa73w65We8WItzoKy/Hw6mlRu80ohu4QOAEeE6sE6EQacq/YR3sxyM519pmY
         QwcWODx8nvwnOAa2nx2ls4qJANA9FY7P5/P1gFxJmw13ny01/wqCTkIKcKX32Q0E12sq
         2XP3HTbmN2iD1oXyf+R9v3yu+8w4VWq8ZoyoJHSshdB88IhN3cpO++tWGsEMgi05WUbN
         GJAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781787496; x=1782392296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=puwAHt6DIGuC1Wf1TrT+M8/3nufhWyiZt6erLHCVM5o=;
        b=T8PqHX7SZEbFSvN9XKIyR/NgySn7/jI+EdXOlgHyqblNxllfE+zrGLPda7oPGSVM32
         dF4AOz9eIIbFvQBgVd4bmFv2vs+vFoNOsF217IR3dUjSnwNE7q6307+2Gb1XKJiprwrg
         FjrtFwQpKkpEMFkmIGYJZsuTOo5Kvay7MH5qtkIUjfhHvGfjGc77olIcpzyCQRNxB4sf
         qE+XAFTXt5CY37vvTlVBryfb5SO5IvLzDH5AYO1Ljyk/GRC3mIV4hC8rV7DBUiAgHhYl
         vlooPbxuNM3n6Qn9+j59qSsQL+gXlMRe9VLA4v5F8kVZYkDmJ5062azlDyylqKvbOm1Y
         fGKQ==
X-Forwarded-Encrypted: i=1; AFNElJ/ehVPCGWohyWDFvrMqVSQM+fevasmXVOj+T4LnCfIFZXne9rETHRzB6Z9W16kc4wwBvz8KOTdeOXo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyyyVYy6NFe0YzcC2v/OsoRpqrPmFFy/EBsbmM2rW4bMhWZzvW
	p9MVVewxj0sU/q93SrLCHtGNmxD+AlKLIkzyc4X5HJnaVgdAHQ3RoIVz
X-Gm-Gg: AfdE7ckfMQ9FIS+kNzvmx0j6dw2PqyVONFquJPLU2gNuvAf1Ah3cj0MABFWaxrOPOa9
	XD86mjyPRXJqg3FwPVoGNARujzc7yfhReQUQ98eJ/XBem1i/aZNxU66GSGV7dwXRSPNBmNTbLy6
	aIIqLqC8R1MLVKWgV5lCN4gojWJjw3mpLUKxRdR4cY5Ql3xkTbQXW3qetoLRVtyhCYIfHIRyp5n
	2davMdJtM7MXzVQAq42cs+2KpfpeMbOQKi6b1NlqaldR3dv8wfRn9SCvIUxxuB8JZI/QnyqrClK
	DJQ86s56ji7ZgRHv60vWvRa5zRwrx03OEPquVUjn6+NlTa/7lCi83HzRDnSxrNWCUlricwZFXRc
	SYmzvvPyKPThP/2b+JP7bSysm4+fLYNqV0PPhYqIAl9yDgoTby7Klly6gBe70/qfEfA2cp+PAbG
	cm43G8UX5LJJ1+4eDwz+Ky8wpS7IH7zUtIol9kASomkFbyX4WjYnWoO8GpWGaxTQ==
X-Received: by 2002:a05:600c:5644:b0:490:adb6:7957 with SMTP id 5b1f17b1804b1-49234141d98mr89030975e9.33.1781787495577;
        Thu, 18 Jun 2026 05:58:15 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-88-103.ip49.fastwebnet.it. [93.34.88.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49230a458f2sm241451585e9.3.2026.06.18.05.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 05:58:15 -0700 (PDT)
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
	llvm@lists.linux.dev,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: [RFC PATCH net-next v8 03/12] net: phylink: add phylink_release_pcs() to externally release a PCS
Date: Thu, 18 Jun 2026 14:57:11 +0200
Message-ID: <20260618125752.1223-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260618125752.1223-1-ansuelsmth@gmail.com>
References: <20260618125752.1223-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add phylink_release_pcs() to externally release a PCS from a phylink
instance. This can be used to handle case when a single PCS needs to be
removed and the phylink instance needs to be refreshed.

On calling phylink_release_pcs(), the PCS will be removed from the
phylink internal PCS list and the phylink supported_interfaces value is
reparsed with the remaining PCS interfaces.

Also a phylink resolve is triggered to handle the PCS removal.

The flag force_major_config is set to make phylink resolve reconfigure
the interface (even if it didn't change).
This is needed to handle the special case when the current PCS used
by phylink is removed and a major_config is needed to propagae the
configuration change. With this option enabled we also force mac_config
even if the PHY link is not up for the in-band case.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 56 +++++++++++++++++++++++++++++++++++++++
 include/linux/phylink.h   |  2 ++
 2 files changed, 58 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index c38bcd43b8c8..064d6f5a06da 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -158,6 +158,8 @@ static const phy_interface_t phylink_sfp_interface_preference[] = {
 static DECLARE_PHY_INTERFACE_MASK(phylink_sfp_interfaces);
 
 static void phylink_run_resolve(struct phylink *pl);
+static void phylink_link_down(struct phylink *pl);
+static void phylink_pcs_disable(struct phylink_pcs *pcs);
 
 /**
  * phylink_set_port_modes() - set the port type modes in the ethtool mask
@@ -918,6 +920,60 @@ static void phylink_resolve_an_pause(struct phylink_link_state *state)
 	}
 }
 
+/**
+ * phylink_release_pcs - Removes a PCS from the phylink PCS available list
+ * @pcs: a pointer to the phylink_pcs struct to be released
+ *
+ * This function release a PCS from the phylink PCS available list if
+ * actually in use. It also refreshes the supported interfaces of the
+ * phylink instance by copying the supported interfaces from the phylink
+ * conf and merging the supported interfaces of the remaining available PCS
+ * in the list and trigger a resolve.
+ */
+void phylink_release_pcs(struct phylink_pcs *pcs)
+{
+	struct phylink *pl;
+
+	ASSERT_RTNL();
+
+	pl = pcs->phylink;
+	if (!pl)
+		return;
+
+	mutex_lock(&pl->state_mutex);
+
+	list_del(&pcs->list);
+	pcs->phylink = NULL;
+
+	/*
+	 * Check if we are removing the PCS currently
+	 * in use by phylink. If this is the case, tear down
+	 * the link, force phylink resolve to reconfigure the
+	 * interface mode, disable the current PCS and set the
+	 * phylink PCS to NULL.
+	 */
+	if (pl->pcs == pcs) {
+		phylink_link_down(pl);
+		phylink_pcs_disable(pl->pcs);
+
+		pl->force_major_config = true;
+		pl->pcs = NULL;
+	}
+
+	mutex_unlock(&pl->state_mutex);
+
+	/* Refresh supported interfaces */
+	phy_interface_copy(pl->supported_interfaces,
+			   pl->config->supported_interfaces);
+	list_for_each_entry(pcs, &pl->pcs_list, list)
+		phy_interface_or(pl->supported_interfaces,
+				 pl->supported_interfaces,
+				 pcs->supported_interfaces);
+
+	phylink_run_resolve(pl);
+}
+EXPORT_SYMBOL_GPL(phylink_release_pcs);
+
 static unsigned int phylink_pcs_inband_caps(struct phylink_pcs *pcs,
 				    phy_interface_t interface)
 {
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index ca9dfc142388..15e6b1a39dfe 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -751,6 +751,8 @@ void phylink_disconnect_phy(struct phylink *);
 int phylink_set_fixed_link(struct phylink *,
 			   const struct phylink_link_state *);
 
+void phylink_release_pcs(struct phylink_pcs *pcs);
+
 void phylink_mac_change(struct phylink *, bool up);
 void phylink_pcs_change(struct phylink_pcs *, bool up);
 
-- 
2.53.0

