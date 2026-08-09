Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E923DDAE4
	for <linux-doc@vger.kernel.org>; Sun,  9 Aug 2026 20:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786307513; cv=none; b=u4CqatYHtYQDgCuBE4O4JobdPEa0t7cq5CQmGI8pfWd5y03RdGvJkADUZh82BB/yWTStOuKcCy6cxIEQPzNWn9vDD431k+4vQtrMcpfPK0c2K83xlHmk2GnYHojox6kIw5dd22lTrcLCiN8GEnz/UrWn/DskS3S5WtbHdDtGqHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786307513; c=relaxed/simple;
	bh=9V3LdjIg6Clu0G9LOgw3jzWAJvl8mlhBZ/E0F+0renY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TSAR+3wZ7J6b+pkuaAypwZbEfaE5YK6eR9fLhmb92+GV6hNwyhXp2BsVYTVbx3CbrkPdgTcdUNxd/djtb0Gv4NFGuVhlu7aHITMux1Tyh3PLQVl5HHJNXU9t8VSTC8iZ4WHOPADIxt9oTpaMG5eGcTN/Y7XayAF+24Y5iHPlAGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DDTcL6sH; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DDTcL6sH"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso8688725e9.0
        for <linux-doc@vger.kernel.org>; Sun, 09 Aug 2026 13:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786307509; x=1786912309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VB96Ldc2jz3Kca5DqAJVE1SCjhA8uLTE3bNlY0xHhzc=;
        b=DDTcL6sH5xD7wNKbvS17V3VNW/kSE7wICBwEbLEhfHj6yZ2COlqQne2TUjX3pFQia0
         WcDYqz1o62Dld7YsuFfiWV2nL0UBOkI4ad6TzRmpDqWasuMko90Kee6Jguml/+gnfa3L
         dkNeAhngaJYlSW/6ep/zToI/mTn3cq9cAunctKMfXL6wsjBkCS6AqhJerULF7x/s8nKE
         fRZOb+35gkBBDUoBrJsN6/W5POWymLolnFv6rlDXeII8ROxM50oCVUmn+usJ1/qIYVd8
         +2I6Fe9pMzeaQfCx3bw23niUcvpJfv/PrTPQIkf47KW7wknAekbOnKn53PwTsoAGT9A0
         mduw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786307509; x=1786912309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=VB96Ldc2jz3Kca5DqAJVE1SCjhA8uLTE3bNlY0xHhzc=;
        b=Qoju0t0jeybly4wAslVM8BF/pFbDX4+SxiPlD6LEuH/bR9tcBeduSMtTJ+WzCeTyW2
         GRcnk0ff1xpuHpkXWtNoNlIhV5Vu09U1V9TY46/nUBvPYO7qTxJGWVYrk/EEF93iwjVS
         SytPZOUneU185bhGAn7e4lEa9N/hLQ62qfgHrOJIYRnR6G0XJ6oa7HRFKniezQ87+q1e
         uZ5hP6CZ/+eBbeO9FAqY52CDAij2medm6eX8HLjPPped4bjWBkL4GreNk0pRQR+nqfUk
         FHgQNMtRvSUt7yUa5HM0t/b+No6iKkJlCqeNlFpQ/jZp6IDRBhTKKodnT4AiqO5+ni/p
         ErQQ==
X-Forwarded-Encrypted: i=1; AHgh+RptGj8TyWJqRvH0LCKF+ejFhK81xAeFjxBXSbj9foNZnJBFp8nXzOG5c/2Ffs/r//xNv+N+LsrsDGY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1dW32AuBQzLPfMbJBLXmxOVKsvrFcwE5I/KGaazCgdvEiyMT4
	QIUAaSd5VE2PaHxYnDSB7BM0T0JESrjS84vSlrFVhzarCIUGzDYyXDqK
X-Gm-Gg: AR+sD13MJbYAWDwsMSP3UUj1TldtkGzJW1KAA7nJ5kG/3YHqKK2jS34CQu05dbgVZsV
	v04hNYpV79D5KdMzoPLXIgqCnflaEO5x2wAchAoWG81Y/woBmlTAAgGrFu9A01tVGiJFV/rDSkY
	033rq7ux5TSWkUyJAd6W6ouKxxBGwQxTSfeFYmFQNFjveDS/Tf8IOPVm17zTI6Ksc/62pwP5TN6
	VbmxOftXYVnXxk5buI2jrO+747H8pgBj133yc3EXviqrlBYFUbqkHFYSO7G8x/++YVRhC+TPnEA
	fBOBRCIwW3G5ZnTef7IJ1c00lL4BCXL1MuOoNMABdYVf7QeWq/mpqoitOZIBktOOkYH9a3/yTU4
	MVS2p/ZLfW9poAY3oYOnItfzyx85vQrAaQCF6NWzs2hmxRM4WI8jFh5qwohWZGwALIMVun0tPWM
	Eg15euJDqe7SYetDaMVAevVNaAIL5IyTAmg1pJOVruAebolaRs6fds2YhPcU/HJb2uURDOcPc+7
	ik01GgPQJCC5UIbGASRAbfkFacPL4viqjnMu86tX+gVswZ9
X-Received: by 2002:a05:600c:470a:b0:493:f318:3bc6 with SMTP id 5b1f17b1804b1-4995e0df176mr198258835e9.13.1786307509452;
        Sun, 09 Aug 2026 13:31:49 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-20-3-207.retail.telecomitalia.it. [87.20.3.207])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4995e9ea92csm229357065e9.4.2026.08.09.13.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 13:31:48 -0700 (PDT)
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
Subject: [PATCH net-next v12 09/12] net: phylink: add .pcs_link_down PCS OP
Date: Sun,  9 Aug 2026 22:31:06 +0200
Message-ID: <20260809203116.640271-10-ansuelsmth@gmail.com>
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
index 191c902d4008..d64fde37eb2d 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -982,6 +982,12 @@ static void phylink_pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
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
@@ -1687,6 +1693,9 @@ static void phylink_link_down(struct phylink *pl)
 
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

