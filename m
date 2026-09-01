Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2568472084
	for <linux-doc@vger.kernel.org>; Tue,  1 Sep 2026 08:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788251427; cv=none; b=Q6CJdTFmWFxWVG4WWDVjMtionDYCPEmpeqNJhufZ6tProNyVkdDYSKvmdpVGthYXPgjtQkcuQaZlmu6YwaM1YM2h+NvYJgPbCq/+lVcx7zaB0nIaquLeiMI5U8OUa+3gx5qoxnvEoj7CcdAuNMEQILI4wrD9fhOKjsWtOTu0UZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788251427; c=relaxed/simple;
	bh=QkfsO9iIXWwWqn2LLgm3fPfnrSGchfrNPnJ7yZr1hKw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VbhXfck9OmGuyRAiDmu+cTt7+4xFesdb6qUwxRFn62Kdyn26YK/sU/oKrlLvO9B3jnJLPWo0239M70bjHyzv43hJ5ZaC90JsPT1lKtGj0LCM/upW5XvQy7Z25flF336duPvoUYqdrn74s5h+ce0fX5rYJD4MHs3CoTPPV0jsx1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BPP5AhIT; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BPP5AhIT"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49ccfbe062eso23055305e9.3
        for <linux-doc@vger.kernel.org>; Tue, 01 Sep 2026 01:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788251424; x=1788856224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4Go8JUbpoOJsxHq3SuM6SXORIBsWItiVTBm2QkGFiCE=;
        b=BPP5AhITsB5ekQI+qVkeySJghnZ+NyqZ6+QcizNHbYn3ZpQL2jDnsyRoZfPeQfjq84
         /3B+oe+Qh/EcQYSS0ngjZyku61Rwu5lWm0uIYfVsm/idRicRTmZo/2RaRfKrYkI0OW9o
         okPxe+l4uDgjp8K0MxsIcsrhOD6jC0BoInSYsCVFDnuYgfFSUiAGNB2hfw+9GEUNHDxs
         tDEQ0czGOkC6t8SVnCzDHk35/65JPPZE6QA8zU1vk9mxwGGpWLdGPggsIWi5KZ2HwtOI
         U8DKRtUtlqTip7RojD9YqgmVND8df6TmVuKjUtUcRSljYBpduo/eZ/WRsaG12kgejNGn
         2ajQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788251424; x=1788856224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4Go8JUbpoOJsxHq3SuM6SXORIBsWItiVTBm2QkGFiCE=;
        b=QtofiUVTlpyZftGLFGBsQvRSUilh9P3BLjOfTMChnvH9aMzFb0vN42+npA8IOQ88ou
         0yHMfKzeraIWooHpuAIkmL/se1I6n+Bcl4N3hh34Jag7PDYIcqkFHr43di2MmLgwVwGw
         RlTjZ4i8p4Zm+R01pePK7ZNAWybZbkoLaYlBOWrRWA/t08beuVZwnsUmt3/XOhT8FTA3
         aE+k2h+iY2vnRVTpm2pM+aKeU6bnyLhnzOig7seocWv3PA7X4y6brCJrn6e7xgXLLs6o
         lFDoSBHKEpacnSEDIDgVqC4ezoIbyGY9jaD1lrTXQERhZeZT/L562rejaC+y4tsRjQl7
         xPkg==
X-Forwarded-Encrypted: i=1; AHgh+RqvXZqwc1aJW9pBh3A48pjkf2+1WlKMxYRg2oZLQt8RDri40zm+zt8dZNsJ9kahMvGWkoo7LLeiH0U=@vger.kernel.org
X-Gm-Message-State: AFuF++lDCH4FhvCOF6mV+eXSpHJiR3qE/yj0R+eJ/e7P49BcUJBrb/yK
	3IEdfftawLE1D/5zGeN+gjowfEjKTD2jb5Ks6ir7M86aQ2QUWdeuychz
X-Gm-Gg: AR+sD12JpC825V8C7RTSgsmSrYEd83VnSENGu26rtG5y3W67Uetb6av/T1GchMVxVbh
	krFaF1gEmU3Af/L75u0vDE16niV2YPeIVz5vpPowtwbTmb3ZkFTnfy4E0hfsuzyQ1Pk89OqNIZ7
	Ey3XgNLYPiwgMhqnNr/bUrspcuwhq1lXS7H78FOPDEzGlj2VL7Srcbw4wqO7I+0OtV33f9nNuoP
	aDo9zDOw+xY7KPTepL4yI377dMhOMTVJSoCEL42uaM43cpvIEAcPTZ1kHQAHGcvJvt3stPss0rK
	HjH8gsmPQbgfYxoyvwKWraQqlNKOSNYbE9QNoFvlXcYUa5xCdZl3vzOVes/pAks3oP4YwS+mNdf
	h2sARieIgtTyVLq2Q75Y+BvhNcXd0dDgtmyJzzW8zAC7ARvewjUIHEBuqxhK4yFgqDxW2+yJqog
	vw+uYeGNkiaydggHQDfMJZiuRmx63tbHh6ZK8KpOFbPlrbit961x+YpydP1Xrnz4xdorBXKGaWQ
	dPZc6MsOJotXo22GfHG5A1kRuUQMDC+psBRi6HWiFXbnWeuwpin
X-Received: by 2002:a05:600c:4453:b0:499:8777:ccba with SMTP id 5b1f17b1804b1-49b91c486abmr438008405e9.12.1788251423887;
        Tue, 01 Sep 2026 01:30:23 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49cdce08862sm51459635e9.1.2026.09.01.01.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:30:23 -0700 (PDT)
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
Subject: [PATCH net-next v15 04/12] net: phylink: save phylink instance fwnode on phylink_create
Date: Tue,  1 Sep 2026 10:29:19 +0200
Message-ID: <20260901083001.8044-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260901083001.8044-1-ansuelsmth@gmail.com>
References: <20260901083001.8044-1-ansuelsmth@gmail.com>
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
index d7391a60f01f..96f72eb5a6fa 100644
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

