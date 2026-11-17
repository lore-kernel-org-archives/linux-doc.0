Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919213;
	b=4UmGPPEkDOrL1MvZMF/RiAyzPC1ymFJoXHmMcxPEv0JddsQg79Xt0Xy/sIEj6S+YFo2u
	 vWwwCW/YKl++mnt6P7wxau2f3xyEYErmQY0hdfPFWs4yWzVqKMdRxLXLPmJ0H8GFxwZUI
	 ZfzHexts/Wx0uBpxhXPrTCeenUrh1KZQGxdzMtuG9foHKp+siwaQqt4Jjf9HLomJKZz5e
	 AFtkzU+szXttUm0DhTIcGniM87ZbRy4JExluQm4SfOkHyKquH5GpqInZ2F3tm0C6yYXFb
	 X1G/5Em4vXnSr+O1fkbnR7IkGjNquLEiCmtwNsixMnkpzNchwkpSqxdjxdu3ZIDA6VQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919213;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=iqXUKOcy9qCieLizcJg3vkRsvwt8JgXWNmMSevngILY=;
	b=iN6fEXLMLNjbZ1xVlf5sw7GHkK5sxjTiP7bKKMHSAxiEnDiLuoI2j4BQoj5yJ5OrKudW
	 e9AD1VdwCG/GnlT3MOUvI1DLziGAyXywJ39w3Vnx1lTeD3H7bf5vljrP34BWPnWixUOZU
	 Oi0rMQTn1jReQoPWTrSFP1vUCX4psR/D+CTyvB7Lfn4JPVgm+Noe7ZwI7WPy4kkL2Nl3L
	 CYqQ7dylGW3bKTT+sGFblb5lXiUHYxvnbx5W6aU4+AKiCNz5HNKIFsleXRfCt5DlG2b0x
	 HmRkyG9Py3G8AWVSbabuZBGKlOYWUlp15H4X8AhO8OWf+wKx/VR//Qj146jZ5P8sUow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jMyWs6M3;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0FC606A32F
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 12:40:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F0FC606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jMyWs6M3
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so47826945e9.2
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 04:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794919210; x=1795524010; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iqXUKOcy9qCieLizcJg3vkRsvwt8JgXWNmMSevngILY=;
        b=jMyWs6M3HAp/JBLBUeMtu/fMax2mlkF8tJ3C2dxahv//OkxZ0P5ZXLTorHIDJJ9qr4
         WNL7e0OzWViTCRcsA4kwyeIYPlju+NX6Iq3odWCMbZHojlmTPWt128tI7XpDIL8npQnj
         okcXI7b/NWyZJRRjjsOgVdutTOuQWWDov1HPgBwdn+TLqg5bIDBwScw2/QGSj3G3UijY
         T5E+DzRaIqSvuM02/yXX/JaVA49YDHQbjTWUoj2Ek0fuVLq3kL0XuczRElby+xiTEI7W
         dREsx78dGWW5v0uJ0nsAZ77r5VYFhX3ngpDsmL2iinXbOdlMSCRKUeA0j4Dc/1uSSjbj
         aYZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919210; x=1795524010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=iqXUKOcy9qCieLizcJg3vkRsvwt8JgXWNmMSevngILY=;
        b=NBR5y/BndWbk1IXfU+sW7ZAno05U/mBBAxNWm48+tTSNjcmS2CJtxf08aoPlG48V5F
         7QUSV3AfTtrFA6sXURsKAN0EaUL4t42JhnyfIF4VMMy5L/wQTcJez5q1knfjtlnm7tuw
         FgVavi4DmBwaJJWFAHxsb9G5F3o0L1/5kLmBNil2DYlMjipqWnQl8dm++KnerFb0yCdB
         lAefPglr5eHvRVSHr6t6APnsMnObM5MNLoNCPWfRZYjz2xPt80B/zLXpT9uYd2WmCLd3
         hjYqeEIX3Zfy9f97fZRvpr/3MxhyClwzCKRWIuSaGaaw6pWXESKWwzR5CRCD72NYxAHD
         7vXg==
X-Forwarded-Encrypted: i=1; AL+hErFnTStYDYLQiTwikn+dTXQCgl3oehGE7Tz1yh8ZIJhvUXBLmixG3aZRZ77xlYwdGmJVWMP27B75OZI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ipocwE/fGXnw4+PJ5UtCIkodq5WkDT7zw1lLcRmyabAp6zxip
	3IWbY3Xf+80e8fDK853lcVR7Z7AftkLi5qbNot0sCnJFx7il6/R1zeF9
X-Gm-Gg: AYBFou1a7YvYm9tVkYFSgkrNg9ma0MpAJYS118qHovGgmfGWYFKGp0TwoeQ7OtmLroX
	nmYO7o99IUXzUlSoG51okjDPnfQKkxagxsdi4/od6EETgVYO2KzZfa6RzPgrFUi4ebKhJP0/Z2z
	Q2mZy6xGmXiZ0MaJYObKZlggGMLixFFn42QeBiY32uh/BZqCvMnklgeardg/C809FzMNDznHNEy
	suOP/6l0fr3hPIb+YgDzddjF4Asrge6cuCOGCfau5sk07hpXjQ0AvJl4UOQCO2pGK4/F0e//Ur8
	ygTWDDkDLbC2UZ1fbn0VXshL7aX0Pk13o94uydPe2jto1g2K7PPG7zow025VOqUu37vyqoi9aan
	MuKr08Jp5nv8kBNf6ivHkeCnGlcJp4DXShJ8M+SbWzbaih3bgABlWwdGsF/eQXuOd0OSW98O0wK
	Dwfmg5hFTQZEWADtcnCQ2QkOfrsYJluU6m3DDOQ2pbR/6hwN7boUCxTCkk7IlplF8MCMT3zhRpH
	j+08ds6W23eYh/dctGlu12UiGDYUsXnjG6KBQFa6pSC8KdqQbBaBmVKtDzpcHA3v8/F9PJnnalE
	D+YzcsjzFRNHfYVGGmG3D2HwUOV5WqLqdG8Wo6wwLUKiYbVPG4imwrGJE+LvYGdWSRa6isDMos6
	vHQaW0M89hatZDguzFRY0fUlv/PvV0dtwdA==
X-Received: by 2002:a05:600c:474f:b0:4bb:76d6:1f5d with SMTP id 5b1f17b1804b1-4bb76d61fb0mr87328795e9.2.1794919209827;
        Tue, 17 Nov 2026 04:40:09 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb78386902sm73367065e9.1.2026.11.17.04.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:40:09 -0800 (PST)
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
Subject: [PATCH net-next v22 01/15] net: phylink: make PCS phylink instance access RCU protected
Date: Tue, 17 Nov 2026 13:39:41 +0100
Message-ID: <20261117123956.11981-2-ansuelsmth@gmail.com>
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

In the context of phylink_pcs_change(), phylink instance is dereferenced
from the pcs pointer present in the phylink_pcs struct.

There is currently a fragility where this pcs pointer is never set NULL in
phylink_destroy() and would reference invalid memory after phylink instance
is freed.

In this scenario, if a PCS driver calls phylink_pcs_change(), invalid
memory can be dereferenced and phylink_link_changed() is called on freed
memory.

To address this, make the phylink instance saved in phylink_pcs struct RCU
protected and access it under RCU lock.

Also correctly reset the phylink instance pointer on phylink_destroy() and
syncronyze RCU to catch an execution of phylink_pcs_change().

Fixes: 24699cc1ff3e ("net: phylink: add support for PCS link change notifications")
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 17 ++++++++++++++---
 include/linux/phylink.h   |  2 +-
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index e7734e45376c..d9d0ace2042e 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -17,6 +17,7 @@
 #include <linux/phy_link_topology.h>
 #include <linux/phy_port.h>
 #include <linux/phylink.h>
+#include <linux/rcupdate.h>
 #include <linux/rtnetlink.h>
 #include <linux/spinlock.h>
 #include <linux/timer.h>
@@ -1295,10 +1296,10 @@ static void phylink_major_config(struct phylink *pl, bool restart,
 		phylink_pcs_disable(pl->pcs);
 
 		if (pl->pcs)
-			pl->pcs->phylink = NULL;
+			rcu_assign_pointer(pl->pcs->phylink, NULL);
 
 		if (pcs)
-			pcs->phylink = pl;
+			rcu_assign_pointer(pcs->phylink, pl);
 
 		pl->pcs = pcs;
 	}
@@ -2137,6 +2138,11 @@ void phylink_destroy(struct phylink *pl)
 	if (pl->link_gpio)
 		gpiod_put(pl->link_gpio);
 
+	if (pl->pcs) {
+		rcu_assign_pointer(pl->pcs->phylink, NULL);
+		synchronize_rcu();
+	}
+
 	cancel_work_sync(&pl->resolve);
 	kfree(pl);
 }
@@ -2601,10 +2607,15 @@ EXPORT_SYMBOL_GPL(phylink_mac_change);
  */
 void phylink_pcs_change(struct phylink_pcs *pcs, bool up)
 {
-	struct phylink *pl = pcs->phylink;
+	struct phylink *pl;
+
+	rcu_read_lock();
 
+	pl = rcu_dereference(pcs->phylink);
 	if (pl)
 		phylink_link_changed(pl, up, "pcs");
+
+	rcu_read_unlock();
 }
 EXPORT_SYMBOL_GPL(phylink_pcs_change);
 
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 3a88a69882a6..4a0dc6fa8010 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -494,7 +494,7 @@ struct phylink_pcs_ops;
 struct phylink_pcs {
 	DECLARE_PHY_INTERFACE_MASK(supported_interfaces);
 	const struct phylink_pcs_ops *ops;
-	struct phylink *phylink;
+	struct phylink __rcu *phylink;
 	bool poll;
 	bool rxc_always_on;
 };
-- 
2.55.0

