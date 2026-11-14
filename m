Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794653101;
	b=aecmVz6WpnbRLkMnav1ooysv50ovTJW0cyniHwL5lvMU9LuJQv9wllqXLXgIUsxpK0bD
	 43iwp46VvDyYjaSIFTtdK8wlj7w25Ih2yNsYagNAntca+Z4DNGTAFLdgiWnZl09HaM/CE
	 8Djtl/jFFnRgWW0bA1WTdrdt/W4HlN9mHEj7oTrIgUd4cwlYvf3VKUS2sG4sGHW5OTxsg
	 RWimkHx9NrfuT4K0HYUG05a+Bl9SdaizTBlbZ86lIWs7id5Xco0nLVFuqIQQHpYlfVdem
	 F4a7hhRSUtPtsPjiO9MQQfaIDHXgPmCg75yF/u+NsAswsBsHC0e1fM3NLS/J+2WOR6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794653101;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tAo6nikI8vemEGEz0TkkBtn52WiIVtD7jF6kIst+qVE=;
	b=jp8z9VF6J5bBEeFZ3X/tq2PRL+BExiQpwuQtXuIt/sC/Y4WPpDwLQ126TIOmw6/NYbxR
	 tdYLyQX52Av9h8CgvCbzYzxwJG2FrOwtVCFlPDW2Y5KL9TuwmTlsXzgsi4jicFxzWLIuH
	 T2hUOTgdop4p9RKiQTx6/nuxZUf9JGv6HIklZq4LnzfoAPpWkxree/2UZPo0aP8LnuCfy
	 6XvlXMyyNiWwrkHGS8stcLcbmC3vPSTnnM22OFFpqkdKZhylDdYqm7VLIwUIiv2eoqlPo
	 o9KDTi0Qjhp7NKxZPYcxb8iOGIgOv0eUJeANu5ZHFLlT+EAOT/Ebu4qoZPSNBRAEOTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hh4jtnEe;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19B1606B94D
	for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 10:44:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A19B1606B94D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hh4jtnEe
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb64c99d2fso3767685e9.3
        for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 02:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794653098; x=1795257898; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tAo6nikI8vemEGEz0TkkBtn52WiIVtD7jF6kIst+qVE=;
        b=Hh4jtnEeY3Rr0KON++uTGejBqMlfxJn3gIiWmWlmp/w1Y8KYpSHDD8ckECMiBkpAHx
         l3XtEN1sOm6CYFaZx/XwPB/JEaH+hPLA+rj8M7Ac9fu5Aiy3/4/Nx3aMPK6uUSX7cpho
         uWC5hS3BNMladdq7gEDU4eel1iBe0h9W0umalPVdwRARqShKscKh1S//LfyOUAWfKRTL
         qT0sNUi+Tr4zgBnDq1l8aiu+55uc9dBYTBRyu9OrC3BhZCpJu9PkDKyXwnpeTI1PvFAS
         HnA+xYJDeOjnmRvcNIFboFt9FkZHhQa3NDakZzfpIV9ifWviN7L9Z2dEaWReMr/qZW+S
         h72g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794653098; x=1795257898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tAo6nikI8vemEGEz0TkkBtn52WiIVtD7jF6kIst+qVE=;
        b=bb58madnkqHtvU67g22Mq8UVIN8aCJxvJ7JT+E3yptZqyf2TtSFrKWdCKui28S5808
         Ryrc8BIq1WMrc2znJZFGhcRdX6SSCFdq/Bjcowrle1OaO+MwwonQfCtWsAiBIGTJQwhY
         0JRbG464aZGo8p0/+vbErUDNK4afCKkdPLUKYxTAKa0c8HcvQMQtxgkXah3b6765w8z+
         wc2WxpvDcJLEeO+UnrAqxkoKV5qu607ilgIFb9CPeiUABfSZOuwl03IhnuStTff0fLRm
         oCYNqnQ9xaN/YmQVE7Iy97JaMSLPcJg0fQDDy7HWNsNij6Nhg80XafUoOyONn2twmOud
         fdDg==
X-Forwarded-Encrypted: i=1; AL+hErGuCvL86FQeMRgCo0/3QEuk6OpeXL31HXKtVxj75n2bWl4FU4jjznySB0QjNrrL+MNnNJ2kYxseprU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/OUTxMWpWjODqzsqdUL/IlIu50VKgWh2iivlEit+8/rUyo2cYV
	wDUSg3wUYRpAVAxQM5AAC+6YzFB3Uv9kaqxK6rgbi8CLy/c1WnfIdo7u
X-Gm-Gg: AYBFou0TC7hLMQ8negRVM0BxJmB0v6qxv2grMnn1TFkwCl3hhJyLrhts5/hEsXNHSZc
	Syk4EHfjUTqVKnyx50fq1RJx4iPhmLZFvfCuYSy86Yf1B9JnBPvOY3Et3Zgsq+6tBnCj4jdnpym
	NFl5OLOofC61xvVcQnVQT45MJG+Kbi/Ky4jpV0oTMWqKa7QZHt5H1u1HrmYmwNWoyOBjjNRSXD1
	ARUUTLTsnVi6v77V52sci2PLesiRlqS+sQfGkiR3JgrlXtCQH+OpIjqblgXXa3n0yn0NEtJ4l2N
	0jib2e33wXGzcZ1m5HA3oMDSWcWw7uETnWP1z6MVr+A6cfXjQ0mVseeOzujaGM0Dmr2Xw+h9CL3
	M5ox4rH0+ZNfg3GXo/8Vaa+YuZ9SKgADK18NKWYK/zblHqMfLnDzKW6HxJfAzTQvQC1+aUQ9hsq
	gv+sqywdkb1KywXWT0sLAKb9pEflpKGM/D4hI5SH2mJKA0W5gDR/GmAEBcBuLM0FoHe7iyp7bl2
	Dx/YzYQgGzwwmvGIw/WVMLbCHDpA5YjYJwmq7IV5KR7fJdPke3EguoiPjXgzcIXwjihCHOEpzeM
	9hLmZKK/12rKuRZev9meeylnEvqAwYj+1TDZP3vb/7w+9E/+m8jXFzReTX9gCxJw69RMTRyldDf
	Xd8E8PFC8GFoFZBHP6iIdYGP8T0D8GHL9Pw==
X-Received: by 2002:a05:600c:34d0:b0:4a2:5ca:767f with SMTP id 5b1f17b1804b1-4bb559f3737mr101333915e9.4.1794653098050;
        Sat, 14 Nov 2026 02:44:58 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb56719391sm52858285e9.1.2026.11.14.02.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 02:44:57 -0800 (PST)
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
Subject: [PATCH net-next v20 12/15] net: phylink: add .pcs_link_down PCS OP
Date: Sat, 14 Nov 2026 11:43:51 +0100
Message-ID: <20261114104426.235620-13-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261114104426.235620-1-ansuelsmth@gmail.com>
References: <20261114104426.235620-1-ansuelsmth@gmail.com>
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
index 2bf7a1ecebd6..11f03f985c2d 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1044,6 +1044,12 @@ static void phylink_pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
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
@@ -1756,6 +1762,9 @@ static void phylink_link_down(struct phylink *pl)
 
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

