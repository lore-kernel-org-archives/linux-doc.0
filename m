Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868831A9B4A
	for <linux-doc@vger.kernel.org>; Mon, 18 Nov 2024 14:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731941699; cv=none; b=VtRpvDtedAvibrGvonHX/MmCYedIlaeZhKh7r8y56CvLIiGQR2UaPcc/6YwmZ/kXwWXe2jV9JfeRGX5jXgVzNWZXp4esYbafRqDTQAk/a65Jot+IzixvXjYE3XooN6LadCMtQ9r7HM+y9c3OZCA4qamFVQ1J/HL8qShz/7xbmr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731941699; c=relaxed/simple;
	bh=pX/kmk4dMi+me3Tj39icaG8AADaQ/icrVmhqYu7ELFQ=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=EkVUVVnEJ7r1ws6Miiv2sTdALD6lK87qZIIFPy17NzAd3jYRUOPorCBdJ4hdTC9Xv0J5Ou6ANZyDr4X/6X37QrAmk4CLFNmtgo5LVtJpuzFS9GndiJBXKtdGcEvTVzChSZz2kllDyppBh64tW1JtS0O1rXBaxY2PmPylZaxLC/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk; spf=pass smtp.mailfrom=remote-tech.co.uk; dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b=YM7I9hXY; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=remote-tech.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b="YM7I9hXY"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-aa3a79d4d59so708973966b.3
        for <linux-doc@vger.kernel.org>; Mon, 18 Nov 2024 06:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=remote-tech-co-uk.20230601.gappssmtp.com; s=20230601; t=1731941695; x=1732546495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=rsuZnZU2NXOf5EqgKE4593+R4sGiA8pml1jXet44X9M=;
        b=YM7I9hXYSM0PPXUdSDRpu4tk9bs+YUTh3O3xq5ICnq917dEAa5QBAS+1hRMOSQdOQI
         X4c4qf/0lBhn1UXs1Zb0ayhu8vx55G2o4zpTy290KoNDbsU4/V0uOyoVcetHnNsDjkmR
         AjIkCzRhoM1yvq9o1TMshBbjoqfXYj+FvyWRuc24PvBiLRHQbpv/t1kGZEiG0Vzb9DYU
         PPso4cSItSyA91wX4TDYtR1o77IkjpgUNwpis79GU+jKgvVYqYAk8kkLWb2RoBvn8H1y
         kiWenoAZ4SL/30RPK4Qw5IpTZ2br/dLkTZ0kNV589qqgWK4ri2lnufz80wnbXj9lVFyr
         Ph6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731941695; x=1732546495;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rsuZnZU2NXOf5EqgKE4593+R4sGiA8pml1jXet44X9M=;
        b=uhCeTBCfPkM+iBOElu334Td3qQv47VhkeZF+q80PdPqK25yiqdGt197AM1Luyn9jUY
         /HAJJ5ekpzXZVs8YfwPZlap03k7XWH0t9yTjKTAXuHQLYeNuth+o1Tf0E4oz6NUUcRcx
         xBFMKdRoXQia8fkGQZgVig6T0jI3i8wqWX7reJdbjtWh+xDTZXZ1EqXq73jNf8yDTFV8
         TCqiyxuGPHFBj48g70RCVu12unRLR+Fs2YQCWkKBLih3/8aYK+tGiubtNvb1RR7WjAtO
         9gaDgDgpCH5mmIBx4YGlxBH9T1t/KT0TH1b7mGZ0g7+O+avLyJeH2i4fwKCYy0lY3D9t
         Uc4A==
X-Forwarded-Encrypted: i=1; AJvYcCXMdLWI4dQLP+me3+RPqcMGBazMF+FG7vVrWvyPXVBPZwXP6dCgGW5b1OmezIo11dq7Uz/Pp5FJ9F4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu2qxXeE+n/xszaKO/BZahte7gIndKDVydRYyMXUrcd2/QODzq
	jPLkMKEjksVaIO1Bho2p77QGbXaFvnsvqRZaOjhn9PsQn5j7Cumc77FOEwjNYh4I0qgOBizz9Fo
	WWjK4JGusRvKffSBSmHpQvDH79/wJSidICFU3o8F1QWaAdgCr2pctWM5i23qPuAEDN811m7mH0K
	wljGSUs7MfZGvYM6SMn5jQr5jxFG+CuwbKsIdq
X-Google-Smtp-Source: AGHT+IHCB4Wc32uEHZri4oww6OJhPXtytvSqmqVrU9ZKviS0h48ZGxo+7ifzbJmdixx5PpIWTHmi3w==
X-Received: by 2002:a17:906:dc8c:b0:a9e:c460:ef4e with SMTP id a640c23a62f3a-aa4834824b1mr1321963666b.32.1731941694872;
        Mon, 18 Nov 2024 06:54:54 -0800 (PST)
Received: from localhost.localdomain ([178.27.36.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20df1b642sm546125666b.40.2024.11.18.06.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 06:54:54 -0800 (PST)
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
Subject: [PATCH v7 0/3] Add LED1202 LED Controller
Date: Mon, 18 Nov 2024 14:54:42 +0000
Message-Id: <20241118145449.7370-1-vicentiu.galanopulo@remote-tech.co.uk>
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

 .../devicetree/bindings/leds/st,led1202.yaml  | 132 +++++
 Documentation/leds/index.rst                  |   1 +
 Documentation/leds/leds-st1202.rst            |  36 ++
 drivers/leds/Kconfig                          |  11 +
 drivers/leds/Makefile                         |   1 +
 drivers/leds/leds-st1202.c                    | 510 ++++++++++++++++++
 6 files changed, 691 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/st,led1202.yaml
 create mode 100644 Documentation/leds/leds-st1202.rst
 create mode 100644 drivers/leds/leds-st1202.c

-- 
2.39.3 (Apple Git-145)

