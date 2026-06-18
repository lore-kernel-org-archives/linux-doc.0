Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077393FAE0A
	for <linux-doc@vger.kernel.org>; Thu, 18 Jun 2026 12:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781787512; cv=none; b=OT0sVAVTbFuTFkBqFNTxht67AczeeDXw5atfm4tJKiXSc/wWmKnTwXbv5KEjGdmPRJZV3P+Up3LI0DWb6QPGE9bJlkzTJVEkOGuJtPkpSnXILZ6lwPM61tovXtUzgeRskBedMY1adqsCYvp+tPjTalaqfbehgDAc1f1VnDcv5sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781787512; c=relaxed/simple;
	bh=PvW6l55YU7y+D1r30THykltDeSG0Og5W68W5V8wdrbs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q3UyyYBx04m/Kcl2X4LAadUz6wFNZFUQswiUXTyTL5oRnia+B+Hh+ZSLuWsXwuX/9jpbgUHEhMuppw2XG9O+vvMUAJn00PnNmlBDqWifXtAX7EOlFyrsjYZK6bXQIiK5UjkrovKpulf9VVn19sgaK5gfKV6Wfw8zu7CnRqRsuqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A83lcs6k; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A83lcs6k"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490c1915793so7203435e9.2
        for <linux-doc@vger.kernel.org>; Thu, 18 Jun 2026 05:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781787509; x=1782392309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YBpoQAlaT8nFCgwnSUFeme66HFsPGdI0rDUBeKbrcl8=;
        b=A83lcs6kUprWekHOGtNbuS8uIh7+NCZaEtZn8LMixPUZaFqalZwaQ2TkW59URmIZUl
         K7BaKYOTa3c8GBU4T1cZ79TFvjSBj6SuqQkxiImd9q23+TOYGvR/JbE79SJ3IwadXDDy
         FklXOfjAeYvEGu2zmsUB2zt0huAR8+KCc4Q2SCT3WzRBp83EiAX6k83spx4LNxlx2Dqz
         l92PI5a8fwAF9kWVfJ++F2DLSKI31OygT11+X+zhS7H+mnr4SFgeO+mfVMSidjQf5S1f
         DeJbxhOPIC/JeG6znTErJu6fnGkKyq+8XuqrRluNRsuzLVuiyZ8yV0F4CHVSDamk6b5b
         5UlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781787509; x=1782392309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YBpoQAlaT8nFCgwnSUFeme66HFsPGdI0rDUBeKbrcl8=;
        b=cKXjEg8pp14E8ZTY0pPnOnHdZ0YSQcbWzU5KXBhGcxgDwb/mfFxEaYi8hbiVBelfwm
         Xl+Za6+8vYPqvja8f7WEWUDWRI89mClFXvgXQ3h8B0DvobOzHFGxyiRcwsHjQz54ESLG
         fdZaPSRaZYDhGF5r7YyfnKTIathwELGwAloxm+20WAuDIkEoa0GVTKS7vSQCwGzwtcVc
         iFC2xDmnb7RZsTfI7J+4F7bts1c4Py3vcnZu0GfqT5khHF0fDyOw9PJ9f62i/Ss3Fi1A
         yDssJ8tdMHdYXytGwxWWQCGekGciz2FtvfBREVVuwdjmPMe+cjxtrBTNX7iq1S9ly/FU
         hwPw==
X-Forwarded-Encrypted: i=1; AFNElJ9s/yxnlOoqFmmeMlolwHHDfIUqXTdgPcRIt11MTE07RqHP1DH0D3d0VGCSjTSohZoTqCLGtH7wAx4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz77MtYvuvn9Z9LZHhHWFvxtwa121LDasT4WislGxxlKHlFpquc
	sq+k3DtC5P2/xTJLN1kckAZZEVi93dODhi/niTAbrwyA8eUZ5hvajfJo
X-Gm-Gg: AfdE7cmOgc3S+1LY7/iBkQxgOC6GNBVwUzwcM4ZznUSrWCswiFio+s6xHi6ZygIzydE
	e2afmeMTV7yYLYVtFkzN9eQMOH6IPWKBK6r0Tri2fEGQ7P7FhjvkhEso0wBJ4S+pLTEoumCrPh5
	m1MTyeQFeZdMIl1vTPajaC/NpWGYqTqbFVTpOIQLKqJpZfXXCzRBSio1yAeU/uLcu6cMqkEUWoX
	WlfBrM0dQyvc4nwIVgNX5fnBlVj6A7RC7IKK7B0cT8dcmqCjmewHLYDwlfRc6AikQeArP/PCSB8
	lrEZiysWePYcaac0Ioh9Gqm1bWadTgkuK/HHbr9lxQI2OiL3U5w9lfm7JGi1W3mjcKQ6l03He0Q
	eW6gkudYVdJgLXt4bb2IjlDVhMSnjhuH3VOlobQvnWxMgkLj8ZDPsUSGEcGJUXDT1mfxfDjhxcL
	1HxsP1A6l6RVEWImYkI3D8RVb4zYw1anbUstZdmF1UYL4p1+M1pc4v94wibnPTjQ==
X-Received: by 2002:a05:600c:3148:b0:490:b5d0:598e with SMTP id 5b1f17b1804b1-4923412f0e7mr127508315e9.21.1781787509280;
        Thu, 18 Jun 2026 05:58:29 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-88-103.ip49.fastwebnet.it. [93.34.88.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49230a458f2sm241451585e9.3.2026.06.18.05.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 05:58:28 -0700 (PDT)
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
	llvm@lists.linux.dev,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: [RFC PATCH net-next v8 09/12] net: phylink: add .pcs_link_down PCS OP
Date: Thu, 18 Jun 2026 14:57:17 +0200
Message-ID: <20260618125752.1223-10-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260618125752.1223-1-ansuelsmth@gmail.com>
References: <20260618125752.1223-1-ansuelsmth@gmail.com>
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
 drivers/net/phy/phylink.c |  9 +++++++++
 include/linux/phylink.h   | 12 ++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index b9a212bd1206..b2b1d57dacd2 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1038,6 +1038,12 @@ static void phylink_pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
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
@@ -1739,6 +1745,9 @@ static void phylink_link_down(struct phylink *pl)
 
 	pl->mac_ops->mac_link_down(pl->config, pl->act_link_an_mode,
 				   pl->cur_interface);
+
+	phylink_pcs_link_down(pl->pcs);
+
 	phylink_info(pl, "Link is Down\n");
 }
 
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 15e6b1a39dfe..ecf4c384fd31 100644
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
+ * pcs_link_up() - tear down link between MAC and PCS
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

