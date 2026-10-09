Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0748E50AC02
	for <linux-doc@vger.kernel.org>; Fri,  9 Oct 2026 18:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791570560; cv=none; b=bUhDRtDNIlPNliNNG8Xd7jTBaao2GX3B+gw/TgYTkEfDDaESyZ2eYHocQ19GnHPhfM1+VJvJWOIqjI7OOD7qiIcy+XIQS6TDXLOm3fd7LTyKcfF5x0Jw1AbNUvAF0zFDF9M5ORGoV3lu+1FCq1StV+Wh9EYNvVc7h0KqAth6xJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791570560; c=relaxed/simple;
	bh=neO9PGuZ4G7cB5JON6/8adxHlnPNKK85h9GRwbYWdEE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UbRzy4TmQmleIK8hol8OgOfO2FN+5TfpDp4CFNVKf71mGksQpIJaqLWuwbFPErYqrYqnKgkIRP9+ioGtENLAxxQeq45LQarG/Zx2RjEoypE979iktBFz0YaIIri5tF4IaxQeHej9dlsqTRT4BHUOdtl1N3zUxN46ZmajVN7DqX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SBQDedSl; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SBQDedSl"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-487048857f6so85143f8f.3
        for <linux-doc@vger.kernel.org>; Fri, 09 Oct 2026 11:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791570555; x=1792175355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sOA4c9z5sUn9VN7fOpKn/7mWxETsDjWhelJneUehGWw=;
        b=SBQDedSljyyFjBypV+KiiiyFha1SeMeW1ZEKN7qzeEt9/PCb3VCf0ayjzZBuDt2lHE
         oktb4t8v76x2XCLG4rDMPGYPKVBfGiPRSJdFGPC4YF27EXMwk7vU4MXxafDug5gxhj3K
         ivmt6yXaL/eb0YfAzraPkP1P1saO3vbXPJnpNwEAe86ZJX2vjnboIRzUboki+2JW5nIJ
         vWBhaIDfSFcPJSWWkpjBz/CeyNZ8BAX9Tdb+wvWcVwiYYLpTTESPPyWCyxkaESWG7BPa
         j3oLqapHDXqRI5OnWRTUyXPZ9WrllJ0BOpzWwA+kEYCbpUfPWPU8u1x2MERAegPQ7J3N
         PRlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791570555; x=1792175355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=sOA4c9z5sUn9VN7fOpKn/7mWxETsDjWhelJneUehGWw=;
        b=Dx3trC85eKWWpiIGQd2RsG/1E2QnxDw+k96z0/Oo3kPsAQ0s+6lXiKF1jALe6jI8Fa
         hMs4JYnaS+/cj0i5VAsTZGc9Gtlano4zvPzGULit2JcEne8ndH1qDCJXx4gmbBDKS5MF
         jswgcfsPOSpMwDcxBzfwfQCO29avEzS6fAIoWqedsT/g0nqf+G/6kr5cOGOvtdV7IMNn
         66Hb09lD45cs6nR8uH1fZWuFzfrkr5v5eY0skbSUMH7iNpmUH0iTmEFpBaQEWAmjSOqJ
         XhobHeiMH5bg2otAfBpgHefJaxMi4FkFo8xIB9wlBnWAaensNoRUuQqTZYCHCv19USQu
         gJgA==
X-Forwarded-Encrypted: i=1; AKwUvBxhzxOKqxGr+2QeO32reExzI85mOhJhip45MtNGNMfq+oq9txbuoDIAia1oiXV+MGUDiYsMzS0Irkw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJWxCSwMnvGoTVkP2wvPNQ+XNizjqxRU7Xi0LVX6XZ4Wh/NRSxc
	xDccPNbbCmD6fFO/AOif4vT7WgqgElmpTpcHzAvZLv6RIOpgWMN+LV0D
X-Gm-Gg: AYBFou0SF06jAnlQxX+Tpa2D9VC5KcwcnwqbVG2Cl8rFiOe+P0JC4NHoqWmTTLePxWP
	hSiOliqD5FbjPWfL/U1Xtx/2/OfMVhvJjcZN6FeXKOEvvBKdA3X1PcDCZcp05/oIll/ShLVfhBU
	WSaOPvA7NTvJqZUZjUe/dyet0ZXYukjOBcMVDKvuTNp4hSzkrTHm3d9+bjiE625Yrguuiii9lnN
	pfOmDLgpQ5P6TJstXdobu3AmCap84zYdlrhhH/Vu6Syx/dU6W3jvNeDEQjF3eiGGfS4aPe0US59
	maIiKaQ4bk8RtUqChPqRNWrvF0DUbaB1mS7uGrRpujJ+M2W1E/oFLvaQ0jgBPmSUvXpQpJ5iOsY
	3Df9BweT5zYUiZLay0JOft9RzemfG+our7no4egv7FL1QTU4UFgNTzqpADABK3kHZGBdkdxmTOH
	6IegggisYmfT8OIuIgbSBYlSFaB/PGZ+8yDKPducgkSlvgamjldYhNSg+trAxstmmFrQNtfnC4H
	Jf3erz+VH4paiEESWJKstMCpnioOP20M1eFEhdm02ppEMuXv1jpEziklMaCMAvU6QMWwuyC1b2L
	xhfkYO/p0HamDkHcPA==
X-Received: by 2002:a05:6000:46db:b0:48b:e50:7152 with SMTP id ffacd0b85a97d-48dbaae21dcmr3669370f8f.28.1791570555000;
        Fri, 09 Oct 2026 11:29:15 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-213-45-9-252.retail.telecomitalia.it. [213.45.9.252])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48db9adf5e6sm5037794f8f.56.2026.10.09.11.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 11:29:14 -0700 (PDT)
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
	llvm@lists.linux.dev,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: [PATCH net-next v18 08/12] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Fri,  9 Oct 2026 20:28:04 +0200
Message-ID: <20261009182836.50631-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009182836.50631-1-ansuelsmth@gmail.com>
References: <20261009182836.50631-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

List all the files of the Ethernet PCS subsystem and add myself as
maintainer.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 509b35b5a0e7..d8533e36941c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9759,6 +9759,15 @@ F:	include/uapi/linux/if_bridge.h
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

