Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32AFF1FAC48
	for <linux-doc@vger.kernel.org>; Wed, 18 Dec 2024 18:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734546013; cv=none; b=qtfxW5i5e7nQ92N8KIyeT8EszBRfAF8e9witEyTVXse7Yb5NZ4u6xgilpcRfO/rTJEqgIAVb2jZZLFBmc4ZzwCpSc+Py0rf2StAJwIhCLbUvV0szwpQ+S0W1b2fHYQcfQr75Zrt79Xt9k8/EeyftAkKMAjoO4yibZvrORclPinE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734546013; c=relaxed/simple;
	bh=yUgm/e00b9okvL8FQIt1pQWjJRf7o7EajmQsEBPWpCM=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Dm8BodPJwxtxDcUUAKJCl4Vw8JEM3zYxhq7T9p+TmB1mVCsexTA1yXz0wb2H/7OvkYffVT3+Sdl7WNDE6sNI8IPUJUy5wmQNPGs7kDbFbW69WAIBeB3K5aswxZhqxSgz1LKkYAf52MBBq7+/0hXVM5C8AjoAQS70XnK2P/FxUd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk; spf=pass smtp.mailfrom=remote-tech.co.uk; dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b=lwy+j4Wc; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=remote-tech.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b="lwy+j4Wc"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aa6aee68a57so1003317266b.3
        for <linux-doc@vger.kernel.org>; Wed, 18 Dec 2024 10:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=remote-tech-co-uk.20230601.gappssmtp.com; s=20230601; t=1734546011; x=1735150811; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4xgYTs1uKZic+a0Z84dr8kghnwyat7Njf7fQHRkX1TM=;
        b=lwy+j4WcrtJx/LRKjeMBfjtnk5Q+i+uggdhpnaKngFK2Ngq48KInFL/3kre8g+WQ2N
         Xrvtc44IjuxC3/Um/aGKVJnIUIbYaC06PdU+pqAE+CzXkOKFQSnLnKpfOkvwZhPCnDAX
         QaVX8hjGdFJn0NLlK47BJLVZocmjM5hIG73kTtdp9e+RqlBc8pgn5BEYDaOiIIV6dGlV
         4zJS7UAJDmdcv9/sp4Csqeqys7SiGiQVyVytcOJ1opClBNiqww2yyQO4XTK86JgrQu0F
         CcNLupHpGU7qu+4AeWSv09JYlSgcU8kBo9RYvcKAhnLV5sL7Rd38hgYZuZZtJKIMrFah
         a+UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734546011; x=1735150811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4xgYTs1uKZic+a0Z84dr8kghnwyat7Njf7fQHRkX1TM=;
        b=OXqJ/TEuEHcwrAI1PwaSyT0WaBCkN5jiXjabalp7ZwmMdx0B6fKdfPHwc18laQM13R
         tapb2yzILTrnOkwu7rmDHFXjWaOfAAjgIBBMMG8fKhYY4zw+YoO0Hn5hcUUEliHdOZ+E
         9TmppHRRctSTgJMKrkIcgS1lXAVQOfzOKd0sgcyCJTEZFT0zXIedX0qKpsc4Td2UQWu7
         Xvm8x5VGBRYTseqC+k8qf8Sn1bVqpCNUx3hIQfjhrW2HT99d+tGMqEiXv9QD1eIcaZrE
         Eq1yFpJl+GdX/6cewkaVIwOnIABJyrgvvVKrSq+RQxaRHysEjeSZp3WxXe4gw+5SHLr8
         wcQA==
X-Forwarded-Encrypted: i=1; AJvYcCWHaYWbAY1nwBR0R6NZ2jfTe3WF0w8qlvBcSUaaM5W4ud2dPpyCdwtReNA2OBUWBOnm+fCjGsWUx60=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5Gt1gVVBMXvjL5M5ti0ZSXAijNT8k+ms9N8xdHcirWFnyG3WD
	4rvu5LRg66y0Hl9rMXO4nBOUpOD8e8/eQJHEe0j/sSGqQdWG0WDu1WFwYyqOtJrv5Y78kkLE+Ou
	SWZng/U7Fw3JygfiW6DwzMzTJzGd74d+84ROhRPEyMGws8ysVy1DTcevaiEI1Tc8b6xTn3eH70r
	O2fUvOeJNn5gNsn04sk/Vt6GQ=
X-Gm-Gg: ASbGnctFM9s92h8QggVRHenjYn8gdsWfZJGR72wGkW/sXDSyf/m74lUS0mdtHj/boyi
	P+k5x1bPiQ+TNl4QWgfuk2fnkAmHTEMJTKJ2/gTDD6oSaSKnbSOVr6UQ43qFChsOo+Lzj/JNFvv
	z8Oc8TLyvZilILENg+4jjW3Gybhw4ZosnOxYFeZFcC3JrOte/fU9bDFGueW+eps0iRsSB9rU2Sh
	9ppBgnFbitbMAXRIvNu0y0G27tvAs3P3h5hJj2VSqAfVHUlxOnGhfyOTLV22kOdv+kYWtDxOsqp
	CJJBam49/vPHzUIvQDk8mEIkYMq77kK0
X-Google-Smtp-Source: AGHT+IGqkZCbHBeaeQDkO34rckU4JQ+A5yErdOL+yP/X6itJuFkgf6vt4ylr0sO5NrVVZ7UUhNuxRg==
X-Received: by 2002:a17:907:7850:b0:aa6:81e4:99b5 with SMTP id a640c23a62f3a-aabf471f8a2mr370930466b.3.1734546010576;
        Wed, 18 Dec 2024 10:20:10 -0800 (PST)
Received: from localhost.localdomain ([178.27.36.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab96359fdfsm584825066b.93.2024.12.18.10.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 10:20:09 -0800 (PST)
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
Subject: [PATCH v10 1/3] Documentation:leds: Add leds-st1202.rst
Date: Wed, 18 Dec 2024 18:19:53 +0000
Message-Id: <20241218182001.41476-2-vicentiu.galanopulo@remote-tech.co.uk>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241218182001.41476-1-vicentiu.galanopulo@remote-tech.co.uk>
References: <20241218182001.41476-1-vicentiu.galanopulo@remote-tech.co.uk>
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

