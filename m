Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9473E9F8A
	for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 15:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773759845; cv=none; b=tNKrzXaAbcVHFOEUSCIbFwvxRHg8NtKXgCIErjeAKoeEFBy1LaLO76XgWUZzJKhXblCP54xROLlSnJAxctN0N8gvyklozuAgIk370u7PbjfavHkPClgDgMSAzLsQGICbkOYHVwIZ01f/j1Vnx5ots04enYV8w/DcV+P92Ytg6VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773759845; c=relaxed/simple;
	bh=3gJuZXgHzE2rXI2domcIKlpvuPEWhFJR3203rfyOu8M=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=O11NAIZtYcnjgY6i4JbZ/BjlYfrhmfL8zMlEmZUZrAkeUVLQwkTwy2e2rA9+hHbUQ6o3Ut/gslM2vcgyyMLfusz676U7sCR1NKyGmlOdsjgpWm8pZXtZYTYmhaMyh//6wxZ4zSLPxgi2cw3OrYgC5TthSaJbQHdZ7WZD9I00NB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=0xRNsv0n; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="0xRNsv0n"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-439af7d77f0so4351774f8f.0
        for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 08:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773759842; x=1774364642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GfDNVGPIN2le5n46HwmmKt51w/MhetLaeIkD5JM163s=;
        b=0xRNsv0nD+VHXoC38gnW3k1RGqDejLthpxdk2Nq0PserZeUBy6rE1UALNE6A2wlIWj
         +5Rj+yLWIlgVECggNZbAqTmVPZi2JSOvfZkaYe/ejcN3UoRZanBQmG0QKedQRnTBzOKp
         vrmx0ib/vackG7y4z5Jj5Rxa8XFLdQYobF7gWLgJtjXs6J2iyh6DhQWOwgUn58qKtqst
         Taj5Y+tfgUAD91TZwLqUJ0qZ+X0rdhUQnCmTBkjl65XqziTzP4pCam/HzvY4mTJmTFI+
         20NIz+91f1Rpx+By9fwaKPiO3cn/tDrbxb0ipsn8VOKsqRckt6zYNeIw5GPHK/yoGWYe
         Xw9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773759842; x=1774364642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GfDNVGPIN2le5n46HwmmKt51w/MhetLaeIkD5JM163s=;
        b=AypTJO0UYcyFQNmeaH7jbRN2q4i0tNr743ZCxsvW9WphOYk3ipgMGH1s7SjJv7o9rL
         +DFhWmswCU2dlcyK0ldrGFL+aBNxygN3Cv915cCv9Nis+NX1Mx4NBDy7kTGdgbPcCQyp
         EoTBgu+pIOjhuM49mES5WhD8GBxr+B6rO6yjkvqIXlCCGNucthjJBkOvVRSliYlZagcA
         U9UXkLecVKdcX2t/vLVBP+MtnfWbKz89FgkYIWPsYhy032hMN491DKHdSu+3rMAWJB/V
         KI+zZBfhEPPdNFUiu0EZpTK+6OgIuTqEzBGxOKasBF+O22b3t+RzNqpvhnRatqMckqaC
         fC3w==
X-Forwarded-Encrypted: i=1; AJvYcCXjP0mgBVo+LsUuSEN72aGjvmTbZnAJKlQBo/LSelHSw2FZWjmxqefr3wPJbp7cD81s2Xiq5hvzX8k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz9XcuJvYGiP9ZFhWQ9sRD388uDREYQi5YZAGRNEF1F9lALdMB
	tbxLoMQb8a6UrRYgOnzMIjViv2cAcP0OusrmxRNqb0FA2HIZhFxiBTpz8Oo9zWwzqA4IU3Vomu7
	Z0Q34l9Q=
X-Gm-Gg: ATEYQzy2Civ7szGXKefaoNxLS1/QQ+/xhnArL8rAXmGr1x6a/xllGNyZX6V+3ZRrHDp
	Jb1xbroJ1Mq9xwe332WtkMqPEQ3ApWVQLgSPlT/xqQOPgl1NU9Ox8guMHVQWwJpXaslpYyo3aHA
	Ba0HfaKIBul8XUWw9cFJ3Ysptcrn7jqSyORQk6nGmTn5zRySbuKAxy7pcBQL6wV9FO/M70PRGwG
	36tfUf9He0CiQ/xSwhAidbVHkGCI7crIu5DMBjbciqOhC93GPkEzvUxqcDHs8rU3z9/RXn9Zkqu
	AMeUn9fP9/6GqCWWp5QlC653pIGHxZdgZcgA34mAC6rYAp53kHqO0p6645QCcJVVRgx2xKvg1VA
	Qv/RiFk2l+v5vyfiyvzV7t2HJRaF2ZaMdiaOhs7L3avyUR/sBbJOLkv8cTYN+f66OdQsOAw==
X-Received: by 2002:a05:6000:230f:b0:439:b79d:b99f with SMTP id ffacd0b85a97d-43a04dc0568mr31062236f8f.40.1773759842112;
        Tue, 17 Mar 2026 08:04:02 -0700 (PDT)
Received: from localhost ([151.37.101.237])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51852aa8sm89261f8f.15.2026.03.17.08.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 08:04:01 -0700 (PDT)
From: Francesco Lavra <flavra@baylibre.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org
Subject: [PATCH v8 2/6] iio: Replace 'sign' field with union in struct iio_scan_type
Date: Tue, 17 Mar 2026 16:04:01 +0100
Message-Id: <20260317150401.3878294-1-flavra@baylibre.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260317150316.3878107-1-flavra@baylibre.com>
References: <20260317150316.3878107-1-flavra@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2677; i=flavra@baylibre.com; h=from:subject; bh=3gJuZXgHzE2rXI2domcIKlpvuPEWhFJR3203rfyOu8M=; b=owEB7QES/pANAwAKAe3xO3POlDZfAcsmYgBpuW1h1uYuWrYCw/6uqGVTi6n5o9bz5kSuOfvy1 L61H6lo4CCJAbMEAAEKAB0WIQSGV4VPlTvcox7DFObt8TtzzpQ2XwUCabltYQAKCRDt8TtzzpQ2 X9qWC/9ql0gkurGhYbfnfbYoMG+f/91ADwASWY5YXLGiPA5G3QMNu/I+kMij7XDcyxiN6rA2CJu 7jYFCUtQD/AgLCiNvuI+8rkTLSUW5Ugy+xDso9bg+qZGNP9CeISr4yFfG8xj1CNmWQrFbWVjouz ROZ19D8K9+JkXvvV1JO9bjdGWOUnVaNKKTWTgM3ZUbfIEYk7xAA0UZG1Ngk7kYfjImit+LwmJl2 qeXkPBtfY9AJZb6mEzqFWLmnDBH1HJbuD73enxc4M41tQeq/rmSzefdNxay6ZSi2dEM5xW08Rz3 uOkiTduKfdhV4F+OhUIMrbu5gAUycX+9Kob/OUDsQYn3Y4qn8OTB99LzxMXbWD4LWQzLMA79dz7 h4XDvOXxuLrPOAgwzY98066xPi8wSVsk9zjgprt+0XU+U4sPM0VallOWJwLU8eOGvvA92+k7e0m 0n/5LFcO9JY9pq3GyZtILwcgn+5BjXMLUkc1Cl+sJC8nYIabutM+dsL8TysSpeHuby8n0=
X-Developer-Key: i=flavra@baylibre.com; a=openpgp; fpr=8657854F953BDCA31EC314E6EDF13B73CE94365F
Content-Transfer-Encoding: 8bit

This field is used to differentiate between signed and unsigned integers.
A following commit will extend its use in order to add support for non-
integer scan elements; therefore, replace it with a union that contains a
more generic 'format' field. This union will be dropped when all drivers
are changed to use the format field.
Opportunistically replace character literals with symbolic constants that
represent the set of allowed values for the format field.

Signed-off-by: Francesco Lavra <flavra@baylibre.com>
---
 Documentation/driver-api/iio/buffers.rst |  4 ++--
 include/linux/iio/iio.h                  | 17 +++++++++++++++--
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/Documentation/driver-api/iio/buffers.rst b/Documentation/driver-api/iio/buffers.rst
index 63f364e862d1..e16abaf826fe 100644
--- a/Documentation/driver-api/iio/buffers.rst
+++ b/Documentation/driver-api/iio/buffers.rst
@@ -78,7 +78,7 @@ fields in iio_chan_spec definition::
    /* other members */
            int scan_index
            struct {
-                   char sign;
+                   char format;
                    u8 realbits;
                    u8 storagebits;
                    u8 shift;
@@ -98,7 +98,7 @@ following channel definition::
 		   /* other stuff here */
 		   .scan_index = 0,
 		   .scan_type = {
-		           .sign = 's',
+		           .format = IIO_SCAN_FORMAT_SIGNED_INT,
 			   .realbits = 12,
 			   .storagebits = 16,
 			   .shift = 4,
diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
index a9ecff191bd9..d48a0ab01b8d 100644
--- a/include/linux/iio/iio.h
+++ b/include/linux/iio/iio.h
@@ -176,9 +176,19 @@ struct iio_event_spec {
 	unsigned long mask_shared_by_all;
 };
 
+/*
+ * Format values in scan type
+ * @IIO_SCAN_FORMAT_SIGNED_INT: Signed integer (two's complement).
+ * @IIO_SCAN_FORMAT_UNSIGNED_INT: Unsigned integer.
+ */
+#define IIO_SCAN_FORMAT_SIGNED_INT	's'
+#define IIO_SCAN_FORMAT_UNSIGNED_INT	'u'
+
 /**
  * struct iio_scan_type - specification for channel data format in buffer
- * @sign:		's' or 'u' to specify signed or unsigned
+ * @sign:		Deprecated, use @format instead.
+ * @format:		Data format, can have any of the IIO_SCAN_FORMAT_*
+ *			values.
  * @realbits:		Number of valid bits of data
  * @storagebits:	Realbits + padding
  * @shift:		Shift right by this before masking out realbits.
@@ -189,7 +199,10 @@ struct iio_event_spec {
  * @endianness:		little or big endian
  */
 struct iio_scan_type {
-	char	sign;
+	union {
+		char sign;
+		char format;
+	};
 	u8	realbits;
 	u8	storagebits;
 	u8	shift;
-- 
2.39.5

