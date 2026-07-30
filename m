Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A473401484
	for <linux-doc@vger.kernel.org>; Thu, 30 Jul 2026 10:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785407105; cv=none; b=LxD+0xWrYZ2QkLaQXPOlNFACa/ppRFRYn8DTZr24IC3lEpCh6vM2eOe+I9IUxbV7wcDfeAkZeynUJPk1avZY8hfA4T+RsPhz9xLB26XTYmTlmpMu8LlujhnYfLEensOM52UxKuluRwWd+nzLnBqC9N15IwbICa1LUj8XSMgRGkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785407105; c=relaxed/simple;
	bh=XUz/ShyoXvuqlw5THYosa3ImAZDVrvlgDzE2uZvQ3kw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f3o8K4EAjwBYJRQUccO3GJ4UkXDAOirDokBvrkgdu/qr3H83z2vcqkoQesjkNBqXgb8sUNrXyGyH971SYSWFWORUZnx+EHEPQ26vzDkiQSR1OGa43DCpRyWXgwOKHDDMIsGzdskhpeUYN9T0kC0V10m4h7oso6mJgTs8kaMxpbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qBuNzwJ0; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qBuNzwJ0"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49802c418b5so2762865e9.1
        for <linux-doc@vger.kernel.org>; Thu, 30 Jul 2026 03:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785407101; x=1786011901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HyaO/jLnPM53YSkqIOaOcGO+dZK6Ewb3QeITvgnsvkk=;
        b=qBuNzwJ0cMkfi60dyiHLexzN1SKuBukjsHXLRm28/Vp4rF3hClBIDxO8bb5CiOM4Xr
         TfMYzfgUZ8IyFnt50b798vinjERmkSkVVUq6/VjDYCAjBQUSrFKyZq2Y+TablMQpriAg
         JohVKzqstLSh6DZ5A7DqfnoYDMO/MFH/Mtd++Iy5Ch9ohHYd/kdRwCU6kG6ynSQLhx0d
         VOwSOZ9yUZVL9RuniAgQ07HIgtSy2VvUHst11eTsESs4vcJpqtnc5ywzSGR8Soxpo8Ji
         uHEFgEHxknritiKarr362dDHLWl8FE7iDGcUbh0zys8zpXnKDBrpzUNe7nwkGnm3UU1L
         c7qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785407101; x=1786011901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HyaO/jLnPM53YSkqIOaOcGO+dZK6Ewb3QeITvgnsvkk=;
        b=aUGCmvoWQWZtwkVHoYKlIinwC9AScYjC74/IWlaP3+XbdR8rV5xtPSgdBPNa3oqwTf
         AvcIm9c+NTONN8b8eiRuyCPO0X0/5Nd1bs+DLUjGd7aKGaJQ7k+5OP/yKGF+gtb5qbVO
         YLNVAxYJQJ+YZb8UJBcmq9O6ThGug3F7KqOVVLifBEXKWC4PWAvxTj8YCMZFoUXlYjy5
         ptp/QxpGY7T4NjcI+VZxgUfovPVIUr3Bg5QP+EuULdRO84r0lVK4i0n39qkKdqBkkO3u
         LKeEYKfzZ3a9Blvhdj92AAVY7yjwQxDA1ubfWcKQ5XAYuSwz2COi1b2QvIzOv4TzRpaT
         euBQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr76BpS1dZ9S9nf+/EZZ0aPy3xsQAXCf+E8xDNwlySlgZcvTbMsgfb+Tbbkv477q1dZOZIfNZbd7sw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNKduIC53nwO7ePvfzumIbXBv7oDfGtZalQdO92d1JiOYUR6tK
	GK5Gk4twO44ahml1OobCArR5M3r7L2FVTemrSVTxJAeT8KGWPj/4Z2ne
X-Gm-Gg: AR+sD13SwAvKllNs987a5rwkkDxWc7YcpfSO1uJvy3++vevydNITKmhJkTZcwHtw3mJ
	cyb1YDR478fNEvFPsUyjq8KlWn62/zSAmlPjVChxgYP0lfOxabhV+XodylgEhxQZ99rL7IA0g31
	WisDOjm+S9rQxvfKXrGCKohIxAo5sIm0LusZuGy2dkxv5+X8hcviO/TrCP9ciexePly37zYDKJI
	TtS7Ixr6x8ciVGtJjGslOa9mcO7vE3JuPT8bYP/LMDQRXe5XBy4ni0hMBawp+Psky0JiQu8tRup
	OBrYKRamzx+rgLxKjIRAbuG8iZPUWXYesQ9fdKeRDTLsn6WATLPuzxjKqYl5Ohn+l3YGMRBccKU
	5/ZA3zotLNUC7mIQ5urFyAuL57RDd2g4zOv6pO/fyT/frkHtc56WtVC2hKXeE/s7dVwXkDdHWtQ
	++aTnSL2680TYcLuQ5eVZRvLCOAskUPddtUyPtdb/TLuIcED5d5zTbOR4W/AmHXTsoNHMdlEDOZ
	dZJUAgNp1FDNUKJ8CjrnW3MSFv3/nOaxkbAIFPd6zws5M8E9CAFjA==
X-Received: by 2002:a05:600c:41c3:b0:495:4e89:3f30 with SMTP id 5b1f17b1804b1-49800e7b178mr13191645e9.15.1785407101144;
        Thu, 30 Jul 2026 03:25:01 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-11-254-126.retail.telecomitalia.it. [87.11.254.126])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-498011fd5fesm44720295e9.7.2026.07.30.03.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 03:25:00 -0700 (PDT)
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
Subject: [PATCH net-next v10 03/11] net: phylink: add phylink_release_pcs() to externally release a PCS
Date: Thu, 30 Jul 2026 12:24:14 +0200
Message-ID: <20260730102444.1967900-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260730102444.1967900-1-ansuelsmth@gmail.com>
References: <20260730102444.1967900-1-ansuelsmth@gmail.com>
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
 drivers/net/phy/phylink.c | 60 +++++++++++++++++++++++++++++++++++++++
 include/linux/phylink.h   |  2 ++
 2 files changed, 62 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index a5e2d342a92e..562e09d1838b 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -158,6 +158,9 @@ static const phy_interface_t phylink_sfp_interface_preference[] = {
 static DECLARE_PHY_INTERFACE_MASK(phylink_sfp_interfaces);
 
 static void phylink_run_resolve(struct phylink *pl);
+static void phylink_link_down(struct phylink *pl);
+static void phylink_pcs_poll_stop(struct phylink *pl);
+static void phylink_pcs_disable(struct phylink_pcs *pcs);
 
 /**
  * phylink_set_port_modes() - set the port type modes in the ethtool mask
@@ -917,6 +920,63 @@ static void phylink_resolve_an_pause(struct phylink_link_state *state)
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
+	struct phylink_pcs *pl_pcs;
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
+		pl->old_link_state = false;
+		phylink_pcs_poll_stop(pl);
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
+	list_for_each_entry(pl_pcs, &pl->pcs_list, list)
+		phy_interface_or(pl->supported_interfaces,
+				 pl->supported_interfaces,
+				 pl_pcs->supported_interfaces);
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

