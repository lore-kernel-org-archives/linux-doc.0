Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B913E9F86
	for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 15:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773759857; cv=none; b=PXDNyXymJwKagF6/HORVHDvu8j9xdSNKy1xIq8/OKZZxhisiDmNfGV9PC0+T+Y4HALEkJeXNEj3RfVXAiBP3j8BcZ4d5d8Pbm0MqWeTiLIrdfWq/0BKjnnFnkv6mBJHCLj4AEUpLZMPOKyAesSolPgOWjwlJTi1uq8YVEopdvrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773759857; c=relaxed/simple;
	bh=nJstDZ/QxoZ2lCZSTohbFx88cUeNPJ2aHRDezpiEztg=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CYdtNWzbDdOEQDGEfBZJcZT6Ah7dxz+hyyOUIORNUZMaRBP909ix+y+79s3bNphpg47kxEpesf1X8wN3siydsLex+pymrGUTVF/dqN3jGdlxMFFRijxfsAhmhiw54546CXZZfavlv9nxjqeauPWok+Ix3M6Jh831HTFZN/9ueJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=vzGd9q3P; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="vzGd9q3P"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-439b2965d4bso4135949f8f.2
        for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 08:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773759854; x=1774364654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oof/EJX4ZjAg7qi0LTv1JyI3DSw6kCFAbKLxi0V35OE=;
        b=vzGd9q3P1man3wgFU8Ae/2FmCphz/ZIQYr9NxR3KvklRncYhwydgq2Fi5/OV745q1h
         1TVoWQ+G6hijXFGIvsCfNs3lE6xjFjHWwJys92XSwhQCBA30Kb/d/8abvK71UT/3/aYf
         FOHSScxLgqy+f6Clb/9qawXV08KHpTDuPhAhfLExztvvBAPX28ezB0M16lvBi0UN9HeU
         /j0C6qSm7fs/ogV1F7VUdMLzmhMqaB35YjVMs2MCCWCX07dQzRjI4TEbqWLFVhBVDhaE
         HdLKOSRVPyuICJy1ffHgr0j+bCIgjnGQjufpYtPyfguK6TNgNPkG0EAj/4cnffuYW998
         f+pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773759854; x=1774364654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oof/EJX4ZjAg7qi0LTv1JyI3DSw6kCFAbKLxi0V35OE=;
        b=pfVgclszBTZqSFGi5Or+Vb5bf4iiCPys4hLLGOejKJGZThvZDRrfSUa9k7ic8R11E6
         NN+pfuCFhDgvn3JP7xVkyfKZAQ3DS2CK8Mam0B/drvYEth+s48T85CcTw4ZSRfSbvUHV
         gT1kuAA5rDDL/LVvAxzLV8zLsCQ1yWLPv88KCMo9Q2aTjX8Jc1/uA3ehrmjjv3fw1zM0
         yoWVop7/tJXouRLZv4YJFbi+Ly6jn2TOKAZLP0yO/Rls9m6p8a9+2BV04Qs2lr3L5P8Q
         F8wxLPiG0Ef2VHi74hd6oxXKLHJmSc+z6grTArBj43+0XLl7evFZVZVNuXmxM93+2raS
         x7WA==
X-Forwarded-Encrypted: i=1; AJvYcCX/PGsPEn+uCVb7//UL3POPkWGMbdniUrT/6RHh9FqNKuw+92soozZnNdrdA2Ymzfm/NIfBS2kNccg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzE84+vN97dS4uye+HEKXRY4iMZ02BTEBOy180oKF6fUtOBWKju
	2zIt18NJXD+0TVno/lygaUgLJo5RELZ90k4V8OPET9jW3c4/3fUQ4JsFOKgFPoAyLi0=
X-Gm-Gg: ATEYQzwOuW8TM8ogLkbUaznCj6ThglOzhJkbBZ6Fb5l359hcmWVk4ttIQOSrYuCsVbA
	wiCOD1XH4DsWW64Rt0bKhJPR1uiLXKV5q+w52v1fGMvRdKHpRo8OdRP9oW7fyabs0vKLkI7wlgS
	7XTgQHGFIfHqaB0sBAs52/OXwtE1U3QmAqJ8wZTJf4W5gfUiLXcrTjBdPMzc11j8OvKzkYhfkA8
	ddPD5m05o9ChQvgWrCD+ERSnA8LRvP0yplBty+pmOgLzr4HzVKjj4RtEThhQRWGk1nMahMI3T/5
	baGtC0D6m2M5Q4MrxU1rxtKwTsUMwk70LDAa1Fd9f5es1auQB77nNjSLZGffW45sXabxqen5HLk
	4VW7/OUyvvvHMShBrhJMpPrqFlj2KlT/ymKFV6qnuZlXnCiRgmu0iA+FNcR63DRtuMww80GdqZf
	wQeK96SNFcX+lNhQ==
X-Received: by 2002:a05:600c:1388:b0:483:badb:618f with SMTP id 5b1f17b1804b1-485567050dcmr289431605e9.25.1773759854008;
        Tue, 17 Mar 2026 08:04:14 -0700 (PDT)
Received: from localhost ([151.37.101.237])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4856eaeca12sm131699815e9.12.2026.03.17.08.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 08:04:13 -0700 (PDT)
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
Subject: [PATCH v8 4/6] iio: ABI: Add support for floating-point numbers in buffer scan elements
Date: Tue, 17 Mar 2026 16:04:13 +0100
Message-Id: <20260317150413.3878365-1-flavra@baylibre.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260317150316.3878107-1-flavra@baylibre.com>
References: <20260317150316.3878107-1-flavra@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5769; i=flavra@baylibre.com; h=from:subject; bh=nJstDZ/QxoZ2lCZSTohbFx88cUeNPJ2aHRDezpiEztg=; b=owEB7QES/pANAwAKAe3xO3POlDZfAcsmYgBpuW1t8z8jlx35g+4GGQ9DFdnRdXczS088/vY6/ 7I230SyTA+JAbMEAAEKAB0WIQSGV4VPlTvcox7DFObt8TtzzpQ2XwUCabltbQAKCRDt8TtzzpQ2 X77VC/4qIu1oMFG1fT+Ujce45VvyVrqPCWBtWmoJuSCMcE84ii/nMOAI8amjPmTrut/ZeSF3RMA tRQWc1HXiyrN9TXlLGFAI2I60729IxamVGmO2WN0qE/Xv1NcHsn2Vd/O1wZb+XhvD2ZKw3gcaTv 4Pr+X8uaNwof5k4AoCbIsXvuEyOxTU8bhQyDlsuPvTiQHqaYlC6p8SQv+agknLOP2lL4cg2AtTc o5/U248wVWXY7iTdCwL4h3QNY4ze7XLTs+eky4ZxO6a0+c2/gy8IcalxghC4LgB/5Im5BcpXvhL MhujgxqoGzmUBLB1bKMxMNPLDillRTPfcSBJkkuezC2Vs3M8iVcNQJh68teEBcsabsYGFi4fw5s 8g3TJ2rT4DIPWjiZa4MrZg8GtQiK0BR+7V2daqkH5HL5AUxsY5SXipYjcXY1JYxw3qj5shHK00O JGHJ+8hBqaWkz3aN9+YILQa++ryvU84lLiZinXyTbs8k4yEo0rk/OwYf4vmKA3XYt4/nU=
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
 include/linux/iio/iio.h                  |  2 ++
 4 files changed, 24 insertions(+), 17 deletions(-)

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
index d48a0ab01b8d..1f2c1cb03394 100644
--- a/include/linux/iio/iio.h
+++ b/include/linux/iio/iio.h
@@ -180,9 +180,11 @@ struct iio_event_spec {
  * Format values in scan type
  * @IIO_SCAN_FORMAT_SIGNED_INT: Signed integer (two's complement).
  * @IIO_SCAN_FORMAT_UNSIGNED_INT: Unsigned integer.
+ * @IIO_SCAN_FORMAT_FLOAT: Floating point.
  */
 #define IIO_SCAN_FORMAT_SIGNED_INT	's'
 #define IIO_SCAN_FORMAT_UNSIGNED_INT	'u'
+#define IIO_SCAN_FORMAT_FLOAT		'f'
 
 /**
  * struct iio_scan_type - specification for channel data format in buffer
-- 
2.39.5

