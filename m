Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E6E33E37C
	for <linux-doc@vger.kernel.org>; Thu, 13 Aug 2026 08:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786610175; cv=none; b=ZKk4BVNFdriNQ76GTtfh/SoZh/951jZS5bAQwHwCErYY7X6st5f5APXN7gNnWS3fSoOoXcY8tf/0J7WrpF5FV4+lx6sZlD4lK1T13+Ct7l72jhD0CmCN3Jnd1+mEZ9isS1dylZlzT28ZUz3IGH6d4aFybK+5mtz7V0EYEixm/Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786610175; c=relaxed/simple;
	bh=f8kJ27Dkx0TxjXOX+bXZ7Ym1uaIiczOOVH2pKLOBE3w=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wyn/cHPSSYjdto/VJ6dEVGbWkJRMnTCMrRhD912fBPimGt/xu3ZIlQhnylNCw3ivEssfq8/L3lGYPWyLbkcLAlYyrk1oj8UFSQ1n1jwTbMom49yvtkZAKc8hIDr2A6mGbbar+jRaOnAfeokK+EmtMfeAS9mpGqi4KbZ6k1hCc4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pS8JTyzO; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pS8JTyzO"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4813ea321cdso432401f8f.1
        for <linux-doc@vger.kernel.org>; Thu, 13 Aug 2026 01:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786610168; x=1787214968; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=e2Ryhc7tn9LqwHTaax5YZtF5C+ZMbKW52Z/rvi3GeNM=;
        b=pS8JTyzOtx3ri69PEx+8+S0f6CRe8UXCJlVu05qGZSXhBtdpXxHS0jqtAwF8L/5LvF
         LC+K1iweD231qCqRkm+CMhXvoiI4EmdNoRrvRAU5T1UWJT062mfAmuBecMu2kKrs+La0
         Yra1kLgeyjcACFkBfelyCG6qkLmhoBjDFJBymcbWnaXrtb9n574H21kHsh9g4wXtnbSv
         b/wvHCpyBj+C4mqctu+MK0VgrPXOpjWxFK/REzvGncswjI9nvK/6NiZj06xrZ3ZA+kWx
         LnFvQqlqoLJ3oSb+T+w0zjb0lQGffr2NVGzBX5L3NUEN/NsrrDKPJlpH4ybKMDYYfRb5
         YDNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786610168; x=1787214968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=e2Ryhc7tn9LqwHTaax5YZtF5C+ZMbKW52Z/rvi3GeNM=;
        b=fnN2/lYzm7A/i8Pupo7JRh1ENPu6T0qFDF39BjhvF/Y2Wn4kbamv484oJpIM2oWWlv
         6ETKYoyK7Cfr4Xxx/WdqBrUNZtH8S/Q3RBDI35o/uK+IGreuqXWkoTna1oaXhbimoieM
         rW7Wen/yBVBBb5Z08WWqiofEtVBvMIYXxcvOi3Y4Dvg7E6yLgO0X3KqSkINM1Qa/rIWH
         01NT3CId8U5qqKTvAYUtVtEUX+wB5soMVg/yc/v4oosaimy8Zai2YKSVCuTVz97+ttQF
         RZElX0gi8m88QpZC8RoMFTdRabmui6QrBaAOq6fw+q30zGrkIlAasjhsP4DEw8caus/R
         fZdQ==
X-Forwarded-Encrypted: i=1; AHgh+RrEHXIjkixr7qlTkgwNG9vBqLbyrNKHXONTki0xeoZzE277M6GL8A8EX1HWT2DMgoFoQshqt6VWl6k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzfnb1+H0OzUFmWkaP+/l/eCuRbJ61e60gtKnmzGLUqvTGRNN67
	y7tD2E1BwcmOTbYjIiTIch+Ofuu8FOMF7w1mz1dwsok2BryKZpJ0Mn1Y
X-Gm-Gg: AR+sD10ojvlhkI2KpUJnBSeDi4H9TdAZaDWhPH8XnbP3HcAbxicHQhrCNNPtOvbTSMB
	QxSKeDh2EfJzUTDtafcVRNcSFFIFD6VR71eLLh2pUSQCG9+0joYkxiQSySOJ4TFeJsJaJrqnF3q
	uniGfJw6J4+dOF15AeHXR1nIV1n645AhJlwa3dmC+pN8zowMWFV4KuSnm5Do3TxWk+xdU/NOGa1
	UpPCdBUP5Ut0R4RNJU9FOEKzGdspiMHEhpNQ+1ou1uCXNb3i+6bEsotUEMoxfZiRz3vpXsURJnF
	ZxZQ9XXrB7HeRPNnUezZx5oGdbJqb7xKCaGsrRuVPpDAFE+dCp5ymRtudv3F93dGZP6HVkjJO4J
	2QJrWAnFwRciuV4nzM6qH812mVtv/qd6F2trSp1X2qW0KZEWCEOAvzf/2wuglUteJZbG5jrSqBg
	cDWPBQofE+TdsZ4JS9axaMrin0OoopWDF7Cj2dTq4GJUfksJ3A0z9117J20rkJMWSLJbBtMWWod
	3rnBcz6UihLHhxpOfFNXGxIf2XzBALJt67sDOeM2VZTa00k
X-Received: by 2002:a05:600c:4584:b0:495:5d6d:9cc1 with SMTP id 5b1f17b1804b1-499821baebamr37440205e9.0.1786610167928;
        Thu, 13 Aug 2026 01:36:07 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-20-3-207.retail.telecomitalia.it. [87.20.3.207])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4998216d082sm45804425e9.13.2026.08.13.01.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 01:36:07 -0700 (PDT)
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
Subject: [PATCH v14 09/12] net: phylink: add .pcs_link_down PCS OP
Date: Thu, 13 Aug 2026 10:35:14 +0200
Message-ID: <20260813083536.970196-10-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260813083536.970196-1-ansuelsmth@gmail.com>
References: <20260813083536.970196-1-ansuelsmth@gmail.com>
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
index ba3efdb0a194..34dbe89328b1 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -990,6 +990,12 @@ static void phylink_pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
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
index ca9dfc142388..ea554c0d41f8 100644
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
2.53.0

