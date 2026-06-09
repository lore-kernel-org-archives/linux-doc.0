Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE927494A10
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 15:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781018019; cv=none; b=FmyrSPnS2XICedZmW2HPzQY8jB5xyOVO4h7aomJXqmTruwI/8Eg9aUTkqnIDwBbILKfNmFfSGFFHdgir1DakRteNgjxFXap/xoyvu/jGiXiJWB77yinq6obyLCSC+c35V7woDTiH4bG/eDw1US/mUK+86rP4qc7LiLcIdd0eOeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781018019; c=relaxed/simple;
	bh=s24y9GPV7y+NJAKmvwvAX1cER3c+JYcl/Cz6+DphJa0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ocsBlkGKiFN6ZL3scBNaPDyzCr2850pArl8s0fuP4DhAztj4/n2dmQ9rBl2VRqXgQagK1XggQwSaMK22BTByM4boFZL5y8+3k1OiFRa1o3OAr5vSQTY+4DZLA5T3b6u74FdOm1ZcRPPkD/xxo9O+npf3jGMCKYaQaM9dk8IcXEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aNvmHBx2; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aNvmHBx2"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-68bfcf11050so10362340a12.0
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 08:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781018007; x=1781622807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3neVONgdAVcEZX3f1l1KWGoYXB46SXm/tOXseRIlMNM=;
        b=aNvmHBx2tHLb1lluUrYs1uQzVJcvwHSyvnhBJFTOWpn/IZLK9O06PRCpz+IJ90keLP
         g24YjrWQNGyzoVkhvKukEngRyFm0AoW8aLvnezAZNa0LxFi/IaRwuDuFfEMKMuGp8BsK
         LehignkKO11waRS0BofFk3GywQZKqx/pheAP0ZyqF4xO5NLE9oVDLLPrpJGz54zjIPQM
         JaS3KBYZP2r4JRzZII8eGBBZAeG4jJiYjdgwEKAct5HBVAxesGsRdOrx6EBpR6Aro0kK
         WZHl+V3eW1nvqpHTdk+jYWNqzTEsfbg1xIW3Q7sZ5k/2NJd7UtkfArzBj5dbYRj4jzOp
         DJ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781018007; x=1781622807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3neVONgdAVcEZX3f1l1KWGoYXB46SXm/tOXseRIlMNM=;
        b=d/TCynk+Os5yeLE2j3q33MrUyGwCSF3R1abcRT0KBJak8RycH75RKOsw3H6cyw0jhj
         dnN9FVfQ6Aq1B/j+K8BDNmASvcL/HFSsKDAV6tdcg9TGXAulwDq/bqK7kR0vInhmXW3y
         WIeQjdb/IqlaieOGMGlvCbARhEY4oIp+z7khc2yyfUvEPAyVzxxnS4kQhRpvDv+meIfl
         2mTU48J4qy85E6wueA1keTbki9V4XgihCeQJwat6iDQmZ9OUB5DOC4PkfF/OTlGl05Ha
         YDOwLs30pVBrlpeMIjJ1Vt89nJDyII6bOffuB4d6o9ef80yMypQlzD+SEwTHCUGTJHXs
         SQQQ==
X-Forwarded-Encrypted: i=1; AFNElJ/amPbMWjwbjKfrKK1ksKbKCLbeRheeFI898xrVVYJNzm2G8VJYlCwTFQTvcwPrLyS2yQLCL71Lwdc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLnweLA+dg8djkhQFZ7kwq6yxlHeres9vJJDIsXkRUeW9eGJ+r
	2fQxJ1CfMg06qT2oGVQhHVriCiRO487BsZCNOLd0BBVpP+FZcHW7Ct3Q
X-Gm-Gg: Acq92OEkFK9m/EZwCWNUrIxYRQpIOMx8ERNI3Ixx4l/V/TPhVRGK5q5pUfzQy9wvqdW
	f9nYepcmp8CadEnYgVKUSnq1DkCxKGTFM3dhhuriZHybWrQWuGetLiJBlffUxYGWiKw3WbxwBFc
	3uhATSYQH4j+NCBtzOYbvZkz+Pr3BJv4ZYfV2Ne2Il2BXgahbdFCbIbosZiZjIPp8HH4k6AFJaN
	vDI4gBAhSTb5RnXyNZZ3abWN4RPeYOAnxXvzzg874KoFWa3Sf5vJjYxTXZvS/PSdT8osE5qQkMx
	1rEz8AjxWAZEqBoHyTX2T7EOsS9qjEo1FDrUeYmfG6JNS5bJvx+KPQsjczy6DMa49OsjxGV0Wif
	AcE5GErqkFPrFTKHsX6hvqy2hsrfc937VW/7UymgjqWNZymRssv45UQh5b4EtXp9PyOYb6qq5l5
	db/XEBQkLPTGMOIAb1mKs0+3OcuzK7YbAh
X-Received: by 2002:a17:906:d552:b0:bd9:2b46:99b0 with SMTP id a640c23a62f3a-bf93a00a5c3mr170280066b.49.1781018006681;
        Tue, 09 Jun 2026 08:13:26 -0700 (PDT)
Received: from Ansuel-XPS24 ([2.195.136.12])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-bf0517721e5sm1073637866b.9.2026.06.09.08.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:13:26 -0700 (PDT)
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
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v6 08/12] of: property: fw_devlink: Add support for "pcs-handle"
Date: Tue,  9 Jun 2026 17:12:04 +0200
Message-ID: <20260609151212.29469-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260609151212.29469-1-ansuelsmth@gmail.com>
References: <20260609151212.29469-1-ansuelsmth@gmail.com>
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
index 136946f8b746..e6584a2f705d 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1392,6 +1392,7 @@ DEFINE_SIMPLE_PROP(access_controllers, "access-controllers", "#access-controller
 DEFINE_SIMPLE_PROP(pses, "pses", "#pse-cells")
 DEFINE_SIMPLE_PROP(power_supplies, "power-supplies", NULL)
 DEFINE_SIMPLE_PROP(mmc_pwrseq, "mmc-pwrseq", NULL)
+DEFINE_SIMPLE_PROP(pcs_handle, "pcs-handle", "#pcs-cells")
 DEFINE_SUFFIX_PROP(regulators, "-supply", NULL)
 DEFINE_SUFFIX_PROP(gpio, "-gpio", "#gpio-cells")
 
@@ -1548,6 +1549,7 @@ static const struct supplier_bindings of_supplier_bindings[] = {
 	{ .parse_prop = parse_interrupts, },
 	{ .parse_prop = parse_interrupt_map, },
 	{ .parse_prop = parse_access_controllers, },
+	{ .parse_prop = parse_pcs_handle, },
 	{ .parse_prop = parse_regulators, },
 	{ .parse_prop = parse_gpio, },
 	{ .parse_prop = parse_gpios, },
-- 
2.53.0

