Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A5A42DA23
	for <linux-doc@vger.kernel.org>; Tue, 11 Aug 2026 09:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786440570; cv=none; b=bopz+o3SwFFLMdcA6vnD6aQOsYHSLGRPIAKrT17NtRZtk/a9Y6BSNCa1jHetMZ87JxxxYM5lDCffBh2Hlk29RcncMXfbyO9QTWIV2YOVVxskgk9HzlpKZpnKk/0u1WXE8g4Wrz/5fkWU5e+q5+vnlX40hfiCkGbSN4ogpLoQgpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786440570; c=relaxed/simple;
	bh=LbEGillG3O+kjyj0YMNED85u22Je+WjmMyS6VfSjF38=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E4ZFEFPcglPAueYcXdFfNgLVnbIZDuqTcMuWtBBlawk35mEX2AmZdUeHqLfkPqJs0o0t1Pck7LYlgKgFlx5MlPhvbG8T1sHNgJMX43aY8It6I0x7Dkn5K0ihdr/E2y72cYKd2lacClJ6fEzAgY5w/j9m3D6Gj6D11PLis0LCNNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BTq0VKlU; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BTq0VKlU"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4955aa106b1so25195135e9.0
        for <linux-doc@vger.kernel.org>; Tue, 11 Aug 2026 02:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786440562; x=1787045362; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5mpB2vpD+uaY+L+h47uF+iOxZ8EZmM0AVQF+rKLz4B8=;
        b=BTq0VKlUYk/CAF56VcxgB8DVG2Dhtb3Mqq3bvyvaII2icEd4ceQctCRANCr/sC2qZj
         FARjtBMOariMjPZVKidFl8Y/yk9ikVX4TmH2N74NZMHcLfWzvOZCA/h9NZdZSbRs6iod
         nY22UZXjWr49QA4Qg4zBjloXcx9BuayXRbjMDGXV+J3xLA/aORJuaW4Wf4wv6cC/gnOA
         1CfhL/3AEAvyxScReFIS+2PH9tCs9b9i+uNq+fSKwKlVr7KiXuZ4hO2UhbJ7l1EkjEy8
         G90HTSxlti8Jbcg4z/pQtVgNG2c74bmwvEcLAy8rCAW2CC6p0o5m8gNWImqfMLg8XFGd
         GnQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786440562; x=1787045362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5mpB2vpD+uaY+L+h47uF+iOxZ8EZmM0AVQF+rKLz4B8=;
        b=cgQJyZkQfrx5tSEIMKp+w5Z3rpVqdlKd0Quueza7sF+cJSyABP5/BU+SAT1X2DhY5r
         ATtdBeJiOlTB2VUEOtZu+VuaOBjaNZZEYYdFBBWJo7EnDafc9pMuUsTHwZAlgx6GvWLP
         czIIszTC4XoUN2yYsvCOuMbYBW1RGYtHjywZ31j6blH9nzr2Hu16L3btx3zZx95V/Qbb
         Y0riCTLJP8WyjYoAIde5pMrXpRYEGPd0cs2y0DDPXt5AQi3g5HpLqPBrJzyrcJEZ//oN
         GS+ODsnPv0xKgTqDDP+Akf2Z0EvQgpfyO3FcpEkQ6zsOOCITJ6yw9ASGAj7aKjMRahy8
         +jHQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp14om9DLzE7J8DYUTvf4VadG0AGoLjFBnq5v9jrdhSrRLHvpkF5FcdAI+e2Q6SYXbEDUcHq40pvk8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBfc2gabVvX3cgnBmdAQDULEIIvrCyufWU9XXo07QkN31Ypu0y
	prX5+WsBCugzXux6RNKaCkqOzfpn0FcVKxgB3I9HdmaXGYPA7MAvJoxD
X-Gm-Gg: AR+sD10A2Ww9hRZNs+GyO1COxQYKkwgGUI1E6z31nZjktszYcxhTaX4X4P+0etn1GPw
	38P7se7D5pCtfpBsRzK/ytiGdYyOPfGO+dmwcak1NBcBIkRURdL89BjnT/U+0KOCdAOVc89/N3C
	8h/hMN9eW6pvwlCC3rliqttmbHdWE94P+hhdQb9ZXL6f3OHCQWT4VlgtidN+NUXEMVIGISmviOA
	RKDcLSsCyAFkovx3z5HxzFG1lbTqHE2bhSQl2SGA/fNizg5D6PR9l+kiC6WuGnSUQVi5o9fGrJW
	KLWzT8qgRMzvbKejutv+9lWgIDFepECWLQpeai+3b9iqLlle+1RwzkaSb8CO0pxCLqGoJbktZD/
	3safdce0dSwmN9S3MhEjxS9Q2y6SVJWCyNul29g4Z+i/Ifn2Citw/hPqLod28rWCS3g4+2V+K1A
	CEYO7PE/5x/rnGCb/cgsqXMwT97F5iqjXa2aSvNJbSP7xXDwVyhnkS5VmaP6mEj9ju8Lpm2yhSR
	cAYrUbS38ZhdlwvDGwRep8WRdjHrIMNhWHwVeeZ9p76N1wEs64cGP/3klY6
X-Received: by 2002:a05:600c:4fcf:b0:499:7219:122f with SMTP id 5b1f17b1804b1-4997843073emr24510875e9.4.1786440561565;
        Tue, 11 Aug 2026 02:29:21 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-20-3-207.retail.telecomitalia.it. [87.20.3.207])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4997402a89bsm56135735e9.0.2026.08.11.02.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 02:29:20 -0700 (PDT)
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
Subject: [PATCH net-next v13 09/12] net: phylink: add .pcs_link_down PCS OP
Date: Tue, 11 Aug 2026 11:28:34 +0200
Message-ID: <20260811092843.673837-10-ansuelsmth@gmail.com>
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

Permit for PCS driver to define specific operation to tear down the link
between the MAC and the PCS.

This might be needed for some PCS that reset counter or require special
reset to correctly work if the link needs to be restored later.

On phylink_link_down() call, the additional phylink_pcs_link_down() will
be called after .mac_link_down to tear down the link.

PCS driver will need to define .pcs_link_down to make use of this.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/phy/phylink.c |  9 +++++++++
 include/linux/phylink.h   | 12 ++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 39d742c90db7..ef9ccec0cd81 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -990,6 +990,12 @@ static void phylink_pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
 		pcs->ops->pcs_link_up(pcs, neg_mode, interface, speed, duplex);
 }
 
+static void phylink_pcs_link_down(struct phylink_pcs *pcs)
+{
+	if (pcs && pcs->ops->pcs_link_down)
+		pcs->ops->pcs_link_down(pcs);
+}
+
 static void phylink_pcs_disable_eee(struct phylink_pcs *pcs)
 {
 	if (pcs && pcs->ops->pcs_disable_eee)
@@ -1701,6 +1707,9 @@ static void phylink_link_down(struct phylink *pl)
 
 	pl->mac_ops->mac_link_down(pl->config, pl->act_link_an_mode,
 				   pl->cur_interface);
+
+	phylink_pcs_link_down(pl->pcs);
+
 	phylink_info(pl, "Link is Down\n");
 }
 
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index ca9dfc142388..ea554c0d41f8 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -528,6 +528,7 @@ struct phylink_pcs {
  * @pcs_an_restart: restart 802.3z BaseX autonegotiation.
  * @pcs_link_up: program the PCS for the resolved link configuration
  *               (where necessary).
+ * @pcs_link_down: tear down link between MAC and PCS.
  * @pcs_disable_eee: optional notification to PCS that EEE has been disabled
  *		     at the MAC.
  * @pcs_enable_eee: optional notification to PCS that EEE will be enabled at
@@ -555,6 +556,7 @@ struct phylink_pcs_ops {
 	void (*pcs_an_restart)(struct phylink_pcs *pcs);
 	void (*pcs_link_up)(struct phylink_pcs *pcs, unsigned int neg_mode,
 			    phy_interface_t interface, int speed, int duplex);
+	void (*pcs_link_down)(struct phylink_pcs *pcs);
 	void (*pcs_disable_eee)(struct phylink_pcs *pcs);
 	void (*pcs_enable_eee)(struct phylink_pcs *pcs);
 	int (*pcs_pre_init)(struct phylink_pcs *pcs);
@@ -690,6 +692,16 @@ void pcs_an_restart(struct phylink_pcs *pcs);
 void pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
 		 phy_interface_t interface, int speed, int duplex);
 
+/**
+ * pcs_link_down() - tear down link between MAC and PCS
+ * @pcs: a pointer to a &struct phylink_pcs.
+ *
+ * This call will be made just after mac_link_down() to inform the PCS the
+ * link has gone down. PCS should be configured to stop processing packets
+ * for transmission and reception.
+ */
+void pcs_link_down(struct phylink_pcs *pcs);
+
 /**
  * pcs_disable_eee() - Disable EEE at the PCS
  * @pcs: a pointer to a &struct phylink_pcs
-- 
2.53.0

