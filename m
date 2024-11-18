Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781531AC885
	for <linux-doc@vger.kernel.org>; Mon, 18 Nov 2024 15:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731942774; cv=none; b=i7b/Hs+wd5YoE0fBFseZ5MeaQihiYcHdK+Lf+wk8n9j5lwHv7cjYS8XwFVIwPFYKvcwSTChCFNgZ6oaQNGIHi9PO5/ZzDI4krjezZLPrHoDIIr1aMTPQn7Ok1A2S3IM1tB3s3oqmAssQymgDwM2AW7Lf6DkAEj/MJDmIQo7zIew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731942774; c=relaxed/simple;
	bh=abhX0e8c7pOXK+VqgphQUVBQ5sBLa4mph2cyW0j392o=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=dhiZYL9EhhOXNNUUMCYDQFgVFgiK6uey8tLX2s9Qm4B2nel3vVs/IosNlfXKErWLTNfrN+50nSaZKQJ/+n7gpe8HdT2szI6Q5O5j2oh17JTUC1ufel5+0bUgcsMV7HIQkEvZSKZ9SdqWR4O6uq+LHGvoh1mNPC5AdT8rQIUbKU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk; spf=pass smtp.mailfrom=remote-tech.co.uk; dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b=YfUeZ2P5; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=remote-tech.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b="YfUeZ2P5"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a9f1c590ecdso580601866b.1
        for <linux-doc@vger.kernel.org>; Mon, 18 Nov 2024 07:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=remote-tech-co-uk.20230601.gappssmtp.com; s=20230601; t=1731942770; x=1732547570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bv4wgISV7HkP4RZ5WKLIykwWASiXxKHjaIhIuwDJQRM=;
        b=YfUeZ2P5ucb1jQGZw2n1Js5S95flnPM3kKiwvB+5+1yaSafH2k3P9zB1LGroO/lHeR
         Cbd/12Ldkyp2k4+uExiHmxTkEtUqcA5iNRbBMPpe9BiMfUXw12Mce82EoviFao2/Gggj
         TS02UTglSBOiZnbIJwELiy4UGdcLIhNyFCVeb98Q41Q4hz4No0n+k6OU3/VHlEJICF2G
         GAA+wRX2f75e0YwOjKpN6ILTNYtSuCV9RxudEfVNZhuqQJGNoAzMm1vM0KfXVYfH/Ts5
         VN0TiKz9xdvCBct85PdWwbnKlWAg4lCj3QJtXSzjprpYYo/Xe1CyteZi0EtCrk0CdAP5
         xf1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731942770; x=1732547570;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bv4wgISV7HkP4RZ5WKLIykwWASiXxKHjaIhIuwDJQRM=;
        b=ZkTj5V8s6hYtaXVY3Gczzm0WCgZ3kc823gSoznaAwTPwMh+1iWSjTve43r8yHzFac7
         IU/0KCFcxaqeHnMiJqdLr5AHSYVLSih6zeTsXIWMt+uwyrE+Egy/nFTNAh2ndZ3XSUHC
         9cUd1ycYbzClPE42vNihcJww4ATtjc8teCMNESxJIWBEzKyCY08ftEhGgw0D7H0wBIKU
         AZ/Cyca0cXVmhqxrv/yh02Jams9A4q5y/HgDmnQPqD1pt5IjGwcqVfb5j12UMangLuKn
         OsDmePENW9qmpgRNJnGHDMetsktWyfNDMxcHS4NGrAvxOE/oQRzcrC0e5t2jwXmRZRv4
         W1fA==
X-Forwarded-Encrypted: i=1; AJvYcCX4RpSjkauIwUFAYT95fvM9V7GbAYl4/ORCfiRVAxGXLGYNd54g4RKN7b5ieXhk7fgcnyZXqjecQDA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz93ch0JfuICcRyF++9NxBsUBt8jwI5kOxScv9B74jgLdI497by
	dR2I1xW/pMLLolcSJJr6c7GcqjSzlvdz+hsdwNZygIgUFRIx5MH9XCX8p7meaflHMkBCvV+Cv76
	AHHvQppQl/x0wHKfuZslmlEF9fd0NW48zoC/qoeVPq/7zs8+ETR2CSsromVWQoP18Yd57FCG56d
	VpSDZSK0hGB+rDsqF1i5AMCdE=
X-Google-Smtp-Source: AGHT+IF6Rm8MuxsPIjT0zsN40PTQnBeCMXAycI3c/kSxHlnk0GoDUdvZkXlmrMv+2NqSQA5xVb14Pw==
X-Received: by 2002:a17:907:3f04:b0:a9e:e1a9:8ddf with SMTP id a640c23a62f3a-aa483476164mr1190902366b.29.1731942769788;
        Mon, 18 Nov 2024 07:12:49 -0800 (PST)
Received: from localhost.localdomain ([178.27.36.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20dffd7e7sm548980366b.119.2024.11.18.07.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 07:12:48 -0800 (PST)
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
Subject: [PATCH v8 0/3] Add LED1202 LED Controller
Date: Mon, 18 Nov 2024 15:12:40 +0000
Message-Id: <20241118151246.7471-1-vicentiu.galanopulo@remote-tech.co.uk>
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
Changes in v8:
  - Add change version history for patches

2.39.3 (Apple Git-145)

