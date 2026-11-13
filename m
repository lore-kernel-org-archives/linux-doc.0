Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794529982;
	b=j0QEeYPEnj6OcVhGtY9PNkn/M+heT9QKSLHxkcIxQngspmb5dUhndWNjHHKVUVHWvit1
	 Bmk/fn+wR1+4u1y70CqzgYy9DHu5p2yPpIG74CLYKbOtguUQorG1vQlMcr+BJ6u1yYMbU
	 mT56C+YAl/Pq+K9ZGN1/otq1+B0ijEhFUlfFnflQg0TY9wOq4ClV1WpFLSPSlkiFHKARJ
	 mijrM7qIqXLBERsuJf60yyJvrn8dOIifrCL7PfBwnmZMUH1TPzIvLo1CaK1U5Rxsu95XX
	 IzyPY8+qtZl0MAmxV7GiMFqTbUOqbypDFvzejsweZc8z7oPCkSWBen6zTgwoyIjnj4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794529982;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tZz2M5xBh1hnWs4WB52jPhyOeCPAanAx0iFskLPL39o=;
	b=Wkpj8UKin8p99gMXg4G14AgFvUArnD+EeFC4fKoeF2VI+mwbR1YadOROfatvSZUKImNA
	 XEhF24u5ZHZahjYZCRPBMDfADlENnZ7aPxmMTJdOkdkrVR0edFOyUaBXy2XUsBMeFE7Rd
	 nBJWWkQMIvtvTSMq8HUS7LP+0U5RCOzd1xqmTRfjHBASR2udD/xXQBvaiyrYO3MWjajxt
	 1nso1AGUwwzigdG+aGgG+JxdSNHiSla3A+b6wnwqurCjnI1Lv2AftfQ8UW0ThdZyygyrK
	 N1Lkv1FC5Av8l5ZQCgq5Go4YfhjcrnFcj0mSNwjM8kN+DBNRGiOGZftYDzPtz9QWAug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hvc5nTip;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96E0606D1A6
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 00:33:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B96E0606D1A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hvc5nTip
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-490f38e9688so251949f8f.0
        for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 16:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794529980; x=1795134780; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tZz2M5xBh1hnWs4WB52jPhyOeCPAanAx0iFskLPL39o=;
        b=hvc5nTip96B3WypW3uIihCn6m8UOACa8UlNljKTVWdH79x19MqSyI6cgBLaNQ4armv
         gR8pniwHo58MdOPpy9Ukwzglxfj3KcC5cr6L+Yb765dR5Q0PbO959wtZ0DHb05+sjQGF
         pfGBu50QH2Eqdr0+4WGWB5f991ce9Dzos758e6uJ7mhb4ywCnuakfKLb43SiZwt7anMk
         3e3dB1WPyfASjC75criq6sW0pRMCmip6CZI+4WzVf1fPvbkMkD5QQl8ESvcThHzMjgVK
         TQFjnFz3Rnwcp9D1iVWIBERA0Jvj/QA9HgmHxLofrtZ43PCStJF6hlx3zDiVc/CYGHo+
         /rpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794529980; x=1795134780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tZz2M5xBh1hnWs4WB52jPhyOeCPAanAx0iFskLPL39o=;
        b=IUcOOBHEx5IXk/IWMCk/5IgOxkM/1A/cLa4kpv8u+nHTT1hsNyMoNea3p0rn+89qFm
         miC9LIv4PxVh5eqUTkzvmQgXqg8DjkFkeiAzbF7zwcrFQKww/GjdJftWBLeBN8XU4Trg
         18BLQaFKCS1vpjYwg7vszLfbDUIpdo4npc8emGphstxu9/lHV0RITz9b5mGQ4/Woec/1
         rFiShj4FYtsP2+nrWJFY+N34ADbkWPAg7vyu4Pe9kpgBOg2DVE4CZl5AVmINY37xZK8k
         zb4SmuWB945W4qK7vUm4+74JuqaNzFH750HkhJiavjgz8BqkzSTDlu7i8G4wqTbG6d3F
         LTRw==
X-Forwarded-Encrypted: i=1; AL+hErFoJ6dbvcvAwW5Is3mhK4bm6Dgl+il5cN9fc+c2zghRe4FhgtOtqZ4tPynya3PCD1A2w1T+q+dIaEc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4Bxne5QbMDusWfSSEo4NdrqNDdtLtM5TL5ewd9su5JNDal4FE
	XqVKtaIUplkRFY9FhyiI9apkNPKstEUGK1GEJxTjPrwqL7kvrk39sCzR
X-Gm-Gg: AYBFou1sX0UsyWIjNhZGrJRiwpAeRPwIUCZpLitsxPur8yM2gDvfopRZUEJWfKk6vxv
	EJUfyDgbHnl3BjgAOabhvVUXfjNVbYmj0p+yNrr5xtg/Yuyx7NXo7j2xpqmMKrL0D+CtPGN8McK
	56PhqNBAhd9YYHT5un7gt8S+jkwjM2ovY1y8SVo1N9KPYOqChFBvMUJuuKdqBMVS0PYKhTuWjFL
	CvdkhwJRVNB9AwIKcZGa3VaMRxiR2m10uW5gIEY9wMGXSpNQ1aHwjH+vj5qT8kGsiPDCys13R1D
	namDNvjC9V8n+RifF175RqYvIv/S+6haFF3TIK9JXHMI3jwNOdfsLWlFh/MG2OfNifPcbl8GgiY
	tt6+3x8uOfqEdRpzg7ZLfE/OOczh/8MbCxtsyrSxJPtboxaoT/0Jj3aa6Juzx7uIVTb38a6IgMK
	N5guAXKRVJWnJWCwaH5WLfOBKs46R83jVi85zcl89dnSApObLu/1fsxpLT+GbWVQyc58hyqc36O
	8rHr6sSGSnbZYcuqKBHwMKxFzhd4/EupTT6Sv5B01+d+SqZj1RlRSDqu7RPtp9GNrTqzmktO1U/
	RiHKRB+pu3wzM+oXBEAe93qxOSQTtHP1ulaRtYH7HN8DHQw0swqMNOP23IQQp4AdkyfSHAwO2Ui
	V2xpXbHZlKtNqctXnkKd5HpruiChcgEGS0Fqdb0gcJ28F1IhvfQTu2Q==
X-Received: by 2002:a5d:4531:0:b0:491:eb12:e133 with SMTP id ffacd0b85a97d-49c6fc9db4emr1471691f8f.11.1794529980179;
        Thu, 12 Nov 2026 16:33:00 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-212-171-11-167.retail.telecomitalia.it. [212.171.11.167])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm2029768f8f.23.2026.11.12.16.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:32:59 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
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
	llvm@lists.linux.dev
Subject: [PATCH net-next v19 12/15] net: phylink: add .pcs_link_down PCS OP
Date: Fri, 13 Nov 2026 01:32:02 +0100
Message-ID: <20261113003217.197757-13-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261113003217.197757-1-ansuelsmth@gmail.com>
References: <20261113003217.197757-1-ansuelsmth@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
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
index 7f91cf3eb951..4f1e494beb8d 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1050,6 +1050,12 @@ static void phylink_pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
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
@@ -1762,6 +1768,9 @@ static void phylink_link_down(struct phylink *pl)
 
 	pl->mac_ops->mac_link_down(pl->config, pl->act_link_an_mode,
 				   pl->cur_interface);
+
+	phylink_pcs_link_down(pl->pcs);
+
 	phylink_info(pl, "Link is Down\n");
 }
 
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 418e8bec311d..e8c3f693336a 100644
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

