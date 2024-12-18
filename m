Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6FF514B06A
	for <linux-doc@vger.kernel.org>; Wed, 18 Dec 2024 18:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734546848; cv=none; b=hnqwMVJVTPyW+kZt0QZYTN89fW9lvRTIRjrBSV+M7bzVMW5YnuEZ9luiM5ddffg6i/FpG7evPZc0uq2HCfJAn2qTfXBo8CPZ8tjLubz5UInzH5WL58DjzRvYsNmiX3ejp2NBp9CnoWvrfDBezwvXrAKKNT0LU455D3vJoQ/5Zwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734546848; c=relaxed/simple;
	bh=ZwPHIRSgcHchgzPbOnE6MDpfrdFaHBQfvVCSdA9Wztg=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=h5FUslUiqiBVKHAJwQzvROHHjbiZfNMTRPGAL6gInHWy21qRIwI9L0Hx0PQMg2MN4GVli/xxP2RB6pHXDh8tP5XjpRiSYpDOFnv67zuJDsa2TvavtDeY00dpKtr1NtScswpcwZhXMQrwF8kT2fzuHZYbd+ZY2uHYsdOj1rfVtJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk; spf=pass smtp.mailfrom=remote-tech.co.uk; dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b=dj5TZuUT; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=remote-tech.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b="dj5TZuUT"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aa6c0d1833eso1221500866b.1
        for <linux-doc@vger.kernel.org>; Wed, 18 Dec 2024 10:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=remote-tech-co-uk.20230601.gappssmtp.com; s=20230601; t=1734546845; x=1735151645; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=lKJ9++QatzOVaiEHtQl8i8T+s1fyCP259nh7H9lhb4Y=;
        b=dj5TZuUT1bWeMPqIFttPWQMGgy8uKt4f4/85akmRGokTJ6nd4xrKU9Srwg7g02MW9r
         5oiXV+fvj4YXuS0vXdDi0vklrD1wTWDOP8ff6zijVF0rYpPK6VClmG0HElJogh8TflMg
         bJAWzQf7eKR6YlU8hsz4xGgatdzsZ0ogOQih1rsp02I8L1VdjgJw2rWnfYY0XfSDy9mi
         4XJUiDGdDHDb8LfJZPn0x0W90Vyx3TC1sbTJX1KvEPNipt9fFxMv7u+mF0PuWVzkf9Pr
         FzSVirsfnySRHOKEPr0sxo1fAO/IWyhUzsSjG16bJaihRkGwD7i7jbIlRbbhG+talJnH
         RkZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734546845; x=1735151645;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lKJ9++QatzOVaiEHtQl8i8T+s1fyCP259nh7H9lhb4Y=;
        b=ZtVIS/fUpxl4z16kRKG/l8hl2xZ1PXmMTd6x7xLSxVwRaGH5ewKcA7GUZBQat8XRM6
         aSIftKCG7+8n86mH5+VwzuAbtMEV3X3Cn9FBOlwi4OapkwmbNpiTvpTGBnX2BJtfVae1
         /Dvzy1fw+ny1aXpVEnY68nLsRTqKZqbjvjVA65st8s3GGmB3rDooGz67YcCWYfZ4kbMh
         2XlbpSZCtZa+TeretaibcOsxtOd+JdcYCQA4s2utb3R8QMPGVkOGLJ0r7QqfhIAaucsk
         vSxcxmzUr0TBl/zlkrVK6G5igO7BVmzQE2cmIBJCkz9ENij856hcBJ8Pd9XgSJRXWCkd
         iHmA==
X-Forwarded-Encrypted: i=1; AJvYcCWXtfb30xUoeSh2ffCobA61hQwpkwWpH3xZpdOZUOJ+ka/54alhRadLq1gRuNH5b4sG1LzRZk0ffZ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCuO4yVPrdJdeSDtjqKkzB1sEmj1oqgw6pfPGvAhcDX4exXNrw
	eThs8W3p10qcD/51Xm/tcXSNCjcdAt0YJQ26BxcLy5f1xtIP13S/7TGq72e/pKJ/B10J7DlKrd9
	HfnDH2vvhW9Ojjc9y2LIwdSyC6oxnXz/uo0WblpmgW1Ip217WG0DhS+LT7LBxmUNF1ElvEj1jHV
	CkCgWaow6m+H7r7EhSOyHCV3E=
X-Gm-Gg: ASbGnctHr52dkJzLFnTyfvZlhmp/WM1XAwR2FRWFf9Cg+I0KJz6hqoG4xf63LtrUPpG
	NWHqNNohRU47v7YFB9MsoEoWZGVj5bOTLk7/66cQv6+9y1IAm8jSVelEK2efCHHdnOQ0mSdeVcs
	iegF8JSpaow6PJNk0wjRDgefuYfPM4uKowJJb1MNidTqaINchEbpwDUHkeKDbNoLR1FW6aPbjFR
	TA1NbwavauKrpUgP5Bb1dO27M8x0kBjleQPVp2/QymHpq/fifeglU2p7rLKamM7/i1ZxHaq4rHo
	3aYHtGjFmvp6cKAmGd4tTvADT16HuEYGWdOu1nQF4J6qpFx+nr3euvmNpJZqGCWNLtjQVIulWEJ
	A
X-Google-Smtp-Source: AGHT+IFgz4oTm0bhEwShmLzCO68c9ozstI4NZkAOdhWqnPdWVYPEqC37W2hJWwY67bQN+jIYR8b3Gg==
X-Received: by 2002:a17:907:7813:b0:aa6:81dc:6638 with SMTP id a640c23a62f3a-aabf47573c0mr369610266b.16.1734546845193;
        Wed, 18 Dec 2024 10:34:05 -0800 (PST)
Received: from localhost.localdomain (ipb21b247d.dynamic.kabel-deutschland.de. [178.27.36.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab9638ec53sm583873366b.156.2024.12.18.10.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 10:34:04 -0800 (PST)
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
Subject: [PATCH v11 0/3] Add LED1202 LED Controller
Date: Wed, 18 Dec 2024 18:33:56 +0000
Message-Id: <20241218183401.41687-1-vicentiu.galanopulo@remote-tech.co.uk>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The LED1202 is a 12-channel low quiescent current LED driver with:
  * Supply range from 2.6 V to 5 V
  * 20 mA current capability per channel
  * 1.8 V compatible I2C control interface
  * 8-bit analog dimming individual control
  * 12-bit local PWM resolution
  * 8 programmable patterns

Internal volatile memory allows the user to store up to 8 different patterns,
each pattern is a particular output configuration in terms of PWM
duty-cycle (on 4096 steps). Analog dimming (on 256 steps) is per channel but
common to all patterns. Each device tree LED node will have a corresponding
entry in /sys/class/leds with the label name. The brightness property
corresponds to the per channel analog dimming, while the patterns[1-8] to the
PWM dimming control.

Vicentiu Galanopulo (3):
  Documentation:leds: Add leds-st1202.rst
  dt-bindings: leds: Add LED1202 LED Controller
  leds: Add LED1202 I2C driver

---
   - Changes in v11: Add version history

 .../devicetree/bindings/leds/st,led1202.yaml  | 132 ++++++
 Documentation/leds/index.rst                  |   1 +
 Documentation/leds/leds-st1202.rst            |  34 ++
 drivers/leds/Kconfig                          |  10 +
 drivers/leds/Makefile                         |   1 +
 drivers/leds/leds-st1202.c                    | 416 ++++++++++++++++++
 6 files changed, 594 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/st,led1202.yaml
 create mode 100644 Documentation/leds/leds-st1202.rst
 create mode 100644 drivers/leds/leds-st1202.c

-- 
2.39.3 (Apple Git-145)

