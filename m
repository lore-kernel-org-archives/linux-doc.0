Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D162481A9C
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 15:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781017997; cv=none; b=PO0vk+DpCObJuMTsX7cYqe905XpTcniZan+8ZkuwbNjKf+NEkcUu8ndsQHrPiQItIFQt22lDriB5D9wSj/grFEDI/ZciyQ6IrUlRh6xRWpbujTpGVB/u3bxhHG0PfnXzbse5rCErFiE9pLNB/fOsZJmfnMDWw9zEBTkiT5ygl14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781017997; c=relaxed/simple;
	bh=sK4fxc5PVlOZuMIeUsvJWB2WAm5QU6VKChsYszl2b8Q=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nIQunOGjVAFKUYH+dACf6AO6YPeuAtb52twSvJKGVewGymMAfIRNBJHnSnMJtrcz7aNBMY3MgCqR4xA70Rx6ws1LO59zTzb1xQ9BMd3Xp2DhCialbBifIsSTR5IKOZhIVyEbDGXqaNDtjBYRwwCKzzh4Rgg2qgh1SJm1YapVe2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XCHf30Cz; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XCHf30Cz"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-69165354c87so3792908a12.3
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 08:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781017990; x=1781622790; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jWYk8ZymB6kHUZKwCJ/zVXargC+wN9U6CkBM8YYghXU=;
        b=XCHf30CzFMmddwoUU6Pm5/FBpS1Vcs37XYCWExDanoz0lumoDmHH2alprpw+HCXoAw
         sad8+Tjdd8Sy/3uhQlaxkaBSF+CusgInJps4h8Bt63hQKZ7yGh+o/QD7POMadb3D51N5
         9x6+3BKoyJtyhodKk7x+Ty27VmBtVlSC0VPRNxJUSNyYTRbkojkO6rEg6XkK9DthR77z
         ETpTiBXfrbH9d61Gx9LDk74Q1wYtV4W6T3uMZyzZVepnr5g1oNnas08l9gQaiY/4LvCt
         Fpm4fviK+3L2p0PEN89RqVy6XluyJ8wmzQYf4CLv6q37w9ycfEi1nFFPCd64FXaabtvG
         HWzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781017990; x=1781622790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jWYk8ZymB6kHUZKwCJ/zVXargC+wN9U6CkBM8YYghXU=;
        b=Ts4WYa4x+Qlx1f0F8fAS8DDX2SqMmqawSB47Qyfph1Oxo5YUKQYBzgD6gKRjHHuvsm
         /P1rdTtDtLi7eIO9gSmQbaihiWwK2PCq7mRj1KE9VWxb8h87hYvT2CPh2VDcQrkheum/
         j+XNNJ8AbVqXQptNdmuLlSo+Oi4HGb04+yZ1invo6ZrCRdqIKJChJNDU93NTIgIXPDRb
         UomDZiC5nw4O9ggw07/eqquzWzOqRdrvB5vZWS5PaZu8jYB+jS9QyyYxqz/EX1DF1mtI
         s0hTCS2OBWjVBMKHWzFNp/ZJl2TqczeqDPCXd9Z1y0ZvQiRpvM+ubelU/iv/pxctHEzE
         DOrg==
X-Forwarded-Encrypted: i=1; AFNElJ+kU/ziYbiBvDVGuF9FPuKhbw3pzQRuvqFuuNDzm5J24yji6UM9RsQiNmkSrNnIgjXbLF5M02zA+Go=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtaWtpHRG543HFZVdfJ12eQRLw1JJPyI8hxbEXZ1RoTQdqdTue
	W9uTcOFF7ek3Ntf7vwld1BLz6sq7r1oLSA8XwXQGJ2j6Dw1qXv2zdwxb
X-Gm-Gg: Acq92OFQKmlYy0A+vEHeTbFGoEbPSBywS4phk0svQRYC7Fx3NA1mqSVPiwNnORzjDQc
	88592t6OiaPVHIasYZzgncBq7/aDQG0i0ONYKGKCYpZe/4rCTk0E48Ly2LugW1FSuyzJ2FZZyFv
	PJgBzATV6l6qTOEnaxue1DkTafGwghbrddzDsIs+r2ht40tpsv/bppg9GftKwW3N+ZRt0bQxmCa
	I7tLUWNh1kV9cgjSTAJrnYTVo9Zy3+HfRXe9h9DYEg8Sv8QRD4mH7rEMCAYio2ATzAMKrEnWBFN
	Rh6y9tLmDHKdIyYPMgcK5fB2iium05mWBLITFMADpA37UPNCWVtv6/KGbFnbfbVmusEPWYfkmmm
	ItonSzWaiEnSo5YI2eq5V4ifg1SyNd+mcjS8YcZp7vjDXiQTBsfb/Iub4I/wVm6S25j+VPKPfMT
	dt2SjaERPbooRsfQzJLoWvbuRNJS54U0+u
X-Received: by 2002:a17:907:989:b0:bed:25a6:1c89 with SMTP id a640c23a62f3a-bf373407e0amr1077762866b.25.1781017990067;
        Tue, 09 Jun 2026 08:13:10 -0700 (PDT)
Received: from Ansuel-XPS24 ([2.195.136.12])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-bf0517721e5sm1073637866b.9.2026.06.09.08.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:13:09 -0700 (PDT)
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
Subject: [PATCH net-next v6 03/12] net: phylink: add phylink_release_pcs() to externally release a PCS
Date: Tue,  9 Jun 2026 17:11:59 +0200
Message-ID: <20260609151212.29469-4-ansuelsmth@gmail.com>
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

Add phylink_release_pcs() to externally release a PCS from a phylink
instance. This can be used to handle case when a single PCS needs to be
removed and the phylink instance needs to be refreshed.

On calling phylink_release_pcs(), the PCS will be removed from the
phylink internal PCS list and the phylink supported_interfaces value is
reparsed with the remaining PCS interfaces.

Also a phylink resolve is triggered to handle the PCS removal.

The flag force_major_config is set to make phylink resolve reconfigure
the interface (even if it didn't change) is also added.
This is needed to handle the special case when the current PCS used
by phylink is removed and a major_config is needed to propagae the
configuration change. With this option enabled we also force mac_config
even if the PHY link is not up for the in-band case.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 49 +++++++++++++++++++++++++++++++++++++++
 include/linux/phylink.h   |  2 ++
 2 files changed, 51 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 4d6ffda0cdd6..b45bee927300 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -923,6 +923,55 @@ static void phylink_resolve_an_pause(struct phylink_link_state *state)
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
+	list_del(&pcs->list);
+	pcs->phylink = NULL;
+
+	/* Check if we are removing the PCS currently
+	 * in use by phylink. If this is the case,
+	 * force phylink resolve to reconfigure the interface
+	 * mode and set the phylink PCS to NULL.
+	 */
+	if (pl->pcs == pcs) {
+		mutex_lock(&pl->state_mutex);
+
+		pl->force_major_config = true;
+		pl->pcs = NULL;
+
+		mutex_unlock(&pl->state_mutex);
+	}
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
index 3387d308c4ad..b65f91c78d8c 100644
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

