Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794529978;
	b=tHxN5jp9ENF9FUtCPiv7usTofIxhm6C4Oawq4SLI5TmMMS713i72P2hFxIGQvyBL6324
	 kVOI0FnvnZ8YrkoNORhn4BWUozZlZPovmHT9EPvsELelz3YMEzX2Jvw8ee5xnrEa758tS
	 o8s62bALl5k1eQbt/jn1CWQtImdDdH0q9XbKhB6FcXhgKR489lxoMLsW7c+kYseAG8YK0
	 eijZdQ1exptG9qpPUieU0B0UfebpLJP98r5WKUm06JvmBeslSzdeaUeeMnQ5SZS/ueJNi
	 myM2eavnG2i2TZXntx5gpqJK5+Hwlp/hHA1mG0wUGJc1K3QJ/wogx1kpbuwdFNmrPPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794529978;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=geHgxObFWVvRZemosAYU/Jzp3fHhQwXYyeBLmeYyX4s=;
	b=NKtaBn9ChCU5dRgm3W/mL/NC1WuK4ONalrEmXKnhCKtM+vl9S7LwSo0pmXwon/IXiRcb
	 inp4clQPrfxXDPR9Tz+AyeZB+cScHaood2TEpLnjRAeI0EvpQBhpVWhzMICQapMIHk0JL
	 ZV/4EfifYZ7JnGKKbFLuApsr7HfudbjExkfVB0Cn0JrG9RwnqSfD9K9fAbeqjdXd2ccLU
	 +9IrCBb9GPJBdfz6TjINBk/ep+qifUEn4PSsO6R+qlrfPHwRsyiBqK3ArTbemakQH1Bn6
	 iAXu634Z+UxqADgJdhrpX/L4cOM3fmRMQyS3qt59G6CmjYwbHLWpS+4w/1D4Wfgv9KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GrTJnggR;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B77606C256
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 00:32:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50B77606C256
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GrTJnggR
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-49a92144733so120791f8f.0
        for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 16:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794529977; x=1795134777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=geHgxObFWVvRZemosAYU/Jzp3fHhQwXYyeBLmeYyX4s=;
        b=GrTJnggR5/Vra+g9toBGqmFb+8V9HqTPftyxf4x9DTK+FuD6Qtd6EUde4hy4Axt6wq
         oSAQkU7S9Mk333uC3P/wUgGlh+CTntjRG6HBeKq29sCE9p3cL7T0PvHTv1ZS9LXdTdbP
         t3YiBXe8uNPTyaq56cXLNGx6leql0y367hx22hpGcW+Ndh9oAlWOMFXWE+y8tFXAiIp0
         9V5Q0vryh4eqgzk/KkNYMpyeYgnjl+XQ8v+KouXkc6VLI5DIVA7iuWJQlbegO2kSAcVM
         rfMGlolkLOVr0m7vIlQuOOcakfrER+PsoKPowEkf2VbxRjNuCui2JnwPOhXqHkvdaYk+
         vlkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794529977; x=1795134777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=geHgxObFWVvRZemosAYU/Jzp3fHhQwXYyeBLmeYyX4s=;
        b=LahqPdGZ1qJ1cV6lTs7wmnY/wQqZHzFOrtNC9UuBpfjl6ukK9i5Mjap0MguYflrIb0
         lI74vHJVFl4K3dNcnwhCtrnEECaAmWfBzsNQsm8pB0/JQkZOLCnqGJZrmbQ53L4joShc
         2KPnotO6RRW3R7mhezBODc3JoAzsmMRGB9X0ZP2N/q2N2SGrFvWkuczNacW0Qer6I67r
         5eK/US2QwUcRLkxdk17yZKNyNd9Ri25Hc9cQV4o65SHC2+HJ8BkuAj/tik7GWEE6sIDY
         DA7eqEDHWQ20GnS4BaAAxIKydmOu4epQLaNalfbd5UugB3lfHRAScmPRinCvXx2MpRo1
         nKsw==
X-Forwarded-Encrypted: i=1; AL+hErGXyGfuhFyyI4Amh5H706xpRRHSERNtGBIiqM8up3IVqniXkwnZXdB5R+Q+SBTugfDAeXFkKJXOoek=@vger.kernel.org
X-Gm-Message-State: APuU4Z/FcvuyMW7QCQ/lmspxd/LAwpmXZPozgmH2FQKia8vDeV6vy0mV
	kWOedQdx3SfQMKAsGhFdlamO1+fHvcsd2jQk2PxApDc7hdXvUTWptHeQ
X-Gm-Gg: AYBFou0qCDdtP6mtQHgZuIR6e0QRhfYg9ZFxkP5V3rrONr3TAaiMIojXGBLgHFU3Dnz
	dcmkcioyNdZ7V2ErEeMX07SKi4qKuJJyRLF0uQO2igYPJXy3YQz9IJZVmXk9DmNbQD94ZoM74Jq
	B25JtljSAmjvy2GdSwzS4c0UqS7h87jY5xQElCC6MX1qVv7m7aQK969ILWsj6GrdO2Hmw01zwLb
	PL/I7Png9ARI9FfDTAAygcmMm53kk+qF2tP5Fcr/eP1uK8xJ/h0SGM1eu8Dg+YYt68oRAEwurn9
	F0dnpvzIBYTSiOatqhw+GtNebPe1D2q9L9SsY6QebijfKUHY+G8rsce1VIgbdggM0DAzCF85kk1
	Kqh4laI5gVXXcEV5J/Q1jUGoQ61rIX3Cr3SazDEMDNpypbVaXnIwshhDRkFuxqDmaH+4qC38y9m
	U1XojC/h36UnxaIKwdPMNZ08xSsoWx0S8itXWv0W54NkxCMpmZWaJXVtISXbWBDTSJsC9Kg8J7I
	rU1XDFLSyEO8ZVlg2JapZl7ZU8/IWVXnweENYJdpJcvROvlMu60WkFqj8ahFvHXWqnSXdpl11As
	L6udjkQxsKTiMISx3tDIjC2kqgfBDIzKeRvvWuRcvkmcTL41GFkPOz938BhlcPiMJ1Nry/aYHcd
	z0vP09ukd9waHskG6+POVLOJIJEfMwm2yn/kzeAXSuxqdh/OEsUFO0Q==
X-Received: by 2002:a05:6000:490a:b0:487:1662:cf4c with SMTP id ffacd0b85a97d-49c6dc01394mr2183917f8f.7.1794529976835;
        Thu, 12 Nov 2026 16:32:56 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-212-171-11-167.retail.telecomitalia.it. [212.171.11.167])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm2029768f8f.23.2026.11.12.16.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:32:56 -0800 (PST)
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
Subject: [PATCH net-next v19 11/15] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Fri, 13 Nov 2026 01:32:01 +0100
Message-ID: <20261113003217.197757-12-ansuelsmth@gmail.com>
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

List all the files of the Ethernet PCS subsystem and add myself as
maintainer.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 893b0670a7b6..44c116f6cfd8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10033,6 +10033,15 @@ F:	include/uapi/linux/if_bridge.h
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

