Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0DF2D9EF9
	for <linux-doc@vger.kernel.org>; Thu, 12 Feb 2026 08:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770885910; cv=none; b=UF++gzuMTEv/nKyauofqKmSluL6mLfmSEx3SUGCf4tPWrijjUl4tzWWvE7JGfansr9J2OZbHR9rrB20w0GkgmU+4NqPpCTkM8OIQDBkcbLI3DgZExTh8W0MBRQ12S3R6Y9D+cz6OKYkhKkvj7sf5DYcHR0TyUa7HDIH9BQKBGXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770885910; c=relaxed/simple;
	bh=FMWBPm49ifKRkjLl8zUDWt9HyBY6118sqYd1if5HkLQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pUghGBg84+bsmBaGQBou3Trxxp+Is1BDu8I5bhTK6LtTSWsxsHapAv6ESDSs8jBTAZJ/gB6FHfpacL1nJBpsS3cDqFyUUtcTL0rNoKl7eThfrPfWLbu/7T8lEOzCXL+FtSZvFdBzceVafBUtMhSXK3k6hxb6wyGRV8OtM11Qbgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=jhnR9Aw4; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="jhnR9Aw4"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48039fdc8aeso18323335e9.3
        for <linux-doc@vger.kernel.org>; Thu, 12 Feb 2026 00:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1770885905; x=1771490705; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kB22oilQpbKLorleBbZlAN5tq3XvDpZ40Y2OzAeJ9vU=;
        b=jhnR9Aw4p09D4nim/WxVyE/4G07/vKHDeiW7qc1iaLBN7lRXwGLdZ70LXoPC5EpTzD
         jBHO+uX9BJG3AzEPY5XBDMCggqkTH/8pceZ5zOjtmCh+k4jpXgJlBI/qS34GD1RNxvG2
         jM9tiiQt6713E/UCsIVch7Ms5oNIxzRob7dHptLNq96nQnsXTcytqrvYoajoBcEOh4lQ
         z+ULOeopTbixpkPxmatuB/gE8TnqgHumunFfbN36p9vPs05GD1VRN0LnnT9UrbiGLc7z
         rPvUtsg67cxgI8h9oq41SSGeQfuTA9l6rrMvDom0uA0xLipNZ6LkGhSGUrHpams+eeMY
         uCaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770885905; x=1771490705;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kB22oilQpbKLorleBbZlAN5tq3XvDpZ40Y2OzAeJ9vU=;
        b=vt3BmVK4jiwuZq5IM8LNxkI0jNBdT0G8b9Rohdz0H0P1e/1Xl9VNvpkoXKGdIQst+J
         8WZbW1dTmLeZ+KwXoMqmEXImGA3fFBsMXZtdZhWwZLbfQvdCVOegnagSiIgThi/1Sep9
         Km89FMq1L5i9wmcSWBq6m28rl1Zp24oBSzq3+6cxyIF4vcq+NAhQ6Src+AQ4Va2BTYNV
         jvWisEbnYKp/oYQl58lzSofUoTscxoUOF9tw/muEJDKlMz22+GUvD0ZdC0it4TMimy5Q
         vgQ78hKkEQcyxkrUyzzK8w8pYxdhEooY3fC1jgdN8g4RSkb9YLQ389xu5C5R7uphBUqv
         YPVg==
X-Forwarded-Encrypted: i=1; AJvYcCWD1TpmpKJh2vPHwU13Gm7p13aXz/MXK3emPXQtp71i5ZV8YyQa0AEbdBlD9mgPnWyhHWsSQK0FtH0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7DLm2ObLtYeYDrcLnDTxFv2x9xOXNgaiKthAeDvXyU2bfqLRU
	wfnlVzhTw1UYpLvD4othshk6C/ykB4Nc5/+v6nUNIzGe1umd1rvWZ96176geN06+DKA=
X-Gm-Gg: AZuq6aJ1UZMHbhDfsIzUjxzDR/5JaTLb/GJXOun4zpxAsIFAWwllgDsXEIclzj0VRVy
	i4Wy3jELqAE7nD5hWYWRIOdhi7+V4xJsZzQ5U7lyKBUjaR1ubBJ43IFUrBd2Pk//Y9EPjoJxilR
	XGEEPrD6OEdcSCq5hGLouNVu4CnjpOfzgEPVfwYTvg7skjkXyaVB5du481eOauyVIEJ3NumrDpn
	sS9wMqdTIATOgHAOigw/0e2E9fU0XOCbGT3Gzfui80dJZCDOGvkgsEiMTYX3zhAegHMfc9GqphG
	cSAjY82sbSzzn3TMVX7HtYxpujqfmn8yEv5MbS8V4tSAtKUqIPO55dnEhkJaHY9EJ95N/0135cX
	COvGadgyXlghA0BGEqC0nDyTBHtGWCdXJwLUSQiuGfGZgo0vNx6phdqyB9qTFtbyVD+zh5Bb4DA
	WNLvmgbbEGLzR5kvUfjO1fxhywbrn0EsocFgrw1AotZLa40c7thi1H+aH9fwbbYmkUnZzOZQU6F
	3prAKCjQw==
X-Received: by 2002:a05:600c:818c:b0:483:2c98:435e with SMTP id 5b1f17b1804b1-4836717eb60mr20304835e9.34.1770885905577;
        Thu, 12 Feb 2026 00:45:05 -0800 (PST)
Received: from silence.. ([46.10.240.40])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835dd0e15bsm82753705e9.13.2026.02.12.00.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 00:45:05 -0800 (PST)
From: Stoyan Bogdanov <sbogdanov@baylibre.com>
To: jbrunet@baylibre.com,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stoyan Bogdanov <sbogdanov@baylibre.com>
Subject: [PATCH v1 0/3] Add TI TPS1689 pmbus eFuse
Date: Thu, 12 Feb 2026 10:44:59 +0200
Message-Id: <20260212084502.1795-1-sbogdanov@baylibre.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rework TPS25990 eFuse pmbus driver to provide more unified way for
non standard direct conversions.Remove existing defines for TPS25990
conversions and replace them with enum listing all supported parameters
and structure using m, b, R. Add fucntion to covert raw to real value
and real value back to raw. Add data structure to hold pmbus_driver_info
and local_direct_values for direct conversion.

Add support TPS1689 support to TPS25990 driver, since both
chips are sharing a lot of similar internal functions with exception of
work range like Voltage and Current.

Stoyan Bogdanov (3):
  hwmon: (pmbus/tps25990): Rework TPS25990 non standatd direct
    conversion
  dt-bindings: hwmon: pmbus/tps1689: Add TPS1689 support
  hwmon: (pmbus/tps1689): Add TPS1689 support

 .../bindings/hwmon/pmbus/ti,tps25990.yaml     |   4 +-
 Documentation/hwmon/tps25990.rst              |  15 +-
 drivers/hwmon/pmbus/tps25990.c                | 185 +++++++++++++++---
 3 files changed, 171 insertions(+), 33 deletions(-)

-- 
2.34.1

