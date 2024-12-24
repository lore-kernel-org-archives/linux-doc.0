Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C601ADFEB
	for <linux-doc@vger.kernel.org>; Tue, 24 Dec 2024 09:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735032882; cv=none; b=ckNI0hvh8ALJIQNSfjQt3qY19vRGp42pUMMOYfiDLmo6K7ztag6gD84ajMwhaj1vgskEUzFpfb+uL4xrUmi/WqgQ6wjO26A4wpTV1ckKc1H5jF5Yl4G94UXMGq5aR+MmapTspdRrcYVRBB7G75Z7so0Ajvw8Tnd4bcPXJgN1lUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735032882; c=relaxed/simple;
	bh=aweWmpL5g0zjtLjLvkjHfrZypMdsORngD8G/mYmjiw0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HD8jldgNgfbH9euL2JdjwdSuf6/fMcZ2zA5Pq6FxwLmw2t33nSdNJTXaE1yo/2iSsKibNbzxeuzCJVISdLUTF7j3oKaKRf07UcOubEkKxnFC/lEKGwxxxoZ1ll+n0cnxB+d1fuhG2ZDbrcZTHhPj0eGaBZQYnq6SaviecNDbSgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=fyC+1094; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="fyC+1094"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-436637e8c8dso47354485e9.1
        for <linux-doc@vger.kernel.org>; Tue, 24 Dec 2024 01:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1735032879; x=1735637679; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DTvD8FKKFGipdmXYj86+K+maZe38oNa1ur7/GExWl0U=;
        b=fyC+1094ytj0YtAW0nBSyaIVTS5EoYRnQDVFhi+1mMCUn0tgoywTKwd361oPfxOGWf
         nWDW9GmKXdMtu9mY6ILkbx9U3jcb3y2dmikyJXvBtck+8hMAb5Un0Gh/E+snIr4N4Grl
         e90vNRY11/ixe4ugIULm5puT9XwTM6HL+qdwPBweZJNAGmR98UYUX751UeZtTE2g3+8I
         KoWnX4XBZD/69vw1ZoZPYBZF3x0/ldxlz4cpdrB2KTB1L72JlG0IK2PGYtwfe2nBT0Fy
         /R2l0fS77yWkN2o/Jdr70tYXfpdGj5gbRSYViPODzEzi3Mlon1qFZUeAIKLgXV73iame
         NY+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735032879; x=1735637679;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DTvD8FKKFGipdmXYj86+K+maZe38oNa1ur7/GExWl0U=;
        b=mXkKAWmzN346LSAuLQF3y1nyfs10olKplIon0qqIBW6JL003GAqlZPHMa7tLAC8Hos
         xwo0MRjbS42gB055DIu98SOTjyXqKonKmHGJtbY0RQT3SznYZye2v1BXDjCfTzU6Djqk
         wGUC3noMr1SmnoMm0FXFxEd+jqMKoxMge1Y9DL7FILTJz2mr6yV8akacHaaUdaGdCgcP
         hIpfgzTCuStzEwTzMSXYDb809zK9w1eLNBgCzD75oGheJ2EOzBKrYlbuUB5AgC2x14NK
         vtlDytEAWtHbn+KHGh6PFmKBxuJdf+Ty32oSBhuhREBzrWkunSGZcNoEclfdW/kO1idQ
         DmuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUl91w1valNUvXPdBaEdwjUEbm1xte7ViYNsOfAy+KTigP3D6tvxyFqzf+ijbss+v8/bP9gjBs+v5k=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKaoisdXGrv9vTpqhqeKqkQCbqMt2f+zkhqkqw/CGV4smXCPuj
	zTTh2Yfzq60dc0JxGwpYQaq3baoy6QFlZ4JceQphv4yv7+a8Wfm97jxfIUuyZxAruxAcqaOYPoJ
	arQcQ6Q==
X-Gm-Gg: ASbGncttpxqTHqz1iGE8J9uhNxR0D8jmoaZhzPE6mGtgIRmlfY5twj+ZkpdiCY6Xed5
	K2UONa195gSNJnlOiQDDt7zuE8vEL4zokWbJeD/39ExQG5AnjutQ8HKx+D++9WzrfcbY0+HdfNQ
	FmSwtOaDnJZc3NSPJyb0F6HtMU16thW13r02oOmrwoSMupYQEd9jpXbYT7Hull5iDrgjOhwE/wx
	T6V81Os31b+jan8g3GtyLuut7qoJ8GtPzZXe+GtISGFo/GU7zrHw33fxOt2wMrabXiSWGsFFl9s
	o85PmTCPOsuAit00dwebVKdjxY5Bszpm9cPaqAZ0QKt2+vRvDA==
X-Google-Smtp-Source: AGHT+IFjhPDiLwUmF70XszgatjCLcuNynUslsAihnwb+MKydOpr05jWuW/8UpaHK61eRTH6thifznA==
X-Received: by 2002:a05:600c:1c22:b0:434:a10f:9b with SMTP id 5b1f17b1804b1-43668643b44mr134829815e9.14.1735032878428;
        Tue, 24 Dec 2024 01:34:38 -0800 (PST)
Received: from [192.168.1.62] (2a02-842a-d52e-6101-6fd0-06c4-5d68-f0a5.rev.sfr.net. [2a02:842a:d52e:6101:6fd0:6c4:5d68:f0a5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43661219a7csm160932535e9.24.2024.12.24.01.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 01:34:37 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
Date: Tue, 24 Dec 2024 10:34:32 +0100
Subject: [PATCH RFC v2 3/4] iio: adc: ad7380: add alert support
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241224-ad7380-add-alert-support-v2-3-7c89b2bf7cb3@baylibre.com>
References: <20241224-ad7380-add-alert-support-v2-0-7c89b2bf7cb3@baylibre.com>
In-Reply-To: <20241224-ad7380-add-alert-support-v2-0-7c89b2bf7cb3@baylibre.com>
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 David Lechner <dlechner@baylibre.com>, Jonathan Cameron <jic23@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Julien Stephan <jstephan@baylibre.com>
X-Mailer: b4 0.14.2

The alert functionality is an out of range indicator and can be used as an
early indicator of an out of bounds conversion result.

ALERT_LOW_THRESHOLD and ALERT_HIGH_THRESHOLD registers are common to all
channels.

When using 1 SDO line (only mode supported by the driver right now), i.e
data outputs only on SDOA, SDOB (or SDOD for 4 channels variants) is
used as an alert pin. The alert pin is updated at the end of the
conversion (set to low if an alert occurs) and is cleared on a falling
edge of CS.

The ALERT register contains information about the exact alert status:
channel and direction. Unfortunately we can't read this register because
in buffered read we cannot claim for direct mode.

User can set high/low thresholds and enable event detection using the
regular iio events:

  events/in_thresh_falling_value
  events/in_thresh_rising_value
  events/thresh_either_en

If the interrupt properties is present in the device tree, an IIO event
will be generated for each interrupt received.
Because we cannot read ALERT register, we can't determine the exact
channel that triggers the alert, neither the direction (hight/low
threshold violation), so we send and IIO_EV_DIR_EITHER event for all
channels.

In buffered reads, if input stays out of thresholds limit, an interrupt
will be generated for each sample read, because the alert pin is cleared
on a falling edge of CS (i.e when starting a new conversion). To avoid
generating to much interrupt, we introduce a reset_timeout that can be
used to disable interrupt for a given time (in ms)

  events/thresh_either_reset_timeout

When an interrupt is received, interrupts are disabled and re-enabled
after thresh_either_reset_timeout ms. If the reset timeout is set to 0,
interrupt are re-enabled directly.
Note: interrupts are always disabled at least during the handling of the
previous interrupt, because each read triggers 2 transactions, that can
lead to 2 interrupts for a single user read. IRQF_ONESHOT is not enough,
because, it postpones the 2nd irq after the handling of the first one,
which can still trigger 2 interrupts for a single user read.

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 drivers/iio/adc/ad7380.c | 354 ++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 350 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/adc/ad7380.c b/drivers/iio/adc/ad7380.c
index b49067c36fdd1bb0e760faf71d7fa0c8c1f610e9..fb59c2c064f402ea797fc0e563bd535d0e0bf785 100644
--- a/drivers/iio/adc/ad7380.c
+++ b/drivers/iio/adc/ad7380.c
@@ -34,6 +34,7 @@
 #include <linux/util_macros.h>
 
 #include <linux/iio/buffer.h>
+#include <linux/iio/events.h>
 #include <linux/iio/iio.h>
 #include <linux/iio/trigger_consumer.h>
 #include <linux/iio/triggered_buffer.h>
@@ -112,6 +113,43 @@ struct ad7380_chip_info {
 	const struct ad7380_timing_specs *timing_specs;
 };
 
+static const struct iio_event_spec ad7380_events[] = {
+	{
+		.type = IIO_EV_TYPE_THRESH,
+		.dir = IIO_EV_DIR_RISING,
+		.mask_shared_by_dir = BIT(IIO_EV_INFO_VALUE),
+	},
+	{
+		.type = IIO_EV_TYPE_THRESH,
+		.dir = IIO_EV_DIR_FALLING,
+		.mask_shared_by_dir = BIT(IIO_EV_INFO_VALUE),
+	},
+	{
+		.type = IIO_EV_TYPE_THRESH,
+		.dir = IIO_EV_DIR_EITHER,
+		.mask_shared_by_all = BIT(IIO_EV_INFO_ENABLE),
+	},
+};
+
+static const struct iio_event_spec ad7380_events_irq[] = {
+	{
+		.type = IIO_EV_TYPE_THRESH,
+		.dir = IIO_EV_DIR_RISING,
+		.mask_shared_by_dir = BIT(IIO_EV_INFO_VALUE),
+	},
+	{
+		.type = IIO_EV_TYPE_THRESH,
+		.dir = IIO_EV_DIR_FALLING,
+		.mask_shared_by_dir = BIT(IIO_EV_INFO_VALUE),
+	},
+	{
+		.type = IIO_EV_TYPE_THRESH,
+		.dir = IIO_EV_DIR_EITHER,
+		.mask_shared_by_all = BIT(IIO_EV_INFO_ENABLE) |
+			BIT(IIO_EV_INFO_RESET_TIMEOUT),
+	},
+};
+
 enum {
 	AD7380_SCAN_TYPE_NORMAL,
 	AD7380_SCAN_TYPE_RESOLUTION_BOOST,
@@ -214,6 +252,8 @@ static const struct iio_scan_type ad7380_scan_type_16_u[] = {
 	.has_ext_scan_type = 1,							\
 	.ext_scan_type = ad7380_scan_type_##bits##_##sign,			\
 	.num_ext_scan_type = ARRAY_SIZE(ad7380_scan_type_##bits##_##sign),	\
+	.event_spec = ad7380_events,						\
+	.num_event_specs = ARRAY_SIZE(ad7380_events),				\
 }
 
 #define AD7380_CHANNEL(index, bits, diff, sign)		\
@@ -585,6 +625,10 @@ struct ad7380_state {
 	bool resolution_boost_enabled;
 	unsigned int ch;
 	bool seq;
+	struct timer_list alert_timer;
+	unsigned int alert_reset_timeout_ms;
+	atomic_t irq_enabled;
+	bool buffered_read_enabled;
 	unsigned int vref_mv;
 	unsigned int vcm_mv[MAX_NUM_CHANNELS];
 	unsigned int gain_milli[MAX_NUM_CHANNELS];
@@ -689,6 +733,26 @@ static const struct regmap_config ad7380_regmap_config = {
 	.cache_type = REGCACHE_MAPLE,
 };
 
+static void ad7380_enable_irq(struct ad7380_state *st)
+{
+	if (st->spi->irq && !atomic_cmpxchg(&st->irq_enabled, 0, 1))
+		enable_irq(st->spi->irq);
+}
+
+static void ad7380_disable_irq(struct ad7380_state *st)
+{
+	if (st->spi->irq && atomic_cmpxchg(&st->irq_enabled, 1, 0)) {
+		disable_irq(st->spi->irq);
+		synchronize_irq(st->spi->irq);
+	}
+}
+
+static void ad7380_disable_irq_nosync(struct ad7380_state *st)
+{
+	if (st->spi->irq && atomic_cmpxchg(&st->irq_enabled, 1, 0))
+		disable_irq_nosync(st->spi->irq);
+}
+
 static int ad7380_debugfs_reg_access(struct iio_dev *indio_dev, u32 reg,
 				     u32 writeval, u32 *readval)
 {
@@ -727,8 +791,8 @@ static int ad7380_regval_to_osr(int regval)
 
 static int ad7380_get_osr(struct ad7380_state *st, int *val)
 {
-	int tmp;
-	int ret = 0;
+	u32 tmp;
+	int ret;
 
 	ret = regmap_read(st->regmap, AD7380_REG_ADDR_CONFIG1, &tmp);
 	if (ret)
@@ -834,6 +898,13 @@ static int ad7380_update_xfers(struct ad7380_state *st,
 	return 0;
 }
 
+static void ad7380_handle_event_reset_timeout(struct timer_list *t)
+{
+	struct ad7380_state *st = from_timer(st, t, alert_timer);
+
+	ad7380_enable_irq(st);
+}
+
 static int ad7380_triggered_buffer_preenable(struct iio_dev *indio_dev)
 {
 	struct ad7380_state *st = iio_priv(indio_dev);
@@ -841,6 +912,12 @@ static int ad7380_triggered_buffer_preenable(struct iio_dev *indio_dev)
 	struct spi_message *msg = &st->normal_msg;
 	int ret;
 
+	timer_setup(&st->alert_timer, ad7380_handle_event_reset_timeout, 0);
+
+	ad7380_enable_irq(st);
+
+	st->buffered_read_enabled = true;
+
 	/*
 	 * Currently, we always read all channels at the same time. The scan_type
 	 * is the same for all channels, so we just pass the first channel.
@@ -894,6 +971,8 @@ static int ad7380_triggered_buffer_postdisable(struct iio_dev *indio_dev)
 	struct spi_message *msg = &st->normal_msg;
 	int ret;
 
+	st->buffered_read_enabled = false;
+
 	if (st->seq) {
 		ret = regmap_update_bits(st->regmap,
 					 AD7380_REG_ADDR_CONFIG1,
@@ -908,6 +987,9 @@ static int ad7380_triggered_buffer_postdisable(struct iio_dev *indio_dev)
 
 	spi_unoptimize_message(msg);
 
+	ad7380_disable_irq(st);
+	timer_shutdown_sync(&st->alert_timer);
+
 	return 0;
 }
 
@@ -1002,8 +1084,11 @@ static int ad7380_read_raw(struct iio_dev *indio_dev,
 		if (ret)
 			return ret;
 
-		ret = ad7380_read_direct(st, chan->scan_index,
-					 scan_type, val);
+		ad7380_enable_irq(st);
+
+		ret = ad7380_read_direct(st, chan->scan_index, scan_type, val);
+
+		ad7380_disable_irq(st);
 
 		iio_device_release_direct_mode(indio_dev);
 
@@ -1151,12 +1236,190 @@ static int ad7380_get_current_scan_type(const struct iio_dev *indio_dev,
 					    : AD7380_SCAN_TYPE_NORMAL;
 }
 
+static int ad7380_read_event_config(struct iio_dev *indio_dev,
+				    const struct iio_chan_spec *chan,
+				    enum iio_event_type type,
+				    enum iio_event_direction dir)
+{
+	struct ad7380_state *st = iio_priv(indio_dev);
+	int alert_en, tmp, ret;
+
+	ret = iio_device_claim_direct_mode(indio_dev);
+	if (ret)
+		return ret;
+
+	ret = regmap_read(st->regmap, AD7380_REG_ADDR_CONFIG1, &tmp);
+
+	iio_device_release_direct_mode(indio_dev);
+
+	if (ret)
+		return ret;
+
+	alert_en = FIELD_GET(AD7380_CONFIG1_ALERTEN, tmp);
+
+	return alert_en;
+}
+
+static int ad7380_write_event_config(struct iio_dev *indio_dev,
+				     const struct iio_chan_spec *chan,
+				     enum iio_event_type type,
+				     enum iio_event_direction dir,
+				     bool state)
+{
+	struct ad7380_state *st = iio_priv(indio_dev);
+	int ret;
+
+	ret = iio_device_claim_direct_mode(indio_dev);
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(st->regmap,
+				 AD7380_REG_ADDR_CONFIG1,
+				 AD7380_CONFIG1_ALERTEN,
+				 FIELD_PREP(AD7380_CONFIG1_ALERTEN, state));
+
+	iio_device_release_direct_mode(indio_dev);
+
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int ad7380_read_event_value(struct iio_dev *indio_dev,
+				   const struct iio_chan_spec *chan,
+				   enum iio_event_type type,
+				   enum iio_event_direction dir,
+				   enum iio_event_info info,
+				   int *val, int *val2)
+{
+	struct ad7380_state *st = iio_priv(indio_dev);
+	int ret, tmp;
+
+	switch (info) {
+	case IIO_EV_INFO_VALUE:
+		ret = iio_device_claim_direct_mode(indio_dev);
+
+		switch (dir) {
+		case IIO_EV_DIR_RISING:
+			ret = regmap_read(st->regmap,
+					  AD7380_REG_ADDR_ALERT_HIGH_TH,
+					  &tmp);
+			if (ret)
+				return ret;
+
+			*val = FIELD_GET(AD7380_ALERT_HIGH_TH, tmp);
+			ret = IIO_VAL_INT;
+			break;
+		case IIO_EV_DIR_FALLING:
+			ret = regmap_read(st->regmap,
+					  AD7380_REG_ADDR_ALERT_LOW_TH,
+					  &tmp);
+			if (ret)
+				return ret;
+
+			FIELD_GET(AD7380_ALERT_LOW_TH, tmp);
+			ret = IIO_VAL_INT;
+			break;
+		default:
+			ret = -EINVAL;
+			break;
+		}
+
+		iio_device_release_direct_mode(indio_dev);
+		return ret;
+	case IIO_EV_INFO_RESET_TIMEOUT:
+		*val = st->alert_reset_timeout_ms;
+		return IIO_VAL_INT;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int ad7380_write_event_value(struct iio_dev *indio_dev,
+				    const struct iio_chan_spec *chan,
+				    enum iio_event_type type,
+				    enum iio_event_direction dir,
+				    enum iio_event_info info,
+				    int val, int val2)
+{
+	struct ad7380_state *st = iio_priv(indio_dev);
+	const struct iio_scan_type *scan_type;
+	int ret;
+	u16 th;
+
+	switch (info) {
+	case IIO_EV_INFO_VALUE:
+		ret = iio_device_claim_direct_mode(indio_dev);
+		if (ret)
+			return ret;
+
+		/*
+		 * According to the datasheet,
+		 * AD7380_REG_ADDR_ALERT_HIGH_TH[11:0] are the 12 MSB of the
+		 * 16-bits internal alert high register. LSB are set to 0xf.
+		 * AD7380_REG_ADDR_ALERT_LOW_TH[11:0] are the 12 MSB of the
+		 * 16 bits internal alert low register. LSB are set to 0x0.
+		 *
+		 * When alert is enabled the conversion from the adc is compared
+		 * immediately to the alert high/low thresholds, before any
+		 * oversampling. This means that the thresholds are the same for
+		 * normal mode and oversampling mode.
+		 */
+
+		/* Extract the 12 MSB of val */
+		scan_type = iio_get_current_scan_type(indio_dev, chan);
+		if (IS_ERR(scan_type))
+			return PTR_ERR(scan_type);
+
+		th = val >> (scan_type->realbits - 12);
+
+		switch (dir) {
+		case IIO_EV_DIR_RISING:
+			ret = regmap_write(st->regmap,
+					   AD7380_REG_ADDR_ALERT_HIGH_TH,
+					   th);
+			if (ret)
+				return ret;
+
+			break;
+		case IIO_EV_DIR_FALLING:
+			ret = regmap_write(st->regmap,
+					   AD7380_REG_ADDR_ALERT_LOW_TH,
+					   th);
+			if (ret)
+				return ret;
+
+			break;
+		default:
+			ret = -EINVAL;
+			break;
+		}
+
+		iio_device_release_direct_mode(indio_dev);
+		return ret;
+	case IIO_EV_INFO_RESET_TIMEOUT:
+		if (val < 0)
+			return -EINVAL;
+		st->alert_reset_timeout_ms = val;
+		timer_reduce(&st->alert_timer, jiffies + msecs_to_jiffies(val));
+
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
 static const struct iio_info ad7380_info = {
 	.read_raw = &ad7380_read_raw,
 	.read_avail = &ad7380_read_avail,
 	.write_raw = &ad7380_write_raw,
 	.get_current_scan_type = &ad7380_get_current_scan_type,
 	.debugfs_reg_access = &ad7380_debugfs_reg_access,
+	.read_event_config = &ad7380_read_event_config,
+	.write_event_config = &ad7380_write_event_config,
+	.read_event_value = &ad7380_read_event_value,
+	.write_event_value = &ad7380_write_event_value,
 };
 
 static int ad7380_init(struct ad7380_state *st, bool external_ref_en)
@@ -1182,6 +1445,12 @@ static int ad7380_init(struct ad7380_state *st, bool external_ref_en)
 	/* This is the default value after reset. */
 	st->ch = 0;
 	st->seq = false;
+	st->buffered_read_enabled = false;
+
+	/*
+	 * Set a minimum default 1s delay between each alert in buffered reads
+	 */
+	st->alert_reset_timeout_ms = 1000;
 
 	/* SPI 1-wire mode */
 	return regmap_update_bits(st->regmap, AD7380_REG_ADDR_CONFIG2,
@@ -1190,6 +1459,50 @@ static int ad7380_init(struct ad7380_state *st, bool external_ref_en)
 					     AD7380_NUM_SDO_LINES));
 }
 
+static irqreturn_t ad7380_primary_event_handler(int irq, void *private)
+{
+	struct iio_dev *indio_dev = private;
+	struct ad7380_state *st = iio_priv(indio_dev);
+
+	if (!atomic_read(&st->irq_enabled))
+		return IRQ_NONE;
+
+	ad7380_disable_irq_nosync(st);
+
+	return IRQ_WAKE_THREAD;
+}
+
+static irqreturn_t ad7380_event_handler(int irq, void *private)
+{
+	struct iio_dev *indio_dev = private;
+	s64 timestamp = iio_get_time_ns(indio_dev);
+	struct ad7380_state *st = iio_priv(indio_dev);
+	const struct iio_chan_spec *chan = &indio_dev->channels[0];
+	unsigned int i;
+
+	for (i = 0; i < st->chip_info->num_channels - 1; i++) {
+		iio_push_event(indio_dev,
+			       chan->differential ?
+			       IIO_DIFF_EVENT_CODE(IIO_VOLTAGE,
+						   2 * i,
+						   2 * i + 1,
+						   IIO_EV_TYPE_THRESH,
+						   IIO_EV_DIR_EITHER) :
+			       IIO_UNMOD_EVENT_CODE(IIO_VOLTAGE,
+						    i,
+						    IIO_EV_TYPE_THRESH,
+						    IIO_EV_DIR_EITHER),
+			       timestamp);
+	}
+
+	if (st->spi->irq && st->buffered_read_enabled)
+		mod_timer(&st->alert_timer,
+			  jiffies +
+			  msecs_to_jiffies(st->alert_reset_timeout_ms));
+
+	return IRQ_HANDLED;
+}
+
 static int ad7380_probe(struct spi_device *spi)
 {
 	struct device *dev = &spi->dev;
@@ -1361,6 +1674,39 @@ static int ad7380_probe(struct spi_device *spi)
 	indio_dev->modes = INDIO_DIRECT_MODE;
 	indio_dev->available_scan_masks = st->chip_info->available_scan_masks;
 
+	if (spi->irq) {
+		struct iio_chan_spec *chans;
+		size_t size;
+		int ret;
+
+		ret = devm_request_threaded_irq(dev, spi->irq,
+						&ad7380_primary_event_handler,
+						&ad7380_event_handler,
+						IRQF_TRIGGER_FALLING | IRQF_ONESHOT
+						| IRQF_NO_AUTOEN,
+						indio_dev->name,
+						indio_dev);
+		if (ret)
+			return dev_err_probe(dev, ret, "Failed to request irq\n");
+
+		atomic_set(&st->irq_enabled, 0);
+
+		/*
+		 * Copy channels to be able to update the event_spec, since some
+		 * attributes are visible only when irq are configured
+		 */
+		size = indio_dev->num_channels * sizeof(*indio_dev->channels);
+		chans = devm_kzalloc(dev, size, GFP_KERNEL);
+		if (!chans)
+			return -ENOMEM;
+
+		memcpy(chans, indio_dev->channels, size);
+		chans->event_spec = ad7380_events_irq;
+		chans->num_event_specs = ARRAY_SIZE(ad7380_events_irq);
+
+		indio_dev->channels = chans;
+	}
+
 	ret = devm_iio_triggered_buffer_setup(dev, indio_dev,
 					      iio_pollfunc_store_time,
 					      ad7380_trigger_handler,

-- 
2.47.1

