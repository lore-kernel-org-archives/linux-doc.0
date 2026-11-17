Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919234;
	b=RpecECm247rjziAlKQeQYiMkFw42poFSeaeF3659jbUL7kbWzFsZ0BPwXurVX8T/Weyk
	 DB+2ZLHSmalbu74Gsx1adxabrlEWX3MUEXUEoEdeCitU2p6qH8qjYBislLySzpZ3YJJnA
	 3lxl1Lofq2A1DSgv7tRA/64r+Rjz61zFMdQ2PVEE8HWfVe12kxKFtcoohumwgo3Ns3C68
	 N5rIwR6WDdw8wnht2i1mWYygQKFqq63mmizWntNdBC92Hh2Q22N2b57n/YP04Bkl+iJLA
	 JK094vifcj2rAAGK53XZdyIB83KB0Yym1i4+tyWZ9jsfTfIq1ljoQnpTvV6urqrkgwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919234;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qjKCDRRW0uy+VJsmq9DT4GWCaTgDTGwX0iXVy6F0vNY=;
	b=uFfcdY3kPJnkDCI8l+mjOLgv7sRlJpsEyd5aWw75aWoQrSlSh9AcydCnb5s0ND+YPjti
	 HuBGMQLKIVYeQC85gn8Q0Yw+E2CXBc2y+/gYghwg/odIYm2jCOjDVUxNaxvi4WRZ1Z1LW
	 J9morSWBoXjfFehUuAfUN5aNLXm7SJymkrJPIfIlxhb/fG9T+bWBrvJVaSYCm7uV3CJTo
	 +Mb9+ydgs2YwBoVOzhhaaytLOC27y4GMa2vcu1Jgh5RVLjCLBIe2UGhO1bvY4v6DRUSyu
	 B0BV2AM40ycdKNrwtjCiuRz5NAv1fPdZclsSu3JIYvdW6XZRCrHSiPL4x33b0Y7XEbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D+T+Ton5;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399DF606F894
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 12:40:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 399DF606F894
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D+T+Ton5
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so30385225e9.1
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 04:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794919233; x=1795524033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qjKCDRRW0uy+VJsmq9DT4GWCaTgDTGwX0iXVy6F0vNY=;
        b=D+T+Ton5B+ZaF0fbiHnvyY2YntjQx5xv4oo3SRyis9tE9qZYw01uSQxYEk6eBzqhzy
         cvmfcut5vgU5INUgRiH5RWTEHzaaN/BZpoZOJy6AnGwUHp/muijCEb7AEyZdrRWDQz14
         QBkkqwLVyesjQ9KJyCsvkx/EfcM2DZvmPm59Wf9+62sa0lUTIUS4k0NM6y527mu4E1n5
         9pwJTSrCyHZSjzCtEfFHrB6ITA4MDiQNgU6fD+pIbUXh13IswYSZqJmtnJeVUnQw9Az7
         vGsBeSnOJ/5f31saXQSFTzuF9xCrGqsFPaYo5s8aV6bERRNt/SPETP2xP4W8R5xvd3Vs
         6iVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919233; x=1795524033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qjKCDRRW0uy+VJsmq9DT4GWCaTgDTGwX0iXVy6F0vNY=;
        b=t4ngBkb1KE3G1Qf20FZ28q26xu35ybs3nFaCjAEoaFKjt5z+7S3Ob4RBp7FGvdZqqF
         KCDEMyEc6uxkZytMgCkZZDRy+3x2474X0MWpzscSjEJZsMwBKi/Ofc8IRMfvdFkJ8z1d
         L4G2/MUGqG6riCufnfUqln8co55A2x43Cua3Fw71YunTDilBpTC30s2Ihg771WRgG4F7
         x6DsHWxi29UAcW/48IpE8WYj1sloDs3C4thiLyO0wx5Mgbaa/Qq/Y5IpeSjg5y5TW7qU
         xGeRV1ZxhpgtFG1CJPrVhfLRb7NGpSXyBvbkNruvtghsKb4Zends1OQQ/3Okd0TYysmG
         Y71Q==
X-Forwarded-Encrypted: i=1; AL+hErGaTsTvpjQ7dQk4u1jMJxCctg3QqmUtghU82yr3oy9Z/27ecdg09mtrKB85zBiKOP/6D7heXUeImf4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Xr4SVhQlR7hWOAAeT7G+hYSD+OkB2+kjNiPjqyS+goseXqh8H
	z0bPBC8O4jHln3/wFJFjC4XX75EiyeCs7idL7sOcoeuAYKKwj0A+u83g
X-Gm-Gg: AYBFou2TVZubk+xm3zQsZuI/IhfEKPbyFqCbcpOW1TaQYpKl46cJDLBJZ0TqBJuhlmv
	5i7/9dd2BAY2bx3d5VPJbcGOYeAZdykc9QR8jUoEBY+mqhn2+ffdTz+4JTf6zniRa2u2CvNgTuo
	R0rm5VnONHDckPyR59tY88VwVClLkdfVkOpu1A1OiwaPBYlECN93uU0KVqRSA/B3aETbpEnn2kD
	/9Olwa99qgzAk/vpYCU69CvQpPWKe4l6gF9eaTH2Inahfn+qSNyC5dCrzBxgABXk5mQEdUgxvGu
	wDtPnKDM/2+KQRfu5MjgSBzKk0HZCF3KPfHRfzaD92BiYO2yPJoBRyDS2Lmqe5VNx2TA4SZ3uRW
	/mgahxpJWZ5Xc3An8jxx+h50Jndol1CZv5VYtP0NVqgQtUoJJs7prRqXQfEFvYm1Y1fYy6rDYDg
	iYigUeeb+ah55j8xTkjxaBc1dUbDQltRQV73P+1xaKCGs5QhwoygD94rdYIFId/pCk/BP11VTE8
	uGAZBCGFc9jBEZd6Fn3eFxlJ7Ineu6pyvGaIVmiKuxHj0OWrqvIdOsXO6Wp69BfWNc7akEISgit
	jj0oH8mulkyaZeXG7SX4H4z9ok4pLIqvx8B4gBy5xajBYFLxuKh2mBpgDh3LoZzWrM3xd8MDQeY
	FrYPd3URLyGMc1kVY3PS6PnSZ+LVH2Seu/Q==
X-Received: by 2002:a05:600c:3b2a:b0:4ab:c447:49df with SMTP id 5b1f17b1804b1-4bb735ad6dbmr119130585e9.23.1794919232533;
        Tue, 17 Nov 2026 04:40:32 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb78386902sm73367065e9.1.2026.11.17.04.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:40:32 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
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
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
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
Subject: [PATCH net-next v22 12/15] net: phylink: add .pcs_link_down PCS OP
Date: Tue, 17 Nov 2026 13:39:52 +0100
Message-ID: <20261117123956.11981-13-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261117123956.11981-1-ansuelsmth@gmail.com>
References: <20261117123956.11981-1-ansuelsmth@gmail.com>
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

