Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119BC3D88FE
	for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 08:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774342077; cv=none; b=Bp+HMEWGkolwwGttzkRP2eBjCC9j7h3XRwISjSA4esUc3gAFsKUrL5vdyWuQR+XU2RV2LCyDdLrgB8c7UoxrgESrVc1ZvodUCVGtihBVm89+tYN9T6fOF/PpHzVwE7BD0ewl2G+8oxrxQhyJmG6IkR/5g/JRIvHPHiQbpd+X6hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774342077; c=relaxed/simple;
	bh=xFpob9c+xdUrGxlB4E2lbBybpHAq+lDyjDXxB70k3Yw=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Z8oyvxtvdZilvDet62sDpfgCUgTMKyks0tnS274B0nITLG4Bmmswtvud38fEOf6EP3R9rFJ+vsENlV+iCL4MmmSKhoeytnTsS4zBB21h+wR612G9ffcmgfZ3MqjUkiQpe5DUzBCljhUosk63NsmhptbvxwvRVe5aVKg8nlQxO7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=apnL3AwH; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="apnL3AwH"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-486507134e4so11940765e9.0
        for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 01:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1774342074; x=1774946874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eF1e1Cyy5V3LKfwsAPdeSvaTgNGlIqK/dZZ0MK0ok9s=;
        b=apnL3AwHZVba907nCL5CURBmZKXKIiIA/RtBTxo91xN49zSRRmAZhfYlKkZSoomKv5
         8FSQGZXdO6Emy8qhNttAZ/d16E4nxuLySaJA0AzOuFS+cqhg6OtkCyiNE5y+jAnghrrp
         2YojOkzB+BTOgsOY7DIxbLTvmrZn/Y/cdzRs0sq7mSZiDvNDAOanRcdlRhrK5ReCkvr3
         2N6+9iAWhOtxUcZgaKeoJbR5oitMoaRr/6IhASIXmqfHVfl6lcZPJdzNvoVqFeIf6SAf
         mWFXsWRpTYyZCt9rDNSTKlJqJnGr5QqzYz75heOaE00fH7VAq6IBKH3QDnrik4XZpkJB
         kSng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774342074; x=1774946874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eF1e1Cyy5V3LKfwsAPdeSvaTgNGlIqK/dZZ0MK0ok9s=;
        b=DUyziR053yrmeELZz9qRrT3R3mM6mXG55vNNLN3M2JfGQXjlcAQOcnUvMbM71URDig
         R2gOBl5pcfs819pvNJVTNDdrm62gDXtz2LuV2bB1Lnb4ojWjxQAtYZ34SMYjRbCrxMfm
         K3SCEGE/tiuYN/f6FKzQkz5xQA9B9xyurcUDdishDXmhI7O1JR7CUg0baCCkWwUimMQb
         6mcV2ajsKtFQmpdSKL3w4pDwLIfa7WNqXvW7NqPXF0ZVag/y4qjKi0ty4wFuNkqSppO2
         YBUySq7gxQ0nFOpJo+tBcY7EAxv4ZiV2CW7csbFMh6mBGsXXULRSQ+Pu+t/oisCSyDuj
         czFA==
X-Forwarded-Encrypted: i=1; AJvYcCUeS5hvDDr61vLwwiUqNqVtlZ5oOqzGwixqufCRAEZMhzKZUOyPV+Rz6rUEVLYZiI5xWsrzG+qzXhc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAs6c5vXGJV8k8X4BXWBVXJxuai26Cf1PxFV+QCa+zOC6M6NEu
	SPGKR6b9hV4LIBaygrrwv9z/EDjCP+Rpo6ck5ORd45Khb35HHURb4bz502EuIH4a1io=
X-Gm-Gg: ATEYQzw694Cygzl3gp1TeChdSvFQAvPIzlZQ7z9R48Z0rqDZnL4mOKcq3SpJn2q4STG
	UOJvjey/k6soK3oO5VfUHdyXNdF2lcRtpBh9F6XDKdtkCgK5MTkIUxKdyHExn6gRJ2lP3xdJrYq
	UJ4GW5YHtxEx6zWm5QIBjvbW240o5yx+cAanszFSPLZc/VrzLccM4dvZnmVTRy6yVlv2TBYS0Lb
	SLJ5byyviXNhmbRNBilxpT9+aUf+/mZKc3GqsCe07NhtI7vCn/SSnVAKGZnSu8BwyoEIobYfD14
	LIYNA8/1MYU1EjLe8igO/axDCGJo4MnktcpBUuHU95NL6abvqqs6lFABNYFsWgi0Y9sQAQjMmA0
	PEv58HwicqEg8aSmzdPNUMYMIXfB5iETdW1j6aXCTwQjHNb62ZHY8dpktkx0xfXpIXQs=
X-Received: by 2002:a05:600c:3b07:b0:485:4278:2558 with SMTP id 5b1f17b1804b1-486fedab705mr205574955e9.6.1774342074389;
        Tue, 24 Mar 2026 01:47:54 -0700 (PDT)
Received: from localhost ([151.43.230.2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4871105c7a5sm13620915e9.16.2026.03.24.01.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 01:47:54 -0700 (PDT)
From: Francesco Lavra <flavra@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v9 4/6] iio: ABI: Add support for floating-point numbers in buffer scan elements
Date: Tue, 24 Mar 2026 09:47:53 +0100
Message-Id: <20260324084753.654037-1-flavra@baylibre.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260324084655.653781-1-flavra@baylibre.com>
References: <20260324084655.653781-1-flavra@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5730; i=flavra@baylibre.com; h=from:subject; bh=xFpob9c+xdUrGxlB4E2lbBybpHAq+lDyjDXxB70k3Yw=; b=owEB7QES/pANAwAKAe3xO3POlDZfAcsmYgBpwk+47k6zuOvuU9cHfiHzsxR9jkRQJzMMrJo3m Jv+TAeOEyKJAbMEAAEKAB0WIQSGV4VPlTvcox7DFObt8TtzzpQ2XwUCacJPuAAKCRDt8TtzzpQ2 X57EC/43WSzXh5yhYFg1UnElcKGkaOMJShfdS/lwgczqeTfBJX3nWtBAGKO5qHT3g5BtxM6DpjF GA0BGtlK9AMIQKDY8G4fJuKl3S5S1ruusuJHMYzo5Ro040Llo7L0vpdQsQAiINabLg3nL4xfts+ iEk+xEJvusQ5aBPcHvf+EDOI9AAdcC+TMc5HVRmjWt2vw9yT+6hN0guZ8tB8blTHQ1kxCVifiTf ZuPak3ArdPOCgfCCU1DfS8AHfYtnqt7i2WdIY/fu4YzrzmHl6Vk9TuIaJO9Wz3iWYmW3vkC10Kd E29UnD4RPr5AhrXQXaD810MTg/sJ7Z5R70X7fTeU/WmBe4P3QbwDMqOYy2P3DiWXwRAK5pFVIEt IrimJoKIxV1JJZdAdme76Hd7a9DHrXTi92e7gSLZVyhdhUQflwWOg5ayxZodI5TKS+57O7RxL5k EMLCXLHrfdFH3KJQjaXMOKOzHqxBVAW+000wg/z/Kz3ihIYj3YN66UPh+26g03QJizqPo=
X-Developer-Key: i=flavra@baylibre.com; a=openpgp; fpr=8657854F953BDCA31EC314E6EDF13B73CE94365F
Content-Transfer-Encoding: 8bit

In the data storage description of a scan element, the first character
after the colon can have the values 's' and 'u' to specify signed and
unsigned integers, respectively.
Add 'f' as an allowed value to specify floating-point numbers formatted
according to the IEEE 754 standard.

Signed-off-by: Francesco Lavra <flavra@baylibre.com>
---
 Documentation/ABI/testing/sysfs-bus-iio  | 33 +++++++++++++-----------
 Documentation/driver-api/iio/buffers.rst |  3 ++-
 Documentation/iio/iio_devbuf.rst         |  3 ++-
 include/linux/iio/iio.h                  |  7 +++++
 4 files changed, 29 insertions(+), 17 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-iio b/Documentation/ABI/testing/sysfs-bus-iio
index 5f87dcee78f7..bd6c3305dd2b 100644
--- a/Documentation/ABI/testing/sysfs-bus-iio
+++ b/Documentation/ABI/testing/sysfs-bus-iio
@@ -1510,21 +1510,24 @@ Contact:	linux-iio@vger.kernel.org
 Description:
 		Description of the scan element data storage within the buffer
 		and hence the form in which it is read from user-space.
-		Form is [be|le]:[s|u]bits/storagebits[>>shift].
-		be or le specifies big or little endian. s or u specifies if
-		signed (2's complement) or unsigned. bits is the number of bits
-		of data and storagebits is the space (after padding) that it
-		occupies in the buffer. shift if specified, is the shift that
-		needs to be applied prior to masking out unused bits. Some
-		devices put their data in the middle of the transferred elements
-		with additional information on both sides.  Note that some
-		devices will have additional information in the unused bits
-		so to get a clean value, the bits value must be used to mask
-		the buffer output value appropriately.  The storagebits value
-		also specifies the data alignment.  So s48/64>>2 will be a
-		signed 48 bit integer stored in a 64 bit location aligned to
-		a 64 bit boundary. To obtain the clean value, shift right 2
-		and apply a mask to zero the top 16 bits of the result.
+		Form is [be|le]:[f|s|u]bits/storagebits[>>shift].
+		be or le specifies big or little endian. f means floating-point
+		(IEEE 754 binary format), s means signed (2's complement), u means
+		unsigned. bits is the number of bits of data and storagebits is the
+		space (after padding) that it occupies in the buffer; when using a
+		floating-point format, bits must be one of the width values defined
+		in the IEEE 754 standard for binary interchange formats (e.g. 16
+		indicates the binary16 format for half-precision numbers). shift,
+		if specified, is the shift that needs to be applied prior to
+		masking out unused bits. Some devices put their data in the middle
+		of the transferred elements with additional information on both
+		sides. Note that some devices will have additional information in
+		the unused bits, so to get a clean value the bits value must be
+		used to mask the buffer output value appropriately. The storagebits
+		value also specifies the data alignment. So s48/64>>2 will be a
+		signed 48 bit integer stored in a 64 bit location aligned to a 64
+		bit boundary. To obtain the clean value, shift right 2 and apply a
+		mask to zero the top 16 bits of the result.
 		For other storage combinations this attribute will be extended
 		appropriately.
 
diff --git a/Documentation/driver-api/iio/buffers.rst b/Documentation/driver-api/iio/buffers.rst
index e16abaf826fe..8779022e3da5 100644
--- a/Documentation/driver-api/iio/buffers.rst
+++ b/Documentation/driver-api/iio/buffers.rst
@@ -37,9 +37,10 @@ directory contains attributes of the following form:
 * :file:`index`, the scan_index of the channel.
 * :file:`type`, description of the scan element data storage within the buffer
   and hence the form in which it is read from user space.
-  Format is [be|le]:[s|u]bits/storagebits[Xrepeat][>>shift] .
+  Format is [be|le]:[f|s|u]bits/storagebits[Xrepeat][>>shift] .
 
   * *be* or *le*, specifies big or little endian.
+  * *f*, specifies if floating-point.
   * *s* or *u*, specifies if signed (2's complement) or unsigned.
   * *bits*, is the number of valid data bits.
   * *storagebits*, is the number of bits (after padding) that it occupies in the
diff --git a/Documentation/iio/iio_devbuf.rst b/Documentation/iio/iio_devbuf.rst
index dca1f0200b0d..e91730fa3cea 100644
--- a/Documentation/iio/iio_devbuf.rst
+++ b/Documentation/iio/iio_devbuf.rst
@@ -83,9 +83,10 @@ and the relevant _type attributes to establish the data storage format.
 
 Read-only attribute containing the description of the scan element data storage
 within the buffer and hence the form in which it is read from userspace. Format
-is [be|le]:[s|u]bits/storagebits[Xrepeat][>>shift], where:
+is [be|le]:[f|s|u]bits/storagebits[Xrepeat][>>shift], where:
 
 - **be** or **le** specifies big or little-endian.
+- **f** specifies if floating-point.
 - **s** or **u** specifies if signed (2's complement) or unsigned.
 - **bits** is the number of valid data bits.
 - **storagebits** is the number of bits (after padding) that it occupies in the
diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
index 745290bd9af4..97ac4961585f 100644
--- a/include/linux/iio/iio.h
+++ b/include/linux/iio/iio.h
@@ -190,6 +190,13 @@ struct iio_event_spec {
  */
 #define IIO_SCAN_FORMAT_UNSIGNED_INT	'u'
 
+/**
+ * define IIO_SCAN_FORMAT_FLOAT - floating-point data format
+ *
+ * &iio_scan_type.format value for IEEE 754 floating-point numbers.
+ */
+#define IIO_SCAN_FORMAT_FLOAT		'f'
+
 /**
  * struct iio_scan_type - specification for channel data format in buffer
  * @sign:		Deprecated, use @format instead.
-- 
2.39.5

