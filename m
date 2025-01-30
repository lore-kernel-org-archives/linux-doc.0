Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D461DF97A
	for <linux-doc@vger.kernel.org>; Thu, 30 Jan 2025 11:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738235337; cv=none; b=hE2apSWK+1WWbqu7lgmDUDZqv7qLd4FgW1vipBw/I3DeKpGhiSA7IEYY2ERt1c1xTDiNnvW5sYmq4qQNUG8z9ytQQYJAKPSVZSW3qs10FMo+wUv7a5nn80aTY0wFgrJSyXH8rgtNQrksUUaTkAccmNnV4zjRkB9Z7bKHzLeAdf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738235337; c=relaxed/simple;
	bh=SRXFxvtaomd7dncfECqCKnYuxcpzErN8efr+LwBJBWk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sUxZ53B1SPb9MH/VwcytkONW7XidcziLF+71iXevImVkJjazp9VCqsdDnAHhfN9QIUisu9VYF7UXVEGKT2YJBHSQBhxtr1DJn5du4x+xbtWN5vlszPJVU/Mfdp7aj6siSUoox0KzJU+RXaU4/FKijXf09eF+dL5GqybCccd1c6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=1HlglLDK; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="1HlglLDK"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3862d16b4f5so393277f8f.0
        for <linux-doc@vger.kernel.org>; Thu, 30 Jan 2025 03:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738235333; x=1738840133; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UayGYi9vbQCj4e06kROwvC20GIlvXwKmVBbFVZIFCJQ=;
        b=1HlglLDKDPfZmXcebFXfd+lamLzuur1Hciyhkl9BsRo8HNAMfGpoM7btO+MxYgQn7S
         j2E8MfAnwWS2ujlmlItMLG4aT1i5FudGsAAlHaxRq/4ovmBQltiEF8mMc5UF/yzBu5z7
         lN2164tgZaV4XuxzDW4z8H0+UsYGESz2prYlLzbRsEfjEHfSRa93ghQC1Fe4ZrVqLweZ
         JGbHRUIL5Tv2V02I744xf/CuKy29JSPnWm2pTDzD0H3/ECQcoecz1XYxBj/jeuF+kSKb
         2rnu3yBdiEgJ8wnkq8nSqkA2vIMOSaPv4Y1tusN8jq9f/tauZckOESNyadhb7+tMFiJw
         XIug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738235333; x=1738840133;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UayGYi9vbQCj4e06kROwvC20GIlvXwKmVBbFVZIFCJQ=;
        b=BSZgfHJI7ddAYXjzSKA3UiOhjCXmKNcI2yEeLE/cKwM1W8Xyd3qZwtZfx4vN/3E1VC
         m0MHqZTrd6K5i/rE9YoctoFEydPJaJpPn0aOqmF240onjEkvct8sfAK7UgH+Q1GW4gSW
         hnr38VZcOWvrzt2+/reMrxrDTyVx2Elp51hBTUhdjjmS2C3DIbUXmXcn6xFXBW6bQrah
         Y4uKNivx9q9nHBSJMMyFDrqHkdOvylYVPOhGd1d2LTf0QenjYxOiC1512aGAKE3uCyVU
         JmQ9JZtmjoPgfn1bqaY7fSPxKl2Oveki1fSxxATp9+5KK2lv8QIStd4aYHcgWOir6iW2
         G9zw==
X-Forwarded-Encrypted: i=1; AJvYcCVAGEjsa7yy0T1ZMcyhu2t4b9XkekVQmkYlCpqGLH+uPZSxSnJ4IegyzXDaxJmoxVV/EfD0ynpLHR8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiLb+Z2w/4xZ1Fg8aWa3WMtEcxYFpghmDPiw1zX7BS4Z6M34m9
	Y7ltEF34cpqtZPygk7CwLpUiWinLMAq7ixKdDA3BTQ3GwXiUW668qtMjmoaMobY=
X-Gm-Gg: ASbGnctYq53Yy17nQ4I7U/lAo9NZZgxp1JsEXisX/nXGHOVXLu+v/FcGgHNp47Nv6x+
	Y+VPtz7Cx1E4/b17lZxW9NnAbFkt2kff/+FpeGApNkrPJATSE7BSVQljDEjlbbKlqKkIicrQ71J
	TiE5AkLuIKaSk/Tur1EEGwALKsJEm6oF/2MRdvRARaE+4zXwLleHowNyS2G1owe9uiIJpacUv3p
	KDEmt2DMXEx9Q7Ue4S3YCyt1+eXfHrXoe0SPAHO9ZsY+BT/4I7aYHrTEFG0/XjpuIUQa8C/vfFe
	WPgmThBPs38eYDTu
X-Google-Smtp-Source: AGHT+IGMXy0Vlqp3I6Y4A/IetFnHXnW6LN3wV1XhbgQiMOsQ3bzN7Xk+rfgP1eUkOVdTjuMdYFFkMA==
X-Received: by 2002:a5d:6d0d:0:b0:38a:6183:77b9 with SMTP id ffacd0b85a97d-38c5a95722cmr2521220f8f.6.1738235332944;
        Thu, 30 Jan 2025 03:08:52 -0800 (PST)
Received: from [127.0.0.1] ([2a01:e0a:448:76e0:2c72:cd2d:79b2:82ff])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c102bb2sm1689225f8f.34.2025.01.30.03.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 03:08:52 -0800 (PST)
From: Esteban Blanc <eblanc@baylibre.com>
Date: Thu, 30 Jan 2025 12:08:29 +0100
Subject: [PATCH v3 5/6] iio: adc: ad4030: add support for ad4632-16 and
 ad4632-24
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250130-eblanc-ad4630_v1-v3-5-052e8c2d897d@baylibre.com>
References: <20250130-eblanc-ad4630_v1-v3-0-052e8c2d897d@baylibre.com>
In-Reply-To: <20250130-eblanc-ad4630_v1-v3-0-052e8c2d897d@baylibre.com>
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: Michael Hennerich <michael.hennerich@analog.com>, 
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Esteban Blanc <eblanc@baylibre.com>
X-Mailer: b4 0.14.2

AD4632-24 and AD4632-16 are 2 channels ADCs. Both channels are
interleaved bit per bit on SDO line.

Both of them do not have evaluation board. As such, the support added
here can't be tested. Support is provided as best effort until someone get
their hands on one.

Signed-off-by: Esteban Blanc <eblanc@baylibre.com>
---
 drivers/iio/adc/ad4030.c | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/iio/adc/ad4030.c b/drivers/iio/adc/ad4030.c
index 45d99152d84aeb878c7554edfdc32d3a1295e9c4..753051edbf96e3532d3178726c1cd159263d7355 100644
--- a/drivers/iio/adc/ad4030.c
+++ b/drivers/iio/adc/ad4030.c
@@ -35,6 +35,8 @@
 #define     AD4030_REG_CHIP_GRADE_AD4030_24_GRADE	0x10
 #define     AD4030_REG_CHIP_GRADE_AD4630_16_GRADE	0x03
 #define     AD4030_REG_CHIP_GRADE_AD4630_24_GRADE	0x00
+#define     AD4030_REG_CHIP_GRADE_AD4632_16_GRADE	0x05
+#define     AD4030_REG_CHIP_GRADE_AD4632_24_GRADE	0x02
 #define     AD4030_REG_CHIP_GRADE_MASK_CHIP_GRADE	GENMASK(7, 3)
 #define AD4030_REG_SCRATCH_PAD			0x0A
 #define AD4030_REG_SPI_REVISION			0x0B
@@ -108,6 +110,9 @@
 #define AD4030_TCYC_NS			500
 #define AD4030_TCYC_ADJUSTED_NS		(AD4030_TCYC_NS - AD4030_TCNVL_NS)
 #define AD4030_TRESET_PW_NS		50
+#define AD4632_TCYC_NS			2000
+#define AD4632_TCYC_ADJUSTED_NS		(AD4632_TCYC_NS - AD4030_TCNVL_NS)
+#define AD4030_TRESET_COM_DELAY_MS	750
 
 enum ad4030_out_mode {
 	AD4030_OUT_DATA_MD_DIFF,
@@ -1169,10 +1174,44 @@ static const struct ad4030_chip_info ad4630_24_chip_info = {
 	.tcyc_ns = AD4030_TCYC_ADJUSTED_NS,
 };
 
+static const struct ad4030_chip_info ad4632_16_chip_info = {
+	.name = "ad4632-16",
+	.available_masks = ad4630_channel_masks,
+	.channels = {
+		AD4030_CHAN_DIFF(0, ad4030_16_scan_types),
+		AD4030_CHAN_DIFF(1, ad4030_16_scan_types),
+		AD4030_CHAN_CMO(2, 0),
+		AD4030_CHAN_CMO(3, 1),
+		IIO_CHAN_SOFT_TIMESTAMP(4),
+	},
+	.grade = AD4030_REG_CHIP_GRADE_AD4632_16_GRADE,
+	.precision_bits = 16,
+	.num_voltage_inputs = 2,
+	.tcyc_ns = AD4632_TCYC_ADJUSTED_NS,
+};
+
+static const struct ad4030_chip_info ad4632_24_chip_info = {
+	.name = "ad4632-24",
+	.available_masks = ad4630_channel_masks,
+	.channels = {
+		AD4030_CHAN_DIFF(0, ad4030_24_scan_types),
+		AD4030_CHAN_DIFF(1, ad4030_24_scan_types),
+		AD4030_CHAN_CMO(2, 0),
+		AD4030_CHAN_CMO(3, 1),
+		IIO_CHAN_SOFT_TIMESTAMP(4),
+	},
+	.grade = AD4030_REG_CHIP_GRADE_AD4632_24_GRADE,
+	.precision_bits = 24,
+	.num_voltage_inputs = 2,
+	.tcyc_ns = AD4632_TCYC_ADJUSTED_NS,
+};
+
 static const struct spi_device_id ad4030_id_table[] = {
 	{ "ad4030-24", (kernel_ulong_t)&ad4030_24_chip_info },
 	{ "ad4630-16", (kernel_ulong_t)&ad4630_16_chip_info },
 	{ "ad4630-24", (kernel_ulong_t)&ad4630_24_chip_info },
+	{ "ad4632-16", (kernel_ulong_t)&ad4632_16_chip_info },
+	{ "ad4632-24", (kernel_ulong_t)&ad4632_24_chip_info },
 	{ }
 };
 MODULE_DEVICE_TABLE(spi, ad4030_id_table);
@@ -1181,6 +1220,8 @@ static const struct of_device_id ad4030_of_match[] = {
 	{ .compatible = "adi,ad4030-24", .data = &ad4030_24_chip_info },
 	{ .compatible = "adi,ad4630-16", .data = &ad4630_16_chip_info },
 	{ .compatible = "adi,ad4630-24", .data = &ad4630_24_chip_info },
+	{ .compatible = "adi,ad4632-16", .data = &ad4632_16_chip_info },
+	{ .compatible = "adi,ad4632-24", .data = &ad4632_24_chip_info },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, ad4030_of_match);

-- 
2.47.2

