Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5771A3DA5D1
	for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 06:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784271329; cv=none; b=kMYo8vRj4zW2ECH7LJ/WW7mAJUtuVdkKn47HIjCr+++srnO0DQVQnn/hfIYUxjyRA+jsOQDaTsQrWP95bF6Y8RvUImQrgVXIFn0Dcv24kJOuMNVI61YyrUohHs7ZFblEkriil0aycWplqndYfKkJ1lmSOVTKBPf6VvEuOn6xDEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784271329; c=relaxed/simple;
	bh=KD0Xxqp9c+WKHaZRv8teeIbNeaFlH+GFSE9b+VzjtQo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vGWvb/NzkrGq58eAf9ZDkY3we8B0Exz8cUVpUq0mTVeT0arwxcUaRHAJxbkLCNp1wWW89PTAUL1dgTNbotZJRSdhPa95Q1luZuZ3or43jXfD1pQmox7qCE+Kud21NGthlpXY5+4EGBiuquMg57UbFTwsSfacd49ZibR9WS44Q6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IMpWP/vS; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IMpWP/vS"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493f6de72faso8928735e9.0
        for <linux-doc@vger.kernel.org>; Thu, 16 Jul 2026 23:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784271323; x=1784876123; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZdXEh1+v5JoWmC/SQYTMdZgOF636AdT6/MfmObt9bDU=;
        b=IMpWP/vSXDY2iFCz/yQj9ql6sHdtePJuSJ5YQLGmx0XmJQWVHK0jWQzy7wzCuUfVA7
         RFpYrJUfGavDvxYFHGO1Wcwkvuw3r4c4Z1tirk6dju1+hGzfIIj0ZYuHR4Ykllrc3Oog
         9RAr0bO19iyEncL0Y0Tad7IPgIoTsb0IQZzH33EcNG+kYeJzKCG7fOZJfo4pwLUsAd59
         J+sABumUnFKJiHFEqsP1M0hcQ2nwDWayTNZJUDJsCDWeZiXiJUz4tIMvKkgV52YRZ628
         2cLEBNiivFJrTWAW+KBMXecpoAiuvCqPdUzv8oWwSUF9ol+NGEQnhd15/bpttCVMeOJq
         J0wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784271323; x=1784876123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZdXEh1+v5JoWmC/SQYTMdZgOF636AdT6/MfmObt9bDU=;
        b=alnJ45yw1hmBRiAwQqhwiwHfAd3P6O4yqJ2QFrDZc9EGlGbV/rl00mPGkprUx6GSmQ
         DPb+Jef5Rvi+Qirz9npoxZyM7m5WKWF3hrYOq14d9vnkH4w3BDERzQaKa2+qfMg1coUA
         t5m+yGVw07ULhXPzrkFZkkDfZC5fn/yfCkxQ6avMagPSMbyinS4WJRUeIVLTziy9WZSy
         ukajlkm0YFqd5D+gTE2hEOiSpXgatP095aMjBAsxrUQdPx2m8/SGw8gcDYu+JLrVtNiU
         AhlujSgQUjz95U2FmTpiHz9FCcQD4z8l08L/dhg1+g3tO8hf/pzsvE+TBPQyfLmy/qhF
         orvw==
X-Forwarded-Encrypted: i=1; AHgh+RoJBbLn6nEtS/6K3+cpUfMeMF83T1QYLOpVmoTzvwsRDhVTOPuALguhNPhLvRHR1ttXTe6XBTkobPg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnAF/2q8RMpxUWd2nRgZpDcYhqTjUgA9eXvghT7wosYhfSuZSq
	o0phd5KixsBF9I5HjnXNHAncABx/EkJKCgpPx0I1PVG9K+6x/uHAlHUS
X-Gm-Gg: AfdE7ckpbIRu/iS3K1ttyFFz+4LY3WJn33olEcJ31vD1PfbBoW80O9R35B/Qv6ep8XT
	Dq7eHfae0nmbGZ+ZmTWCukuPZtNlb6oZpEX1HftDmiWGBysDOOXqmqdPChbUapzXWZA4P5Ovank
	9irrzvTFgRt53W+4h+zNiKUsrpGTqLcBXavb8EgorJ3NNuYLsDFnqmQiK80uUaWG6EBgru2rWZA
	DBMlj1uDkCTMgxokvbLTf9Xrv1uXIr7dC2yfdnLMqMV+iJU8W0LGBiMs9EUwi2AXLCMqiiBvBcc
	BKz46npSlDTkuCIzbpoxfxvuFlf7BpSVPsnprcrA561vYySkIfK4bVsgwtqniOdX40QhGFO+qyD
	Zdf5gtUbZksQEWjdkFwri0ioeXCdV1gKpBVwQ8FihyEEumZsuAbt9SkTbGE/oI+jCjZPmUp0oKX
	YnY5LEse9iy1jDPzhPO8TWUT9NvWPG+ZP8RsNH0vTmZB8SxWWnvLhJI7PAUpE+iSS+N/GydA==
X-Received: by 2002:a05:600c:a210:b0:493:c566:7bd6 with SMTP id 5b1f17b1804b1-4954a341bcdmr7407915e9.18.1784271323320;
        Thu, 16 Jul 2026 23:55:23 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-95-248-227-210.retail.telecomitalia.it. [95.248.227.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-495499f3f99sm24260835e9.0.2026.07.16.23.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 23:55:22 -0700 (PDT)
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
Subject: [PATCH net-next v9 08/12] of: property: fw_devlink: Add support for "pcs-handle"
Date: Fri, 17 Jul 2026 08:54:08 +0200
Message-ID: <20260717065448.1498335-9-ansuelsmth@gmail.com>
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

Add support for parsing PCS binding so that fw_devlink can
enforce the dependency with Ethernet port.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/of/property.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 72cf12907de0..91c3e3931fa6 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1415,6 +1415,7 @@ DEFINE_SIMPLE_PROP(access_controllers, "access-controllers", "#access-controller
 DEFINE_SIMPLE_PROP(pses, "pses", "#pse-cells")
 DEFINE_SIMPLE_PROP(power_supplies, "power-supplies", NULL)
 DEFINE_SIMPLE_PROP(mmc_pwrseq, "mmc-pwrseq", NULL)
+DEFINE_SIMPLE_PROP(pcs_handle, "pcs-handle", "#pcs-cells")
 DEFINE_SUFFIX_PROP(regulators, "-supply", NULL)
 DEFINE_SUFFIX_PROP(gpio, "-gpio", "#gpio-cells")
 
@@ -1571,6 +1572,7 @@ static const struct supplier_bindings of_supplier_bindings[] = {
 	{ .parse_prop = parse_interrupts, },
 	{ .parse_prop = parse_interrupt_map, },
 	{ .parse_prop = parse_access_controllers, },
+	{ .parse_prop = parse_pcs_handle, },
 	{ .parse_prop = parse_regulators, },
 	{ .parse_prop = parse_gpio, },
 	{ .parse_prop = parse_gpios, },
-- 
2.53.0

