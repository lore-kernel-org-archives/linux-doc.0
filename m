Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04B73D952F
	for <linux-doc@vger.kernel.org>; Sun,  9 Aug 2026 20:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786307502; cv=none; b=kpHWJTX12tMUsRqGi4t4yda5O+t+WwIqs1CWsrFr4skPfSUgx3F1MEdwluG6Jpfa6s/uIvM0x2PpozcyS0JwY4fuTK7xkQiQZKaAlfJGmYoe9UvBp/wxNikLlW0Env+A4X3nHMS0CpcR+Qre0nvKsw+5Jbu2C795NCTPqr6+Bd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786307502; c=relaxed/simple;
	bh=uxeJVrns8QwyjSHCN9EiUaTLmLVR3PlKWthj3ETOI48=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E9kASXwKimCEmSeA0Got/tkNGBQE/nObC+yZJ6YDvLEHRa39f/qsUciEz9nLRssvyj5VUPRFCUSeObckfTuGT7LzVLbajUXmDYhVezRLgcgo32kAc/Arev/By1ue+Hfi1th4KbBL0XHuzzLcy5jGVmLDGannkbl2/bhQVJkSfxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PLiBv2cL; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PLiBv2cL"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so10775845e9.3
        for <linux-doc@vger.kernel.org>; Sun, 09 Aug 2026 13:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786307497; x=1786912297; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SDVkGCf+wZIAIn3ijo+C35M8x1Ew0hMLzqVjwMb8SL4=;
        b=PLiBv2cLekUNdda1BtQ70VYAEkNGXQ0oecVfImuMR6e/2CooDOUMOkwX3+xbxZH4lF
         vuqSFyms1MUApdd8CcSPg5f5aFuyMOQGMPdYqzHdgXoJoUHdWhdITB/VIeq7U2T05POI
         Mh6LvY+Xp+ngwrVbDopL/jwvrFLb0QkM1CHpxTcQcdbaYaUDY5pL7+tSEgs7aUkXLDGf
         5aaNdEagVgp3uYrzUHJygaKVTaYc73QPvFV/vBrDgudxaTY9Gq5xdAk/J0oGPNJHzUIu
         vtnndiPiU6MJ3DxjZLiQ55iGSz6t02mE/ztnx9hTq6ChGtGv+QFRIQ2EygbuTK2rzZAW
         uxMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786307497; x=1786912297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=SDVkGCf+wZIAIn3ijo+C35M8x1Ew0hMLzqVjwMb8SL4=;
        b=ZcPMkcDvOMZLVWp5IQyjEOLC+qZOiDmHCimRV26GqKZJ8l4kUVnq4azmgDUPq7/v1f
         y5eCu/kjyysID+ID4cp4OkKLfdNJsZX09wqLP4BBwYneEqdBwrDVyh60zqm46j8eGkFs
         +nC2qD4oKM4uiHNdrmur+N52Tf5bZ3OKEG3aHvlwQ9iF4b2fNK+qe+GaygSiAZM3LmrB
         fPuhGoZbNMFjrPyn0v5Sg5up70MyirmZYEyv1+PeTAa+JytIBfk7So2eABly6B5AAzQE
         b438kGSIUTNLbq0ys2H5ich87tCGeuyyxblu9GOh3h50Yszo4fuWEBXd7fCN6eTuliqG
         VBGg==
X-Forwarded-Encrypted: i=1; AHgh+RqzIyjkE1uF2Sffk6khbjWtyFYPIcqsXLQLqqT+U7FQUGXf7e2Rkn9F9uKUk0VUxVaQfaKryBWmP28=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOEJdJ+wTThDrRATlk7v/tqkpNl17xuG+R7pwFCvU/+qSvqx49
	gZvJISGBYGDkZkbA1qNNglS4tyRPd3AKx3fSGkdrnJTr4QfRdAoxEnKk
X-Gm-Gg: AR+sD12U0JCZdf6r6SEvIda1poMtlZkAbolLfIvH92MJ0tyqrMoH9pX3BZYwp09pJQy
	j+lPvAidhGJJ6zNaAWwLfHSjsLD+N06hP3Sz1FtlPG+c3ZKl7L14KblyuJEoyIMc9kG7l0s+9aJ
	Rm9plVOPTartfPaor6wwWxSnLH4VPpCEzEbs4QP12X004J9XJkN4d9TieB0uVAAmPh+WcAZC4Nf
	wceDAOaibwcQqnvY9aanrghR4hqnDkuTxBD4Rge+zMtG7urLZ+AjwEsexjuagqhLL/MTkDSAmmL
	z6NKfp2aNMbvhQYPliii8g93JanUcrCzRaHEPwCc8kU2PR2pnx14/KPw7sB6GhlbjxDkQhUU0Q0
	zqIBoNC4tKncm9Thsb3Yzkm+1W/wkPlRN0Y+TAqInETggZ6TfR8B3QT/pzaOq2kDQOGURWD9vxF
	gSD+ovPSSIckV1qSFRASmctdxWXvDkI0D0gSsew84cYfUw/BSaFX/Vw6A7R+f2uzGDMeqMc3l2Y
	U3r5agcl+lNU9uiqUJgUxXuzWvvW9SQqh+107AjAdW3EBLn
X-Received: by 2002:a05:600c:198f:b0:492:4e09:9fc1 with SMTP id 5b1f17b1804b1-4994e7cc5a4mr520537665e9.15.1786307496663;
        Sun, 09 Aug 2026 13:31:36 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-20-3-207.retail.telecomitalia.it. [87.20.3.207])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4995e9ea92csm229357065e9.4.2026.08.09.13.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 13:31:36 -0700 (PDT)
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
Subject: [PATCH net-next v12 04/12] net: phylink: save phylink instance fwnode on phylink_create
Date: Sun,  9 Aug 2026 22:31:01 +0200
Message-ID: <20260809203116.640271-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260809203116.640271-1-ansuelsmth@gmail.com>
References: <20260809203116.640271-1-ansuelsmth@gmail.com>
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

