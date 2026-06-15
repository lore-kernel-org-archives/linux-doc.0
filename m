Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DDB3F4139
	for <linux-doc@vger.kernel.org>; Mon, 15 Jun 2026 12:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781526664; cv=none; b=TF1mWmvesICF0q2Y5YdA/+YRrGoGcFINwVE6fucfd5dDppzJB7j2z9Fm4y+TIrOcf8a40LPKfHO/NdFtw1dmUjvouA0qok/HZ2oSNwU2LaKoIGR5QPjQoN5VEIVJd82fZfXN8+lwsL841RxgyMhFehd4qOyZrpU7IOfK2GRyZPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781526664; c=relaxed/simple;
	bh=30QNHt/uyMqU2qLsz6aFbvIpIdmUJ01fiuBt57q5BGE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Idf62wgp1VLvbz2JZmBjw+sfpfYaCwtLgkZmqhMgxD8+Mh2BlagzNeI3JKEGJ44Ct/fjwHYXrgoXWLkalTSE4ftN93nqlzMerZVgbS3ag49c27dyUo9akEkwg7vkaqTacy+RW9EkX9hHmm9H3HcAVihr3XY2ffzfpWx32TpIA58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=stefvXel; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="stefvXel"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490b12270b3so20326085e9.1
        for <linux-doc@vger.kernel.org>; Mon, 15 Jun 2026 05:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781526651; x=1782131451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nO+Qv6/pUZm+9zWLiB9BZPBet5FYSX8BuSSJgUbckJA=;
        b=stefvXelEs7+hE6oUce+2bPTXSQvm1qihydmKgnMkC314GQI039Ihm6aYez/WWlAHs
         j4/mlU6dlnxkyKnx3tsooeL5HlUgqYNY7yizh9e7YkZf8IAgWM9j0QYhppNor0DC7H1j
         AyYMv7MfYCwAfTVJJBy74tH9zVg0CbkB1MoSD/ewR+kBihBh8h3ls4CLcnZ8+6FWLbxT
         uPcHL2YR+N5Z8fzN4mN607PHJmTi6UUVVOyjPPY2B1idvG9DdIl4W0Q4UjtnCv6d8Gaf
         yx+s+57nHPdbmUUNWS+n8eThuo2n7uuS6aszqC6fYRCexUDDp2no/uQ08HJpj59wXOe2
         T+PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781526651; x=1782131451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nO+Qv6/pUZm+9zWLiB9BZPBet5FYSX8BuSSJgUbckJA=;
        b=LN1MTpbKNne0f1kU6UbDrA90EIQuRZgZlmwOnbfwcnor/9lOVlwZF3RyHh11kg13QM
         5llMoOD9s6LZ2yr3f2nyes7mtGPsM68RqZIIgs4XMOw7nvSixkA0Jecr1wSlFH5alR+A
         F53mCAMmDQLgH45f68D/cLUxgxpsOwFpxehign3EOMZ9dvtzXJajaLwHsKb+kuCOg+n/
         ZMIFCH15EGpxndAVuEPBMJhzd5+gnGJeMHLpcPPXc1pvh27hHvc1K9+rbptxgorvX0LA
         PhjTl16gMc+BTVv8yKDYcm0rODNK+So9MzSwzTNnM6LJfZdJ66SJufiJQRjOnB6w0DZ/
         EbaQ==
X-Forwarded-Encrypted: i=1; AFNElJ91+MzCahGVQa0NQTeLPUhvl+yoQCwGA78VKg2sX5IRAESCwpzy0vgk1awami4Wzol/oKmjvrH2618=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWetRzyn+/Gq1aSmdFExaneoKforExYRB0tAl07IRP12wjKgnX
	iCLCOJTbAVWed9ibn96+gFYfV10XeQl1MwEpVDAbB4B20/ZqfmoNrRe9
X-Gm-Gg: Acq92OH6GyGzlXNFNKS+vqNm10mwR/py1j929XGY7QpZpI8/icZbQbvJG83emUDl9qY
	+XOL0aq1Mm7UyrMs14TZbIocjKilPYlhHOI8scATxcHc0nfDdi4BKniSTp5n3LkzPPLk3WrTEsN
	2tmonkm4VZ6TqLxJI8A4DFrL3qY0pNI9PSp75j1GUHJdKViBP+iFKwK1Kzb+K5Y1uJy6y1iWKyr
	kqg6LgfNBm7CvU/09Lp3ux948tzReOwE+Nm8Zw4K6y6FotI2kaGvt8Y4tN+jQpXXWAUweKGfWAK
	F93jXUBna3Dc5JE60pP2LKjo0f9MwxDZaBpl0/YgrduU4L1RtbkYInvxLFJh1FC73xkCslGDS76
	J09VJzUmrOFiu6wVZmZnukM24rB9HTx5QF/d2kYun0snAEo8r3pTw9ScyDD80RTtLTPcuStVmMw
	7U8sR11SuBxeWnXXeXSVe9K2PMQtMZxmsLLUCCfyXYQR26nYuhj3/8GVQ=
X-Received: by 2002:a05:600c:4f83:b0:492:2c87:3d34 with SMTP id 5b1f17b1804b1-4922c874027mr31192735e9.15.1781526650826;
        Mon, 15 Jun 2026 05:30:50 -0700 (PDT)
Received: from Ansuel-XPS24 (93-34-88-103.ip49.fastwebnet.it. [93.34.88.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-490ea95c512sm191426435e9.2.2026.06.15.05.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 05:30:50 -0700 (PDT)
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
Subject: [PATCH net-next v7 09/12] net: phylink: add .pcs_link_down PCS OP
Date: Mon, 15 Jun 2026 14:29:45 +0200
Message-ID: <20260615122950.22281-10-ansuelsmth@gmail.com>
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

Permit for PCS driver to define specific operation to tear down the link
between the MAC and the PCS.

This might be needed for some PCS that reset counter or require special
reset to correctly work if the link needs to be restored later.

On phylink_link_down() call, the additional phylink_pcs_link_down() will
be called after .mac_link_down to tear down the link.

PCS driver will need to define .pcs_link_down to make use of this.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 9 +++++++++
 include/linux/phylink.h   | 2 ++
 2 files changed, 11 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 0734c98498a9..1bedac517d21 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1035,6 +1035,12 @@ static void phylink_pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
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
@@ -1736,6 +1742,9 @@ static void phylink_link_down(struct phylink *pl)
 
 	pl->mac_ops->mac_link_down(pl->config, pl->act_link_an_mode,
 				   pl->cur_interface);
+
+	phylink_pcs_link_down(pl->pcs);
+
 	phylink_info(pl, "Link is Down\n");
 }
 
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 15e6b1a39dfe..eb6c6ca34147 100644
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
-- 
2.53.0

