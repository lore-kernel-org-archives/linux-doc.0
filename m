Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55EF837BE70
	for <linux-doc@vger.kernel.org>; Tue, 24 Feb 2026 14:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771941840; cv=none; b=TevwSHMqbpQO08utpQZHaNTf7AJK+gnmTcAahz2LCzomJ5R6sJNHhkBclNQGPNsEngc0uwVh5eJTXOUtEnnQXF9SEGJq9lCx3WaWXnmK55Wz0PwzoC9SVwP8nu0m2qcIjb5l21+I40WLbmltx8DBdf9Cfi0lULXwpvYqrpi+l3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771941840; c=relaxed/simple;
	bh=+3/fywndWbMVQ2sR2gOUDdu1/eSnWYu1iI7MeYkkaOM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ACjQiakQuo5tOGsaPBoOQTZDyGjUdKINTLQ3zZqQzOx5MMwiM1QPlAXDag8odeBDztO4kp20cuUcOKuKIA9pLmYQPYxZY4fQGQhvQNzBT9b2Q4gF0B+CuPLkrXfGeiTuMSIQyGkmXrmg2adxI0k3MSEho1dEg17M4acUslscYfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KP1lXOgc; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KP1lXOgc"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48370174e18so30276295e9.2
        for <linux-doc@vger.kernel.org>; Tue, 24 Feb 2026 06:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771941837; x=1772546637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vtE+z3Cy2C+XBq05qM7F+cng10U1INGp7SQFnLebO8A=;
        b=KP1lXOgc2jugsrVIImcPEcqA0WLf9+LQZ2Shu9TJT5Lr+IknXceLkTxc3/TY4FcEL5
         Hv3qfVYgMIMBNhwIZxZbg5rOTqGLAuQHPn2X++UBAPtnB3+9grrcbapWci2TPto+AsZe
         m7xkxVWioamEqZmy88tYfRwYRIzU45jF/2zKSUEXntR37oF/qI7nJELbcsTpR5Dga7HV
         sLrTNT9PPr4AMurxbb0wg1ah4hRasml6jbHuO56hvzReGPfJL8pMrX9fZXaxJrpnhr52
         3qCD1XI5/zZovPAgQJEcAF50BH7np3JKyi7FPe4raY6ik1UstDvzjjkVTfECQFmi4tFH
         whVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771941837; x=1772546637;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vtE+z3Cy2C+XBq05qM7F+cng10U1INGp7SQFnLebO8A=;
        b=tSE4WYNskKyBlWNmzf/v5qoGBLFGN+zZdRKDarxyhiKh2T/ROI5QGqx+kWJnsBuhEd
         tymSltx9bfSiXCKRS8jsmShBvS2hGP/5E6byaKxlxfSlIKDsXTCHZQBoev8YxUvpE8im
         2NweV8hGU4szmSGq3IW4IXsej16UuYwAsQsKSFYNzWM3NfXfCMXmjoUtO9UVPeVCOVKT
         DzE63GfhQPIFkS49BMjSgcm2gXYqwlICaF2NqM86Keo5crFzEKeRiG7M3XXIGTbRxJjM
         5HL8P0Wgw4mVAAAEZnUpSXgt3OgBtluLW82CQrsMwHL/VrBJZs8DvjfPRQHBrKPiR6Bv
         J6eQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhzurkvG2xSKbAFsfMTsk2O3nDdB08KhYcF1+I9odfHjzNTJryWCZUfeZN85W96QxZlT/Oo7w1OTA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzN3xMbPc2lM6XqISrINn00uvJfZwSaFIJy+Ez8FvvXsVIjm+NU
	15b4gv5TC+PmFdTLHE5jr2IHGuiLjHa3SZlOCTF9U5b/sbaMkw8ajdWn
X-Gm-Gg: AZuq6aLN8wQRXkfNhroyNA0B8ZyXvmlJqzFLbbbApn+92TR6oUaQfnNjw3nrxRBTL7c
	2VBdZqzVqxwWQT0Ie1r03WvbZHPxvH2bIxJ05JA8OKFP3ZQsWcVbqMQC09IDQ4i7L0lCjIbHVvo
	959qkwNz/g/pZYsqvRwgH2rs4dv9AuZRTLNZMcxk0l3ZEuzNRmXAf6j5FWbBsVh3G/AMOPsYtUW
	oScfWmd79/X9Sp7nrrEtQryi8geDJH2TCDDEYHt3cC0j9bj84z2qKIWGopcl/HnqM4wI5H1gwYV
	heD8f2nsI9p4J3r/cxroGw8kJCKdDTGP2n9pK7jRij9H9dhA7MHk/AcvPqSaRkYnqml4lSjLqd4
	AY3KekcBj05IXbSQhYWB78HBxLUEFMlpgidSzfDSLPmQ02ugzneyoY9k+gaZe+CgRpAaT+gv3ns
	S1e/te/V5Svso73Y3D3S5/XbvXdMIiSoUu/VKNVITypixUV1HIeBoToQiSsZAxIg==
X-Received: by 2002:a05:600c:c166:b0:477:7b16:5f9f with SMTP id 5b1f17b1804b1-483a9607d11mr211795505e9.31.1771941836478;
        Tue, 24 Feb 2026 06:03:56 -0800 (PST)
Received: from db07.1337.ma ([197.230.240.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd7010a0sm1043505e9.5.2026.02.24.06.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:03:55 -0800 (PST)
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
Subject: [PATCH v5 0/5] iio: accel: adxl345: Implement event scaling and ABI compliance
Date: Tue, 24 Feb 2026 14:03:43 +0000
Message-ID: <20260224140351.27288-1-0rayn.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series addresses ADXL345 driver non-compliance with the IIO ABI.

Currently, the driver exposes raw threshold values without a scale factor
to convert them to SI units (m/s^2). It also hides the double tap
threshold value because it shares a hardware register with single tap,
which violates ABI expectations.

This series implements `IIO_EV_INFO_SCALE` in the IIO core and applies it
to the ADXL345 driver. It also exposes the missing `IIO_EV_INFO_VALUE` for
double tap, ensuring userspace can correctly interpret all events, and
cleans up related documentation.

Changes in v5:
- Split the series into 5 patches for better logical separation.
- Patch 1: Moved alphabetical sorting of the event attribute table here
  (David Lechner).
- Patch 3 (new): Expose `IIO_EV_INFO_VALUE` for the double tap event to
  ensure ABI compliance (Jonathan Cameron).
- Patch 5: Add the newly exposed `in_accel_gesture_doubletap_value` to
  the documentation.

Changes in v4:
- Fixed missing IIO_EV_INFO_SCALE handling for MAG/MAG_ADAPTIVE events.
- Explicitly rejected writes to IIO_EV_INFO_SCALE with -EINVAL.
- Fixed bitmask ordering and whitespace alignment.
- Updated documentation with exact sysfs scale attributes.

Changes in v3:
- Reverted "axis" to "axes" in documentation.
- Removed repetitive scale values from documentation table.

Changes in v2:
- Added core infrastructure for IIO_EV_INFO_SCALE.
- Implemented event scaling (0.612915 m/s^2) for ADXL345.

Thanks to David Lechner for the structural patch feedback and Jonathan 
Cameron for the architectural guidance on ABI compliance.

Taha Ed-Dafili (5):
  docs: iio: adxl345: grammar and formatting cleanups
  iio: core: Add IIO_EV_INFO_SCALE to event info
  iio: accel: adxl345: Expose IIO_EV_INFO_VALUE for double tap
  iio: accel: adxl345: Implement event scaling for ABI compliance
  docs: iio: adxl345: update event attributes and scaling math

 Documentation/iio/adxl345.rst    | 81 ++++++++++++++++++++------------
 drivers/iio/accel/adxl345_core.c | 38 ++++++++++-----
 drivers/iio/industrialio-event.c |  1 +
 include/linux/iio/types.h        |  1 +
 4 files changed, 81 insertions(+), 40 deletions(-)

-- 
2.47.3

