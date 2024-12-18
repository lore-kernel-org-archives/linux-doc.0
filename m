Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4CA1FBCAD
	for <linux-doc@vger.kernel.org>; Wed, 18 Dec 2024 18:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734546852; cv=none; b=GwS9xlDKJj4ErUkzX1BRHxJj2NFgtnVGVp8/pd+Jkgf34JR3v9shYpWihvr75bCuWKEwhXXN7rBUevG3beYdM4G/inVbz0wQMdFFmU1pwd0EfQhZ+engTiExDxPLUKUHsqU8zWSb6A3MZlbJrlIlo8rnl5JJrr3IFUJuhn6QWNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734546852; c=relaxed/simple;
	bh=U8PM7OFW1gKiR8tXuTfMQZQozHR9qO5pl1a1dCYeUcQ=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WmaE+RnjyCnSYzNW6Zb0kT4xMzw8uIzI+nU7cFMuBzpqaxqgf5Eb85LnOa0dPOqjGHn2vR9XojNYBXZ22mUhZoHuVy5WkojK+8csjKKqTyztgvznoDPR5dsm1Wo31JakO229lbOvFhXe7VPr04XD+2YWPz3KC/Gwg/zvFnFGqVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk; spf=pass smtp.mailfrom=remote-tech.co.uk; dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b=dAPkBYvf; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=remote-tech.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b="dAPkBYvf"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aab6fa3e20eso1013010266b.2
        for <linux-doc@vger.kernel.org>; Wed, 18 Dec 2024 10:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=remote-tech-co-uk.20230601.gappssmtp.com; s=20230601; t=1734546849; x=1735151649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FpTyr3pOeqBd4fVeHV4awepAm1kO5/z7MbR3xj/v4EU=;
        b=dAPkBYvfM52gDlSCOSrRTowFOZOa8EYFtX6oh5U8kZlrNNrA0c9A5MlN9kuEnlggt4
         rD1AqIyldC+gl6J+jMRyH5taWFtAUOZg2jvtyOPTdt9xDRCgM2SP4Cqj/bgXl5eySIoZ
         ADQXoWC+B1vD79I21wShJYom7Hs7OxU4P+VPWJExwWjdYHNSui5ciLkHJpaY2p/a9Ypt
         /aDh6VOxqC5b5uj+oYbITaGAdqQWEOg2Fz/tcdQ4Wale/pLQiGw5q44P4dJMRDyTlVjm
         IouaMxsrZ1GIQjkYnpg4nISl7QrsTFXP61LC4Sg3niA5F27yOoMkxgzamQin7gSgQOvg
         7Mog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734546849; x=1735151649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FpTyr3pOeqBd4fVeHV4awepAm1kO5/z7MbR3xj/v4EU=;
        b=SBb+FjQDVoEiussczEfMvYWbpzghWCPk+23nyFMOyZiGJ56x8nkhk34MWR3na4g4mk
         Jql+Nq688RhhaQv6T+oTULhgVIZCQKFMYHAcuLQu8WZPDAzCpel8MTWV7MGvoXGEKU9C
         v+esh9HL0E43Fz+VJ66/LfG914K/mnq0dtdRJ/5m5SlAdSrrca5LC7PVouNJZiWuuL8U
         vL4oV/e+wWNR0VFzeVna3NTL70+TBKj/oBhDLFQ2PRyR7dnKdXsrFlnFHj215IWeLWcZ
         iXIBDhV2LuDJBTNDKis0FkXCEBwdfpNpP+Uh0nVQ2nuyn5woqFghkt2vpICeHB+j8Ndl
         ebNA==
X-Forwarded-Encrypted: i=1; AJvYcCWZAw/j3hsGghr/iRg9zqIoEYzRp/JbMiIvrsrfEfrJN95M/+6iekSctTy5knnRiDPqCMjVgTXRGGE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1t3uIysYsGktKIdj7jDsST2nbRz7ihHYl1VHxcE6GpDZvD0w2
	qmxBTs1jrcPWEIKD1TWplvrQqzmrD0Ek6wKVPbqsKkSvooNMx55bhyvA8Ui1oDfzGe3RKWkyMJS
	SIJtVNo/KJ4S5H1JHtHd96bb2BkNZ0sBjBWSSwUw9Ol+pHgJDjStopfA5WirDxfey6ZPP7G3XAe
	Fzo25cKfsBofKGjYDTDUdExTc=
X-Gm-Gg: ASbGnctb1QDAwc3wu3HEBh+mUoZGRJwsoDbPiVIiqqk1UXkJ25ByZzIG11gevxgfTkL
	wSUDW3+UIr43NzZKWNfOOYz0lFx9Z7bVIvIzZ+6SsQDYitPLFOXPaTEFuMqzkI/XYTcPdkFp1uS
	rCR55DXlzDRBwpkK4B6nFRCitJI3nBEoLbzPrP+rW5ibzXVo4rJ4i3BZCMjtsS5r91WPYVtWN6l
	j0H5JMU+iJbgNWal/k8QihXnhIIQrIIgPLC2B1w/4t3MaDAiopLTHtI/K1OOc3tdVvCRzLOGORQ
	jer3lE9J8vSOKtyywdr9ABViWjmKRPoxqOY2Al07A2OuIs2aR+IX5SgLQ9vu2s7DxQ/zuYbCwwt
	F
X-Google-Smtp-Source: AGHT+IH2PWkcdNyGTKokJaUWWhT0r1CKLpFl11CxYkcaFXYiJrP3t69tY7W2UAINnz6wjr2BPUp2mA==
X-Received: by 2002:a17:907:7817:b0:aa6:6885:e2f0 with SMTP id a640c23a62f3a-aabf48f7236mr333656066b.46.1734546848513;
        Wed, 18 Dec 2024 10:34:08 -0800 (PST)
Received: from localhost.localdomain (ipb21b247d.dynamic.kabel-deutschland.de. [178.27.36.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab9638ec53sm583873366b.156.2024.12.18.10.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 10:34:08 -0800 (PST)
From: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v11 1/3] Documentation:leds: Add leds-st1202.rst
Date: Wed, 18 Dec 2024 18:33:57 +0000
Message-Id: <20241218183401.41687-2-vicentiu.galanopulo@remote-tech.co.uk>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241218183401.41687-1-vicentiu.galanopulo@remote-tech.co.uk>
References: <20241218183401.41687-1-vicentiu.galanopulo@remote-tech.co.uk>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add usage for sysfs hw_pattern entry for leds-st1202

Signed-off-by: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
---
    - Changes in v4: Update format (line wrapping) for leds-st1202.rst
    - Changes in v3: Add leds-st1202 to index.rst
    - Changes in v2: Implement review comments

 Documentation/leds/index.rst       |  1 +
 Documentation/leds/leds-st1202.rst | 34 ++++++++++++++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 Documentation/leds/leds-st1202.rst

diff --git a/Documentation/leds/index.rst b/Documentation/leds/index.rst
index 3ade16c18328..0ab0a2128a11 100644
--- a/Documentation/leds/index.rst
+++ b/Documentation/leds/index.rst
@@ -28,4 +28,5 @@ LEDs
    leds-mlxcpld
    leds-mt6370-rgb
    leds-sc27xx
+   leds-st1202.rst
    leds-qcom-lpg
diff --git a/Documentation/leds/leds-st1202.rst b/Documentation/leds/leds-st1202.rst
new file mode 100644
index 000000000000..1a09fbfcedcf
--- /dev/null
+++ b/Documentation/leds/leds-st1202.rst
@@ -0,0 +1,34 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+============================================
+Kernel driver for STMicroelectronics LED1202
+============================================
+
+/sys/class/leds/<led>/hw_pattern
+--------------------------------
+
+Specify a hardware pattern for the ST1202 LED. The LED controller
+implements 12 low-side current generators with independent dimming
+control. Internal volatile memory allows the user to store up to 8
+different patterns. Each pattern is a particular output configuration
+in terms of PWM duty-cycle and duration (ms).
+
+To be compatible with the hardware pattern format, maximum 8 tuples of
+brightness (PWM) and duration must be written to hw_pattern.
+
+- Min pattern duration: 22 ms
+- Max pattern duration: 5660 ms
+
+The format of the hardware pattern values should be:
+"brightness duration brightness duration ..."
+
+/sys/class/leds/<led>/repeat
+----------------------------
+
+Specify a pattern repeat number, which is common for all channels.
+Default is 1; negative numbers and 0 are invalid.
+
+This file will always return the originally written repeat number.
+
+When the 255 value is written to it, all patterns will repeat
+indefinitely.
-- 
2.39.3 (Apple Git-145)

