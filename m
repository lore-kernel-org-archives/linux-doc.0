Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9261D4CDA3C
	for <linux-doc@vger.kernel.org>; Thu, 24 Sep 2026 23:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790290974; cv=none; b=EqygyaCHnZ/UBdijNG2x0IaG955R3ZtmL/4tCnofcqKCrk1DKNXu0l79OsNTzBJxcSCF2iwS9y5+8vybksJAtLRaMtjG+0nml6Xph7HnJsEVS6wyZ2Z/q3/oZoG2P8TvXBr/MiKnRHaSA4PhNV07o8GQJHQCScD0PwPpDaxgbR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790290974; c=relaxed/simple;
	bh=1iRj8n7qRYALgg7IVGBWtWv8CIf75ownoHVgp7tITjk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GXp1mnvR1M297cWzrxpvZymTnuqWv4R/bri2Be+AZX9HGnhR+f379woIuLQIKb81fpx2PgXQGqmQpaFSr3LNrLAr5w0iXmSukHwLGRy5kZ4OyqmHuSXx+wUv/Wbb7uVZixKzr0Fn7/684CxwLkDLteflsnX3PKXcwR1Z8Grr0zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rz67xUQt; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rz67xUQt"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49fe8bf173aso1619925e9.3
        for <linux-doc@vger.kernel.org>; Thu, 24 Sep 2026 16:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790290969; x=1790895769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TRQDcfp704v7y9W9giZQnIbIP3wKdXktBztj3wl4XLo=;
        b=rz67xUQt9CLzXiBXE5pLdu6AFIguT2Strk/FCqziaOrKFBJZoC2+XliCDoNZoMPB4M
         7Mo5si7PRsuWMiPLgu3d7HXQIDArMtlLt2xUbUPJY9Asv2UzkXZGtbrzsHz0fYeWtNGM
         xuCfMBYONrfgH7SrEjHM3fMzdx82Rr8Wnjk72ZebI0QkQze8PK1HWIG4ngBTCRa6qr42
         vQYmpT+SCfdJIU3/G2uGg/ZpTu93iMqflxXaRvJp1wAw9j+ywQKSl5W11NuvfWB9MH54
         V6ksQAA5tbcErVa9wdqyp5EOnFc84sQxXctkck2TEyov//+AIpg5V9Y3wh42XDRIJ40O
         VE5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790290969; x=1790895769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TRQDcfp704v7y9W9giZQnIbIP3wKdXktBztj3wl4XLo=;
        b=ooHEp9Re9NvcbOXEPXtq7yAkU1ror56dUFiKBhK4I1fTJfS4ROZZf3OZeddgfe228R
         ELxFhp3kGmcrMf8Avkpz9UC5xouPFRMO4PUHYqxjlWnC/dXN5KWQCKiV+S912BXcTP7u
         iFPS+6yRJ229a5UzR7Yn/4r6rDiLz+QRpG2MlLsmCAGZmMZFcl1NRsBzloDjI8NxxMGu
         SWqqcOJeKuSbrsJkyT3cgtxb1iOdu6NVGm+PfeG+CopkkDRY74QIBbR4pn/Y6OF+JkpL
         bal2Bk3H42Olo3KJhU/zfseXWCNTmXkG1GrBObtATF6VS/jD3MH/AG+Lrp+GvAu5XA3O
         eJoA==
X-Forwarded-Encrypted: i=1; AKwUvBxcFZWlX9FmvzHv7DSFvq9C4PLPAc/vDsCPBIvs9TfDiMkGBODeQ7L7vyeX/kKqTrwJ/44K9E5r/W4=@vger.kernel.org
X-Gm-Message-State: AFuF++l1U2R7YsjNgn737w0M8AXoJ+WeOHPttew6fc7QnROdx6yM5Xcg
	d5z3J2b8oqIswTDvzY8P8A0Y5YgeP3we9LgHKdGnOoEnku3yIZ2jCW5S
X-Gm-Gg: AYBFou3dJHsYVHzP1EEEANFzj1I/UPq/aF7p/0qp6P4R8zINDZMYYpxozV+CtJO4vUk
	oPG7rYzv5qcjfOzopqDsPKjWJLit0TpARmV9ZEZov6Hl/IKXxdsGozS4DoWet4jyUJBz2DuDIXg
	Bj33QE7f+Yk9oVpBQQEsgzZwZi/9BzHYUZDY98zjcdsihD9MWRiVHp/C1NkFQd9J1PBlB8whmK0
	NR9fHe9P5iQFXoHBeU8EzoGWb3TtX35j8GB/RfsH8Phtke96Vplc1jGLkiIvvm6obR5QV1BW1cU
	MqtJ31bcJTyNTYByuxi8kaIUAgGsowZYXx9Q0vWAvLq3qhn7VHDGDwWxVTOu5swuQ916jiQCjAS
	esyfX5vL9IGlk0mNI1SIY7c09VCDnkeu0VQRheGja9tvfpL98Zzo9Cw3SzDjeZ2wjDPthy4BsEQ
	ovGZ0bjeoUtUU1a0BNnsqyYGUlBTLt903ZmiDTuVnvo3nGZ8MoJP5KisAhZDBGvYOfIAdKkvD8d
	MQzorc5UUKMbv4u/YNxymjaWhrDSK/+nGNPJiptINn0KRnNA26LJi5GGw/esLHk
X-Received: by 2002:a05:600c:4f4f:b0:49e:69f8:e846 with SMTP id 5b1f17b1804b1-49fe66cbb70mr75087625e9.9.1790290968884;
        Thu, 24 Sep 2026 16:02:48 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-29-83-136.business.telecomitalia.it. [79.29.83.136])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49ff06cbe57sm12288175e9.13.2026.09.24.16.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 16:02:48 -0700 (PDT)
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
Subject: [PATCH net-next v17 09/12] net: phylink: add .pcs_link_down PCS OP
Date: Fri, 25 Sep 2026 01:01:50 +0200
Message-ID: <20260924230211.11519-10-ansuelsmth@gmail.com>
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
index b87655a09df8..fab55e6ed507 100644
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

