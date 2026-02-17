Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F491292B2E
	for <linux-doc@vger.kernel.org>; Tue, 17 Feb 2026 08:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771315934; cv=none; b=Lf/M4sEGR4evnEHzXQeoZJMIFSij+hpIh3ldnNF966YpBA+LI9k1SiWKH3RUgAMEU5lrIApUmm8iIncSrKMJAraxENxPcIrGPNd5iVw8OqTG+3WG7K5mXLAUzqgDjaAWtUlMCeBHqPQzcMcX8b1q3AD4g+Z3dUeedSZjGMsS1Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771315934; c=relaxed/simple;
	bh=nUEhTFG/7UBE/bp1GdYkZho+b3xUavo+boubP6XYsBw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lPKqyNAWoo4638V+TSOVzIkdkPAPqexg+E1oufiiqEWsNfoJYySW7/GuYEiNan2RMHBkY2qI63TnsABg78redN6GX/SQjRZ9X9MzVc/1nAFX7Pt3qV/5XtxNs5kpRkSsLipt7xHHQ2POtZSGw3votRa7zPtq3FKuXh2cOIJX4dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=jUJwPgRG; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="jUJwPgRG"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4807068eacbso29966805e9.2
        for <linux-doc@vger.kernel.org>; Tue, 17 Feb 2026 00:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771315929; x=1771920729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Gb6W1GryaZfBbGOxIz34ZV52pWSStvnj73mIghaUYWU=;
        b=jUJwPgRGOdcXz9utJSkIrokB+h+hNDJpOIhmYbEEGxq50sWZ2dDPoZ/Vi2NAvUNkdd
         plJMKeR8pBbdg9DwPtW93YaO8l0qXFlZy6MlfrPXnd1fMi6GduR6nzCe27wuJMUwHhdb
         EFChAFAhmMTBHSe6u36h1Pe+amsCEZxcQBGcqkhx4CtzDLjtwNaCvpt8aoSXOR/g3iCy
         ScCiCTsMlq3q5cxwbaUqZnlHbmitj6CB9t+BJO1CGTYw8faG7Behj9LrvRqzZT2UmwsZ
         Ap9jhvu2r8zF94ft42+jOpdN+6Qi02F7WBUUV8/bnKukaKfzNrodyj1dcAi/fwyf/1JS
         3cXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771315929; x=1771920729;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gb6W1GryaZfBbGOxIz34ZV52pWSStvnj73mIghaUYWU=;
        b=xObJpX/0Rw51zV6orrh6CsUJNQ3NBifKWvMy0fAZRVZ9++WsY+qmWW4OYl8GQNaO6e
         GxSJyerdyZQxF91ZAJp5denpT8HclmHUSw2nskVfsZl/jaGkm7jQwF2KPtTfTRwmmYr0
         XgbqpRoPfSs/ib9ee+frD3yaqxqulMXE5tbngcOhxJ9WppmczNCG9+QpaLvwfdxQtgu+
         xzl3EoQnYJwpntcU4qbCP5rHv0VhhpkzwTxCtEeP3bDGA1UodaOjTwfavVIl2uE6MzP3
         JkNBwOYEUWfzAkLGnGLRfScUPC38KmGPVIBVAacMVzWSixyWTvnMCnJQZzYhffKjtzMV
         yTug==
X-Forwarded-Encrypted: i=1; AJvYcCWR9WUEFTgeokkRf7tzV3N2nIvGxAUshSKSXD4qsMyoMQooOrNnfr9oLIsutpNKwGU5qXhfYZ4QAXw=@vger.kernel.org
X-Gm-Message-State: AOJu0YykPm8gG5a+esLUB4MYUluUQw1FzXK/viqvHrB4OTcAcW2+NxmS
	c+olhbuc9FGRpT3TA94EWzz7g17QYmwRVdE0FQpbYf6IE3Ofh+h5JNdQgQq28099999kag8RKTE
	v4uPT/Jc=
X-Gm-Gg: AZuq6aIGHv3sL7wb5naAcQGFLkni0YkCuX8msXTqcAA86oqRVn8aT5occR+FfpjzXtn
	KGQZvvTtEZYKTuH1h3b4MEayCw19vXIcRDdaOiUFqE4A33JMtIHmOIu+ZdMBN0YhODHoI5a0hx9
	dYS8MzI7G4/+h/JsEYJ+wY8NBEuvOETmy1iSszRmcu13o8nlUGzWuO9ZCSRP/QfwFxo5WovX+qF
	n68YfpVeK3w34fx0KBIuv76z84cDQDE567Lxh2W3ByxMx/Gtwr4nKgZvKLvR3OfXgiv2j8UnqSs
	Okj1nt0COf/xno8uks0gaR2wWbFsrYd0zh4pHLCHR+fgtkdWvA6O4ydDAabL5cHdTFvYxcwTQON
	QMPtM9x1jjKlf7c9bC7vd3LhQmml7LJDfh+iCss/lT60N/MvxXMgwt7EFaAZDrKmNiUu8diukqj
	jj8LBsuChZK7bxqaI486q2EWd/bzD5JBSg6UfR6hfBIPovotXhlNeHhvUg7L4Tlhsd3owt28sJu
	o02CAI9yg==
X-Received: by 2002:a05:600c:3d87:b0:480:3ad0:93c0 with SMTP id 5b1f17b1804b1-48373a5d6d5mr188570635e9.23.1771315929400;
        Tue, 17 Feb 2026 00:12:09 -0800 (PST)
Received: from silence.. ([46.10.240.40])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a5d156sm35757690f8f.5.2026.02.17.00.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 00:12:08 -0800 (PST)
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
Subject: [PATCH v3 0/3]  Add TI TPS1689 pmbus eFuse
Date: Tue, 17 Feb 2026 10:12:00 +0200
Message-Id: <20260217081203.1792025-1-sbogdanov@baylibre.com>
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
and structure using m, b, R. Add functions to covert raw to real value
and real value back to raw. Add data structure to hold pmbus_driver_info
and local_direct_values for direct conversion.

Add support TPS1689 support to TPS25990 driver, since both
chips are sharing a lot of similar internal functions with exception of
work range like Voltage and Current.

Change log v2 -> v3:
- Fix error detected from kernel test bot regarding division

Tests:
- Test builds for x86_64, arm64, i386
- Retest driver on arm64
- Validate driver direct conversion functions manualy

Stoyan Bogdanov (3):
  hwmon: (pmbus/tps25990): Rework TPS25990 non standatd direct
    conversion
  dt-bindings: hwmon: pmbus/tps1689: Add TPS1689
  hwmon: (pmbus/tps1689): Add TPS1689 support

 .../bindings/hwmon/pmbus/ti,tps25990.yaml     |   4 +-
 Documentation/hwmon/tps25990.rst              |  15 +-
 drivers/hwmon/pmbus/tps25990.c                | 190 +++++++++++++++---
 3 files changed, 175 insertions(+), 34 deletions(-)

-- 
2.34.1

