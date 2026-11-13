Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794529952;
	b=Zxm08CvtuFmWQhfn+9tJ2u+Ij6SjDXL7L0fxHOhDfqhE0/90Z8Tdsblv9pfmr5ZvIA9m
	 ey+JAUzxzOYdNmBkYi6dH6u1g/DmTwnGLK9OREr/SXL+3atMRpE2Q50ZT0TjCa1wNZhsX
	 ofv24RQ+bD/pPofhk0GbQHYL1CFv1CCSUmQRT7QrfBIKk+c7LIOoJIvGJQsoDG77nl7cP
	 zyE8zaBbe1d/u8eblTumA/TxCVJCfBL6Qd39No8noLkHVB9TbXUnUCsorgyZNf1PXjyiE
	 TZmCd/LbAUglUWRHEZ+TqRAua96IQ+Zd3+YUFyUCbOqCQGhCW99MAEeNiT7fHHzu4nA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794529952;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GSzexzY3tNd8fGcKsjnU3nRndcIeboSpFV5OISlu3o8=;
	b=xODqLiXVWSi6icmP2Gr6NsHPKnIMv83nduXNIB9DSxveshEFx6Mb8865grQS5uM5sko9
	 4vx26U0LO/3PcypNQgmJS8fbPvJdh0Fl++/GChVn1UtjcpYaKSR30OAnO7tRcP+yKjkfu
	 bJA6nfpWShml2gEtu0UGOIE2IztHe8VpxIMasvSJZzMeE+U5dLskQgrMBiOAK+wUITvtT
	 2DLGhsAxDXTGAxjp/xcaSeplluC+7iVZFkxtLDGr7upBHPWz9IaZo2eo3iL/cr/bj0VBc
	 iUGFTaVfBbDv6obbvtmg5tkflgD1OlWkfSFp35e6RwuhWedF0m+cebJZHPiQvfiAKtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gjqnet9W;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D190606A333
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 00:32:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D190606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gjqnet9W
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-498f5fa5103so133000f8f.2
        for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 16:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794529951; x=1795134751; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GSzexzY3tNd8fGcKsjnU3nRndcIeboSpFV5OISlu3o8=;
        b=Gjqnet9WN/sbUEJTf6Vdlds3Seb7eZti22TD54FtT9971cn/+vOENE35r436ZJ2bbX
         AzkE5RhFryOsnMyYBTQLnJTfLHWJEat8uLl0CCJWiJ5T/Hm1qd/5zapsSDAvMY3+IC+8
         06Tez2QayRutopxficRWi9AH84UgkQnYOPz7vGrKaVYq2Toe2Ctc60M6tRpw8j4bN5m/
         1cf6XKUlVcQLQ7U6f1kxNT0S/weW/nDOcb3gdEj31WqHqgNItWhCFh5wauHF5CsNOa8y
         6VTfCUEQKGABAqUd785EbScZjgj5xZo+r9uUmBe1YpXDVNgjKGbfaiRJX+H7Agw65HWd
         u9JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794529951; x=1795134751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GSzexzY3tNd8fGcKsjnU3nRndcIeboSpFV5OISlu3o8=;
        b=Bpd7Dvj8dCSrU0bvxtBh26Gjhvu6J59RQQU8T2q4vnZkoJ9BUmeNDqW8LbPZKQYOYU
         8TfTKVm5UALJd4LsFLx0UY0NqGIIgL6jfhkK2637oQBgMsJndZSHCMkT6xI8O0M9VmCf
         rd9J7RWeyeCsLoRDU0u5fyz+YlkwaVwgJXAUS+Uex0PRxH2MmU6uSP7gox1KHRd8KD49
         nmgk0ov6E4axd+yAhyMs/45G9kroQr2H1seiUn6AeT10cJ8Fme0uN2hhH0ljmyZFFUQ5
         elXkSY1bLR7uK/OmSDmsG83nvUJKkqLuI01Uo8DnLDjeVMlcgoKB0vJJCCGBuBSDM/j5
         SISw==
X-Forwarded-Encrypted: i=1; AL+hErHXp3mAIGqiFYjOEmTIPWaUVN6EdtjwS6aBdYv+9gS9607Gogb0QqV/EYaAFpOgPnH+1GE8JnUXbm4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8upPWEYQS8tbC7CEkhWKFZ4FlTaR9Q6m9hCtM3ozbfe/jzsZC4
	Mp1FS9NXKHwI7tqp1JMR0D3OrxbCavzVDSUopAyhyrRaINvyM51W8/gg
X-Gm-Gg: AYBFou2+QbsNcLT33TYhrX59O2nOzi94Wu78LkCe89xgXPvHaBrk0uCMMVqpshr5TTa
	eGSRgKDyTikujkHzjTAQietHCieCVjH8IkqRnA2qy7GlYrzE1ImyHs+564QnZOPcTLnZoDYMLyi
	mSI8JF7PoE/AFcjbWWiiOyJyg4BtLU55zqbIVczipt7VSBv44Y20LSelOA0htRUwLIIFaOl9FnF
	2EbiDjQe//ESlBmsa1gd/Od3bc3l9CXgwNY+AhDMxi6f+nbrlurxJA64hq7JvUrnzUjk4ywMpxC
	6GaX64H5NqGzrZNgtCg1CRdY+tHaJry+pMI6Arggr9/LosVPtaNVrAjntS5xfr3dLG8ZYHxtXkc
	7wvCbve5WWoG9aHnaiRq/i1GtrhcjpAS66ewjzN/6HqNm8fFU3aZiv3I5jvsD/Fp12hzOR7OP3d
	qD6lRGBIf1IUmdbXo1LBeUy6BYPP9Z6XZhAA4NE3iidJEO9dJRCcsQxG7aG4k1N1N/Twn7jO4NT
	m04ZPPsDniuf0BJyjZ0S620oJ6acbpokTNoNh6qocSyYtmQYJPbDg4knR88kCbumr/z6OOgEI58
	mfbBJGDCwZszsNvKnvL5ii8JmjNLhNhoIElgPTlbL2RoAIMMnpWJzTzSbrsLwl4VNWdDHzob22l
	qLoH1jgYP3vyKOs6vY3cNfcLBiqJPQrRoFpDmcjor5an1NYwLiiCLsA==
X-Received: by 2002:a05:6000:402c:b0:491:4e13:fde3 with SMTP id ffacd0b85a97d-49c712ac654mr2019766f8f.13.1794529950823;
        Thu, 12 Nov 2026 16:32:30 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-212-171-11-167.retail.telecomitalia.it. [212.171.11.167])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm2029768f8f.23.2026.11.12.16.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:32:29 -0800 (PST)
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
Subject: [PATCH net-next v19 02/15] net: phylink: make PCS phylink instance access RCU protected
Date: Fri, 13 Nov 2026 01:31:52 +0100
Message-ID: <20261113003217.197757-3-ansuelsmth@gmail.com>
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

In the context of phylink_pcs_change(), phylink instance is dereferenced
from the pcs pointer present in the phylink_pcs struct.

There is currently a fragility where this pcs pointer is never set NULL in
phylink_destroy() and would reference invalid memory after phylink instance
is freed.

In this scenario, if a PCS driver calls phylink_pcs_change(), invalid memory
can be dereferenced and phylink_link_changed() is called on freed memory.

To address this, make the phylink instance saved in phylink_pcs struct RCU
protected and access it under RCU lock.

Also correctly reset the phylink instance pointer on phylink_destroy() and
syncronyze RCU to catch an execution of phylink_pcs_change().

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 17 ++++++++++++++---
 include/linux/phylink.h   |  2 +-
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 5d649903be9e..83620a120f18 100644
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
@@ -1300,10 +1301,10 @@ static void phylink_major_config(struct phylink *pl, bool restart,
 		phylink_pcs_disable(pl->pcs);
 
 		if (pl->pcs)
-			pl->pcs->phylink = NULL;
+			rcu_assign_pointer(pcs->phylink, NULL);
 
 		if (pcs)
-			pcs->phylink = pl;
+			rcu_assign_pointer(pcs->phylink, pl);
 
 		pl->pcs = pcs;
 	}
@@ -2145,6 +2146,11 @@ void phylink_destroy(struct phylink *pl)
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
@@ -2609,10 +2615,15 @@ EXPORT_SYMBOL_GPL(phylink_mac_change);
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

