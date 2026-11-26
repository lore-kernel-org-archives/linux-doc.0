Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795698229;
	b=aUHtWuMxZ4Jv2h+V/Rf/Ppil9/Lg9alciF0Nm66IdCIqgsaTQHEt5cAR8ogKQWxsirEt
	 blHNueeN3rK6R1mdO2mJfKxKQBbOik+uXgxYMOoTdWa9YQxoP82SWDEQzD8mss4UA/bs2
	 2wDXPIYPVHi53d22P1ZghxXkPs41L7szEI9apLhy9Ps7WF4DXAn7+hHkgYdkxowtOcgcn
	 EWXxEDwtNyDYJT3Cl3fPqw2Zn51F0Ho/RYqWxutDuvF8vvkaE3srYu2UCxPz4ZUMRhW9G
	 eSbNKgwReftxsNUdLh6QaYIkRkyWxV7qW/65xTZWSmrR3mysm0xQSCHRMznx7mwPZrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795698229;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=OeRjPPZqNacTwo8Qqr0CJwW7bzppscpQmV9mkBf/Brc=;
	b=oI2sxioYufrALW0xoFurzIUfegXJQ9Iogn1QuGAIgF1w5wSd5+hwVobh4AH77LWiMnaD
	 2fnxlA8ha+N1CFp7Hg5EfHPSKL9zMqq/HtpvUUfUu4zg7YyCS22Zbw5JO9Qng1/IpgSa6
	 jp1QkZlhfqY6wXP8Bk3Bgh3SlCMBKwt2ndnA28htaX36mzkgJV46BG4GT+/s3oj0LcxcK
	 kjWSC5AYcHWxGP+6qfm5g87H9dXrsLGLEU9cqOuNAPfXrkwKi8SNTxL57y8Nop8/SMAOh
	 xYzQptlYCM2o+3cDIo3bZ6DxOQalOKJHmHPUK7yr2K8Kb7Xd+VSxauoHSjTM9mdrV4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tCSI7GjG;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0723E606A321
	for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 13:03:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0723E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tCSI7GjG
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb6886d30aso66706825e9.3
        for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 05:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795698226; x=1796303026; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OeRjPPZqNacTwo8Qqr0CJwW7bzppscpQmV9mkBf/Brc=;
        b=tCSI7GjGk0P3UCYE/Z2zC3FFcRRFNPQVRswKNCpXjvaV5wXDaLpeinnEhPNbANWZsN
         A1vLB6eJFQfLGxqlq7STxYaMU3l+F6RJOnE9ccVE74gug/pxkiuHmHF/NxAkdquR2LOR
         kCSmqA28ZxgRArJRu4YLsA96w2gyoQVVBzQBnoRrvOHahHWNeIhGGNoj+vYqafvgpzTY
         AhhIF5pWq9EMLt0IrkDWToPoKbRnvuqYV+CJBNt7t+X9Nozzmvygirc7qX8+q1SEOE24
         VGFP06eEjW+AosS+GgG/aIJWGJdc/9hKJ4OTB3zzvREs2CDaxM1/55zvCQJmU8D+Ew4L
         QfHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795698226; x=1796303026;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OeRjPPZqNacTwo8Qqr0CJwW7bzppscpQmV9mkBf/Brc=;
        b=brC4jAPZ7w3R8mCuKjV2SuIZCcgzr789rDi0ZdiuOUtbq4leOJPH60XJjkn3jOgiME
         lJd5jPZSokYQH1Qn7xoVuOzjBULD5pcZUSOx2vQlZPASzAEBcp9nRA6KeKB5PCbmgn7L
         u/4cqBJfPO62qet8YDdjhFT6CpjpRoHKH9t5qVz5IDoCGI3PXkuPsjn5KtbzGgET1UcI
         qnWFZZw3/iNsGVUqaV6VChaZMSR8qSr30tpk1lNO4AUNmNxt1sPPq0oe/ysXDWrNC+9A
         QrG6iM1SOGbcN5WdyFjXKVrQVVYJeOb4aSVZ7ImbEHacswYb1KZuZjpfU+mEkiYzvMUN
         dLAA==
X-Forwarded-Encrypted: i=1; AL+hErHsvhSa8OMYSeF7y9k1WJ1dRFxiNxMxuk3EO6Wgs7kOXAMsETh/PlEy/jKFv1hYgAw6L/jK/y787qo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8sS5T4rKKi9eR9NIZJz1s+0Ux8DbEoPbYZQDnywZi1ZuH78JF8
	rLiTsuyzM4R+ELBJtMOTuG5rVQBbw1fyePYogyO3CXiUMAIf07DEtWvB
X-Gm-Gg: AZFdTZehMhioPq4traO6m6zxA4rbMmEHOh40xeqvHm7vyNL3qRi9gEnOCBIFluwCB95
	GOJdrpTy+lgohN8KPuEAToQzKeXouvhpv+BSlHu0G2tO2qTuDIpLE5OY7xkIcJpzly0w5kne5jT
	2qgV90/TlCL78yAaqiCmu/PsCk2AEmQqrix2dKmItQwe4IuOTw0jATrFXahNOUj5sMViaNKzH+v
	7w52Ow+fW/VDyWtE72yWJa72bDsui3MqBX4/D3GAG8CUmdkL6SuM6SxMoY/erZrj15TksLUdmOV
	txsHqbNd1rDV1Pwz0MXK17HCQxQSKlX65A0FR8qKalQ1U1jMtpZqfTLYkpPaJBTZsm5fY1gqnab
	Blx2ASJ2cb6ZYMN+L1Vq5HjsqNx1tO0zqFgG4fOcqrmQXbxO8tWLQGUhhfVt77Dg4iZ6v36asJO
	z6PplTUWfFQy7UmdIgraFTuo+EtNYbVMtCfQZ63i9J5MUGY1fQGM9H1WINrOIA7tm5uEjcnpZ8v
	9PYSSMjIbH9OVgHeCH9FaqHbsPk6QSAW3xpRBury4brSNecw8Z6wchmqH3/IMD96qQfrHmMWPuv
	HInnRNlc83g750VzJi/+ISqGxVYxOozAT5dMYd7W/y8ELPkQQCa2t6teloh22fCA22OKuCkHaBQ
	hMUSpEjui+Mc4d2o=
X-Received: by 2002:a05:600c:8486:b0:4a6:4d6b:a840 with SMTP id 5b1f17b1804b1-4bb88819468mr432182315e9.31.1795698226066;
        Thu, 26 Nov 2026 05:03:46 -0800 (PST)
Received: from zeus.unificl3slsbnxe8mz.com (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6ae2dd55sm39331425f8f.30.2026.11.26.05.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 05:03:45 -0800 (PST)
From: Sander Speetjens <sander.speetjens@gmail.com>
Subject: [PATCH v5 0/3] hwmon: add Raspberry Pi 5 PMIC driver
Date: Thu, 26 Nov 2026 14:03:28 +0100
Message-Id: <20261126-hwmon-da9091-v5-0-0c3570ba9133@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/32Qy27DIBBFfwWxDjYYA8Gr/kfVBY+xjRrsBIibK
 sq/V7Y3UVRlN69z587ccYYUIOMO3XGCJeQwT7hD4oCwG800AAkedwg3tJGMMUXGnzhPxBtNNSP
 KABgn/RH6Iz4gfE7Qh9sm9/m15wku15BD2YvYmgykJIAOjaWcc1fXQyjVN6QJTtWchvp8tXV2s
 T6F6Xqr98Y6U09wK3uVrGE1hIKiyQXSunoTdnOMoXRIecHAGu17ozynxhpLrRJCUdC9klRwKaE
 VFq8mx5DLnH63Fyxsc/n/tQsjjPRC9NT02knDP4Zowqlyc9yEluYZ1i9wQyjx0smmbVRjNLzC/
 B3MCSVMaCEpF15Z8Qq37+CWUEK9BN4Kx6WUz/Dj8fgDiWJDVwQCAAA=
X-Change-ID: 20261117-hwmon-da9091-7aeeac6d8ef8
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Stefan Wahren <wahrenst@gmx.net>, Guenter Roeck <linux@roeck-us.net>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org, 
 linux-doc@vger.kernel.org, Peter Robinson <pbrobinson@gmail.com>, 
 Sander Speetjens <sander.speetjens@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2788;
 i=sander.speetjens@gmail.com; h=from:subject:message-id;
 bh=U0sVFyBC3QFd3x50V6URzXzlIDLOye/rcYLW6iCW/8g=;
 b=owEBbQKS/ZANAwAKAXjNeEUMBchnAcsmYgBrCC4x8u86m74sL2YYNiUcSPAW5L+l6TUbqXZ5E
 mNZvw2J2eGJAjMEAAEKAB0WIQRWUkqLABoRw+7JUQF4zXhFDAXIZwUCawguMQAKCRB4zXhFDAXI
 ZwUGEACO5KfOjKPSb0GGpDmYGtb4Jqi8x00+CRsbRIv2B/iCwnIbqgV8H0AKiBHygp2yGx8Pm9b
 yBTaH2fwAezjZeows5pbvv3daCCXNBsRl2PJUBRSWogpsbeesifseRm4tY25agNO7cBb390Z9A0
 juLfBKsJRTkTmC8yD3Y0UjIrQX2UuAVZlk/K6tQCruhbW5cm4dOQIIqi36YnvdQ1qbOQpTR//4P
 OKBGXbVp7ocFGMA3kUgOAjlSbSutnlKpukbo9dhDMxiBMpSJnS2MZTFsdOK+KMifQufI/0k2Rwh
 huIMmkAvdB0seIVI4sNEcLecLSWaZrangpzbxBT0eaE1rJMDfrCWPQU0eugp5i3r34FpqD8LK6P
 YBWjpPPLzI3DVq+8HFjU9ZuE0GR93OXIHC69W0t+yuGJHmcOx1jDEhb1yriuEEIeNNgau9EcLsz
 Cv0ZJv0PW5JigRl4rRqcoKZ/uf3mHRw0mIOcluoPl/evUGSryDfYN6uhtfaaL/gg37kfC3XMcnU
 KQxsaYDf0cdSqctKiZifa4IyqjS6X14xYUYhUXYiodtnkiSCCMc/uJ7nol7BtdodRigJuy0pEJA
 HvFNQ7W0obmOREl452Xr+4yMJOwP3rx24HoGvN9fV2YcqQo6BiItyhc9LYQdB3zza+Ea8h8dE3Y
 n95KUz3kU+wV4Nw==
X-Developer-Key: i=sander.speetjens@gmail.com; a=openpgp;
 fpr=56524A8B001A11C3EEC9510178CD78450C05C867

This patch adds an hwmon driver for the PMIC used on the
Raspberry Pi 5.

The PMIC exposes a set of voltage, current and temperature sensors.
Access is only available through the VideoCore firmware mailbox
interface; there is no direct register access from the ARM side.

A structured property tag (0x0003009f) was recently added to the
firmware. It returns the ADC values in binary form (index + length +
array of values), which is much cleaner for a kernel driver than
parsing the text output of the existing gencmd interface.

The driver follows the same instantiation pattern as the Raspberry Pi 5
RTC driver: the raspberrypi-firmware driver creates a platform device
at runtime, and this driver binds to it. All channels are read in a
single mailbox call and a short refresh-on-read cache is used.

The sensors are exposed through the standard hwmon sysfs interface so
tools such as `sensors`, collectd and node-exporter work without
modification.

Dependencies:
- Raspberry Pi firmware that implements property 0x0003009f
- CONFIG_RASPBERRYPI_FIRMWARE

Tested on a Raspberry Pi 5 with recent firmware.

Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
---
Changes in v5:
- Split include into a separate patch 
- Move the firmware registration before the driver
- Link to v4: https://lore.kernel.org/r/20261119-hwmon-da9091-v4-0-0d6e345c3666@gmail.com

Changes in v4:
- Fix sashiko reported bug 
- Link to v3: https://lore.kernel.org/r/20261119-hwmon-da9091-v3-0-15956035d7b5@gmail.com

Changes in v3:
- Fix sashiko reported bugs
- Link to v2: https://lore.kernel.org/r/20261119-hwmon-da9091-v2-0-d6c624272a9e@gmail.com

Changes in v2:
- Add documenation
- Split firmware in a separate patch
- Remove DA9091 mention
- Remove extra lock
- Use 64-bit jiffies
- Remove lookup function
- Link to v1: https://lore.kernel.org/r/20261117-hwmon-da9091-v1-1-f55f0af9c6a3@gmail.com

---
Sander Speetjens (3):
      soc: bcm2835: raspberrypi-firmware: Add PMIC ADC property tag
      firmware: raspberrypi: Register PMIC hwmon driver on Pi 5
      hwmon: add Raspberry Pi PMIC driver

 Documentation/hwmon/index.rst                  |   1 +
 Documentation/hwmon/raspberrypi-pmic-hwmon.rst |  49 ++++
 drivers/firmware/raspberrypi.c                 |  21 ++
 drivers/hwmon/Kconfig                          |  11 +
 drivers/hwmon/Makefile                         |   1 +
 drivers/hwmon/raspberrypi-pmic-hwmon.c         | 296 +++++++++++++++++++++++++
 include/soc/bcm2835/raspberrypi-firmware.h     |   1 +
 7 files changed, 380 insertions(+)
---
base-commit: 7d51eba9dfa7d30abab0b75570e9f7605366e45b
change-id: 20261117-hwmon-da9091-7aeeac6d8ef8

Best regards,
-- 
Sander Speetjens <sander.speetjens@gmail.com>

