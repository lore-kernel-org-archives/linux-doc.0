Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E175C1FECB0
	for <linux-doc@vger.kernel.org>; Tue,  4 Mar 2025 09:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741081181; cv=none; b=VolYOVacjV83OK7NDh/y/tS25M+emz4DJvks8MIPJ/mFG+uLO5zkosioQIS/Ap4M6s5MVBCWdKHG+MYoudVXjMZfyqoodXIZbt7xW4rKFdYDxgsDTs1YFIeDRo4N+KYLs5fAmxny3XhAvlAaUu0uauPRSZOxujKMpPqDwfGtLew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741081181; c=relaxed/simple;
	bh=aOGadUaD55/7NjVi9olJnWxHY2EQr81G0BMQB3FqhzQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HBP4XUhUNKFkL0gcEPiPhTZD8jzjj+A2daXB/diIHb0OG4Fxms2NtexqfRBzgMMr4D/D7yBRFbFhkWUs/dlbFcftwd2/kfpRHiovQVJf9sUxEJBKLXzNnGDoHTw4SbKAf/KsJFTyhdMMUQ7YlknNtF8cir7VtVcmEbxHzGQ6xaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=vE7b76Iv; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="vE7b76Iv"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43bc0b8520cso12419315e9.1
        for <linux-doc@vger.kernel.org>; Tue, 04 Mar 2025 01:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1741081176; x=1741685976; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yzSd2WWwaJ30wmCeIbpT1A/lGBwbvt5bCwq5/4oCS6I=;
        b=vE7b76IvIy0hog7qW6HDTGl/PAw6bW7Adl2xf6+9tIfZ0V50hZffFnsnv3IKp9F1mz
         8UVjdEGN0AndDgYH6sDggkyf9ppbwh1pp+84q7VBgmQ7nKzOZp7kBlXeXwDgfMysCooL
         D5TbwBfv1W4OhSczgB58nzWukuQvKbLF4AytutKvRrvLuf7jzTfG28MsS6oG9gOJ3HT4
         xiM7R3oz7ybaIGUfrX5vZmRgWOlYFjvzssNOPlXCSFrKgcACWKxPH9rvXE2ULmhgEpbS
         Fxuj5KlTtYLw7vWj1+Fot5QLKFSS7+k6SjSg6FtT8o9QET42BZMBxkYUKeSdFuO2ushN
         HGVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741081176; x=1741685976;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yzSd2WWwaJ30wmCeIbpT1A/lGBwbvt5bCwq5/4oCS6I=;
        b=c9q4V78I+MYkYwHP8CgYx0ElVF4M3Y+p0qlyId9N4TXr5cRVDIpt8GVYw0LYmbA5uO
         jqbanzRoQ3usMM9yutELVuGUa0ei0wb/yYvC007Fddj4WehJ8IAWDOaxYRv5ygMntgZb
         EP6AzZQaPQCyLKJAPHsU7dQw5SNpGe5XifD7qLpNNC+bptfbPHUHLMh9q9FyYHlE4o6R
         OtL8zpRzbfjMIBMooM2YIuq1FTBQ2KMPdkyjqBt3iu3TQckGPZLqRFuBGpOwdRRJLqvQ
         R/y/vd9nL+wSCXJNiLXzr1fck75rDTrx1FDqGqy+LW0ndGRnqXNMC0lvpZ3uHJcpLO06
         vGbg==
X-Forwarded-Encrypted: i=1; AJvYcCXiQ5gfxhFb+1IvNkPEiS/WWh3NtxjPtZ1zbn//VcYD6cTOwwpbTZmgY7fJpmuNQIfHFuJWvBgJGdk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQcvUf97VYnnX4So9Az6gIPHcMz1imyQerLp8ATfW4cPgpG3DT
	6aKKSOIYt3bsyF5N904t+I3AJ5lr77BmA1rjggrYpV5Efxvp7hRjUnu/9HI9Kzg=
X-Gm-Gg: ASbGncv5azis3vtIB+igIIcECWDc6Z9JiKcm8sLAjcDI3iSi+mW86MByF02U38jCdxJ
	Hs95sF2GjwM+ngTC/ITwtIK90Vs206lTiGnOX8Go9bsOyoOtOWFXO5MqD3134GsPLEYcrD8X2h/
	qRyJwl6x61gfOl6OwzJnfwtpOJW4Xlfdh//89fvP/VCKHjUJbS9mKHbrYGufv93+vzo8XsMW0WD
	v8NjOMbbpovySE+kXhHkF4vfQbnYknbDUFuI6ERm31J79UVopZ6ig3M5MPmimJoy4s1VixRo2Qy
	6GFakyQZSVOlacoAtMcSnNUcTu6keh21dXokgktE22E9gjHYZ9mAvbabcHzzgxL/XRCu77tj48b
	4d48cK+EbKPKdswurgNj3VvAOTP6mqPCelg==
X-Google-Smtp-Source: AGHT+IHj42i+Jh0hoXFnYJNDz31oiilscLISu0w5fjYK90iskecg4D7mRgp2rynwPpr1wC+EJx98Hw==
X-Received: by 2002:a5d:6d89:0:b0:390:f815:78ca with SMTP id ffacd0b85a97d-390f8157bf2mr8815914f8f.30.1741081176166;
        Tue, 04 Mar 2025 01:39:36 -0800 (PST)
Received: from [10.2.5.157] (amontpellier-556-1-148-206.w109-210.abo.wanadoo.fr. [109.210.4.206])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47b7ddesm17307844f8f.57.2025.03.04.01.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 01:39:35 -0800 (PST)
From: Angelo Dureghello <adureghello@baylibre.com>
Subject: [PATCH v2 0/2] iio: ad7380: add SPI offload support
Date: Tue, 04 Mar 2025 10:37:49 +0100
Message-Id: <20250304-wip-bl-spi-offload-ad7380-v2-0-0fef61f2650a@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO3JxmcC/x2MQQqEMAwAvyI5Gyhxu4pfEQ/VJhoQW1pQofj3L
 Xsa5jBTIHNSzjA2BRJfmjWcVahtYN3duTGqrw5kyJrOfPDWiMuBOSoGkSM4j8733WAqvr0VciR
 2hdrHxKLP/z3N7/sD6aD5zWsAAAA=
X-Change-ID: 20250304-wip-bl-spi-offload-ad7380-ad675f2a2f5c
To: Jonathan Cameron <jic23@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 David Lechner <dlechner@baylibre.com>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.14.2

Add SPI offload support for the ad7380 ADC. 

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
Changes for v2:
- fix return value on offload probe,
- add documentation patch 2/2.

---
Angelo Dureghello (2):
      iio: ad7380: add support for SPI offload
      docs: iio: ad7380: add SPI offload support

 Documentation/iio/ad7380.rst |  54 ++++-
 drivers/iio/adc/Kconfig      |   2 +
 drivers/iio/adc/ad7380.c     | 509 ++++++++++++++++++++++++++++++++++++++++---
 3 files changed, 518 insertions(+), 47 deletions(-)
---
base-commit: b7508a5a672275694c2a1b09a5f491ca2a56bbcf
change-id: 20250304-wip-bl-spi-offload-ad7380-ad675f2a2f5c

Best regards,
-- 
Angelo Dureghello <adureghello@baylibre.com>

