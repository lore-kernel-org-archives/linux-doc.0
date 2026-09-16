Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4527D51357C
	for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 23:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789602764; cv=none; b=kcPav5Z5sGL63eVW/gpgV5TIEmX4E+u+KpftShqtPCXFAqhGkcUeUNSvYFOZCGJ8RtThJc9rYwabvXHJ0d++Gw6iWc3DieVFwNlLer50AeghVy3swe9uSxkVzSTJS18rrBUg4Yp8SA5hnx/eCuKDaHyoJJt1ncKzXd+pW7A/uqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789602764; c=relaxed/simple;
	bh=cXFXLP+NjYWZtJpQfz+KEsHtZfam6Old8yzjXsddKto=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rbrgTfhfE/x2GDILs06Q47xH4NUcotD0vh4wRRQKcGL3COVafrS72AuC4s46Jqy4fgGRTkLZR/sYZPBdOQ20InvAXfQl2XILG8RwmYXp5V94A1z5AMxEkzUYdXeJyuRbRxx1w5z4Aud94kpscaCUgK7Edc5vpjRjLHfUJKTO5f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z7VeK/o0; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z7VeK/o0"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485ac898fa4so194788f8f.0
        for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 16:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789602755; x=1790207555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tmAu67PdIVI7V1UutpEDvX/bujznCInbK+OAzRMwn/o=;
        b=Z7VeK/o0Hki/LXVrrrkPm/toPwU7WsGonTfv71e2ZZEVViHfelDod8elIyMqGb1i6U
         Jc1ohu8eXp7kqtxUVnfBQCk+ezruz2pUNSnmlxEJOFb4nHjeBmRb4c4Qp22H1Lg2Io2M
         nSePr300R9xCT2UkvCKEf9QXidhYYMrQmgCMB9wUg4Qm3OAL6Y5W1krCb0g0A+3djSvw
         IXD3/tOpxrVx6MZWt0pknH1vFRiCzpNK5KQIosnFuph1i8YUJQAMPx1BKVJLXEW4Y9gT
         vWxnWflnLlZE/bShebjbC91EyVYUHSfccBkPUCl80FfvzoeuJL5UCtb7Yx5fjYyo7kjS
         Sk4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789602755; x=1790207555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tmAu67PdIVI7V1UutpEDvX/bujznCInbK+OAzRMwn/o=;
        b=cqiExxoAO+l6M+ILK8DZzOGHwYoVbw/J5F7m25x5+tAiLaZEsjoiSLInYU/IBaEbKS
         KIMX5q5pJkoJSTt6dkUfk3f+Mlyt0+u7C2kBsH/XV1AYCn5sc209IszOzgi0Du1QrlzX
         12htMwDMet9dCVCjy6ApTzrg5lBaN4rVGnqJy+ilTDYo9KDvAyzWCtc7DBgZyv9m9I8a
         wkVWXRP9lyGbyS545MRI3nTaHxDREXFxRLrZ0pgnCJ1JJvzyTfFzQvbaNyZeYbvV/EwA
         yNi9/B8FiS29SEHC9e3uDqqvcla4+ezxCte8WxxgpcVZCB81D5zWAB3tLldJoSG8Ro0n
         +icQ==
X-Forwarded-Encrypted: i=1; AKwUvBylTTmhslSvXHFlneOq9naxd1Gz29BhrdoP0Bt51ko6TMY9uOIOs8bIsaIE/o7UnAo112btx1vy9H0=@vger.kernel.org
X-Gm-Message-State: AFuF++kqrpzDwyL1fnNBQTBLAPLqCzzAiVLCkYXm4LYWkBg+ig4R/obf
	u/srIhqRXUyUgOo3dWFeO5fl8w0IdwaWMAZxRTGjnAKj8Wh5p4YpZWpE
X-Gm-Gg: AYBFou3KToWd/SJayEVZgkjiPORyEiOfMu8AlBc9TG/yPbsCcwdQ9IJFd/Ds5WA/GhR
	gx+cDgaA2Ws7a52tHl01CK6a0kkCkoDhRDRuwyhHzRcw0KDHuU7CbvpROjqLx9Aa1caP7TvPJVb
	+Qge4F3Sb3Lq4PC9Xb2Vt+7JpTpesRMuPBwEts6j5/XBIPYHzhIB8Cn4gyv95TM33q0YTZ8Cr8S
	uO2LingGvUHyi5PepQZ/y9aN3myP8gX4vAAVc99Drt+0TG7Hlj/n8dRTEN410jAkUVH/On3Gwu9
	mePk6EoqSlNq2mfVRbks74cRY9gND6mvgvl/NET1iKa6TJoKic45HZuZXX92IT+3l7l2eyKtJQY
	NXNMP+CeK+4jvdZaM6YFv3voBKjNQlHYjP/TYGE/iVECa3BwLOr0xr6r2ORr82d0whpIzdtri5y
	GBuWBuPVr3O6VQoJU5UW0oTwBtTH91ibFDx1eW6T8hr7aYRKHKdAmGoxsEQseihZw+Xe+dUMwAG
	nX6RzT8UG/qCV54hpp9DtxeJfRA79u+BR9kKyIhzdGxXVT09nOBZwkn/IWCksg=
X-Received: by 2002:a05:6000:2304:b0:487:b32:9d6f with SMTP id ffacd0b85a97d-4870cf25729mr5407208f8f.22.1789602754931;
        Wed, 16 Sep 2026 16:52:34 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4870bef7687sm11861104f8f.1.2026.09.16.16.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 16:52:33 -0700 (PDT)
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
Subject: [PATCH net-next v16 08/12] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Thu, 17 Sep 2026 01:51:34 +0200
Message-ID: <20260916235200.20712-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916235200.20712-1-ansuelsmth@gmail.com>
References: <20260916235200.20712-1-ansuelsmth@gmail.com>
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
index 0e04d92d1b09..35e20ddd018b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9755,6 +9755,15 @@ F:	include/uapi/linux/if_bridge.h
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

