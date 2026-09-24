Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83E446F4AD
	for <linux-doc@vger.kernel.org>; Thu, 24 Sep 2026 23:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790290960; cv=none; b=SEwY6gejPF+kNzNUQPzfbejWNQjeRyFoajyJ5Q4v6oXbGnkH0Ctj9xU963jg6x96YGTX2caitFfRpSYcGB58CFrrjnGCqQJ0UqCimZb5QfWA7391R+YZj1L0v1iHaNxj/lkw8n67ZWniJ/BMSns9ENl2xO5RRfv1+0sFJqnyB8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790290960; c=relaxed/simple;
	bh=m5HqqAwvf714jhn9AtFujlH/Cfft9cIXbM/MO6suoWc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CpXH0UnSOtQMp/RS4dz0wDrsFaNlFxcClt+5Od/SlTj1O717IfDK8f0v2sMGs2OgvV0rhEddYLynnY4qW3K8gHYaoplalvZdU5TaFPTMHIwmPb1Je9Yg8KKYffG5ITb64prUW9CU9kd6EdLmrlU/jAI1RrGBHlXP8pt/KKm4zRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aqFFapcj; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aqFFapcj"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e79a408deso1606765e9.2
        for <linux-doc@vger.kernel.org>; Thu, 24 Sep 2026 16:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790290956; x=1790895756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VDqbFLObsehCe0sJ0clGiEdbuZFFJjsJjNFUc+Lf4xc=;
        b=aqFFapcj6lWKZujhQlZfnhJKwQcmMWoshA0sNpAjFRspPHqIpyj2tW+ZCnEUs7tvGq
         eSNTkkmXspGkm3qSba9KIGthzRLhX7+LSwDJZ0j5ANgdeny2+IO7CfgaPkJrncWj6pWi
         q9vtngwonrM8G7klVeQQ9j2rOXeZfjj4Mrvu+QB29IiRYTzMfY/ulah5SBGXK1TZtJvk
         3Ghfd/Q/JCluMjeQpScL63ADHzXCmLUOTqHnnbU0Plt3LnlwIQvp8h9CCQxoLpemcQfN
         PX+KLuDzaym7ZakDxYzVZSvkNWhnKQDfmcjIFDwrU8Avc+Yc3kkwVHiQnatEoZ1XNIIz
         AYOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790290956; x=1790895756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=VDqbFLObsehCe0sJ0clGiEdbuZFFJjsJjNFUc+Lf4xc=;
        b=CgyshfYlZnMsFZD/bzLKGYiUaPP19BACrtqronlBUq8B0H75Q6LdX5FYmYyvJPh0B/
         QII1J0ySQXjYPkWnKGY/9KPCXmiMWjGzExS3Jw6IFCJaFcgY59FDuUKR/s6pS1mFrszs
         AUFPUF8Xa3i6hdN9/Osu/Z0idZkPr3UHt0tor2iUEGlSHF19r1NLd5GM1o8LGbJFHUq9
         v1L57neAOhMW3SE3LAIik5ovhB2FuUomXOI1qZExzAocUOvirfVl7x4U39tRe6QWEZ4m
         PzlVELeVG4Iqc8Fdk+P2XZs0/qlFkqf385iTEIlmeW/8KhzcwnZG+EuJ3KVLIczgowEd
         vTUw==
X-Forwarded-Encrypted: i=1; AKwUvBy1Gz1+BeOz9PCTI131NrkUIfax4uIRO7SnEhkMv5YSYsy1JrtoUQeS+25Y3WzHuprvIWFnrs8Z18s=@vger.kernel.org
X-Gm-Message-State: AFuF++kbZA6lt4C9yVks64Brh1IR69sjgaStKzkNp5WmRPxFqMmWMmOJ
	Rvb9aqEfKrK9kgat+sc/T9+4grjDw30hTWT0Qs2llEKs0AZNb+Drgnpq
X-Gm-Gg: AYBFou2eZB2xytbMc1ImaeRQhV86sojIvKoMRLIihevATN6uEI40O0tHqYKFAWiLHwE
	Y6GI0p2nwfUWvkgKxdBa7twVjvJmYwdRWXAK1KYAQDht6Bape0BfIIwXB6G/sxapud3Jne3TMuW
	fb/P6J99/rwS0t016s/WlzzVhUpEDnSMmJP/h++DVX4G5KDJiYOs0YxDUk4fuaGMECZn90QkfT/
	f9EKtho96YzzNGRfDRstCWtIr+898lTAGEEym60UTeD1XDpHY3+aKWuX1dq8f5zxicGZCsR9z0y
	EKO9i+nrneNlLasOUJBYDr8PQ5nv+keuAD1hazrlW63kQkUha3uW6Des9E/9BwsLSIIGNWEz4fX
	Um+wMpsw90T8syl5g7Xt0My2TjyM/4Wwhz28YWmV1FFoYKVDnhThMe3nBrgRhuz3cYpVYbrjBRi
	REATpSJppsAVSyn2Go1axG6+4JvwKnObmreKmZG9f/g10QuxHBPxVmzZdUW09NVWQrLCzmD859d
	MMc7pRx2Mc8JuNNVGEYEOIneBlGcEjilRz8mBJ9Mpf0eFKaahEK7YtcUN3wajZy
X-Received: by 2002:a05:600d:486:20b0:49f:e8bf:221a with SMTP id 5b1f17b1804b1-49fe8bf24fbmr42002985e9.22.1790290955933;
        Thu, 24 Sep 2026 16:02:35 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-29-83-136.business.telecomitalia.it. [79.29.83.136])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49ff06cbe57sm12288175e9.13.2026.09.24.16.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 16:02:35 -0700 (PDT)
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
Subject: [PATCH net-next v17 04/12] net: phylink: save phylink instance fwnode on phylink_create
Date: Fri, 25 Sep 2026 01:01:45 +0200
Message-ID: <20260924230211.11519-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924230211.11519-1-ansuelsmth@gmail.com>
References: <20260924230211.11519-1-ansuelsmth@gmail.com>
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
index 1156e6c61a08..9441afe372c3 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -44,6 +44,7 @@ struct phylink {
 	const struct phylink_mac_ops *mac_ops;
 	struct phylink_config *config;
 	struct phylink_pcs *pcs;
+	struct fwnode_handle *fwnode;
 	struct device *dev;
 	unsigned int old_link_state:1;
 
@@ -2115,6 +2116,7 @@ struct phylink *phylink_create(struct phylink_config *config,
 	INIT_LIST_HEAD(&pl->pcs_list);
 
 	pl->config = config;
+	pl->fwnode = fwnode_handle_get((struct fwnode_handle *)fwnode);
 	if (config->type == PHYLINK_NETDEV) {
 		pl->netdev = to_net_dev(config->dev);
 		netif_carrier_off(pl->netdev);
@@ -2199,6 +2201,7 @@ struct phylink *phylink_create(struct phylink_config *config,
 		pcs->phylink = NULL;
 	}
 free_pl:
+	fwnode_handle_put(pl->fwnode);
 	kfree(pl);
 	return ERR_PTR(ret);
 }
@@ -2229,6 +2232,8 @@ void phylink_destroy(struct phylink *pl)
 		list_del(&pcs->list);
 	}
 
+	fwnode_handle_put(pl->fwnode);
+
 	kfree(pl);
 }
 EXPORT_SYMBOL_GPL(phylink_destroy);
-- 
2.55.0

