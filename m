Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82FC408602
	for <linux-doc@vger.kernel.org>; Thu, 30 Jul 2026 10:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785407116; cv=none; b=Oie8ivb6dUpp37/Q9DcTvEd6Z8ykzXNIgzNkiAuWIcbgu92blel8XZJPiI8EBPmhUS9mLziFM7uC3Mnf22RfVO5IbLYzVgLTJNAa/MxNOEdP/wUlpyN7dFhOofo921KO5VBinqYCsaHDUcnvWoVw7WNOgP7O1oNkvnuW1+91X7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785407116; c=relaxed/simple;
	bh=cGQiwLSUELO0BNhj/eBwOu4S6pqC+JNa5ROeFabH6JA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y5izP7sa+bnta3cjyNgKRrPC/x10Z9IbcyHqh1IZbM1kQGrpHByF9QmCV6ZpCCkYbzcagRxmuTN84N1Ew6qeMrpnExrrTbogDxzFWd9Fb4SJhi5j9U0NEhPxl3ARmrlXMEaiQtIYVEHnbgTnUqk6NTe3S1feR8t/nGbv8V6B3SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mORI/7ue; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mORI/7ue"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so18926395e9.2
        for <linux-doc@vger.kernel.org>; Thu, 30 Jul 2026 03:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785407111; x=1786011911; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IidZjb6Sk1gCBpTKPlKzd/sIpZV6ZnvffkT6vIVNonY=;
        b=mORI/7ueAY1diC/bzXyFYdlU4vYtmL9Tpg/SaQRlFH+cstNHYGw7Cj+D4mf/e+xvvs
         ZY/URyKYx8+Z+z2KSxQ0cbYpOSxDdVCZI2hParrCAg9SmvMd6bxnFKvd9rov7s+iQQ6E
         jXAAca32j60NsED1Ay+Zcvy2NlccorwOuEO+fInhANV/nbjeke9uQIQtbTZRlpxbv11k
         q4OawRjnN4tbd4JEOzzBoozmaRDW06ehEdK5sQ00xNRjabJZqznfZh3MFk6jYrSO5gHX
         LTMBcazIhURIs2hUdiqDGHpOyZPalGnnkX4tcEAvh4cFWDiqj1lcURy2hR2Y1uJ5naKj
         ZJKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785407111; x=1786011911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=IidZjb6Sk1gCBpTKPlKzd/sIpZV6ZnvffkT6vIVNonY=;
        b=YYhy+nz9FF0MuLhAbtW+eOLEUFD0UGm2BLDbysrozFCcIrTphBVoK+DevQ5Tj43m6a
         wsI3fv0DA5QNFlKI4dpeBV3AIa5+c/wjEthMVlcCI2cq6hU7m0VMw3ckB12J6cgZBip0
         R2HyrQ4t4YQ4oDPylsB4pEKEi7jgylSKExUXnhSYnmHeRzjLZGo9/TABEjzVCrbM9FjZ
         OeO9Nj6QnCNa5uKE5gycPsehIDFQumKUW+BcqPVtVuERohCVPLgc7mTH3m19ikiyiEfN
         Vhnj5BtzT5wmtEKbdSHPYb3nnra78RRw3vJzgaZ51J52fOkWft6mwwS7uuWPVXESwCwE
         GqlA==
X-Forwarded-Encrypted: i=1; AHgh+RqXfhRn9ID6i4SPPGrsrKuJY/9KVT6rgxB+AoHd+tcn1mqyGImTPrbaVHPiAGS8FQ946RIVM/mUp9c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEFUPq4VJEUci2RRFXAYZ4SKstUlpxLZRB5WM/Srk8FqYzToH4
	5dpJSc8NSxOV0OOjesNj2Gmyl9TT0e5g2ccpzwkNDJxtuXgFmNpT1AtR
X-Gm-Gg: AR+sD11fTpDYUJcAPv8W5qzmUlUtF6TgWTwnx4C2cbEfkU4IAbSa9f/CgNMwqxOUvST
	zhyx/Q2K9evGd72vXsP75NEer0NPNrTIcrLDISS6VCzRoYC5M36H3+Z2/5D25BbCS1equwgL9ma
	NuVygS2KRQoyjoP4+5clF5oHYEnCBzeZf8WO7KR0JVRCza96FkpW8fix3P3PNhYnF2/cffOty/z
	nWYnZNV5Z28K6nRdSMACOLjfNSQS9N8EUS67ArEmi0dwRvR01MjZnL1TZ4ZmdA8svXXI//UAysm
	7yaSVQGtUQMap+g0FMDh1utXAHve9YeznAdnLeMcwIJWupaS/1tKHLsfGIQEmA5DVLluKOp+v0B
	ofs5ApLpCUjVAODBFMLUnv3tEdeUA+OMFj+/khYp+1j5r59g0su6LhMYizrjqPGZbqUaaTGtLTf
	MdTdufCT0kxPaRiuFSE6uMK8DzZo5DJI4uju8Pp6tKRnmzE3Pe0qCwaZ4BcEE6fGkFBcPT1oBuP
	LxK2G5w+uSM1cFLr26/vl/Yk67aoAsxBDBv5Hh4Fs3aNUVFmgK5kA==
X-Received: by 2002:a05:600c:4fcc:b0:493:c773:c3f4 with SMTP id 5b1f17b1804b1-49800ea1af7mr28621295e9.22.1785407110623;
        Thu, 30 Jul 2026 03:25:10 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-11-254-126.retail.telecomitalia.it. [87.11.254.126])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-498011fd5fesm44720295e9.7.2026.07.30.03.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 03:25:10 -0700 (PDT)
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
Subject: [PATCH net-next v10 07/11] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Thu, 30 Jul 2026 12:24:18 +0200
Message-ID: <20260730102444.1967900-8-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260730102444.1967900-1-ansuelsmth@gmail.com>
References: <20260730102444.1967900-1-ansuelsmth@gmail.com>
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
index 3d17b7b143c4..3ea995241522 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9697,6 +9697,15 @@ F:	include/uapi/linux/if_bridge.h
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
2.53.0

