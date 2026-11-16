Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846865;
	b=YfxqgQ/hW17SXecx0JQf5WpdnChn3+ePPqVDCDEY41sCwCvqeHPmxadPanlOS73aSYhu
	 eqnYt0RA078nH+Fq7rJSspnux3vQsYT+ABLTS477OdRYzIzLyfDRLUWTKzexTr9Um9Zho
	 rBtzOHXI2gdDxJ6QO3t9gmh7q4EIpg4NnrKZ6i1lRAs97Nr9+hVWvWrygNZbeiLqjv/5q
	 hmMMvxi1xVVyrf0TpB8msYC+huV9hHBoxX5+ehwa9ZzS4W0p784zmLRLQ3HY0T3vi8hhi
	 5ROdHZryOo7bHQHrnZ/hivqXZ35Kd01OaLfRFS0Qd+aBxRXaUYE6PXSP9O0rUu2m20A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846865;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=iqXUKOcy9qCieLizcJg3vkRsvwt8JgXWNmMSevngILY=;
	b=CjmnKBkcyB5lCyBpoR0+WuJPbDB3HTmK5fw+f13X7pfksizN+0+d7M/qZz8lGy5XM/ix
	 sK25egwdD35gM1MAUbCsSp8OEFr8S4DZInPaA5o/SMhQCXgmsBdDdiKbcFyHzikiURgmd
	 bFps/vlqPKlaE/WpdgPssgo2YG31o6SC00i6QHqwgp/6ostAhPSBSz5yGDrTesUgtEq6T
	 eOKuNvRf3wX+LMR7LShmGXr/f6V9ELikQE2r2V50UF0acqfZbKa3q14ajizD2Xu5A8kw3
	 COvOgmDLFyMce7ZlCCMvYD/vnxnDrWxVQZaqVZj9268kvRkLyKYB14op3tHuS1GXJKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y8PZobkT;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E40606A884
	for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 16:34:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39E40606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y8PZobkT
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4a32576da88so118033f8f.3
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 08:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794846864; x=1795451664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iqXUKOcy9qCieLizcJg3vkRsvwt8JgXWNmMSevngILY=;
        b=y8PZobkTNSe286sthC9hFeEIYis8FpFW7RElSVsmvEjhLIk5rhlvTHbYfHMdZSs27S
         G+EV170+v9GwVuAl51fLoVMULj9D/mL1FN/R3uLdFFKrt8OYYE/QgPCyxDX/7Q3cLjX8
         ybxq3kVQQolmAIu1eU59Sfwi/A6iIdaIcJ3zkQcFWLKKh+3V9002Ut1jI04cOgijC212
         U7zvppPtoHWr9awCEu1AnUCfDh0YXi5Xo5HlgaOZc3/2XVnaXZ4vYbnIGTmCoC7w25fM
         XMOpS+GBZxvJWJQ8GYM1GRZeRRhNGO9Q9KQkdLJ2j56Er3jHA2BVxaxVIoNYniRGzlD+
         v4wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846864; x=1795451664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=iqXUKOcy9qCieLizcJg3vkRsvwt8JgXWNmMSevngILY=;
        b=L2DfgrPpT2Kke9MIJrUsfrAl0crzNhY3SYFNCe39ZTLUa6UkjqucLHziei2rTWJUar
         2PnBg6Amtia2ayP2G3GGWwI5hD3Fh0IO7oOwIMENhbfpj5VUVzmTTufXUQuYpajuqyVT
         PiP+PX2VSH4GaOCqB0vBVmbX9/RIteLiNljtzuWTZ7YlhP2T0yMmvCSGCRREIGeYcYux
         n+MBKvjS6JxsShJjvEXtSpn72SVwr6lXAhMazU8dDNWueH6PNCk9a+TA/MZOF9Bpqe8U
         OEuzT8vyvc+JdkyeNoR++zj7DMdXOvev29sf4lNlYnsWGDf77FDoPy2Uysu8YAwcsJ0l
         FgQg==
X-Forwarded-Encrypted: i=1; AL+hErE84XUZ+RPkevHoSHA4jvFrt/tvSaHae9MnK03hMW4eCGu8zdI+f67lic3qFf77Z4+uQ1YnPCPVNi8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9eoSu6ie4dNMbRJv7PhlwM/jE4YsMY3wPwYE3vS1J1/J4SMbgm
	r+Eh1uWnhBy6daERgs3rHtumOdE9BBsDC+eGxPCuUIjtaYD7+4kqJ4Bs
X-Gm-Gg: AZFdTZeX4LMPdI5DYYAQSk2ex4JQBC7nqXYGeJ86KGdFzCUXMn7u1KS4Sivqs1Xf+ff
	/z4H80kMiQrhaFOPD5hlGl+vXpvpzWxNVOyvYWhn9in6lqT3/BctjCajV4lcwOgOVIJc9VlY6Ck
	8dEPl1It/PNkRD1LG+GP0CkkSMz6qSKEv5r250UB9+XhVo/cEcBWct8A28XO3F7G4STKMNTgCNZ
	IH2eWy9cWEeiK6QKoDcfnOxNsM8j/0vlrYWwnDy+sMvcvI91WZc/IJstx7gBtj/S0q1UbVjuqxU
	XUQ/XUTJw9oRKVtz+I0K4VZmqnLHPda6ClYGGsN1nfdfwlwEq6WybqM3zhDLgOzNbXulph+ocjS
	iO+QJ/AZDi/lVpiwDOVvIzEdms7VU5E7LrWTwU6BP5k2DJM91wghu1mLXGQ4QMqel2Ky9TCdKJe
	q0k2RYAU7A5ZkUVeJ4T+DgFPVKPqFBapRM+GT43gVzfyes0lngGRAs6ey9LUbrW21JKvTV/6ZGZ
	sbif7XCvI5qebB1K6Pa9OlcWAXI+uW/5DWOGX7/gMkCqPXnCwNp7IXuCX2/9a3e5FyM67vUiuGG
	hHSDvt20IR7NBwRcSqRo1Ka9j3SnO6I28563xSinTGaOADHhR0ughb76gfdQyYgMgdjolLamVs/
	E0r1rFlr9rW8kTSa15/5NtI4AfaBxDZospWWGQU7ZHBjZN0Uf6SrEJSA=
X-Received: by 2002:a5d:59ca:0:b0:487:13f:f612 with SMTP id ffacd0b85a97d-49c723fb77dmr22962598f8f.37.1794846863544;
        Mon, 16 Nov 2026 08:34:23 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm23840506f8f.8.2026.11.16.08.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:34:22 -0800 (PST)
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
Subject: [PATCH net-next v21 01/15] net: phylink: make PCS phylink instance access RCU protected
Date: Mon, 16 Nov 2026 17:33:44 +0100
Message-ID: <20261116163412.551438-2-ansuelsmth@gmail.com>
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

