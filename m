Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A7C36EA98
	for <linux-doc@vger.kernel.org>; Sat, 25 Apr 2026 12:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777121693; cv=none; b=R3TxQ4+AEs+7puE4xHEAXnpI/1LSBx4/kUY53fKZBmupBMID9WXwZLBmLD3xsqdPgbTDHurYc9aQw5pCdga3zpn9r+naLS+p3smwLm1oWJTcL/a4AviFfq/nz31oalbSPMzS3/HAiqwbKJrSiD2QMxwpqMK9JNRBK9vHXvEjhkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777121693; c=relaxed/simple;
	bh=Qu18/WAxy7pSgmSjN5nfIZEKo5O/oY2bbdaVU7rwZZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qp+rJKJx97NIYa11MRc7j06xkmcNaXwJrUK3RjpfT2JmgxmBiH9hn+nQN2pUBsAbRG5GeKHSfLLnJ+Uf8dUeOEsVu8ivq9YdPJsfrf06VFAWJSbR/zUGGZTqEpGM2yTmvMqmoSj/4QZp5SREM1emYTPlNwraNU/E3O1ETGk2uuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UosU/PAv; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UosU/PAv"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-38e7d983f50so96660131fa.1
        for <linux-doc@vger.kernel.org>; Sat, 25 Apr 2026 05:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777121689; x=1777726489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i9MujvPFIO9IoskE4wX3Cu5o3M/qCzpzUl97wUtWfqQ=;
        b=UosU/PAv0isJRPeZQE2P66vBgoqiyoHtvQ0cC4/vXOMqJKf5WB1g/yrJFUOLqHBy2Y
         IfK69gcCMZBmOgP25yJ4ZRC7Xj8XmI2/av3miOpGz8kLhfTaqm0y7986ApG8F1J9GvFF
         5fssw37jVTo5I8+YNtNTaaxe83abLMHGlt6xedpyYUUd4yhwAtans0RNIgXsoH73LC7K
         mpdlcsElkgWKZSTdwkoz1sr4mkJzpWXNEJB4BuNUMSV4LCwE/WSE+7rP0CZfOyoYBxJe
         IzLr+P7bCHO7dwBV8nF9k6f//bw1vYhs+T8ym2/6jx2oe24M0kmII3KCIBHQfvS0/R21
         I7gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777121689; x=1777726489;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i9MujvPFIO9IoskE4wX3Cu5o3M/qCzpzUl97wUtWfqQ=;
        b=WJ68p9h2+uKZfI4Yn7AxB44KBq8g0GE4oVz0nsmYrBbb0EHurWCjGoDbzr/qkx5BgR
         fr/Jp9t06Hi9DvDGe09rWnNMa+eUTtl47M4BIcw/on9jIfJ9/laevCqcAv/4u9F7bDiq
         w0U5vPeD52WLG+uqN+6HcVMALVepKnt1S4lAuQSKAMUljMIuVO0T4oBy1d7BsKSB7wxR
         iOTpNjbCo0b0+e9tViyYlqwvu1m4MLsMjjm6TJQdbV3peyHiFvPd7FpTbSbsAneAfelf
         49+QF07M3rd8XL8Oq4iQXGGBN+rww9Kf0KEocAfIu/N2fVzmnx2IjkkbaIDwm66xWrF1
         nfdQ==
X-Forwarded-Encrypted: i=1; AFNElJ+YP8i2+JkxUc7enxA4CRpyBW3CM4cSkzbD0ddp1dPbDW0qIiSlZd3E3fqL7p8jvTFvp+engDzGjpE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUA+QOef78JRQmIWr2qJAgp+DGjbBMPcCtNN/+C+vhZ1brhxQD
	MUQmCcgZ749J3QZhyNhU0iSV19996R2/z125cqBnvAl71yWh09zwbS3/
X-Gm-Gg: AeBDievK4YQetyNZGYJJG3v+0K4s4bWXP2YTl3AXhGK7kf0lJTPRciXy9LvdqH28Sbi
	PEPdEdAyKLhAxF5DsQG/oCJhIjsrJhw1z/5kTypEty8UXTtJgHxBLRuihMXHvHCNaU7Wils9yHZ
	sk/5rWQdjUgJqyHLS29wR+HOAfTp7vOxeGqI8v5q7c56I1t6BQmu4kkLbY6AQ8IoJGT6sprl5Uh
	8P5ZoqeevU6VXTAZKC7TuvGwtVVNnXaDBg82Z8OydpK71DF4NeBpVEEyLwBuPp2tJeTr2x/vQZt
	ScSh69CXVKYXMWIrO7hhDJ7KXz7LpkXlQ+0wbpIvI52Ik3pQkXI6fueW+DEvSacUudxRir/eumW
	dYpcNMxBCoqyqBB4ieHinUqzW0pk2OsOExgtmqegG8o8BW+0mPmDwXgYh5LSysPLW1gBrxt2UaY
	FF5mHrbno2oObBmMGPrmd3EKY=
X-Received: by 2002:a05:651c:4188:b0:389:f0d9:398c with SMTP id 38308e7fff4ca-38ec7b42f03mr88438351fa.31.1777121688906;
        Sat, 25 Apr 2026 05:54:48 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb5f6b20sm58334271fa.18.2026.04.25.05.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 05:54:48 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v3 0/3] Update APDS990x ALS to support device trees
Date: Sat, 25 Apr 2026 15:54:26 +0300
Message-ID: <20260425125429.65154-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document Avago APDS9900/9901 ALS/Proximity sensor in schema and add its support
to tsl2772 driver.

---
Changes in v3:
- switched from apds990x to apds9900 in the driver
- fixed misc-devices/index.rts
- expanded and adjusted commit descriptions

Changes in v2:
- dropped all previous patches
- apds990x was documented in tsl2772.yaml
- apds990x support was added to tsl2772.c
- original apds990x driver removed from misc
---

Svyatoslav Ryhel (3):
  dt-bindings: iio: light: Document Avago APDS9900/9901 ALS/Proximity
    sensor
  iio: tsl2772: Add support for Avago APDS9900/9901 ALS/Proximity sensor
  misc: Remove old APDS990x driver

 .../bindings/iio/light/tsl2772.yaml           |    2 +
 Documentation/misc-devices/apds990x.rst       |  128 --
 Documentation/misc-devices/index.rst          |    1 -
 drivers/iio/light/tsl2772.c                   |   16 +
 drivers/misc/Kconfig                          |   10 -
 drivers/misc/Makefile                         |    1 -
 drivers/misc/apds990x.c                       | 1284 -----------------
 include/linux/platform_data/apds990x.h        |   65 -
 8 files changed, 18 insertions(+), 1489 deletions(-)
 delete mode 100644 Documentation/misc-devices/apds990x.rst
 delete mode 100644 drivers/misc/apds990x.c
 delete mode 100644 include/linux/platform_data/apds990x.h

-- 
2.51.0

