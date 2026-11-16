Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846889;
	b=XhUa++wnZNmwP9jCm9fuKDaKmvYDUpoKZTqDUyEvwyPYnyE6cAUVtFsEiZ2Kxm+QgIgU
	 VjOdq6aI+poWEwblgLWWqJb3ZckLFOQNaZY9bU4w21KtU9fz1iaGwBeAYwJvI/Kwc9wqC
	 OwKyi5U//WhPAMe28oGnIarpHk8tnp1K6aNDK1eFAnTohkWT3H7zdcTqIrVZPCzUgGJiH
	 fwqPr3Kv7iO4qzoOQ/EOi79a0Hy+S8hx1W/20gIzpYIjyqYEPVKtf31UnIJCdPBSMBaDJ
	 ubrT2U89Z+Fv+DuMvotQ9HJdjw612HUfAfkvUeVZhw2HYcreaAQ02GLj2iUU12bCdlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846889;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qjKCDRRW0uy+VJsmq9DT4GWCaTgDTGwX0iXVy6F0vNY=;
	b=CY1tEH99R4tOaIpfv3zGR0V5AUUCEgMJ3tPr88Ns6iQd+Qk2C6xwZJKKtoojb7/p2NJL
	 lqnjI2Tr2yGKoXPFrjSHieCJHAfZuyAa+pvW/03CrAxnH/D2pe9jYx06cmKLPbZNWPJqn
	 UMNpfQqYEFjlC230r+QDd0hX2mEmo81HfJs8H9UiqpZqgnhqn9vUDkDZm+1dpD7qJrkyB
	 /SoKSnR9rUG26ByVkucAnDAeHNggggx0HcPOhOX0Mk2e8WpdiriVe5v5h7SmqzznJLums
	 yK23nAg80X0ebgiTlABnt6La6dJ6f8HeLXzdkHJ9nd/gQN5z+hx1+uxmezFs1tJOZIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=khscm5EO;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91FD60A2637
	for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 16:34:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C91FD60A2637
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=khscm5EO
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4b467581b98so31893095e9.0
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 08:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794846887; x=1795451687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qjKCDRRW0uy+VJsmq9DT4GWCaTgDTGwX0iXVy6F0vNY=;
        b=khscm5EO2wQ0GmDlIq/x0ONqH6COf/dtb0YR2P1Sz/VD/nyinRdmqw2SvZ4pxGR9bW
         voHoX+GHV2/G5gnrUps/Yt47XjudwHHE1jqjOAwkLZKhFNVavsv0aUjrTvp2S5M3NokH
         PUWiJjSc4HWDZVS4o/vDHG7qRLeBYVNkelMp/moV9fNJl42oVnDvQYB3vlJdqS8hbHpq
         L3z7/8KyTjMascYH8YhvvXubaDS0AM9CN+uZT8lyuq+83xgNg4zi3M5mmWId8pstYJ0H
         x1tS60tDOIZP4viUvemVb1aHqTQk/zvgnELQk0aDt4OR3S/+FarUteduUNKtsdOPeUg4
         i3Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846887; x=1795451687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qjKCDRRW0uy+VJsmq9DT4GWCaTgDTGwX0iXVy6F0vNY=;
        b=wA7kywDawlWcaB4AkY+QCYN33/zg2SklNPj8aszzMCnGz2fxFxEHnBLTHPP0gK+f5D
         oiTzX6FqfW/Ab64Iv90nN0xNVETHWepTqyuZuWSfs270eUQyV8hE5JoVz6dezEwljbom
         xTtICds4H7SG2/y7Oz/lHfDTvDpRv0ehx+t0N9Fk8iaTuwcnFufI5/b6F0Mum0Pe3OIJ
         09dkdg6PW5FOw7i05ilGoOAQvnLT5yLRrtZcWHucApFT/YWDrDkquX6NFuC2j5o5n/tp
         r2+GzyBjZydbM4rliYcfaCemg8r9cBfLCnkQX58F5X9X4Lej3BiaF+reVwlCdpMdBthZ
         KrHA==
X-Forwarded-Encrypted: i=1; AL+hErHSqyxsWS0kxw8DGkXJNI7iIKHUdlDwU9mqO1ujV6NAtTanWiLUgXEAUDG0njqw43aufurLa4fcISg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bX/s4iC22asRZXkQEhTyXPlichkxe+mHhx9V8ohEUg7729Fhq
	fFvOg/Cwy2jRUp/f78KJqc5lgnb9v2zkGmvUzC8W9jxYcDLL3BZw77ZS
X-Gm-Gg: AYBFou2ObGNvWhT43xMRj4ySNa28FYrVkpa1vBWW6X1pdtmM19GWqOJC2EBUdjq8ODE
	JyE1YYAxSNOkdmglFCmuSuz8hWTr9+OoAaX2p3AVk18+zLgabBWZp36RmXTCX0S1wG2AblBoSic
	bPBTB4uVjixSP7iPCfrlPvVr2GYPyXIXTvQZxbPyH6LD0yUNBYT5WYqvB94mvHRrJiDKFKrvt5J
	JtvxJN6hEA1yazZPv3UgyEOY1DODbNVgIQ2EBbe8JzPImh5RpfIxKdp1qWVNHDmKGLI/m3kuQKH
	+6DSIwRP9N9D8H8NoAm5kAIhQ6RTLeppdzuxkn+izHMwdRrA8KuHabW/N/DKFimIb9QpZ2Esvii
	GxCcBuvdbtPMAxtq4+bdkVoY9dgFQQRecV46H0r9Y7jzQ6PGah0om6P1C7bV1go7GDCkfeeOICn
	nmPqrg30KHlAkSNwlmFMLdrnVtcUoGxrniAFUIP+yKsLhwWWCsu7sl+cr7MUITpppMp8WtmnxCY
	Tt0M73HOGH5C64q0xhsxNSzoWxsnTDe0P2fj7EKob5KPg8EaNMSTMdsH3Unmgx9vbQahNSgvji0
	4JtmXV6t5XO1RCJvUaqrlztnIoqJb++IUm4co4uYs8MuxQKj/Upcy93VdFs9BB2vPrd8nOI3RkV
	lIoYUMWI0SiSsFhJTL7lZFzyJZWpK//h6ZQ==
X-Received: by 2002:a05:600c:354a:b0:4a2:18d4:f9e0 with SMTP id 5b1f17b1804b1-4bb55abaedcmr236465685e9.25.1794846887115;
        Mon, 16 Nov 2026 08:34:47 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm23840506f8f.8.2026.11.16.08.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:34:46 -0800 (PST)
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
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v21 12/15] net: phylink: add .pcs_link_down PCS OP
Date: Mon, 16 Nov 2026 17:33:56 +0100
Message-ID: <20261116163412.551438-14-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116163412.551438-1-ansuelsmth@gmail.com>
References: <20261116163412.551438-1-ansuelsmth@gmail.com>
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
index 8768d8220a13..bf1c5188131f 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1142,6 +1142,12 @@ static void phylink_pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
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
@@ -1854,6 +1860,9 @@ static void phylink_link_down(struct phylink *pl)
 
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

