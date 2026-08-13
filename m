Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3880B445AC4
	for <linux-doc@vger.kernel.org>; Thu, 13 Aug 2026 08:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786610176; cv=none; b=Wxzdf5dt7Qm0b9kFQnAHz51FOlvugYTj6sHldt9c4GY1uZoUOWDi6JgAzrReTkdOx4yzTcr7rjSxE7ltXu4+bk3wgxl0JuIAnOLXXwuLL1XShvx+mfMRuUzah+5h8yXFLDCzKmgSNN7bLhBf9MycBlmKgrmyPpVF0tGvnlpZUqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786610176; c=relaxed/simple;
	bh=ToC+qrojIElPVEor8Dd5gyGiOeRrIzNZay5S5+a5o+M=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DYPZezBu4U70PfkcoURdN/HLrVAmlIo6/0mWRv3veyQC991VWxQPTnPJHAzGKJmK8Vsyp5Hfm2tCrtORRHFAlheR1Ga2k4SSm4ZAI5/CrCAvgGxHnjGJBs8+daP3JvVyM6iEt8w4GMV1CzFrI/KDy8lSYTYArOwaMo1UYSGxP3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T0JAxiTN; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T0JAxiTN"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-496b7622a83so2759645e9.2
        for <linux-doc@vger.kernel.org>; Thu, 13 Aug 2026 01:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786610166; x=1787214966; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=u3TXL1NZ/aRbhtWQeEIAK86zXlmYDZTCC23cn6TScuc=;
        b=T0JAxiTN/Jag3xnjzYMyTbdVvZbBTNpKfyatM8D3v4L79NOtPRzqN3+P/mzeR7BqyL
         2oDAhFs1pcMxefNE2o/NjvJPU0U9NWgNFdQxV8HWQ9IiAoQwIJEMptkkcGF2TCWC+b9q
         1QqHZZXcAYnacnw2qJkx3SzJJi8QrUaXHmbFwBPpe2LEKYIi9lXHwKQHzbk4XUUneyvI
         uqo/QPSttgmDJKgfskuLeU5rH8/F42FD0OTCbUnIw2xQ352j3VtIQGndaWoHLRwAd6n3
         OxxIyMnG5ZPjhLlYIIl0dk5r4lyej6ztzspYgyYUvnnq3CouYO89YoVR6X55F+9Iba9r
         Um4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786610166; x=1787214966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=u3TXL1NZ/aRbhtWQeEIAK86zXlmYDZTCC23cn6TScuc=;
        b=aajpOaGLLFQ2Z3MzMmGCbOV/4p2jQOkraArmIQzEN2Ne3HlHKDZaT1sULeyBT39bW7
         j7rPtzxsURDPGkqHVd/y10Ks82+98QuixrmPXqpnloLXnJ8e3FW39m2LbqXASg07MHeE
         j4JL7Wy9D3r/UL05OLlvXJzrYWjCSJRPHb7q2Sh6UKOpCrSxvxrkjDclaZZlP7cIaaEY
         UmQI9vruTj184Qz/a0nZYTzJN2qSNYqUzh/l+GhtesHFFPMjP9bwl5kwfZnEhK3qzICH
         BjpqBpN7Tvu53CDMzi6t9BmZoL69BLaMk4EhywcEIKVA0sARsn53Tm63HRz0QgglTsEe
         80LA==
X-Forwarded-Encrypted: i=1; AHgh+RoUjoXJk9cwCiKKUsoqBco+807njxWIq65IhACZrNYO7Wzn8QndVXJn53fNxd75Dg0sMNowR/zFtT4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzJTryYPUom/ukCrAeI0ERrF9qUDN64sk+TOjKW3AzYsqijJIU
	DOhd4RL4Yt2MzhKjP3aL9Nb++7b8vbWmLIbHw85cok9KPbDV/CDhpbPU
X-Gm-Gg: AR+sD123FPa9VjMFEhf9Vzl03z3hlIkXJseQJ3SdWEN3vn2y+RjvRhX1WiyC4zAuCam
	TDTKFb21Qw2n1OK/D0KXWE7cz5acuJfKyL1PawqnzEx5ZoQkVdc57pta/d4lp9zoiYbO2wP1F3l
	/AUoaV+Nc6cgKV+7CGkSTYmvf9Q5x3Yo/RAtZd5lPk5B9lC7Dgdjbf/nqt82NWdHJVkYdrl/amk
	fIyTgfnZejsJHGhAFycP1ZTXu8kU2gnLu/lMJUpx16MgnLWBW7x8nQqueIvRyC6rHZsX7nPzx7N
	DO5VqmEX6xR79GEDcxotP05Jpv5d35DD9FDciqegHxWjCdOVMsIBaQO7MkwMvXRpMw0VS4tMW0h
	sc+pMOHmaP4ZObS0el5uVLCO4mpRurbrpHBkkSa9KG/AA8D1L8qkLi26hC1ZsdXmdwpyvr4pRFG
	Xk4BLOxwe+uHIauvlwR5XnpE9rTn8VYhl4Vgsu3144mxuYDD5lK6wRMItkmdJsD9Rx46w5wL0zf
	KZPGv+OSz8MgIkvOWBB/VCnkgoEjNZF5Hk5euGzEAhKdaSr
X-Received: by 2002:a05:600c:474a:b0:499:80ce:827b with SMTP id 5b1f17b1804b1-499821bcff7mr43640125e9.4.1786610165898;
        Thu, 13 Aug 2026 01:36:05 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-20-3-207.retail.telecomitalia.it. [87.20.3.207])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4998216d082sm45804425e9.13.2026.08.13.01.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 01:36:05 -0700 (PDT)
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
Subject: [PATCH v14 08/12] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Thu, 13 Aug 2026 10:35:13 +0200
Message-ID: <20260813083536.970196-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260813083536.970196-1-ansuelsmth@gmail.com>
References: <20260813083536.970196-1-ansuelsmth@gmail.com>
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
index e0e7fae5b92f..04db742696ac 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9690,6 +9690,15 @@ F:	include/uapi/linux/if_bridge.h
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

