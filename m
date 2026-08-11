Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4425C41D13A
	for <linux-doc@vger.kernel.org>; Tue, 11 Aug 2026 09:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786440552; cv=none; b=NcnaMeAWGBorCT4g3S9Or6A91EZGok5uwbNBvPphUc4Wx1d1RPjJucorWFRMhWBvpq8xfJxg6i6deRo9bB8n7+EFHjrJvXx/vNO5WLDy336IW05Im9DTcLZW9XhvxtO5f10LzIksJN/sOSql+t0JrGx9lxD98j4crSB5Yvk8LXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786440552; c=relaxed/simple;
	bh=uxeJVrns8QwyjSHCN9EiUaTLmLVR3PlKWthj3ETOI48=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XblSCV8dpFSvTjcDUjcBXAwBq6+L4kUWGpR/aYC0lDzgi6Hryl9m4Mz43hNHayFP4mZPPu/xo2IEd7Wf5bgb12gz0aSBRc254dXdYmwaG+cMs08p6OnuIzXgzWPxBTA8c8KAeb7SP0gd2P+M7JwsWe4xMIDCCdVZYWTj1AMd2Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bUvm0aTQ; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bUvm0aTQ"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49558ce01afso4902725e9.1
        for <linux-doc@vger.kernel.org>; Tue, 11 Aug 2026 02:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786440548; x=1787045348; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SDVkGCf+wZIAIn3ijo+C35M8x1Ew0hMLzqVjwMb8SL4=;
        b=bUvm0aTQzetSDcof3XZfIue6q6esK5KkZYVlKTZg+smkGWNvAL8q9am28VIHgd/hV7
         GoXXUeIFWPlurb+PwPRc6qHB0DxSsC6VnV4iQKQJttWheE8H+rQJ23vZOaMbJkh7DIM2
         tAHZmlqywQ1HJY718a6BWAd5vBOUomJgPROxkRshGXoZWv4YfRg8e6bmHrMcdhSKXDXZ
         sNMeHrxm9XJpDpaWvb7mTHxp9qE4bMgqzkL9LhKnLbgQxc7Y64krWJJd8MLERiFUFSrZ
         U1SBXPllOZmQga+eVAwHLR6AzYuHf1HC3n3uBpH3DlsaEdaBuiEIUGndyF6tjobfiTZW
         CAxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786440548; x=1787045348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=SDVkGCf+wZIAIn3ijo+C35M8x1Ew0hMLzqVjwMb8SL4=;
        b=Ap8FXWqI5IPLNWVgpxn7WHC4D10SkeXFJ1Z9ikUzkYM23L5ZwmpUvVobqOgXOfQD1t
         EW4dsVLcMDLXBIJUFW6LXqOJARtxlSHBdFAPlBJvrUv/rcuC4OLIQ7Rod7a5a4GadrA3
         VcyCfbU1qM6XebxhEWgM9rG6/lImhhJ3c4vvx62wSeTKH5dFQSnGD70hr/n1BjPZLLye
         uk4fUNkLiGfQvBHQFVlRFEe/14sWgt5BCS3La+jYUdFDzOVdUrHB7povTh8xuVK8r1gE
         a/PEak6MzcczTWym3FCMAMjUrCK8YbR2pZM5xxpmauu4TcX7cB/PbFNKzxCx1F24yL99
         skPA==
X-Forwarded-Encrypted: i=1; AHgh+Roae+ku0sPGCVYFpJ2tVbRrWAZzy+KJOy1KogcSV+G8eqZYSY3EdD8XubfIfE6ONEYoQyr4ZfJRjDs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEakPI/JkZ+bt/tsJp4AvJWecCRKXl9+reg+oBOUtSVFTw7i/Z
	u4xBRBDWK7KQKaaqf9FP5TJptWyy/QJ5OgniBmOIsCZzP2vpb0ZcqY/p
X-Gm-Gg: AR+sD12gBac2xkY6kZjje5txLLNL+yMddPXG92Ys56D06c5lFutDk81kJdQkuXJo38h
	Oc8jxprqRJsvCA7yyj3Au/H+rOad5OxydIxe3qtb+Yy9ouMp1fZzWW8WmcFfiIR8O1XoJuC7+j/
	ghEh4synD/m/IiiSu928eRWoUW28vfsBEYYt9l5BNIToblGZX6JU2fZALreIh6L2Nz9lhapOfh5
	4oMYr3V4TyWzbFM/TT1FMV5DoP1m6Nr3GX7RG/ME24cF3eau29t8KKMUWmnAkwQ8Df4fixk4svE
	rNAmSQp2xoFx+Zj93xAkZ5IcmD1ZBqbDqbEVPMkwwpIu6OXvE9mvOGSaR2WLorPlbEBQP5cc6Ll
	6zJ7vn2u05juid9noWZNE8YqxC5uvJrDo+4TQxcB3PGyCq3X56/aqK8C3jTKEXsBNW+vDkO6DCJ
	aDAu1xi/PCcgBVZNPwbSS/mLk4klffla6DKS6+bML7aoX89AxSrmBvmRmEBmWd+Xs7tJF1cD0QI
	F00jHyIu/mWPezkFEfugteM3ZDVdnA8hrxnU19nVgkbUwwcuw==
X-Received: by 2002:a05:600c:4695:b0:499:726a:117c with SMTP id 5b1f17b1804b1-49978494f70mr24088285e9.19.1786440547839;
        Tue, 11 Aug 2026 02:29:07 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-20-3-207.retail.telecomitalia.it. [87.20.3.207])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4997402a89bsm56135735e9.0.2026.08.11.02.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 02:29:07 -0700 (PDT)
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
Subject: [PATCH net-next v13 04/12] net: phylink: save phylink instance fwnode on phylink_create
Date: Tue, 11 Aug 2026 11:28:29 +0200
Message-ID: <20260811092843.673837-5-ansuelsmth@gmail.com>
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

The firmware node associated with the phylink instance might differ from
the device firmware node passed in phylink_config as such device can
reference the parent switch or other platform peripherals.

Some function might need to reference this firmware node after
phylink_create so add a dedicated fwnode entry in phylink internal struct
and save it on phylink_create().

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index b69050f22717..b9a5cd123775 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -44,6 +44,7 @@ struct phylink {
 	const struct phylink_mac_ops *mac_ops;
 	struct phylink_config *config;
 	struct phylink_pcs *pcs;
+	struct fwnode_handle *fwnode;
 	struct device *dev;
 	unsigned int old_link_state:1;
 
@@ -1993,6 +1994,7 @@ struct phylink *phylink_create(struct phylink_config *config,
 	INIT_LIST_HEAD(&pl->pcs_list);
 
 	pl->config = config;
+	pl->fwnode = fwnode_handle_get((struct fwnode_handle *)fwnode);
 	if (config->type == PHYLINK_NETDEV) {
 		pl->netdev = to_net_dev(config->dev);
 		netif_carrier_off(pl->netdev);
@@ -2077,6 +2079,7 @@ struct phylink *phylink_create(struct phylink_config *config,
 		pcs->phylink = NULL;
 	}
 free_pl:
+	fwnode_handle_put(pl->fwnode);
 	kfree(pl);
 	return ERR_PTR(ret);
 }
@@ -2107,6 +2110,8 @@ void phylink_destroy(struct phylink *pl)
 		list_del(&pcs->list);
 	}
 
+	fwnode_handle_put(pl->fwnode);
+
 	kfree(pl);
 }
 EXPORT_SYMBOL_GPL(phylink_destroy);
-- 
2.53.0

