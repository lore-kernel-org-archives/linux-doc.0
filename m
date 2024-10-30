Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BE61EBA1B
	for <linux-doc@vger.kernel.org>; Wed, 30 Oct 2024 13:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730295884; cv=none; b=lq/vrwAS9O1CIrYHY/I5cSRXexQ0aB8tberrvnoe/ykEdLmeTHiBvhhZTvUF+RNPqjpOq6UDwjuVZ/WAAgrc6FcgjTpi45Kc9+EI3+gOJKAmCaLNyDiZ3DY7VkA3oV7DCQz3Vez0LxdQtNZrhhkhMQdV9fFrgQJBNIqdTa8UGbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730295884; c=relaxed/simple;
	bh=V5Iv60vRstuniFfHpYRmwvvIRs3G4BEePM0L/f0it8Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rLVpDtwJYHuTk8Y0ep8nWgwZQ8/rUKPmS19a8O/aStHkIcIYYzepaY4OAaRI8AGi1uViat/azR5cl/Rpk9dr5yax8Y8Sqla67njlEG9nLZ5BOex0NHab7jE5T5UcDFOE2vTUqly1ACiv+Tt2B3TtnI/viNTMsd0BVwvl+Fobs4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=AcDjtabi; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="AcDjtabi"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4316f3d3c21so61671645e9.3
        for <linux-doc@vger.kernel.org>; Wed, 30 Oct 2024 06:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730295880; x=1730900680; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1x3VtH5eamsZnRB9P+0wcD4ahBXtjl9ZuFAd+0mooPI=;
        b=AcDjtabi+j/r5gutsbhnadFvlNR6VJzYD/Pzh0+QXhNO9dHtZbWWITG39CxKLbWjyx
         XjzeJhQwIbRYgZ3cn2Nzcq49tzJP0uxdFyFQ0b9rMjZS3dGJmJAbNZ8XD9LeDcvhYQ65
         PYwWYxw4k6v/FP6PGhRdZ+Lf1KUixBaoQzVpWEqgmfKSCDRJMPkkgY+tkfwxtPp2yJO7
         qb1USmwKnlGLRoMg+3jhcBb3VhOmFBR4simtAaki20pEB1qa+WdCT6HTeeNreXOQWQkR
         1oDI0xwDWgcE4F9b68T1sfgpiks5XEA9ozHwetjVmsN7ja+mwhut9aOBtqVkoYJ9uh6g
         mYtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730295880; x=1730900680;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1x3VtH5eamsZnRB9P+0wcD4ahBXtjl9ZuFAd+0mooPI=;
        b=WfWqoQhsQIy+EnGBX/iEt7WppiI1826GhP+JMtQZDZ/E1m0lQRNC4aRbafZpjDN5rf
         nulUtUeVnZC5X187Bd/UWKd2791mua1aC/xl6qPtvcQOZHRk30Az/NU+1Lzd9JfC+DhZ
         ZFJcXklZQVjIjvUz7nHnVZ8BxsbORp692Ws4kSgUBdlS5iOiVDBsbxovYae+F70zvjl+
         EPFmsDMpsgdqARh9wm1EYcu4OsKgINulFedOC2hcC1Lom5y42avfWljXVzTm6fUuCDYB
         zN7yges0sYuvgVU6u0MktHBK022lcoq8ka63Q2rzz6a3EiTZe6Hs8B82emH43CrwNGEm
         mChw==
X-Forwarded-Encrypted: i=1; AJvYcCUJc9UYBTrXPTtnmYNmj8Bi/qsbOkphFC6s4zFkjC0EXw7zNsIVMdaMOaQ6i/OTpxaPFBGzuhVOp5Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg6uIz49i0Gbb5qsY3IT+Fgu7OJE57CuF2Qbg0q8VTt8l1OAYt
	HkTPVDH1DAgqvaLDmIiRC5bNb3FTxtRkzZUV+3IuaoxKxMr1I9hqqwfw6FxGG68=
X-Google-Smtp-Source: AGHT+IGFUMsRBJAN9nu2cZNxyckXM2rlQCdrl015AwDjfeG7ISymyh7aGHVpQf5SgmRCqWeI1nTmMg==
X-Received: by 2002:a05:600c:4691:b0:431:2460:5574 with SMTP id 5b1f17b1804b1-431bb9d1425mr27612325e9.27.1730295879769;
        Wed, 30 Oct 2024 06:44:39 -0700 (PDT)
Received: from [192.168.1.62] (2a02-842a-d52e-6101-6f8f-5617-c4b6-8627.rev.sfr.net. [2a02:842a:d52e:6101:6f8f:5617:c4b6:8627])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd97d693sm22135175e9.24.2024.10.30.06.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 06:44:39 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
Date: Wed, 30 Oct 2024 14:44:26 +0100
Subject: [PATCH v4 2/5] iio: adc: ad7380: fix oversampling formula
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241030-ad7380-add-adaq4380-4-support-v4-2-864ff02babae@baylibre.com>
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

The formula in the datasheet for oversampling time conversion seems to
be valid when device is at full speed using the maximum number of SDO
lines. The driver currently support only 1 SDO line. The correct formula
is: t_convert = T_CONVERT_0_NS + T_CONVERT_X_NS*(x -
1)*num_channel/number_of_sdo_lines.
It will produce larger delays than what is currently set, but some devices
actually require it.

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 drivers/iio/adc/ad7380.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/adc/ad7380.c b/drivers/iio/adc/ad7380.c
index fb728570debe6432d5f991595cb35e9e7af8b740..e5eececaaf501cda8f51d801c089e593111df714 100644
--- a/drivers/iio/adc/ad7380.c
+++ b/drivers/iio/adc/ad7380.c
@@ -77,6 +77,12 @@
 #define T_CONVERT_X_NS 500		/* xth conversion start time (oversampling) */
 #define T_POWERUP_US 5000		/* Power up */
 
+/*
+ * AD738x support several SDO lines to increase throughput, but driver currently
+ * supports only 1 SDO line (standard SPI transaction)
+ */
+#define AD7380_NUM_SDO_LINES		1
+
 struct ad7380_timing_specs {
 	const unsigned int t_csh_ns;	/* CS minimum high time */
 };
@@ -649,7 +655,8 @@ static int ad7380_set_ch(struct ad7380_state *st, unsigned int ch)
 
 	if (st->oversampling_ratio > 1)
 		xfer.delay.value = T_CONVERT_0_NS +
-			T_CONVERT_X_NS * (st->oversampling_ratio - 1);
+			T_CONVERT_X_NS * (st->oversampling_ratio - 1) *
+			st->chip_info->num_simult_channels / AD7380_NUM_SDO_LINES;
 
 	return spi_sync_transfer(st->spi, &xfer, 1);
 }
@@ -672,7 +679,8 @@ static void ad7380_update_xfers(struct ad7380_state *st,
 	 */
 	if (st->oversampling_ratio > 1)
 		t_convert = T_CONVERT_0_NS + T_CONVERT_X_NS *
-			(st->oversampling_ratio - 1);
+			(st->oversampling_ratio - 1) *
+			st->chip_info->num_simult_channels / AD7380_NUM_SDO_LINES;
 
 	if (st->seq) {
 		xfer[0].delay.value = xfer[1].delay.value = t_convert;
@@ -1021,7 +1029,8 @@ static int ad7380_init(struct ad7380_state *st, bool external_ref_en)
 	/* SPI 1-wire mode */
 	return regmap_update_bits(st->regmap, AD7380_REG_ADDR_CONFIG2,
 				  AD7380_CONFIG2_SDO,
-				  FIELD_PREP(AD7380_CONFIG2_SDO, 1));
+				  FIELD_PREP(AD7380_CONFIG2_SDO,
+					     AD7380_NUM_SDO_LINES));
 }
 
 static int ad7380_probe(struct spi_device *spi)

-- 
2.47.0

