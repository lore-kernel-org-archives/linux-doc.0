Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AAE3D3499
	for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 06:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784271328; cv=none; b=lhIpzTEiMwGMH9m/cxsKgMyVEYBcuLjptzoNgq/Ajs+lYYIXbcphyDKxRq8S9SAtgiqYEbmc2QnnUZvjItGflYZq7YSCyn7HxPvbjlJDQMQOS5DdEK2gQKsyLekkmpMY7O73XQ+tKvEaMrnNvLTZKzWSPrCXSuqTZlHCPCwLgKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784271328; c=relaxed/simple;
	bh=rSkcPxlDmospi87HHpmbrQ+oifpV2RxCLNsblYdSW/s=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jTYwDYjj7syYvBkIirBRjYydUmtaOu/s9z6ZE0dhX2wd0uTmE7H2HyvQAFJNKuY3yzoOJE+zqA7NL14L1BFEzw92aO1EYyFwHdKUaq6zTnlvWlQydjuYEEuoszhzC8eb29wzf9434M1Qxme59QwCN6ykHueesogcsrwtT0lgK3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ANC7Rflf; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ANC7Rflf"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493f45e20cdso43364905e9.2
        for <linux-doc@vger.kernel.org>; Thu, 16 Jul 2026 23:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784271322; x=1784876122; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RH5Rm+VqeCudjfRml6HtxpQ7RLGC9UFpnfUcRZ/Bi4M=;
        b=ANC7Rflf93ySjwIQE8A4G7NmOn8y0cSY4oEQ0a+yp+EEw4+hbR2YBPp/u5GVcdWRoG
         tu8xX4kRotvENx1ZBkVujMVUDziSfaOVo/xItVWfCUH8mIaCy3xXfy+BQJHI+51pfpt0
         w3+i54XLhxdusWbMos9UrXnQhI1C9eCiregdXVzE2PxMe5xjNmc75E3Bgj2HB8Mh+WmD
         DtzKVvpG67v+6BRaIA1tYLAHK3sYY+cKb/YtkQ5jLHTj1MZe+xX9KT4LlQMaNKLSylpJ
         0a5vOVHWHh1TfPNeNgV4tyAlbwXzXdDJTV0IxR/6SEz28bfnA7LeznPAg4B6BsCgyUyE
         72Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784271322; x=1784876122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RH5Rm+VqeCudjfRml6HtxpQ7RLGC9UFpnfUcRZ/Bi4M=;
        b=SJRHU7tYf2k1rGsrz6a0v0Inio247G2Jj/wiNzf4QUAbz7wmBLbFG0w+fNwDo5JY4U
         JqKw7tQmTMYGGIHdX3ulzMSg2M7Oh9d5UlsYm2GsVzlKm45FtSPJuJIKjK8GTU/Yj6tF
         xnKkzG3BgqxqHWe8GcYrO10gDtYQRiY27sIck6hdizqZKqr5teSVns+9a6UO5F77c/Us
         P88obdyCvNuaN5JuAzOHU6fo8fIQdN4yk8mkuZWRUwj7qjhFQU6HZG/MY/JeG1Rq5UHe
         EiCGodvugw4xDo1j0lmEKh8Hsw0eKVbzonXIRy2QeFr4AVlKYyjVtN0rFpQOH2adRPKg
         0y8A==
X-Forwarded-Encrypted: i=1; AHgh+Rq+yWggSH8EvRyGLYcHc6OY7M0WeZSdX9jvvtDMqMJZShfbPSkWWQuURtW36igZcqnjM0Lsd7IGRKg=@vger.kernel.org
X-Gm-Message-State: AOJu0YweyrjK7i4J2MtccD5ln0BbOIQXsD2FiKaLtv8m/qL+roCJEoh9
	NUmLgFfV082LBB2Hbae83Gr+X3rpeLJRSFamAOpBXMoySq5lES0/zdI4
X-Gm-Gg: AfdE7ckWftSxEvWm2elY+3FP9jnpt0z5tYedJ6p6hZxB+xm6qvf8DuWfFdKNUmniCnb
	7JA+PTpul8LkMZJl5wPXRtP3lTJ/EksH+N5T+kpUNJrXyKy8A0My0Il1scFqxTgWHkMPn+iVBAc
	Xuqn000NOoncl1wQmJyhOmgm3G4WnnHYLp/dSVzdvVDFsJJF74GCdVo4xnz4u1B1P5UmRzskFOA
	80tjw2yJFAd2CoirddwzghGyAltshW2UsAa8Dg8BkieYeEwQyXLNTHyXRNng9P1tlYZFMRUjoo0
	JNCpRH0unChx31aLnxjb/ANFJHHZCgSqe8c2dgaQrcfoxyc6cZJWWKMsGPrMWI7tvV9Nq1yUMCr
	xrrXoDvNM4LxuzBeuGLODDIYX59qBTAr2KmsqwJVQLnlrwTZYn/3jw94v3zAWjR1uz180mC6DrX
	KXb72GS0JAZaaYfoyby4xGsneGIc+ZAPLS9940Ejwex6lophaVjAFqXUqHT6ebxLs8wLeTwg==
X-Received: by 2002:a05:600c:574d:b0:492:4a50:41fe with SMTP id 5b1f17b1804b1-4954a405e58mr9272335e9.22.1784271321433;
        Thu, 16 Jul 2026 23:55:21 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-95-248-227-210.retail.telecomitalia.it. [95.248.227.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-495499f3f99sm24260835e9.0.2026.07.16.23.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 23:55:21 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
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
	Saravana Kannan <saravanak@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: [PATCH net-next v9 07/12] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Fri, 17 Jul 2026 08:54:07 +0200
Message-ID: <20260717065448.1498335-8-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260717065448.1498335-1-ansuelsmth@gmail.com>
References: <20260717065448.1498335-1-ansuelsmth@gmail.com>
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
index f3218abefd0c..51704a90ca46 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9682,6 +9682,15 @@ F:	include/uapi/linux/if_bridge.h
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

