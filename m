Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D835172EE
	for <linux-doc@vger.kernel.org>; Fri,  9 Oct 2026 18:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791570569; cv=none; b=lLYiaIpVyiNkx0z5FBhqY2CefgE3u6rWNr3sAHZSYwwP7GHrU2C89YY02ElR9RaOc/gOclHXbsJP/Uj8v4g8yYWCzJPylqKr44JbUL6rVVIUHalKUVnxP21Y3PMwmeN3b0dR2etkdlXXSDIzaGbaQ5iKZ8xLdFHNCE+XDuAJWXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791570569; c=relaxed/simple;
	bh=h8hPiufn9fKTuoW6KyGHAeDHTeJhlBLm8O3wGAxSH68=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oE4jI0eL2TkQqp0BHV/nCZ/E00xlTrEGagOxQMaX8Ak063Wzx3ywiBcSDZpcgSzYNESqxHUIrFmTZ6k9dj2WXmDqb9ExnWryC9qpoOl/xMGQaML+nBkiVJLL68OIY+RATrDecbQsW+oHwDbvoL8/uSxWwUjnZQW+Xun/O+cGGVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LU6zUJOT; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LU6zUJOT"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48c4207ac26so105019f8f.0
        for <linux-doc@vger.kernel.org>; Fri, 09 Oct 2026 11:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791570559; x=1792175359; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3fwLKA/eSPxGgl5NTsOgBm1tSgbZmfE7FnoEd9FlDQc=;
        b=LU6zUJOTTmT6LBBYE+c1T+53cIvJqiLchd0iJ/ocryD8jFT2S9Am3EDGh6+POGnlJ/
         43CfZxbDvviPsZRUQvM9dIjY9Ng02iT5m1d1psoCglw6hjhtx+/XvZMl56FDbFMsa9V4
         u8LXLCLqCBox9oD++RPZmEWGRP0C2wJFqd8Ip5yxuqf1Hdrun/6y3Vfb7VnoYmBsVWF6
         Wt1fEwg5b7eq7FOLPl4HhAtbrEnr2Q+M63MSBT/bIBYH3xDtkFf7s3Q90vWUOqWaM9L+
         +aCd2qLkVGBLd239SrD/3gqY4gh3cw0SbET2iuNF5Ko+uRs4DtmGN/rzLlrQOBsWmEFZ
         aEjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791570559; x=1792175359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3fwLKA/eSPxGgl5NTsOgBm1tSgbZmfE7FnoEd9FlDQc=;
        b=N8KfFaeD7aIXbdjSQa6IDcQUsWP8nY3grA5pLJFzwFmIs5dN2y/fMIXv/Tz7QeQCNj
         jyWxEA4dj+jNm/GEwrUJvMcM5k8VrrR+eKF5wdT3MdUi0RnINXmgy9EYzGyEmQNrhamO
         jEj66NuBCJ8E3gldKvvmz7KJVRWkvAi5ImSzGMi5kZQP2RiZBKUDRvq6WgKGklKMv0i5
         5X/aeUHZ9evAOogLmeVUygxYPaBZvdP99m9YdPDGGRoQ5kPCO6QXC3EfE3o1X5o4UmZo
         vbRGcGMqMNX1pojnC00sg5A0FyvTJwQ9SzAQCfXIYDJhsH2TZntmJAXAzab/LBdJLgcR
         fHMg==
X-Forwarded-Encrypted: i=1; AKwUvBzLHdjTkTqSSRD01+ONdKU5Gx7Heku5IdbLp8uCLZWZWekS+vXdUQKWPMUWSkm6YK/9T+/AjGmivS4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLwtW77lfVBB5jfZp3VumLBZABQ3HFo3r0mpERmxxuR31NZ2isJ
	Ddn5o8mmG/Jf9ICd3vwmXigPRwYgS0wrMAzcVRtWG9trpkv/aM2x0whY
X-Gm-Gg: AYBFou2x1f09LHJQPVlaQbvJD0b556AN+zleTLzY5SBOhS6DZMpBW89IyVBo3cfRJd2
	qtZ5MybOiNLXjOzPCCb7BLv9UVs5JgvbeGDw6h3DMN9ahyp/AXiWhKB3m8iamwkShnYk05XfWDk
	2+wiR5BMd0VcYgCR2bNTTeXwiaFAjkLm39eamhv1oEIF0IpUbrc3xWvT8a7mLmwlGl0V0NP4UsO
	6iaEPo8ysdz1LoYe2dWi9+YBcTj7dsfMPKzGOTeAqAOtQ58JMRY0SDrDeLlG6PQel1SuPeDfV43
	bTCvxsYav1+iEIj47bsBX2vkfWZBo6YkWGAWZvLg6PDBDVch54zvdiJ0MMgfDzz6Bgex8XRDgL2
	ANn6yEjx70wXktJfijqcHeQTaET4YNP/5hwOF/k/FcBYe3qPPtHi/0OFh3iV8xY3eL/0UHbOCQR
	C/CpgjqIX+ukQh/GzgmWiLrFbIzCh+zqr9+ZVnyr6+GwH1gw7kml+7sQofWjaislEe+S71AJYGz
	68n+5lXn1uSDeHuTnRQCL8mwBvMzFomkevfY4q5fki+r2DoE1QHfaMT3DfqJZRKzXoTjh1wv/Xb
	suvFsLsINbivcUnFKMq1sifpbiCU
X-Received: by 2002:a05:6000:4112:b0:48c:7ac7:e59d with SMTP id ffacd0b85a97d-48dbaaefaf5mr4958397f8f.34.1791570559085;
        Fri, 09 Oct 2026 11:29:19 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-213-45-9-252.retail.telecomitalia.it. [213.45.9.252])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48db9adf5e6sm5037794f8f.56.2026.10.09.11.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 11:29:17 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
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
	llvm@lists.linux.dev,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: [PATCH net-next v18 09/12] net: phylink: add .pcs_link_down PCS OP
Date: Fri,  9 Oct 2026 20:28:05 +0200
Message-ID: <20261009182836.50631-10-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009182836.50631-1-ansuelsmth@gmail.com>
References: <20261009182836.50631-1-ansuelsmth@gmail.com>
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
index 59283564f72e..28dad1393b69 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -989,6 +989,12 @@ static void phylink_pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
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
index f06eb8b6f94a..f03c1dc0a4a1 100644
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
2.55.0

