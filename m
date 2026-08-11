Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B230F42BE86
	for <linux-doc@vger.kernel.org>; Tue, 11 Aug 2026 09:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786440565; cv=none; b=inXlMDa+LrqV0sDCyklhtukEd21RBc5/peqeSiSOz9WlD2RbNtBBp6qqI1VNBo8yl1MvPPt6wZ5x/HLSuvkNwjDVIUxnTuQ/e2H19JsfV4rKOWYSaA9KJ9SX7AEtmbGTUYnznJPm4WIEphb8A03xJxZ6taW1gIrS3nSQliV3QHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786440565; c=relaxed/simple;
	bh=qr1ayfYw/TaUJNlhsz7JazjlE9h+RLODo9YzpXaYNW0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VSSZAZWWlpXgEbTbck+M4eMwPfU9Q6DHRAKSrcHw5k4wJDWGFwE6Tuku34ik64FjbzNkv1BYpmrM0V5FYmArKLPtfkYbrBQYQ+anDQXACR+48Y584cb3tcULI9ekOwN3eIB1Thl1Me8Nhbz8TJkSOdUuleHttjzuPWynWHt6QzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RX/q0JH+; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RX/q0JH+"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49558ce01afso4904425e9.1
        for <linux-doc@vger.kernel.org>; Tue, 11 Aug 2026 02:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786440559; x=1787045359; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KvAGMH2SF3OadC27x/m+3YmCq7OMNQ6xjFpJG6wyIOs=;
        b=RX/q0JH+UbQBDd/25nAaK1+TykO9Ft5ruotgBSd6tGm5YnRcnlfwPhhxku4gMAZokF
         A1cnzUod8E4e3f9pGAD31YI3VloSdfc82zFJCez3RgUm0bIxvu/F5aJwh2pEX9lTm+yx
         I+0l+V8ckj3opmr66mjav9VMGemzA20Vhb89+Uw+oxyBbU7qFlnFwkOuq0p3mjJlnpQk
         6pxD55IjQKQ/Iutx2CK9Sl4N3bMS6TisSiFYhrKkvM3hxnJyF//TI1uHTnFwD2PrGwx4
         XPOAsHFH8wiOKA5Gjq5l2YxVCeJ7bbN9F4jycNkERkw6Sodt9VMDtbfZE+6hT64HEjc1
         KZUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786440559; x=1787045359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=KvAGMH2SF3OadC27x/m+3YmCq7OMNQ6xjFpJG6wyIOs=;
        b=AZhGKJg9RDVLlhg9S4MqwxGDG2lph61+F+Q/QurWf28R2lLzHyanQ9y7wlY+TVxumR
         BW31pDCRbdYej9OWv8VboQvdLczYuQiZnFN5kS0DpkZ6TjNDaikRSNgbl0YDCoJKD8Jp
         +aIqAuTIqJIQLbAux+L0Pct79af2p9BtxdA2B67k9T2nwIlWx4jezVBeBKZCTqVOy4HM
         6A2OZEbvz2JvQDv2En75T0noVYXsaC0xo2DhYLjg9emJWv8ZnYslVqMpVfx3WvhtAMft
         MLUnPS7I15fpHZaQD04f/juJhKCcLfC/REqeE1vkk67l9VHo0QeBvr/HOs3KE/D+tTj/
         4bsA==
X-Forwarded-Encrypted: i=1; AHgh+Rp3WaOO+7T7uJ9Xdv9JVZtTQFUVLHfdB62yEG+NybI4QBpOkWzpUTyfCcLAyLP1O+mFHHOVToXwwhg=@vger.kernel.org
X-Gm-Message-State: AOJu0YznbQ7M20pB141hIo4Y02G/B5x0NwLYtPQZrqKtpac3ojIOnF2U
	J6879zEiqUyaG5K/vZ0AkYeJnJw8twEWUGF9NPvcJScggM6OqxspWTCZ
X-Gm-Gg: AR+sD10cYdbkTNC9XLyYZ09/+oO4ufjJ60e3kjiwKEapKDc/XIerYZhZZ3iBSnEEVhD
	5TFtzvS6evnt/HUc9YLP7T00I9/MEKCnfiMwUAjjFI64mCA7SuSE6eSgKk6GzDc7M8q0BluNJbO
	SqgMFjcDxGKsiCvRJ8CS87NJwNb6Hg9i6YffPizCUE72fn7/VbZty02kePhE8e1P7tseg31SOJJ
	USbOo3K3NUAC+ONT22mKi7E9KyToXNPTDz31Ay3mZc4STcVeTdAOlsuTnxHVyXdhLJchHoU9VCM
	ExBqACyvqr49bMn/GKlnvc1Y1qFsY4XA7vxIxF7zH861shMgE/gT++ZAhcFEuVWrhtW7IisgNwG
	tt6zRPQeKV5iM6K3TWdvA88VH1NyUfOZ8+OenEG6asZosV/zI6jMgBJT0PZRkBAuwzjpC9/Fjmo
	CHLx414YYAxJiKzbPosQF4unUjjbJT40c/24uvr2DBivFJU8aYgSTjrRGpUVdpGR4eQF2hWkV48
	8lJlcmWLhcjkc5bcDJ3p+2+hdXZBsJm6ct8633sibYBiLWc
X-Received: by 2002:a05:600c:1385:b0:499:6faf:336e with SMTP id 5b1f17b1804b1-4997846c8f8mr35438295e9.13.1786440558763;
        Tue, 11 Aug 2026 02:29:18 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-20-3-207.retail.telecomitalia.it. [87.20.3.207])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4997402a89bsm56135735e9.0.2026.08.11.02.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 02:29:18 -0700 (PDT)
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
Subject: [PATCH net-next v13 08/12] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Tue, 11 Aug 2026 11:28:33 +0200
Message-ID: <20260811092843.673837-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260811092843.673837-1-ansuelsmth@gmail.com>
References: <20260811092843.673837-1-ansuelsmth@gmail.com>
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

