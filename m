Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7B447278D
	for <linux-doc@vger.kernel.org>; Fri,  7 Aug 2026 13:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786108426; cv=none; b=EXR+Lav0DJVarpbGdCiDhD8l52VilQCv6pSooRf1g5HVmJmG/XAtRI7M3aInJ6JojKK+8qQaybyLW8agKFlXl928+mSOziZ0T9rPE0OsmQWuQVi2RCrWFV/gO2bE4yixiMypcbmNYk6qxh2iAzNmePIVCEOEYyH1l9k1NYdoE84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786108426; c=relaxed/simple;
	bh=qr1ayfYw/TaUJNlhsz7JazjlE9h+RLODo9YzpXaYNW0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fUCwV8X2kI/8CpgPtqldscMWpK0WG30Fmaf0MxFCq278umcyltMaF9Dcb0QuzebBBc13IPHy9NYSJmA+0LmY3uFpA7GNFbKWXSL6DMviIkFQxM+hRbLjrZw/gQ15Wi/GeN0Qs3zls/8rtuFOUTGB3OujEqDBh37O9Elc3L764eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LDLFDb9O; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LDLFDb9O"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4957eefd361so25294475e9.1
        for <linux-doc@vger.kernel.org>; Fri, 07 Aug 2026 06:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786108409; x=1786713209; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KvAGMH2SF3OadC27x/m+3YmCq7OMNQ6xjFpJG6wyIOs=;
        b=LDLFDb9OUtqTDULAEN+XVPo4xCfAV2NZxfUOEtf82LPZyOh7iojvqXfIh9SiDLo/ep
         z2lk4mrP/ghd9/LxHp6YuhttT9Qvy/BjWhC8r/4Y7rM5ICc6ZBuUNDcHJOzk5cBqJxdC
         Kl6XAVXPOskh3CHHLwl2KywqyoHe9r/CNr0JPFo/msrtnrN3UFMmKspwM0VU7r6VJCVH
         3x8UqMu+x4ehaElgrhxx9sHMn7Kp/PD/wBigtpK7UaLGp7yAyEbCbphalum/2CUc2gFz
         l6XxTJNLF53nUZTbocpKoz8lXz18N+jGS+uLmPz2xSWOOgQbWAHkmuqmDlO7MAkwAr2R
         n91A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786108409; x=1786713209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=KvAGMH2SF3OadC27x/m+3YmCq7OMNQ6xjFpJG6wyIOs=;
        b=PP2ItZB5hciWBjEpP9QrTa5jI0RjLEcMGPf+rYKEfVWmcDqGffa6ZvmmnjPs+6YaJB
         VtX9unOsqcI1bvzWaaC6Qdb2tAi7smL/OHPhxYc6rQg8MLikVJnDQkBig6Jh03Ih1QdP
         Dggur29p23CxiK3/6X2ZW6ko17vJUuJURF0QxOcdBf83U+LxG9ItIS0n3tRw10TCWIpU
         MGsBAs3rfjK1In/gw/fxbFynvxcvy73aU85/osUrHHfFj7O4bLM75dye9EwfjATUK1p/
         k98jJ1eIw4b7eNy+6ypb8i7vOEhVY6ilwjI4M84WeqkMwZBI5vPhrVTERrdGZD0Fh2iw
         aA/Q==
X-Forwarded-Encrypted: i=1; AHgh+RrKhxbPQxYFmW4cTpMaeX4bWTG0PTNO3MX4y+1Zb9/ZfRhOZh0rdzrmwmiAZ0fO+IaCZQxjhzXrdMA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXNpuC8m2tl167aZCaUE3BEgdO6tMAeLD/Pha2BYB6iJxzuK45
	3GsHnGUEQ3tx2Z1Dg+/EEE7Mjfv37OJZvjcpR895C54hiy5SFlB5lMkJ
X-Gm-Gg: AR+sD11rWyPD0F/Z1x8geJbTBVZz+sIY+EqiHGrbKyl1opPo5SG6Heb2po1rgIKeNU8
	BgVQjO8nI0eVhWpu13TQkNbdlQRX8mjRii+9LyH61Q9Igauz89hqNW6R6CZviLNoNKrNmOEHMxQ
	y6Og+LeYHzYCiQ/ILOkv9mWrEEjeam0M2SbsiH4U3hH2HOSVFP3QRHpdloxmow31RYBqbX5TQWS
	vs1q8KmVBm9RFT2zCEk7pFRPbMnnd0Pn+2Bcs+fIb0KrCTkZ09dL3d6Q2ApGkfFUguZqAwNtngd
	z7Hnz7ZyVsgdUsHtaufqFdPXZqqpxsvJlvPCjCbphIPsc0GoAwaBovfFVyZrtPVDSW9pzZJVMsc
	N4fy4pxzObLC5ItULP8Rxubc8z1VqIKYCUxfB2Lhhra0KataIBa2Pvmw4cIdUT1r4LUL5slOozb
	mG2U8LMCRS86SUvaVxYDjKyg/MItqJdXH8do+H/KEbjoBuMeLJ0dTR9Gsy4azG0j3Fxdw+zf2qJ
	1C6hik3sVIP9nJzjvncI1OTPFjHPW4Rn1Wpv/0J6VGjfsglTRsdNA==
X-Received: by 2002:a05:600c:46cc:b0:493:bd2a:93be with SMTP id 5b1f17b1804b1-4995e085347mr52863935e9.6.1786108408434;
        Fri, 07 Aug 2026 06:13:28 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-19-255-168.retail.telecomitalia.it. [87.19.255.168])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4995c7b2b68sm58827665e9.4.2026.08.07.06.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 06:13:28 -0700 (PDT)
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
Subject: [PATCH net-next v11 08/12] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Fri,  7 Aug 2026 15:12:50 +0200
Message-ID: <20260807131301.192060-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260807131301.192060-1-ansuelsmth@gmail.com>
References: <20260807131301.192060-1-ansuelsmth@gmail.com>
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
index 08e43bc09735..e3ded0e4a115 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9688,6 +9688,15 @@ F:	include/uapi/linux/if_bridge.h
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

