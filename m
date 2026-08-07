Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D7E47F76D
	for <linux-doc@vger.kernel.org>; Fri,  7 Aug 2026 13:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786108428; cv=none; b=UKe+EOj9IbJeE+169bWJkcQQVpXWDBZ1YnvxB/uFhq9r4XI3GmRT1zuztP7gCpijQLHhBZBkHuwnUYqsvCShYf3r3xw/8JxcoWFVgyiGdvwXVDEQr2l+UV4d+d7fFzQ0fDjBodHA6ZDRTuGha83W0N6Ka+tIFYVnsdPhnYkRhr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786108428; c=relaxed/simple;
	bh=aSuv9m3SRfbbDLL6UMHt2VSLxYYZd1xdbxrhJPEfNVg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nHMZ1XH2p21dfT+hjYyQtwzfwnz4a6bNuDKWQN0TnGnshxpfxEdoyE0SDDhU4gfPOzi54DS3DMmR2lnzkanU+EP93Uhx/EayH352FY9pifebgQI4KwciZKn71S5t9GuZ7u6T/HO1yqXuQEvwqHOG6yCXm1ytO8OYIkpPxa8v4do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BP1ipZgX; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BP1ipZgX"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-495590dde14so38544625e9.0
        for <linux-doc@vger.kernel.org>; Fri, 07 Aug 2026 06:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786108410; x=1786713210; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DAXATgTkufRgDBElO/+VP5qlX2m9wHSj0la+spoaFT0=;
        b=BP1ipZgX2ufZt0nRDe/qJpc2neO9ZXvBxa6i6U3bu3TUfB5imRTiqm98b/xQl/0/Ox
         7Jj7nHYisys5HWnnmv+dwZ5yhSsE+wvOVt4xYnHs14Iu1NQmajVRp8nM5mcgfzDJn2//
         +wQV0ZqGhcdGU+2ODVp/X/1zXBNAkxvFM29bSIdOLOJpHbSsfYf6bqsbrndnFhE1LGIc
         wUTtKkyyuAlTWfiguAyezX63OXrDBN9nOj+tEWHYt8fZwN0N1UiZVW9BZRth79ItyZVS
         9sAbE/qfqBrRcw0okBXF9cIzyAVpasRaoHbDO2EBg4RORuHBwLeTIzjsbrHJRAojfqJN
         8nmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786108410; x=1786713210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=DAXATgTkufRgDBElO/+VP5qlX2m9wHSj0la+spoaFT0=;
        b=e+Jl896ZO10sYoWeZxHOAI0xBtJvW+SXv8fSMiClGYLoUU4Y7GFWyx8bdYhya4h4UP
         wXReW2Mfjmkr7ACUvH2bNg1gul4a15NOc560MLneJqoR3nj7KLTPZRiYlMCKaGyQ1mth
         4KE9I2CkG5FrHs04t4RvgcRnkqLu6e0kS0HiFk00HEKacTmRw+vLkSG2fESldYVPxc2f
         tAxPFs/KH1X/V0rGuV6q782NYlqSz3WFpwWCTuJTwRyXgI6Ox82BrBg3qHE0BxIMlVj1
         mLZZ5bRftrxsw2A01rYZmV9qI1hB/7XjG13CJnb2AtoB9xUsHe6nNBW4sG49HJFOUAx3
         Rl8w==
X-Forwarded-Encrypted: i=1; AHgh+RrmKHF57Yikw+UephBxUvQMWSf5qRw5ki4YpKWCwf9SP7kntIUE7zrvzD/CDVXeY9tBBbGTwRFFOW4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCLzZ4sttCdiKF7qS2TzfAASLwCSOmY6ONPlCaUphKPZu5dOEB
	SmU1cz42PUlTcJkF0PJ0Ai/Z2676cCo8PH+9/z/yJFecIYR0l4ColdN3
X-Gm-Gg: AR+sD10wn9Eh+cDXcE6n7sU9rfA3AZfSPQ5tLocdbuT5PIUv/AsmcWAK1TBHZWCIO2t
	1JPIcwvIezW3vKuhWpt79DbREaspQSh7RGaIsTc/jZJ9Obelgiudfhfxy7B68yJ1d+KelpCaUH4
	YsbHT7+gQTILKlb3NJBr0r2FxohsQbgsxS2TRCx6H347r09Gf0kjICJHoBArcomVNpFnh2eqsAG
	iSrVIWprcsa049nPTjEqta5uLvqKx20reaoixn23loZSFdX1gVaipKUJ2uhZgiyUfxZ629DN12n
	UyT0uxlvQsTySY6ZwbuLDX3mUqRcVf/ppcLq4c3VMwoz9clxk6ED8//ZieXjnhz0059GII5Vhq4
	cl3ctpruxc8A+nO7UAQsfWJOaPDyvkY+k32hC4K1NLhSxModaeX6YXSXL5Ik55VZwtkOoVZhd1b
	S9Nu6VEKjtITcCBJ9wvxOuy+BTvc9qR12z2DgZamYBzth+eu+2Nu81OKT3/p2J+bx8lwVs81BBk
	70zK3O3jTQNQl9QhqcKX1L6HC1wA0YWlqK95dFfK0yE/y68fEbXaw==
X-Received: by 2002:a05:600c:19cd:b0:498:519:e660 with SMTP id 5b1f17b1804b1-4994e72f7b6mr296830145e9.4.1786108410336;
        Fri, 07 Aug 2026 06:13:30 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-19-255-168.retail.telecomitalia.it. [87.19.255.168])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4995c7b2b68sm58827665e9.4.2026.08.07.06.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 06:13:29 -0700 (PDT)
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
Subject: [PATCH net-next v11 09/12] net: phylink: add .pcs_link_down PCS OP
Date: Fri,  7 Aug 2026 15:12:51 +0200
Message-ID: <20260807131301.192060-10-ansuelsmth@gmail.com>
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
index 69d4f6675db0..2e8d11573e3a 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -982,6 +982,12 @@ static void phylink_pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
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
@@ -1683,6 +1689,9 @@ static void phylink_link_down(struct phylink *pl)
 
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

