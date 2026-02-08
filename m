Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748C528750A
	for <linux-doc@vger.kernel.org>; Sun,  8 Feb 2026 15:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770563130; cv=none; b=IvfeIFmoF3Bc0i3LOxWSvT9Z7KJI5WXKGkct22BS/lke8riN2kqI5pWWOiYj03zKeDXgln7AZYF3Y5nNRstSp9TZVQrBh2whasD6k9DOK0o41u5VFMAP3ZVIkbBhGSpKM3IrtNli+spvRX4AajWNXxTpzgT6TVaWlHsfokM+psY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770563130; c=relaxed/simple;
	bh=REzYKaXLBwoE4Plvf1gN5k8tJVJVi4O8VE71Wbri9PQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KXQN7yaDohtdI8jtFJjUwrm5qR7lilIKdFDhgsWLziYKSXDF8wicKU4ffnnno8qbR/VoyxdeF4Jrjgd5QXAzsGFHWP5oOUf8lns0wQhBQYSN90YiHYInIQo4jbDv0Cnvm+bJOSJtdPZ5/AdofLVYMULfv21w5r+uvjWJ3l4FOSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jV3k0c6h; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jV3k0c6h"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47fedb7c68dso38763795e9.2
        for <linux-doc@vger.kernel.org>; Sun, 08 Feb 2026 07:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770563129; x=1771167929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cHsiJILP6hpkRCgoXucesB1BnAyegGp+ZNei85NfukE=;
        b=jV3k0c6hIdiomZ/9bmD7NuxV1AkHhjvI1PGSbWbRHpn3gkTIZFqF+TC3ItYVsNP3VO
         F9Y85VdAbweKOPvWMlV9KdUr9PkmxMXdXsXlmz1jUapb6OnIsU18mHJxVu+9I2N6qoz7
         iAsPmiLhYWhO4KVDknjmCwbCgp5EVVL9Nv2hKYGs+2T1HMqNv8fyPPj+/IsvLgecptxH
         gQCoEjNWq5d80EwcMqVV9j8f4b7ysiAWCtDcWwiPoqDJgs//f9sMdW6Hb3Pa8/fCUIYo
         9W2+2RrcttqgmF0oVEkCbtqDERGZm8DHF4HXTUKpnXgIp+Xdfz6UwpTV76RRRyHZJlMP
         uhVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770563129; x=1771167929;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cHsiJILP6hpkRCgoXucesB1BnAyegGp+ZNei85NfukE=;
        b=D8VwtZTt0Nn5C+Q23s23G9dRd/D4IJVgNHL5IH098qvQNn/0qlArfi7JtTanRJvLei
         r/DOZwMtFvrD9GezOryEQvYIRnQnC263FpSHxPWMIQEzyPniSvIa+2h0lH41f5GPXQme
         B9gTVGtS5CNe6jfJszS2XZm4NoBjVyLpeCM9XcbYWC6cJlfE/kOemGhG7YIQ3l1TbViC
         Sg7oabPUDlf77AS7QBJKc3zp1ui7fGxgoYGfmgWi/EzFvYTbPzIxnbhrOVs3/sNHZukF
         AqWeC4j5ZCbraI2wZ7lS846Zg33Yu0G3cqtoAAm75v5DKEytMqw1RnCQCsqagjv1c5A2
         KXcQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4eDttTuMNvGq3+Ki1BZ2VDFC1ioWE2zEMSwWM3znZUFYhxda1IWqbLeht1h5rJFxprxxw+QKaIYs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjS7BwS25Lj48j+crnXkJsQtxl78+OiNdIS/p9OarXInmtcJ6p
	O3caz+IY8veNe5JgjYoWXQ3NKYiH4mPXSApLtY0BdWFOkfAyGroejkTJ
X-Gm-Gg: AZuq6aLkYgZj43v0pUMSrlRGB7iLN5mDwqM3P/rWzQJQtdybcztsCKuJxFlXju0LUfg
	NyRcDALjND8Uup+damH6KUw8lEDb+jrrE8oNXUyM+kCdQ56buJ2e6rGtzw/WLCGNnlmVLVHY2lm
	Z8KheBXrG5DRP+Scq0tgUw75vGTOdVGaQQnhnJD9dvZQwh1iZhi8DImSCtmExrAHGb+SXveemTe
	c61pCWuFWDEiGKVlj53Fdz5SQEmVEZF38McagMjqdgLtUtuj9kHnjOCV+xjZHY8eN/9RsuVKaoV
	+eUJwCpRw64erpbb0gBz6ogvCTmTMsgmHy4gUfC6Qg0nOgYoRLMbIv3BNoTZQ9Z1jMcl0NGdfgF
	nlgShIu0NnQjSpkGg+brqfu3mQsL2pbngWEkYBPYH8rHihVOmTzUo8doIfYTi4ZKzEqC6OtAy7z
	5O/QJYllOULBFK2S1Dzfz+B7aYKKuCI9qjssL8oBSBmhOTNLUsQg==
X-Received: by 2002:a05:600c:4f4d:b0:47f:f952:d207 with SMTP id 5b1f17b1804b1-4832096698bmr114979165e9.19.1770563128638;
        Sun, 08 Feb 2026 07:05:28 -0800 (PST)
Received: from DB-VM.1337.ma ([197.230.240.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483206cc7d3sm179326255e9.5.2026.02.08.07.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 07:05:27 -0800 (PST)
From: Taha Ed-Dafili <0rayn.dev@gmail.com>
To: jic23@kernel.org
Cc: dlechner@baylibre.com,
	rdunlap@infradead.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees-archive@lists.linuxfoundation.org,
	nuno.sa@analog.com,
	andy@kernel.org,
	corbet@lwn.net,
	lars@metafoo.de,
	Michael.Hennerich@analog.com,
	linux-iio@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Taha Ed-Dafili <0rayn.dev@gmail.com>
Subject: [PATCH v3 0/4] iio: accel: adxl345: Add event scaling and doc fixes
Date: Sun,  8 Feb 2026 10:05:01 -0500
Message-ID: <20260208150515.14798-1-0rayn.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series addresses ADXL345 driver non-compliance with the IIO ABI
for event thresholds.

Currently, the driver exposes raw values for thresholds (e.g., tap,
activity) without providing the necessary scale factor to convert them
to SI units (m/s^2), as mandated by the ABI.

This series implements `IIO_EV_INFO_SCALE` in the IIO core and applies
it to the ADXL345 driver, ensuring that userspace can correctly
interpret threshold values. It also cleans up existing documentation
errors and typos.

Changes in v3:
- Patch 1: Reverted "axis" -> "axes" change in documentation as it is
  used as an adjective (Randy Dunlap).
- Patch 2: Reworded commit message to "Implement support for..." instead
  of "missing from..." (David Lechner).
- Patch 4: Simplified documentation table by removing repetitive scale
  values from every row. Added explicit table entries for the new
  `in_accel_gesture_scale` and `in_accel_mag_scale` attributes instead
  (Jonathan Cameron).
- Patch 4: Fixed "inscale" typo in commit message.

Changes in v2:
- Added core infrastructure for IIO_EV_INFO_SCALE.
- Implemented event scaling (0.612915 m/s^2) for ADXL345.
- Fixed technical math/decimal errors in existing documentation.
- Cleaned up grammar and pluralization issues in .rst file.

Taha Ed-Dafili (4):
  docs: iio: adxl345: fix typos and grammar
  iio: core: Add IIO_EV_INFO_SCALE to event info
  iio: accel: adxl345: Implement event scaling for ABI compliance
  docs: iio: adxl345: update math and examples for scaling

 Documentation/iio/adxl345.rst    | 65 +++++++++++++++++++-------------
 drivers/iio/accel/adxl345_core.c | 28 +++++++++++---
 drivers/iio/industrialio-event.c |  1 +
 include/linux/iio/types.h        |  1 +
 4 files changed, 63 insertions(+), 32 deletions(-)

-- 
2.47.3

