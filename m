Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCC09476
	for <linux-doc@vger.kernel.org>; Sat, 21 Feb 2026 14:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771683183; cv=none; b=uwuU8zIyKx/Q7G9DN04GgF7GG6p9o66nluyEnklwacXDLfDddC0iHHCKbiNnftAd4X9H4jUl2zluaEozuwlbACZQolKCwy+LnoJ0dXBNQ/+iVxPLlNqvWASb4K2c+xr3mZ3w3YPExAixsmNxDzSib0modEGsP7o9CnxvP8jcNnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771683183; c=relaxed/simple;
	bh=NIUoJr1XY5gdclV6RiHFGBT9P8aW+Ke2Acc0QjgcK1U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iQQNa02F7L48VGMyKfPCJdUyhpngaPGWCZlbgKKXNamDelEnr7mR9TwGDHu53bKJpPQrPHY+pSYy32Y8YVgMTmsxpqKLlyJSkH7gkah1GfqDD2hCsaCwVMOtYSiSQ0kM/sQckcGCVKUH+fKdGpWnFE9fuKiqDfELNgc9pDw+9Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f/HR9H4T; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f/HR9H4T"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48374014a77so30769505e9.3
        for <linux-doc@vger.kernel.org>; Sat, 21 Feb 2026 06:13:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771683181; x=1772287981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qaomPLaqyB2XegpBtyCcwnlVmceyjniRY76DonELa74=;
        b=f/HR9H4TRytclwOhPHDC+sydNGO0mbSRc0NzIVUYL5BktxHT/AJXziT+3dtTiib04b
         llWg2Gyb++WUlZb9RsMxW1ZRX/xeW2/ZZ/ZHOJ7fR7rPDCFLr+QXMctV1o985Zefsyh6
         Thmi0yxCgU0qsHm1W2xNr8XBmZDRguo5nKeY6ydBZXsRxJcmfGzsIZ76dcK7ss8aq3tN
         iYUV9YT3JMBgp2bDBPvGY1US8palIGJuA8FibS8NQRC/U9BpoD4at6RdMbjcHg6Jaqy9
         66yfNPtiGJmY6DwC3q42m3yIg9Wb3I4cmbf5FHgiGsTj3bamuPmCNfLPhxfjjpNc4aMS
         eLxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771683181; x=1772287981;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qaomPLaqyB2XegpBtyCcwnlVmceyjniRY76DonELa74=;
        b=Lo5c4VNCCzMisfueEBnO3pU5TcnmW2MvY544QY0ZXzRxG5fBSdYgo8stjeTws/g8Vc
         WJDwYz9Hc1K132EQi2gcB0hI55ZpaKsM46AzfkGeLnj90F1lJ6IM2CINNpcfKe/2kHVW
         l3jRHxMhjCRIQD8AVMhKTL58zVVir+VG05fXxGkWRQPeyhqMgGFDHmEVZBEsltSxeAKu
         5mBff996s8ZAm1A+A00DSzXImUOzdWa0qbV+DDZXjJUhYFCafDXwv+GmwLbMwdmu2whe
         YxOD3Ey7Hgqi3kmiAKXbA0ycJwn0vctFSMXJ2aWkXQAxBvH2nm3Qk+VTIxzlpyXPrJPM
         nSkA==
X-Forwarded-Encrypted: i=1; AJvYcCWmNsJcTBToXqA+WUKh1y0AIV8EA7nyUj4mqPi24a+3C6FZR+7eussalHxrLxh3IdU8jxUtOZtOrZM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKRDT2ep1rgqE4EK8JsXK+EAsjGFB4yVHgeHinJubG0SVW7Dow
	hFKIasB4xTFa6HoAY+SwhOZWbEnOBO8fI6koz/J4RAixkYGYezAiR60zPJS0YUqZ
X-Gm-Gg: AZuq6aKIaAlV9sDNmJe4fsr1ovuW/Bc5nvhfcSojN17nQYsHsgSVe5WN/xoEMc/1LSu
	okWfRTtNzmapJv09RY1Bc7qfeLPs8gHB0SBTmont4Src82nFJQDJQFejdwn6YPkUgZwFEo/IlA4
	6OK6wZqQjPhawFoT6P808RGFK969ATdMzOxtNimIdWH1GcAraYlr+e229AqJKdgyl3YeKb55i/W
	zW+ab1gGWN+ZxgZrOEJbyC99o/g1YtOHzBcri/FjasxzCLW+Eudon5rPuZ+b8/8qY75drtd5mN1
	3kszlfl+GfU2pr6ZSXX4mY61a87djUqprvFxnKqmXCJZD1f5ZnfRq80JVzz5fz/3JA99O5hWVBr
	rDJZuEJMYQvabIjPgQ7C3Ny96g/lC3Gi9h7wkQphskgnorjUu244QdPJnc3llYtuAOM964oHbws
	Q4Z9XeLGQ/s5+hwx1ALKiU+yJOHDDJhbnJg+SvFR8XXsJPL8gHs/oQkaYDczyvnUducw44lNMP
X-Received: by 2002:a05:600c:45ce:b0:477:93f7:bbc5 with SMTP id 5b1f17b1804b1-483a95b5835mr47780805e9.10.1771683180862;
        Sat, 21 Feb 2026 06:13:00 -0800 (PST)
Received: from db07.1337.ma ([197.230.240.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a3e01c27sm50169825e9.9.2026.02.21.06.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 06:13:00 -0800 (PST)
From: Taha Ed-Dafili <0rayn.dev@gmail.com>
To: linux-iio@vger.kernel.org,
	jic23@kernel.org
Cc: dlechner@baylibre.com,
	rdunlap@infradead.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees-archive@lists.linuxfoundation.org,
	nuno.sa@analog.com,
	andy@kernel.org,
	corbet@lwn.net,
	lars@metafoo.de,
	Michael.Hennerich@analog.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Taha Ed-Dafili <0rayn.dev@gmail.com>
Subject: [PATCH v4 0/4] iio: accel: adxl345: Implement event scaling and ABI compliance
Date: Sat, 21 Feb 2026 14:12:43 +0000
Message-ID: <20260221141251.34855-1-0rayn.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series addresses ADXL345 driver non-compliance with the IIO ABI for
event thresholds.

Currently, the driver exposes raw values for thresholds
(e.g., tap, activity) without providing the necessary scale factor to
convert them to SI units (m/s^2), as mandated by the ABI.

This series implements `IIO_EV_INFO_SCALE` in the IIO core and applies it
to the ADXL345 driver, ensuring that userspace can correctly interpret
threshold values. It also cleans up existing documentation errors and
typos.

Changes in v4:
- Patch 3: Fix missing IIO_EV_INFO_SCALE handling for MAG/MAG_ADAPTIVE
  events by moving the check to the top of adxl345_read_event_value().
- Patch 3: Explicitly reject writes to IIO_EV_INFO_SCALE with -EINVAL.
- Patch 3: Fix bitmask ordering and whitespace alignment in event spec
  arrays.
- Patch 4: Update documentation table with the exact sysfs scale
  attributes generated by the IIO core.
- Patch 4: Sort the entire event attribute table alphabetically
  (David Lechner).

Changes in v3:
- Patch 1: Revert "axis" to "axes" in documentation.
- Patch 2: Reword commit message to "Implement support for".
- Patch 4: Remove repetitive scale values from every table row.
- Patch 4: Fix typo in commit message.

Changes in v2:
- Add core infrastructure for IIO_EV_INFO_SCALE.
- Implement event scaling (0.612915 m/s^2) for ADXL345.
- Fix technical math and decimal errors in documentation.
- Clean up grammar and pluralization in .rst file.

I would like to thank Jonathan Cameron for catching the missing MAG scale
handling via static analysis, David Lechner for the alphabetical and
bitmask ordering feedback, and Andy Shevchenko and Randy Dunlap for
catching the whitespace inconsistencies.

Taha Ed-Dafili (4):
  docs: iio: adxl345: fix typos and grammar
  iio: core: Add IIO_EV_INFO_SCALE to event info
  iio: accel: adxl345: Implement event scaling for ABI compliance
  docs: iio: adxl345: update math and examples for scaling

 Documentation/iio/adxl345.rst    | 79 ++++++++++++++++++++------------
 drivers/iio/accel/adxl345_core.c | 37 ++++++++++-----
 drivers/iio/industrialio-event.c |  1 +
 include/linux/iio/types.h        |  1 +
 4 files changed, 78 insertions(+), 40 deletions(-)

-- 
2.47.3

