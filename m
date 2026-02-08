Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D96828750A
	for <linux-doc@vger.kernel.org>; Sun,  8 Feb 2026 15:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770563136; cv=none; b=fG8Tczp+FwTVv+wgc/2lIyp92S7R8pc/ytXa9xZbjrraaL/reB7IyKy4wyaPfNVmu/428MPKi/a7bw7d3oNk9iqdetXYmjA74sgrqR/xIToOyQo9ppPW4YrpiWnFXH0XNwaGQWEkilWxCvqXFutiKYgZekkR7dpVIMkb56588jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770563136; c=relaxed/simple;
	bh=IUjmltrTFO4YbZQalOEcuCS0vZJiq0YFeUYJfges9VM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FtqfVqS1xN/H0PReYNwthnPwmOQS2/sGaVxJvHp0wh2mW3ZcDki5KR6a9CHl7ryQPQg0hT+//i5xex8xjcw6pB9XLcspkh9iaHJlf/e0m2jie69oCylzaq85OeSbsn9OvqLAWhA0Z8Zl7EtKpNZe9yFGUu4ZPe1FF1BoF+MtfSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iiA7IMYH; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iiA7IMYH"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47ee76e8656so56154315e9.0
        for <linux-doc@vger.kernel.org>; Sun, 08 Feb 2026 07:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770563134; x=1771167934; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I8B3KYHW7oN1cE0ooieHtgCbkDaH2P1LrwaeA4680tA=;
        b=iiA7IMYHlTm7UsKVpJxtp0+YEd2qV0JRCY5IAXOwbKbOAr/R0twjCzQAyLSk4QCQME
         24Z0iCwqUgoaTLjZkQQZDpcH21PtusRoTwYJaA9/8Bcf4FqgO4Bl7djxPPZXdFZTPbrK
         9t8oUqoWm0eszeI95jBRXED9itKkSW9MiPcqZSJXmPMkT0KmbxSX3qtdXxP1MWiiWXmI
         +qEDNRf+dXezY0e+bkQMxPPnsjrGQcJ+N7xd+i+93fto8+skFTERlUQLN532obK0tMlm
         JacxDvUVnPsV3WHdYUPyJEGMe0JAI0+L9As1E8mbKa/a2fMsPcTN381xvtThLyf1gncY
         bgzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770563134; x=1771167934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I8B3KYHW7oN1cE0ooieHtgCbkDaH2P1LrwaeA4680tA=;
        b=W948N2GbuYBegyMiAEoL4UzeSKxM7ZoF4l1fDXBA0SeK2xf8MXyGill8ISmEDRsXyp
         I6SCMVZyp8219WcHhL7Io7PvWpwKyaYlEa/zHAJwFF1LO1vYYCxDQvDO95vCulDNb4nU
         wEtHcCSBFGe8xd1siOEkuXslXEUI7nwqMNBpGwiZE1mQhWLktFo9o3A2rRfGn36lgevA
         ac2S/jGOiaihgs2wqHKs7IumZEPWwWN24Ia4CUuQI3qi2aV0FZPiFULGQ0RDPZl1lrT7
         vElzpDPI7N3VWNBJQgrOqONzeMCGd8ENDHRyqC3ln9oOo4G2QbAHUv6thWYqucM04/qr
         cM4w==
X-Forwarded-Encrypted: i=1; AJvYcCWC2eeMHqtro0vwl2GMVkqmtNuQ80jHviYIXtQKX3+5fjZ7AKXAkEhTSuTNisiaBxDB3pp6gTwH9w8=@vger.kernel.org
X-Gm-Message-State: AOJu0YylNN6k+yh19ZlbFBfCfMv86Um9T3Cxjf4B43/vaIS2iS3ZPp23
	j5x2INXl3HMnehllCMtT1X0RgZ8M/amRpFJk7wb/m2sOoi00wYU0dQiw031akQ==
X-Gm-Gg: AZuq6aK4TBkXr3cJyISLod4yqaXEjhHL06gr3T+M0QxxI1qqQ2Xm5iOaJwOmx1a9r7b
	ZdGZtqstZlnJtYrXQZPu3xy5EizQBGDKsQ7vdK2zLaN2sQTxTDwNMJasMZbVJieZyLCTMN2iphE
	K7S8Gpg+3LrR+96hFTUKCmRaWJo8H+YFvlA2Xp7dLJjKC9NgV6w41LH4ybLK6ySfv5sID5Hy28V
	4P2zn5IXYiABK1rYbF6SBAre9kcYWVJchO7CGtdvL8QO76xBpdbpiKmpavKlfi57UIl9rqD6HeZ
	JQJ1d37RAu6Sc8bAlBPb4mcfed2llX9o+njH48QyCYWWF1pONjeclQDcvW8oADIDlK09j4EwB7k
	oln3ZgVvSnlhAmxRxsSmpYEwrj72ZQN39GhBGeZWkq9t3YxaZ72yzez2z949YV3e1se9CcJbGPR
	TaO+r7mJLJbiVQvzRu3kXkBlo6yYGUfj58+eBkQZiUsyBeNy0PxA==
X-Received: by 2002:a05:600c:1d24:b0:477:7c7d:d9b2 with SMTP id 5b1f17b1804b1-48320236b1emr108520665e9.32.1770563134446;
        Sun, 08 Feb 2026 07:05:34 -0800 (PST)
Received: from DB-VM.1337.ma ([197.230.240.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483206cc7d3sm179326255e9.5.2026.02.08.07.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 07:05:34 -0800 (PST)
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
Subject: [PATCH v3 3/4] iio: accel: adxl345: Implement event scaling for ABI compliance
Date: Sun,  8 Feb 2026 10:05:04 -0500
Message-ID: <20260208150515.14798-4-0rayn.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260208150515.14798-1-0rayn.dev@gmail.com>
References: <20260208150515.14798-1-0rayn.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ADXL345 uses a fixed threshold resolution of 62.5 mg/LSB for
event-related registers. Previously, the driver reported raw
values without a scale factor.

Implement IIO_EV_INFO_SCALE for all event types to provide the
conversion factor (0.612915 m/s^2) as required by the IIO ABI.

Suggested-by: Jonathan Cameron <jic23@kernel.org>
Signed-off-by: Taha Ed-Dafili <0rayn.dev@gmail.com>
---
 drivers/iio/accel/adxl345_core.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/accel/adxl345_core.c b/drivers/iio/accel/adxl345_core.c
index 78e3f799ecc1..dfe3169ffc5f 100644
--- a/drivers/iio/accel/adxl345_core.c
+++ b/drivers/iio/accel/adxl345_core.c
@@ -212,7 +212,8 @@ static const struct iio_event_spec adxl345_events[] = {
 		.type = IIO_EV_TYPE_MAG,
 		.dir = IIO_EV_DIR_RISING,
 		.mask_shared_by_type =
-			BIT(IIO_EV_INFO_ENABLE) |
+			BIT(IIO_EV_INFO_ENABLE)	|
+			BIT(IIO_EV_INFO_SCALE)	|
 			BIT(IIO_EV_INFO_VALUE),
 	},
 	{
@@ -221,6 +222,7 @@ static const struct iio_event_spec adxl345_events[] = {
 		.dir = IIO_EV_DIR_RISING,
 		.mask_shared_by_type =
 			BIT(IIO_EV_INFO_ENABLE) |
+			BIT(IIO_EV_INFO_SCALE)	|
 			BIT(IIO_EV_INFO_VALUE),
 	},
 	{
@@ -228,15 +230,19 @@ static const struct iio_event_spec adxl345_events[] = {
 		.type = IIO_EV_TYPE_GESTURE,
 		.dir = IIO_EV_DIR_SINGLETAP,
 		.mask_separate = BIT(IIO_EV_INFO_ENABLE),
-		.mask_shared_by_type = BIT(IIO_EV_INFO_VALUE) |
+		.mask_shared_by_type =
+			BIT(IIO_EV_INFO_VALUE)	|
+			BIT(IIO_EV_INFO_SCALE)	|
 			BIT(IIO_EV_INFO_TIMEOUT),
 	},
 	{
 		/* double tap */
 		.type = IIO_EV_TYPE_GESTURE,
 		.dir = IIO_EV_DIR_DOUBLETAP,
-		.mask_shared_by_type = BIT(IIO_EV_INFO_ENABLE) |
-			BIT(IIO_EV_INFO_RESET_TIMEOUT) |
+		.mask_shared_by_type =
+			BIT(IIO_EV_INFO_ENABLE)		|
+			BIT(IIO_EV_INFO_RESET_TIMEOUT)	|
+			BIT(IIO_EV_INFO_SCALE)		|
 			BIT(IIO_EV_INFO_TAP2_MIN_DELAY),
 	},
 };
@@ -274,7 +280,8 @@ static const struct iio_event_spec adxl345_fake_chan_events[] = {
 		.dir = IIO_EV_DIR_FALLING,
 		.mask_separate = BIT(IIO_EV_INFO_ENABLE),
 		.mask_shared_by_type =
-			BIT(IIO_EV_INFO_VALUE) |
+			BIT(IIO_EV_INFO_VALUE)	|
+			BIT(IIO_EV_INFO_SCALE)	|
 			BIT(IIO_EV_INFO_PERIOD),
 	},
 	{
@@ -283,7 +290,8 @@ static const struct iio_event_spec adxl345_fake_chan_events[] = {
 		.dir = IIO_EV_DIR_FALLING,
 		.mask_separate = BIT(IIO_EV_INFO_ENABLE),
 		.mask_shared_by_type =
-			BIT(IIO_EV_INFO_VALUE) |
+			BIT(IIO_EV_INFO_VALUE)	|
+			BIT(IIO_EV_INFO_SCALE)	|
 			BIT(IIO_EV_INFO_PERIOD),
 	},
 };
@@ -1367,6 +1375,14 @@ static int adxl345_read_event_value(struct iio_dev *indio_dev,
 				return ret;
 			*val = sign_extend32(tap_threshold, 7);
 			return IIO_VAL_INT;
+		case IIO_EV_INFO_SCALE:
+			/*
+			 * The event threshold LSB is fixed at 62.5 mg/LSB
+			 * 0.0625 * 9.80665 = 0.612915625 m/s^2
+			 */
+			*val = 0;
+			*val2 = 612915;
+			return IIO_VAL_INT_PLUS_MICRO;
 		case IIO_EV_INFO_TIMEOUT:
 			*val = st->tap_duration_us;
 			*val2 = MICRO;
-- 
2.47.3

