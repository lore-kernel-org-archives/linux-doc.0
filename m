Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7714B1AE875
	for <linux-doc@vger.kernel.org>; Mon, 18 Nov 2024 14:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731941702; cv=none; b=bINdjva7RDDGQf14i60NQctHxu7BRJKMQTt7C4Muj3ruMkT2RqnIzR6ahXrCXYIEXoECbov3NOcASKy6pl30xZwoYgnjVulcAMuGC3wGYX6S8a8SuUhifGNj1T6/ddoiqZ9OliXB7uROzSxygZrW0gh/z2VbWXbZYnmstDe30u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731941702; c=relaxed/simple;
	bh=BjUHWeRL5XhFoFRQbACC2LDGQOEjVIksyw691+eLQ00=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=utkWZohGL6b3GYWSbwITeCbNLsj1gs/kyoPBHXBfDG6+IFJcc9j12ffnMgpuimKEXB5rtj2CCKGWJwCAXXJ5jWIh8Fqi33Vo5n32DhtX1yvIyJroxSGaDrnQLsVsQYwgdU/armXaT0RQcMsLaycgY1k2TsQT1NfaW9aKR4sYEkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk; spf=pass smtp.mailfrom=remote-tech.co.uk; dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b=nJ0hICrP; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=remote-tech.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b="nJ0hICrP"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a9ed49ec0f1so746094666b.1
        for <linux-doc@vger.kernel.org>; Mon, 18 Nov 2024 06:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=remote-tech-co-uk.20230601.gappssmtp.com; s=20230601; t=1731941699; x=1732546499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rb5KhQmw4LslJ+rFvwG7oSd7/IR0vOX8Cf3hoYX7Tng=;
        b=nJ0hICrPufB4tMHHl0kCWKaL2Hv09jGWCXnSYjZMOi5CtWSi7qkAc9GHA2sQLB/l3U
         00sO3s5UWOJzesBqKTl76BN+95t5OWhiBxFTcwP3UganxQ0+uwjIdjZgnjFc9VeX8eDu
         Vhg2gwzKN4izAbRAKxIcOcEv2LVR1TU4XPdVrq7w7cPKZx/kZPumAhqIvHJhvCuDQdws
         XR7FLItvYyc5a6wuamkvjYdv4LTwrCFPEBLUR4pjtenJzeB/AUa3n7V7EvnMPFYvncXi
         vFeOuXQvE11XtM1+KG50IEjrobfLceFyxui6gRkX3lfnb0IyvngsfpaVh6Sf7G1T7MDU
         C/ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731941699; x=1732546499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rb5KhQmw4LslJ+rFvwG7oSd7/IR0vOX8Cf3hoYX7Tng=;
        b=h8D0MNLFfEoyU2C7XUq3mgXYf8AabUfUlzgz+FWicdj6eUW054z/xF6DgHHkhgU1a1
         w929O0biUu2pCY5la/1WzX2wqqGJJu2w+cA1nQKgWArtkZHOWaj8gO8PGmTOQIkomUHJ
         EzkTWBfAIVPB27DP0jz6IAG3VDPmb09QESKs5JuHw4AT83LpMbSQPW5vydhdmke6998H
         Dl3KNFm+EA55hIGI2mMgEbAb6XSNAEMF3C8ZaNknLKVk+sl+9Z+Hx/19npGb0a4UDZbu
         E/NCJ5sUp/hyvQFRmsnbXgdAk4F6wNzIkU72ysIXj1HvWY5h5i3kzTZg8Hrt2G+LCB+a
         n/FA==
X-Forwarded-Encrypted: i=1; AJvYcCV90UU4LEvV35OsAaIRwiKBTYZlI7OtSKoTJ3PSynIiN2QRTp0b8a3eJ7kQEshg3T834xsLoAzTus8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzgdf822uxMjyMCGAbG8nBi+OdCaV/IK5BQE0W6TyYVCxZjFLF4
	0mhvZk+/9D60x0FtNyv5/CsGDarmYQMP447QGfjK5VpTurgPqUrpCJxxkFHogRn4O8JwoZhUddf
	3IEjVHtQj+HTyerDVXSLzPHBL6rT0S2aL4OxwKQvrYhedVBetFoCc5YumozM0wbdJFcDdUtpt+Z
	+FZ3fdCr626J1jil723bJZyy8=
X-Google-Smtp-Source: AGHT+IGakfYoRwIFD+fAHqlh39MXBNvGeTyqIDQ/4FiU/c+03NRrIZyHHule8AgQu9QGgBrK3+YxFg==
X-Received: by 2002:a17:907:3d86:b0:a9e:c446:c284 with SMTP id a640c23a62f3a-aa48354f048mr1218450766b.55.1731941698849;
        Mon, 18 Nov 2024 06:54:58 -0800 (PST)
Received: from localhost.localdomain ([178.27.36.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20df1b642sm546125666b.40.2024.11.18.06.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 06:54:58 -0800 (PST)
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
Subject: [PATCH v7 1/3] Documentation:leds: Add leds-st1202.rst
Date: Mon, 18 Nov 2024 14:54:43 +0000
Message-Id: <20241118145449.7370-2-vicentiu.galanopulo@remote-tech.co.uk>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241118145449.7370-1-vicentiu.galanopulo@remote-tech.co.uk>
References: <20241118145449.7370-1-vicentiu.galanopulo@remote-tech.co.uk>
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
 Documentation/leds/index.rst       |  1 +
 Documentation/leds/leds-st1202.rst | 36 ++++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+)
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
index 000000000000..e647966e496c
--- /dev/null
+++ b/Documentation/leds/leds-st1202.rst
@@ -0,0 +1,36 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+============================================
+Kernel driver for STMicroelectronics LED1202
+============================================
+
+/sys/class/leds/<led>/hw_pattern
+--------------------------------
+
+Specify a hardware pattern for the ST1202 LED. The LED
+controller implements 12 low-side current generators
+with independent dimming control. Internal volatile memory
+allows the user to store up to 8 different patterns.
+Each pattern is a particular output configuration in terms
+of PWM duty-cycle and duration (ms).
+
+To be compatible with the hardware pattern
+format, maximum 8 tuples of brightness (PWM) and duration must
+be written to hw_pattern.
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

