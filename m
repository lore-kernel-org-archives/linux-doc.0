Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9AE3EEAF4
	for <linux-doc@vger.kernel.org>; Mon, 15 Jun 2026 12:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781526642; cv=none; b=HGj4uEXKKdedpJJtA7WC5tjOB7/chgYGR9FPPWxmF0mHnKnzaSmKiox5aAvdseSe+pPS+NjpJRSIFNa6A4C0vDaVeVhFexw/UwaTcYCYl+qnlvCx+PKf+5jgDBhCZNNHop01iSqvaR8vDIIfDhu7mkH0k0decwJhRsL0wXTveb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781526642; c=relaxed/simple;
	bh=ZcRVlQJeNRXK2M0MgaksgKzLa1cJRySbcnQ11oZN5aQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PYFt/8v0j128TNi+nKu1UU3wgzi8KRiQp+Aq+CyTsRXDQrlgobJpF246BH+xwe3kAxSq0a0lSa5BGaxIOoTe7d9yNzWa4GIDrdb+ton3tlekuiKd9CCgknVTxelSWX+yH0bMfS1neJ8FFAU/A1hqpaph3Mw01IzF4Kiif+l9wXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=svtum2do; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="svtum2do"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490be03d47bso34453835e9.0
        for <linux-doc@vger.kernel.org>; Mon, 15 Jun 2026 05:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781526633; x=1782131433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q0DEjqI/MjSZk63smQxo8R3imVIUNR3yg/nfskjDHjk=;
        b=svtum2doVe9mpepR2bydarhDBBiT+D+SO7Z6D0pbICjBuNZKCdm5vw7mSryOtiOoLo
         8kRQ/IB9Irw7EJO09puqDe3xKYY0VKVtkNQYnZXfpHrM5mNifCH/lsu5AcarepxZDm/B
         85TpXxxt8R5+HcNocKFGNFiXqAie5tzq3QJye5q6PX4XDEkgld1MEFETV1fM6JDZ9Zi3
         KzZ0kyjHIIGuVrWWCdGtqMTmAF8uVBnGBGnZ2FiWZK965WUjFfcMok9v4TZ+1noyDSkQ
         jEBV4VrN2E6wWzlqTLNuz1wJMQ7bsz5yn2rcI+A5xNOVYUDQZne0LT66nd1ae0apQ0Cn
         cSMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781526633; x=1782131433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q0DEjqI/MjSZk63smQxo8R3imVIUNR3yg/nfskjDHjk=;
        b=k5/yW+tYoICZKbOZe6NTyndS+ReWv2OIf6gg2eWluL+KT1+e0f4UdA+Vm7i85bjtQl
         qrBpA++GYFUF6pTavJs1fwYa/q8cQ6tGb67hyGrw7cbLeFt+SYa33R5Dn3xOdeVv/oQf
         tq10fQNVU4JeKA1cO2FqYQsipn2U4f6nhKHINBRsd/Pus2LpuIFEixAcHRxlFSs+Ma5P
         XYO1ohX66whKCsozbj7eOEokT8A2Ot+/+aHqW+HR/tDw7o+tr5QPh+VQON47yKdD9txw
         ni4W06+7+w+Gu1tamHTIoIqkIaA2eA4VI12yknXv+pq1aj+KUcAB0UeVLUGBfC54XuU9
         c2uA==
X-Forwarded-Encrypted: i=1; AFNElJ/ZFdQoxc2r9dgl8PaKCLUEUTCDcJzetP0I/cvhrQnrk07lT1yHPj7hcE8H0x51MQn1mbZ9KvabIgg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCfa5ptr1raZbkj+XddV+UIZO/StU608nPXVg1qJP39kjRY/u5
	W3U7CgcDmHnWWqC41oBrLxppAaGDHu/MiEXVQJgjDoLotLn4gaQt+soL
X-Gm-Gg: Acq92OFPXM6X5gFqWkXORAUtIB9BVE6b+58cuK0gfX5CPfiQjNmbODrfC7E/CiUjyUq
	rJ7beypLMcohaisada4JN/zDVDuDGcyvnbtWze9qNauTsjxJw6Av5ztnrTIpxNGzg6T897fmS2R
	3yWVdAAMG5rmXWB5o3MDWNUHoWBWqmpb9IOKGcRZxyzqQ86+0uN5/aE1vH64SW/2CZLfRU+zkDc
	qxhTlT6lWE7QB/c91ot1eYBs8bzuBtOkHp9bN59xCrA6TChQRqiFPS37m+nsUYD7LdtzJ+BJ0jy
	cWp7k5HvbZfoqlLaMmR9jUdm2Mc8mQPshrlO7qlVE5UwaJKJCeB8qtA56DBDhaPtxCS2jnbXZga
	Yq8cNZ4OpfoiZE+sX101qhyL7OnHxLHytg+RO1sJp+CY6N4sr+5YUsm5aakYx8d/OSxfy3tPqLu
	a0xuVfri+930w2O12w+xuomuUBWQ3oRhvFrUCtHCVtOLbaDWp60rqy3rI=
X-Received: by 2002:a05:600c:4753:b0:490:be9e:fd03 with SMTP id 5b1f17b1804b1-490ec4bf9a6mr188542715e9.7.1781526632715;
        Mon, 15 Jun 2026 05:30:32 -0700 (PDT)
Received: from Ansuel-XPS24 (93-34-88-103.ip49.fastwebnet.it. [93.34.88.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-490ea95c512sm191426435e9.2.2026.06.15.05.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 05:30:32 -0700 (PDT)
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
Subject: [PATCH net-next v7 01/12] net: phylink: keep and use MAC supported_interfaces in phylink struct
Date: Mon, 15 Jun 2026 14:29:37 +0200
Message-ID: <20260615122950.22281-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260615122950.22281-1-ansuelsmth@gmail.com>
References: <20260615122950.22281-1-ansuelsmth@gmail.com>
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

