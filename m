Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919232;
	b=CHQkjfnuYPBZzb2PymCwDX4mEL57LKl+e5nPgdSKqJq2Z+E4vKFCkXVVwFRUEUo3y3DX
	 eVixVmYOjYjY/z9ju6oWZb9VqlIbUk3skoAiKxSCf4ylyoq8GD5aRUm4QwSi5Mt3XH1/P
	 vbX2An7tEewrsHZAZxNHoYmZAcycdNbDkX/wWeDOKLYp1RGWd8TkpOyDb+3YW+yVd6YiR
	 6SPwsZzX1zsTROBC8s4TEx196AexTGi5/Tz1UexjeuJ2wPc+IvOsI/S5hj/9fvMDVJW5i
	 VoCGr6TQSHAJhWSWRMUuyCUVSOZSdN9WbwCpgVwY5E3mpgZpUNp+RrTn/fHlnw5Do7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919232;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=T78nEvmP8RTyHYN9q4ooPSC+f+0+Xl/WE0BGeWSTHkM=;
	b=zqqZOjXw/3YFdCYECGeVkDjeKBn5ufPAaFCldtjuIV3z1rS2IpRu/Cn6SYjPwTTcTU/J
	 g3E8dYb8Vh9X4BI+J0BqaDhtKs0tMJzXaqeT6KMTYV+V4CyxAnGOqub+0Eg9E0JqrS9xJ
	 k+GLYkjNyUtTDCSunAiOw5EOuV/yYIxRVjc+NETkrBHm/jG6F+VUN4p8DFCsbXatuUiZW
	 TSibuc9mi9t56Anh90lx3Ez+HyZH2+7N9pgnFrGv5pLUyg/fxbP7fEHbQb1iWKO3+aukl
	 K5I0GDLiAL3+guCuxzXMUCx+SwBIVVOHqxKSOukyM9MBIzObS948LdNURDE8dYz2Jfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mcxx8hub;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F06D606A8A6
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 12:40:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F06D606A8A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mcxx8hub
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so35627985e9.0
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 04:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794919231; x=1795524031; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=T78nEvmP8RTyHYN9q4ooPSC+f+0+Xl/WE0BGeWSTHkM=;
        b=Mcxx8hubRiGTRxjKYFnIkSuk8Qjz/YepIITSFGaoBDnrueKoUwvb8bdQqSsWdDqO3h
         BYpDduC83/yUmYurELWKjjcNFuGygXph2KnOvlDVfsBYn1M3MY9XvMwrK9t0VODnpKFD
         XDW8keofNMMQTFt7ouJLEpcVUo/Dekwl1zqziqcTClZx7PQfmee5tqf6qT/FYkes8AkR
         l9U4HJTr1EhobnWrmYO3tR3sX1/DUDOn4GQFU0iywt+BSGJHutOaPMFVu4lwRCJeSSnE
         OkurMitNrpvSdhNi0YbJzKCgPeRB7OcsWb2WHPrQxoZdJc2NM6T8aLWi879t8sFhFl/M
         Sx4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919231; x=1795524031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=T78nEvmP8RTyHYN9q4ooPSC+f+0+Xl/WE0BGeWSTHkM=;
        b=KV7ANdCpYGbOtC1187U76WQe8UzLUZv7Ec5dVZCx5mW4Mc3F4JDYW0tEiYa2a4HbJ8
         cP3xTl2Wc401LPwUdevQl+zwAvrOIVkXmJnYm2jLhe4OQX2lrMa2CXaxLmeKtoyvwC3W
         mN4DlZta3SA9z+rxKAqf8ICPe9VydF66Yi4nzA47SeZXHbE/p7f8Oencn3yoQyMSS4bV
         Pq4dHM+GOO8+lwu6xWRrxi8Xx/CGwzFElb0/m9GwSPcsTa6G6tQhTKeeDj6aI1GMmkwr
         f3XRhugCAunGP3z9UV/mjje1X57jFg+kmzyF2Ni05x5twfCIcUCTNq0uytcidafsOKVT
         3KxQ==
X-Forwarded-Encrypted: i=1; AL+hErEL2AgiNgk2iGzevDOt5aAvwkIPON1CsmE+ytIypoYagbZFjdTuNOCPcXN68sMQaDQ/jnWMVOPBsQ4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/cWLVn8VKMxPnUMzG6D3ifaHfGvLnBFWmfWidCWnqji+Oyr2F/
	1SUOBe9ypluG3f9r6GaPOQoUXPGXqlsr/kocQ6RJWMRuUdl/ASwLIn72
X-Gm-Gg: AYBFou00IRfIH9Dkit9ulDLaWH5he/+FKL6Gm20cRV6koKpy4khgL0ABkGI9UmPY2dC
	MspJFWYbiaqv1UJMDuGM/2OZz8eiMHPMTE5l94d3aAacQ9NYc7W92X1L70ehRrgcuVja/SOD41O
	NywFYj83af/XV8ACc+O/FUNGyOR24Ysb8tzEGbX7dUmHm7+uHUnlMtRjnLsT+30sPRl6w1Gbhm4
	KlOG+PjWiG9toFaljSh9vytXJ+ZfJYK09DlLQFpj8s2iC55BureTdF7/Gvlsu3qNiV9wEwJNYcM
	oCPKsZBFD8lEVisbD2XoVSYwnX6Oui3ywgduSQaufH677nWh9rn202R4tkuRDcG7zPEaT90muqT
	+0Rtw/z04PXL0LAI9RlCs8vugoqqjd42qpZre/TQJP1iJOrPzxF5SdRFZ10BIiPnrcchyUNw9x5
	obISo4W+6XO2JfOiLaUSuzM+p/aTmp+VY1A0bb0Xfwr/QWB8RydXdH5rlEgDw+bUYDP5+0/71iP
	k1PMQF1EaPOZkHtW60cwPFTTyGV+6EWTnldW56mnrFvltkzZllNRUNPuGkai5pgmnu/k8mJDCh7
	Nw27Lv+3bDhlspHnEn3GUw6C8XtyWNRQuk1L1ByqjCvvMh1QAdI4+CwrjaBvCMuTcsGexk4ezs1
	aCJ0r7i9CACn6BH20jTp36TOSVb3mR63JzQ==
X-Received: by 2002:a05:600c:c4a2:b0:4bb:7581:2bb9 with SMTP id 5b1f17b1804b1-4bb75812c05mr102919215e9.22.1794919230626;
        Tue, 17 Nov 2026 04:40:30 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb78386902sm73367065e9.1.2026.11.17.04.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:40:30 -0800 (PST)
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
Subject: [PATCH net-next v22 11/15] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Tue, 17 Nov 2026 13:39:51 +0100
Message-ID: <20261117123956.11981-12-ansuelsmth@gmail.com>
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

List all the files of the Ethernet PCS subsystem and add myself as
maintainer.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 32e218c0fe68..ccd2d04c5a07 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10034,6 +10034,15 @@ F:	include/uapi/linux/if_bridge.h
 F:	include/linux/netfilter_bridge/
 F:	net/bridge/
 
+ETHERNET PCS SUBSYSTEM
+M:	Christian Marangi <ansuelsmth@gmail.com>
+L:	netdev@vger.kernel.org
+S:	Maintained
+F:	Documentation/networking/pcs.rst
+F:	drivers/net/pcs/pcs.c
+F:	include/linux/pcs/pcs-provider.h
+F:	include/linux/pcs/pcs.h
+
 ETHERNET PHY LIBRARY
 M:	Andrew Lunn <andrew@lunn.ch>
 M:	Heiner Kallweit <hkallweit1@gmail.com>
-- 
2.55.0

