Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7FF3DC4B7
	for <linux-doc@vger.kernel.org>; Sun,  9 Aug 2026 20:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786307511; cv=none; b=I3pUtZbU87xVOCgAnYqp4z5B735YjRu+Wp1eSw5TQaV5YNGUHMob9DjE0CLh/OfQ9nVT+dlJ+v5lFjTAn7e/wmYHNcb/NHjy255e1dsCGdOiB2/uUU65bi9EjfpmaChrlcUhtuGToanmNdfzI+ou52TvIwdBTJKiGDhL9q912i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786307511; c=relaxed/simple;
	bh=qr1ayfYw/TaUJNlhsz7JazjlE9h+RLODo9YzpXaYNW0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o2wyhJH+m2wJZuEU/aemU5P1xFFT5uPFtRZ4rqNYPLPdzAvga+bpKmoKA8lJIZ3wvwUwaWInX7UBR7MOgw1shGhJPpvxeTs50Mzc2vBdBPrsq4IlROWM0Wsea/CuTHOhcn0JO6iBiwI8folkLOnlmIddOacg7bkFRMhWyB6u0tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G8Ll39+a; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G8Ll39+a"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4954df200ddso7897855e9.0
        for <linux-doc@vger.kernel.org>; Sun, 09 Aug 2026 13:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786307506; x=1786912306; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KvAGMH2SF3OadC27x/m+3YmCq7OMNQ6xjFpJG6wyIOs=;
        b=G8Ll39+aT2kywXwAiaY82Zrn+31nvCdldV+FZdDRSxTRHDtBixqDNMDWJNpK3FyVyq
         HzKom7uScZBLR8HjXdBvjAdl3GptMlwAcaytEZ1lH1TGj9bZT09HH1GN8FzHaDt+Q9ip
         /wz5Hx3MrmFJMQyeT8mUskSy+7IMsoqjrFQQs1wEOVbj8t7T+wvGgTw1dR1BDgq69req
         howDy2nCl+VD9/ZJF/0nuZNTvtimkSxVC9GsL7AlOX1QrO7PDdn0GMBMC1oQzTr3KcFW
         noMh8kOrccXihCHwEP6TEdwUw+489t9CUmiB8LjnG9uiGfEL2L8Q7HwOeQgYKzCCMNAX
         opng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786307506; x=1786912306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=KvAGMH2SF3OadC27x/m+3YmCq7OMNQ6xjFpJG6wyIOs=;
        b=LEMk3XFV1qEtkP6v4D63FE/MZeHF2yGBHtUfPDcMZPmUGgjkZ4Orbo9sL3+A1vuVFL
         oOszBMHnlse+bDhwi52JFBWTZKryn1aYPNqr03dOTidiJJqPvik7eM7s2VATiattQ1xj
         HA6vMVyt1yYbQbEO4IJvu56mDnCUbrt4hnmVLyxylAIs+yvZlojNLEBtci5HJ/ze6iuE
         QigUWmFT0K2oNdc2YmefIWkJUyfEsDnTPYOa9XL11+1/ZF9tjbBA2+cDmUG25J6Xsj1D
         YyEC+QOH1p/k4BkL0XrZdK1haYAC/p7273UU0/Mwi0OBlhf1l8mcA8kOkbvtpl8ErNyK
         cVZQ==
X-Forwarded-Encrypted: i=1; AHgh+RoAvZWU9WkjA+lKcaInSi7r3XhOKZr0Mhgr27a/yf7jlYb4fk5zB0svcTt1/XN1FveX/C3JcATRPds=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrF0Knr42f8QM4f1zHaNkirOd8egjPYiGNMsiOC3sAQCYxDWjH
	7itaUrOupKO7rbM+6BoZ6LbM9pkJk7z2ph1akbYnYmsiyubImPW2QUKO
X-Gm-Gg: AR+sD10/dk0RfmpEvNKA7MmImFZJytIYeYLzvrL1mT/L6RDFTBUlloBmJRktf29rmFF
	xI5IRo9dVKnInZG1jnxvJwnRRFSJ955pIUD3vpncls+M1n8plCbYbWV6QwGmFdOGXuvKA9HUgsz
	TOygvKcq8hcdAvBcbpe6j95giF3h+VjYLN5kgwjcB+o78afpDjb0aGbCXl2KDptLufp5OquQCsN
	P3PnntYYeIGbMKLyC/4jvGuALsIO4Hbssg2Ah0+i3PsLLEKjrDmhkG/8Hy6MYY3ULgqr1iXEsmJ
	ZjCVOqt2h2kmgDi7Fccus8Nt9V2h4XfsGiTim/fn1FLqa13nwhKbmFHyeWGZGYHxkhPZHZyss2a
	0dS/dXvyAK8mNcSg2N5uM9JFcegcWy1k2InaB676ks3zJCkDmZGIzJa+ABzfPr9Jwu0xj8+qIIH
	ae7OpPVor/1x0JwfJzdz4JP45GokHLO5c+8GPylUHh40MDWhRVgjBLuv7X5nUNLFWnF645vuZK+
	PmvN4W00nZH+zQE22uQoYz1hvUmrjQ2ehysVtZgeBAY88nguYIeuRQmtjhQ
X-Received: by 2002:a05:600c:5251:b0:499:5b04:6920 with SMTP id 5b1f17b1804b1-4995b04695bmr259698705e9.16.1786307506550;
        Sun, 09 Aug 2026 13:31:46 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-20-3-207.retail.telecomitalia.it. [87.20.3.207])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4995e9ea92csm229357065e9.4.2026.08.09.13.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 13:31:46 -0700 (PDT)
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
Subject: [PATCH net-next v12 08/12] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Sun,  9 Aug 2026 22:31:05 +0200
Message-ID: <20260809203116.640271-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260809203116.640271-1-ansuelsmth@gmail.com>
References: <20260809203116.640271-1-ansuelsmth@gmail.com>
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

