Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0A01A4B51
	for <linux-doc@vger.kernel.org>; Wed, 31 Jul 2024 07:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722409557; cv=none; b=QtR0dy4O4Npe0KtcxT3UxnCTBqwoEHkYQSJ/bOmkKpgGSYt7Lxolh4ZAnMy+G4brsM+eA1Dxwd/KKAXW0HFduBSc4xGH/rnCLBZaNza9/sqf7D2RU7bN0dXHf2uW817fUFY3PWc5nP/hJCO0frDwFhxH68VKDKhpnH2pfX8FoZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722409557; c=relaxed/simple;
	bh=9dGPkiTFYDkEvhn/NqjG5/RctGzuW49L9Sh3Gg5iz5U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pqZ0vp7tAIzHaKnXlzkW/hjzv9U/PHVRkn4XTg65HI0ZMK+ig4nL0hZ2K4evk+2zWPFWhz5GPaI/o0yw5ALuu7DJbWe6wptKFo2f7a6tRUjSCUUulNCPFSbIDtA11xLI2PxbYSYSeYo8NHTvlkvZ2J8kehWHu5iiL6dTL54SO90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=uxrpKHHN; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="uxrpKHHN"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4281e3b2f72so24862465e9.1
        for <linux-doc@vger.kernel.org>; Wed, 31 Jul 2024 00:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722409553; x=1723014353; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f8DToPXnh1aWxX7ybAN+wh21IynsQgrWjhcqvmXDduw=;
        b=uxrpKHHNCklnT9o7EqJWH+cFAYMFeCqj5JPNdUqHn5BI5aDUg5rAXzPEykxPoBaQvd
         eyWghem1iyb37QTjjEOWwg90OSjoOfjkrMdZ42bP4gBUjic+T2FnmZC+KvoLVwhtL3gE
         q2o2x4AGjhBp5Js0umVUsXWDJvt7wLhwcgVkvJ6VmVJGSQH0rYpIWdPeollDRV3Fzagr
         wtI3fVHxvbwgSPClO7m6DyW9Zyul3cjMtgovuCevQ+vzSV4qhpfv9oYMzaS0ME9toHcB
         fz6Kj/LBX+in8sk8CbAdfGtoeYfLIDm6Tw9zH4tHhWjCXNcqK9kEp7wi45WwGgbOkw+W
         iR+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722409553; x=1723014353;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f8DToPXnh1aWxX7ybAN+wh21IynsQgrWjhcqvmXDduw=;
        b=B/RCalrwqO2XUjgKPmvGYjASFaS+q6HT3b/uXW6x4/7HFV37B8a9scX7zmXcuKdEnp
         KgXpo8OfPgUQy/ET7FokYIffzKo8F3s1gE9+7B5JDhr4GU4imVkN/4Yz7kvfxLcvYdlF
         waOrtJjKy8YsRy7718BKupLestkufGDn5jKwqOM/B1L0zeOgVv95TKmbw1lyJaKQWNHY
         iY2YFzZ08pm6YObMxVRbRDXmUFDObSQ32X34e2uLW0qlHBDctUGK1y1zrgYyO4pn1rsN
         H5GvHDq1vEnFc3Pe7ECMxp+cq+ewr0eQWzpNcd7nzcRDjyb8tojO3vUxg9kQQUMXFP8D
         4uPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIXw4tBM1YlzwWGCZwcbfOnlBwT84ZT8CHt5MJiJAl+KlZtgWzJDAc1fJScbBrVBGkzwEv0UbzeQJls3rfNjrqk5zq2FiZLpaZ
X-Gm-Message-State: AOJu0YyCBGLh131Q1AQQNzqAH2NMwkaWGsYB09FdlzVRxNhYMqiQPFjd
	urxbjR63SXFNUSJu+cfdwhK6dE2GdrTucwjfsNfORB+FuP2jgHbDUfWtqAG2gjE=
X-Google-Smtp-Source: AGHT+IH1GAfFv5sNgUZ04+uyD4pq8HEHaz/JsKPmRVMY/Gl2o8hakRh/+nIMT5w9mIRlMBI4xcfXFg==
X-Received: by 2002:a05:600c:4ec9:b0:426:58cb:8ca3 with SMTP id 5b1f17b1804b1-42811d9eda7mr92210285e9.21.1722409553116;
        Wed, 31 Jul 2024 00:05:53 -0700 (PDT)
Received: from [192.168.1.61] (2a02-842a-d52e-6101-6f8f-5617-c4b6-8627.rev.sfr.net. [2a02:842a:d52e:6101:6f8f:5617:c4b6:8627])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4282b8a2593sm9953215e9.4.2024.07.31.00.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 00:05:52 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
Date: Wed, 31 Jul 2024 09:05:45 +0200
Subject: [PATCH v2 4/7] iio: adc: ad7380: prepare driver for single-ended
 parts support
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240731-ad7380-add-single-ended-chips-v2-4-cd63bf05744c@baylibre.com>
References: <20240731-ad7380-add-single-ended-chips-v2-0-cd63bf05744c@baylibre.com>
In-Reply-To: <20240731-ad7380-add-single-ended-chips-v2-0-cd63bf05744c@baylibre.com>
To: Michael Hennerich <michael.hennerich@analog.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 David Lechner <dlechner@baylibre.com>, Lars-Peter Clausen <lars@metafoo.de>, 
 Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: Michael Hennerich <Michael.Hennerich@analog.com>, 
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Julien Stephan <jstephan@baylibre.com>
X-Mailer: b4 0.13.0

ad738x family contains single-ended parts that have a 2:1 mux in front
of ADC, so the number of IIO channels is different from the number of
simultaneous channels that can be sampled.

To prepare the support for single-ended parts, introduce a new
num_simultaneous_channels variable. For currently supported parts,
num_simultaneous_channels is equal to num_channels minus 1 (the
timestamps channel)

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 drivers/iio/adc/ad7380.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/adc/ad7380.c b/drivers/iio/adc/ad7380.c
index 72fece383f72..04cc1ef18131 100644
--- a/drivers/iio/adc/ad7380.c
+++ b/drivers/iio/adc/ad7380.c
@@ -80,6 +80,7 @@ struct ad7380_chip_info {
 	const char *name;
 	const struct iio_chan_spec *channels;
 	unsigned int num_channels;
+	unsigned int num_simult_channels;
 	const char * const *vcm_supplies;
 	unsigned int num_vcm_supplies;
 	const unsigned long *available_scan_masks;
@@ -208,6 +209,7 @@ static const struct ad7380_chip_info ad7380_chip_info = {
 	.name = "ad7380",
 	.channels = ad7380_channels,
 	.num_channels = ARRAY_SIZE(ad7380_channels),
+	.num_simult_channels = 2,
 	.available_scan_masks = ad7380_2_channel_scan_masks,
 	.timing_specs = &ad7380_timing,
 };
@@ -216,6 +218,7 @@ static const struct ad7380_chip_info ad7381_chip_info = {
 	.name = "ad7381",
 	.channels = ad7381_channels,
 	.num_channels = ARRAY_SIZE(ad7381_channels),
+	.num_simult_channels = 2,
 	.available_scan_masks = ad7380_2_channel_scan_masks,
 	.timing_specs = &ad7380_timing,
 };
@@ -224,6 +227,7 @@ static const struct ad7380_chip_info ad7383_chip_info = {
 	.name = "ad7383",
 	.channels = ad7383_channels,
 	.num_channels = ARRAY_SIZE(ad7383_channels),
+	.num_simult_channels = 2,
 	.vcm_supplies = ad7380_2_channel_vcm_supplies,
 	.num_vcm_supplies = ARRAY_SIZE(ad7380_2_channel_vcm_supplies),
 	.available_scan_masks = ad7380_2_channel_scan_masks,
@@ -234,6 +238,7 @@ static const struct ad7380_chip_info ad7384_chip_info = {
 	.name = "ad7384",
 	.channels = ad7384_channels,
 	.num_channels = ARRAY_SIZE(ad7384_channels),
+	.num_simult_channels = 2,
 	.vcm_supplies = ad7380_2_channel_vcm_supplies,
 	.num_vcm_supplies = ARRAY_SIZE(ad7380_2_channel_vcm_supplies),
 	.available_scan_masks = ad7380_2_channel_scan_masks,
@@ -244,6 +249,7 @@ static const struct ad7380_chip_info ad7380_4_chip_info = {
 	.name = "ad7380-4",
 	.channels = ad7380_4_channels,
 	.num_channels = ARRAY_SIZE(ad7380_4_channels),
+	.num_simult_channels = 4,
 	.available_scan_masks = ad7380_4_channel_scan_masks,
 	.timing_specs = &ad7380_4_timing,
 };
@@ -252,6 +258,7 @@ static const struct ad7380_chip_info ad7381_4_chip_info = {
 	.name = "ad7381-4",
 	.channels = ad7381_4_channels,
 	.num_channels = ARRAY_SIZE(ad7381_4_channels),
+	.num_simult_channels = 4,
 	.available_scan_masks = ad7380_4_channel_scan_masks,
 	.timing_specs = &ad7380_4_timing,
 };
@@ -260,6 +267,7 @@ static const struct ad7380_chip_info ad7383_4_chip_info = {
 	.name = "ad7383-4",
 	.channels = ad7383_4_channels,
 	.num_channels = ARRAY_SIZE(ad7383_4_channels),
+	.num_simult_channels = 4,
 	.vcm_supplies = ad7380_4_channel_vcm_supplies,
 	.num_vcm_supplies = ARRAY_SIZE(ad7380_4_channel_vcm_supplies),
 	.available_scan_masks = ad7380_4_channel_scan_masks,
@@ -270,6 +278,7 @@ static const struct ad7380_chip_info ad7384_4_chip_info = {
 	.name = "ad7384-4",
 	.channels = ad7384_4_channels,
 	.num_channels = ARRAY_SIZE(ad7384_4_channels),
+	.num_simult_channels = 4,
 	.vcm_supplies = ad7380_4_channel_vcm_supplies,
 	.num_vcm_supplies = ARRAY_SIZE(ad7380_4_channel_vcm_supplies),
 	.available_scan_masks = ad7380_4_channel_scan_masks,
@@ -407,7 +416,7 @@ static void ad7380_update_xfers(struct ad7380_state *st,
 	 */
 	st->xfer[1].bits_per_word = scan_type->realbits;
 	st->xfer[1].len = BITS_TO_BYTES(scan_type->storagebits) *
-			  (st->chip_info->num_channels - 1);
+			  st->chip_info->num_simult_channels;
 }
 
 static int ad7380_triggered_buffer_preenable(struct iio_dev *indio_dev)

-- 
2.45.1

