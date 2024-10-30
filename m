Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B1C1EF082
	for <linux-doc@vger.kernel.org>; Wed, 30 Oct 2024 13:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730295887; cv=none; b=t+KfSzNKUmrniFr8z4/ba3Gm/ZCwXVSS3heKq/GbfABjapLmwL+YJTJx1y30oriuB/CmIq8h0hkJTMxPDt5jGhWnAvbrqzYuxIpIpvAsA7XHbYR0HRLqmlGZ1FmmM/77xeWGJb9g5KYK09maU9/tDFhQz0iwD87v1uNEB8+oLXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730295887; c=relaxed/simple;
	bh=lyFd5Qy9b/diKvMLRhapoJ8Lj/FcZgWn8uTxreNufZw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MD10mD2OtWsQ0azCvt/Suc6eQgj/h5mjvs7LBrM2H9Ip5IHIKoOe6lXWLWg/N8slSS0qGN9ucmZn20TFWKNwgnyokBOL+x95D/pZumOmSMvK8KdHhDcnXYOC1d0NAbXq2pX1nAyJ4+pjp1e2GCj0xN87C7SA7tuOep6ka0TxQRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=TBgdcrxG; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="TBgdcrxG"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4316cce103dso84468015e9.3
        for <linux-doc@vger.kernel.org>; Wed, 30 Oct 2024 06:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730295882; x=1730900682; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dSM1H9kQmZbNYjD2c9OgvWRYm0lRsPAWlbXFXQCdhuI=;
        b=TBgdcrxGvba4ZuXK1SG4WM1YUxazRDtpDYxoXKL7TRfX6ZAiU4r7bMf8v8bqSEx0oT
         VmyW9rXK6aNs/UgHRK8+V/FQapyXY1yuAF/Bqqznx9muE+DCuTkU3mu/fg46W7Dk1zT/
         C0WF2WjKE+6zO9W5JRvpzZo+bYhwkIi47w1G9gIILHNnhQFwS9Ych5dDtd7v0REdTV8f
         6jj57+WYIC3Mt3FLU5Mcwq76dy2ClU/6DBIRbLnV6lyRx9uc6C7OibbaT3eukzI29iEw
         IEC+mMtjB+v5RqZ4tZWJZHEeGWLEUCGQ09GUxYq9+WaiFA3DbS4kdUJOuPWG/ZKywZJ/
         2T9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730295882; x=1730900682;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dSM1H9kQmZbNYjD2c9OgvWRYm0lRsPAWlbXFXQCdhuI=;
        b=t9QwyBnrGc5YEESvhoffLfoDCduPN9qWonHNsWtEciL87UNNIt/60IVK2YK4jKbSnG
         g4cg8WHNVnJJ470LWAIfkGe/w4NnPc+3dZ7FMAJUm0XvI9LPQnGvwE+aW7Zku5jNGEJd
         io1VJAQuUUe7mzD3casjlYbNamLk6veCYCnBTN1R1bBuY94ocGAxnNQyfRZ5okqxO6BZ
         gKZhAUIIR+pzqclH/4HO6CRBNK08/m5Egk56/Cr+wuELtZLaq7RRejwhXAgLqhsE23Us
         kV1pvdDhtimZflWCV7LTlsWPNfQ2VSB7DBfEfMTBFuuwbCA1pSJWgGonNfTBO2dE2n99
         2JpA==
X-Forwarded-Encrypted: i=1; AJvYcCXkYMKcn3zKgP7E4uPZHphhoW0L0hBiZi7Takf2/pm6MZTArK11YwNxagaqmleA6harwGuaNHzAlNc=@vger.kernel.org
X-Gm-Message-State: AOJu0YygW+sW2VMaNewTD4AFUkUFIeCAEGvXRFKThhl8Z8aYXHxDP4MH
	wsfPDvovvir1/fX5YVK0C4pNflCof/5tOHq+tq6NFGcf+Cr3AlholADajc88n/Y=
X-Google-Smtp-Source: AGHT+IE2n8u+e+ZREW1BpdcgVl/9aw+yhcg+q8JpfH04yUN5XBE8lhFyGFOGAUTC9j2X67KQA3sBlg==
X-Received: by 2002:a05:600c:4f4a:b0:431:4b88:d407 with SMTP id 5b1f17b1804b1-4319ac6f874mr169681245e9.5.1730295882572;
        Wed, 30 Oct 2024 06:44:42 -0700 (PDT)
Received: from [192.168.1.62] (2a02-842a-d52e-6101-6f8f-5617-c4b6-8627.rev.sfr.net. [2a02:842a:d52e:6101:6f8f:5617:c4b6:8627])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd97d693sm22135175e9.24.2024.10.30.06.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 06:44:42 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
Date: Wed, 30 Oct 2024 14:44:29 +0100
Subject: [PATCH v4 5/5] docs: iio: ad7380: add adaq4370-4 and adaq4380-4
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241030-ad7380-add-adaq4380-4-support-v4-5-864ff02babae@baylibre.com>
References: <20241030-ad7380-add-adaq4380-4-support-v4-0-864ff02babae@baylibre.com>
In-Reply-To: <20241030-ad7380-add-adaq4380-4-support-v4-0-864ff02babae@baylibre.com>
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 David Lechner <dlechner@baylibre.com>, Jonathan Cameron <jic23@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Julien Stephan <jstephan@baylibre.com>
X-Mailer: b4 0.14.2

Adding documentation for adaq4370-4 and adaq4380-4 supported devices. In
particular, document the reference voltage mechanism and the gain
parameter that are specific to adaq devices.

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 Documentation/iio/ad7380.rst | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/iio/ad7380.rst b/Documentation/iio/ad7380.rst
index 6f70b49b9ef27c1ac32acaefecd1146e5c8bd6cc..1b9777c33e0c3e9e06f72d7c957a012346d4a26a 100644
--- a/Documentation/iio/ad7380.rst
+++ b/Documentation/iio/ad7380.rst
@@ -27,6 +27,8 @@ The following chips are supported by this driver:
 * `AD7386-4 <https://www.analog.com/en/products/ad7386-4.html>`_
 * `AD7387-4 <https://www.analog.com/en/products/ad7387-4.html>`_
 * `AD7388-4 <https://www.analog.com/en/products/ad7388-4.html>`_
+* `ADAQ4370-4 <https://www.analog.com/en/products/adaq4370-4.html>`_
+* `ADAQ4380-4 <https://www.analog.com/en/products/adaq4380-4.html>`_
 
 
 Supported features
@@ -47,6 +49,12 @@ ad7380-4
 ad7380-4 supports only an external reference voltage (2.5V to 3.3V). It must be
 declared in the device tree as ``refin-supply``.
 
+ADAQ devices
+~~~~~~~~~~~~
+
+adaq4370-4 and adaq4380-4 don't have an external reference, but use a 3V
+internal reference derived from one of its supplies (``refin-supply``)
+
 All other devices from ad738x family
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
@@ -121,6 +129,14 @@ Example for AD7386/7/8 (2 channels parts):
 
 When enabling sequencer mode, the effective sampling rate is divided by two.
 
+Gain (ADAQ devices only)
+~~~~~~~~~~~~~~~~~~~~~~~~
+
+ADAQ devices have a pin selectable gain in front of each ADC. The appropriate
+gain is selectable from device tree using the ``adi,gain-milli`` property.
+Refer to the typical connection diagrams section of the datasheet for pin
+wiring.
+
 Unimplemented features
 ----------------------
 

-- 
2.47.0

