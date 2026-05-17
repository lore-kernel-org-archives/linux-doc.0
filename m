Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5AE633F5AB
	for <linux-doc@vger.kernel.org>; Sun, 17 May 2026 17:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779037287; cv=none; b=RXGSLqSHCAVdJ6QKcxHqOGzRO3COyMkUHltLCex3395UtJf0rxzQ0JHrYuDFabNMDkJJdb2l+eP0fpEChCA/E2pTeArno65GtHzzPuBwKM1cr09mBUIW3YgtDVCYQVYuMAi0msWeyNPCLDEU+4PvNsd823UZtZgh+P4S3OP2dDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779037287; c=relaxed/simple;
	bh=tmhO9ONS+I2ZZ/ogSFXIuW1oh1JcW7wCHoXai3f3evM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=H1ODJp6m3r5stnq16JSG5665Il3VJO6IHaZ11c5wDzLYtWDwC63ywsLHPMenPhuTYqp+FQQDmQv7RYhF9/3AHyIaqIpOYfGE5mRynn6lMbLPNGfqKxjfi/fRV8dfWygnQJLYc6eGbP0SBZnPWq/PxSYV6rvR9OtYNdS2HmjhKBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=gFFyo/bz; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="gFFyo/bz"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7dbccf6a23dso1389606a34.2
        for <linux-doc@vger.kernel.org>; Sun, 17 May 2026 10:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1779037282; x=1779642082; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eHtZ1FRLItPRp/kCXOsjA2zW8HDB2xesQ4ejF3mSkns=;
        b=gFFyo/bzImcHmaVgDk4qOl1DTt/ieApMUF8PkY4yrZvqIr5At4+LNVPS+F5tPnh+Bc
         6I24Bu2T7jZ5KMzC+gHlCePzc3ayUMUR90P6b0PeHf+bnjtJCZEdSjlPLA0gVHHDU7av
         hJ65EoxJtBJIYRloAyqJl0Q2NvgrDFaWjzoYfLEsztnEbE7b5kmzD7nUELi99XNtKuJf
         sOHFhZH+u4SrVUUFmklfhVZDt6q+ez7n69ULDCrO9A+XCbMq2kGod+/G7LimI6zQnPn3
         HPLusXrGLptM++JWzkm5ashf3TtBftp1VqDDEvhLb4YSb0oUTV7nq97TVW5RD5TVULpQ
         68vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779037282; x=1779642082;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eHtZ1FRLItPRp/kCXOsjA2zW8HDB2xesQ4ejF3mSkns=;
        b=Zl50PYa0T6RYerWAtuIwDuYrnOfTDKyLlYghzNEbm31YDRwf3z8LmOM+OzNV4hgJig
         1F1hX9jKT0DbWVmtXM4ZB3VuS2glnwzqVJLJRksK3lUGAaP+M54WhemmtlnnHVmHQmDa
         ES7N4xXHeWeRtvDmlJCgUXK671x47K6L/qXaswBOWcpG9ChBj3R/s01cSuJ59AH05EVA
         xdZjLhzSYNMRMbYi3EFxnPmdlIK39+4j9mK3cQbUrA7yeVkj+dB97/ldmmo9moNvfjQG
         qhkMPb3q0vjAVlDRYtOqDpijUS/L+o0ewv361fza9TrYgLoHRcb3vioUg0ZoLAoesC+0
         wV1w==
X-Gm-Message-State: AOJu0YxV5Rjy6fk7m+eWnd8dl8b8djaHKrMboi+wn+sAiwNqjefZSCrx
	zEAYoHv+eFcU2BIX48xszvOEqqdA/kV735WMPSUmu87brYakO948CTInPsJDwYzn9nY=
X-Gm-Gg: Acq92OGOMfjA0AhNLl4ztmhLEULQNBKJw3Wep0bMsZkI+/7wBM53jB/3oy0dQmj+bw5
	FRaKq/DO/auCV+upom6m4SBCoNhBEStcdGW8HnuQkiPxQDPXRecMXZ+/5sUDKua5jHQAVs684eR
	7Fak7iib2tLdcuFv9z5U6t7ydrliw7/AVlDjlNUe3neWW49l/WfqxVyr6FhKaN8jjtQyorhGcf+
	PNnB2FaPfTICo4EaZef+TvAr/yAB+SthAR8HFUP/kwe6jc5ZZ9vKsGp9Ppnhdi3ryXvo2iHshpt
	E6EH65j2vGvry81VovvUPrN/vuP+JPAV1feMtpQjWjJZYVDJ93o0FdwisrcpckVA/X3wKJHFewF
	2U9AQ+Jtxvc+Y9UgPaR84l2oK5pSp19WDewE7Qc4XEAqHGlYIUupyODfQwQB1lzJVxlPIc+T7CJ
	aD85OWkcOW/fzvE6wpkbW41YcgDjaStZw5pYWzMg==
X-Received: by 2002:a05:6830:4118:b0:7dd:9b19:a875 with SMTP id 46e09a7af769-7e4ea0529cdmr8843719a34.2.1779037282041;
        Sun, 17 May 2026 10:01:22 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:7a4b:ddf0:f61:f58d])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e55b7c68d6sm5890859a34.3.2026.05.17.10.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 10:01:21 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Subject: [PATCH 0/2] docs: iio: update dated triggered buffer example
Date: Sun, 17 May 2026 12:00:57 -0500
Message-Id: <20260517-iio-doc-triggered-buffer-update-helpers-v1-0-7f00d4188f6f@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNQQ6CMBBG4auQWTsJoIh4FeMC2r9ljIFm2hoTw
 t2tuvw2720UoYJI12ojxUuirEtBc6jIzOPiwWKLqa3bc901PYusbFfDScV7KCxP2Tko52DHBJ7
 xDNDIcD2Ol6EzgztRqQWFk/fvdLv/HfP0gEnfPO37ByfuTjqLAAAA
X-Change-ID: 20260517-iio-doc-triggered-buffer-update-helpers-ef7e3895c9f4
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-iio@vger.kernel.org, David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=757; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=tmhO9ONS+I2ZZ/ogSFXIuW1oh1JcW7wCHoXai3f3evM=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqCfRM1LWCrjB+ROYhux20WhU+SwORuzhIZQO3S
 KLiHPPhofaJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCagn0TAAKCRDCzCAB/wGP
 wPylB/9wiTNT2XhBbdQ8ztto0m10cm30vTO+JQrjM6aswOjtMrjtDqLf7I87nUqvbKM8q3HBy/a
 UEfuCPP59lT+woFvpVfrm8kDRNRIOBNvN2q5uM0PqFUstP45GXb+KR66QgVkYGEO+9k2y+u85qZ
 CcAmI2QKy0Pn+x1wTi9QXUxi4Qmuf601Hq6Ug36lMkri0lNAgVVvyqyhfa91pRDOiT/d7f+n1IK
 ja0Rc/f0eC2XZpk4o7Mkjg1dCHvCy/2TGFKykc5mA+RnpVfS6ixVFsSMU2Md+SdcpUFtpV0/wr1
 CLNqT0yIuDXUME2SJFPjSi6/X/4xoZqSk2ZMsIO9pysqpE7X
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Noticed this example was out of date while grepping for something else.
And when I did get_maintainer.pl on it, it didn't match the IIO
subsystem, so we get a bonus patch to fix that too.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
David Lechner (2):
      MAINTAINERS: add match for IIO API docs
      docs: iio: triggered-buffers: use new helpers in example

 Documentation/driver-api/iio/triggered-buffers.rst | 8 ++++----
 MAINTAINERS                                        | 1 +
 2 files changed, 5 insertions(+), 4 deletions(-)
---
base-commit: 8678fb54958893818ddeccd05fea560a4e1fc759
change-id: 20260517-iio-doc-triggered-buffer-update-helpers-ef7e3895c9f4

Best regards,
--  
David Lechner <dlechner@baylibre.com>

