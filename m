Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837EE3932D8
	for <linux-doc@vger.kernel.org>; Mon, 22 Jun 2026 08:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782117075; cv=none; b=pm6xKhu9PiKcIKaKxSuaKkZIKm6zuFORg6MlgYU9v3OHszmBRDHfkYXaPxIFZYwzMtQDEscQffVj4vBXIzQ+S7216yTipWbYbCTnKAKkEBBFTsNdWGl7dwe/LmCnrpe0HeABz17L40qV1t3RkobM5yuZweFpDiGoJRKVzrbAy7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782117075; c=relaxed/simple;
	bh=dp5DXrFD/VR2Pf30vi6TU4vpA2bUKis58HF5l5/23sU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Rz4+VHGZB5GgbR8ALpVynuieDl+Ttqx0mKbgL6GRJ9EOVUVMwok2EMG1MOdBCI8F3cmpa07WZHCmpxm9Bumk/jKDIf59toqWpjmhIBPb8PQKq1nIolw2SyMf1j56/3MBUueFI0fGr3fYitMNFNBXHoqnYZwpB1VPaSW54DDAKKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gtsOO3la; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gtsOO3la"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-461edb387ddso3791558f8f.3
        for <linux-doc@vger.kernel.org>; Mon, 22 Jun 2026 01:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782117070; x=1782721870; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lTDgjvJHAETxnjltFNDifT9VJeCgqwN34Z2RGXGG7KE=;
        b=gtsOO3laBFWa7hQTUMYkOvrzhkoYZXn+VmP2rBo/+4Uh/aXkGXkU8tucRzrLcpiWvx
         E0isk6POZnFrNML12z8RURsSJlmKSAplQTQYTadOv+0ySbk2vwk9pbjE51IuvsWwGJcA
         bMrQo2RzeMqv7WDInMuJ63DvHsGasvs+y8kNHQP7pIOaVEhGDTNlUTVhyFGNtB9oSuht
         ++xO1efYEFtF0tUIaHDs3+pxBlvYe0HkttKEADIBryT0F27x6hv53PHTSAxnLItMiZ//
         3i4eufpySJ3HEob0Oi7balf9BHVLwgkfBEI/pXpsHyvIBetJ+ja+ugMfmuESV2idE3jr
         Rxyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782117070; x=1782721870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lTDgjvJHAETxnjltFNDifT9VJeCgqwN34Z2RGXGG7KE=;
        b=tFNQ6F+CHhF69efH93ASejm0sRkVpZA4KVpty5nwf1x4mc2gqI7aqFWljd7OufTmQ7
         6Wa1XyVCMXRAyNFCi3MHynjRLgSPzyHziL0WPhbAN1ydRuLhK7CmW7tcQy+Bi9g0uIYY
         THgBlZS+vnUfOsQv+AyF/bWpxzMU8Vr+KHC2OuO9CgJMUn4vxY/sVXtAzBL+mGYFkc34
         EW5zpHj+kZ4WWF0GbP2BOQ2FDA89lA0l+fP4xP2ywYvSS7/RiGc+td9OOz2Z8ES+89o4
         g2GSAuG8NSeFdfOH3BcJqLhCDvL8a7GZS+lAg04tlReb7xfrFN9s4jriTR/egkkxYUjx
         djeA==
X-Forwarded-Encrypted: i=1; AFNElJ/16rkXM+Z4h0UARrc/Jx7CnRG2j2Y6uLitm/r58+1/VE12l6sh9FSt1Bg1hhPKUetHmT76NVjHAi8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLPRIY2ZJ7Zmb5WyDlvVOOXsIFZ5XxAACPGtJh6uqKdCka2mI3
	PZtyOjZP23clzYV7YOgurp6gLGci6fhGHGfNbzPZdxRMmVwM//FZukcL
X-Gm-Gg: AfdE7ckWzCWjW2155kncwi4GucNPSdtO6+zq0WVij4b6mLqTakbHbqVVm4uf/CrFgrW
	dG1GxSumA5q1evMQRLRZvEbr9fPxbjGLFP26mMKqWgqALFg08SXWujD9JU/3zKcARveOskWyyNZ
	g2l4rVePPSil+g+ggHi6xPaZQWmlsxDBWWg4cP5WGfu6DVfbIZpb56tt5JF456aYRb8mOVCkLY4
	wf9zki0/H8YMw/9OdCetvcFWXglz4cAVMbs/6V02MMCn68kZDAWSLJ2HvyCGuQflQm25hwdXcB9
	b55D/F1rFlb0KVbe5vN7NpcWejIlf7GmEK8XZyPaiYat9MqpbkZQuyuXCfhV/EUpVsmM2/ulUPB
	eycuMraOpxkF/To+hB+YbmmZIhWZVOJE5pMwGc/s0vcOE4+JLaADT+vPkns7Pgh4iFLCWJzy8Rq
	/Thz8bwe8ksZEXZnrRsBwuCY0=
X-Received: by 2002:a05:600c:5285:b0:492:4640:cf59 with SMTP id 5b1f17b1804b1-4924640cf67mr192104875e9.36.1782117069622;
        Mon, 22 Jun 2026 01:31:09 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492494497ffsm200809105e9.11.2026.06.22.01.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 01:31:09 -0700 (PDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: andrew@codeconstruct.com.au,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: openbmc@lists.ozlabs.org,
	linux-watchdog@vger.kernel.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	joel@jms.id.au
Subject: [PATCH v2 1/3] dt-bindings: watchdog: npcm: add GCR syscon property
Date: Mon, 22 Jun 2026 11:30:44 +0300
Message-Id: <20260622083046.3189603-2-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260622083046.3189603-1-tmaimon77@gmail.com>
References: <20260622083046.3189603-1-tmaimon77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe syscon property that handles general control registers (GCR) in
Nuvoton BMC NPCM watchdog driver.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml   | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml
index 7aa30f5b5c49..4f00f099b2d2 100644
--- a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml
@@ -40,6 +40,12 @@ properties:
   clock-frequency:
     description: Frequency in Hz of the clock that drives the NPCM timer.
 
+  nuvoton,sysgcr:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      a phandle to access GCR registers on NPCM750 and NPCM845 watchdog
+      instances.
+
 required:
   - compatible
   - reg
-- 
2.34.1

