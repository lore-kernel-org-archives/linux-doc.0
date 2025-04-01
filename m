Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9910621A437
	for <linux-doc@vger.kernel.org>; Tue,  1 Apr 2025 22:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743547841; cv=none; b=H4KLQ2GHAhLgJf6Bxfw/U0vc8c5OnTIFqiWFZA6kA63kxBWY/xkJY4oXe3CgMd8oDKXGhRzlZo1xoP66mHkbbOhTEdO3thkd2pVvsKhTFZGSigO3ure9NHI0mOKVA/M/43UmJqDtNOzg5wqBFvuQLyooa5S5QIGGKghUxbUiLXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743547841; c=relaxed/simple;
	bh=TFjwmH+xYODJDHRu7+6zpGJURRvrNkpc2t3jrzy9BBE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NUsG2Wawkt9m9HvqzOdBD6/9FNgYNY/iYSm1aTAeegTslXfUMbTH+tyqtdoirtVc0EIOo9b18G9On+WrEr/+PtWpmj9Yxe0wsLeC7kpxVcNc16ZX/d0W7tx+w0WrXXtDnYQJUxiX+crSyOCEm3AklyM/IrTNHi5D47cTO9XgfZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=IouOL8ae; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="IouOL8ae"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-60298ec60e8so1515363eaf.0
        for <linux-doc@vger.kernel.org>; Tue, 01 Apr 2025 15:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743547838; x=1744152638; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eBF8hIhV/gGGIF9CyDabCpTI9anOcgSekPdGitLDP/E=;
        b=IouOL8ae+gkUuB02wWJOcZGYcdMYFCWTgWOPG33AAW+egF19ZOAVYDfGMtkQgUnsBd
         RqljJ31XtnJ6aKIju9pzR6LjXm3nmvLXOg8/H85tpQSRefvsWambpXT2NvuEoCnAsSwV
         +LUXTgOMg0a/2QqnVkwcJBMMnqdFvvtML5rGW+vzNt/kpqjB1nAL0B7Fhr9oAn6FPiYf
         Ylq0U5J6cE6NI9vkki1y7roP7EaD5v+dHLjGc6Ue4KRTDA1IofZw+R+Z501n4pDL3lOx
         WmhhfAO6PY+58BB2+3sOIbaT52q+jVHoCYFVxgWEDEt3Tl1BE5/QqbiNyGHA5sHo83Kz
         YeiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743547838; x=1744152638;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eBF8hIhV/gGGIF9CyDabCpTI9anOcgSekPdGitLDP/E=;
        b=sQNKTFYrVn83kQOVPsmBmYKDgHxuAUcfmQdT79m8JuC5s7JaX02QnIUUr5fLPrwxUR
         uip9/TH2K7OIte4XXJ4BdY+hc24IFwG0G9Jpmamaz4/MM6BZX8QTzz8eGqF+cHlwUebH
         NfN1PlQiJP6ZaA4Q/w2yztJOMhomRW6vedJcyv7w0yh8BYPqJB/Ex51cz5uQWmHZ/Sw9
         ordiQZTLj0j7JLt/bCH+0omkicVc9y8PMKOxpnpHVjoQnHH9ChhRTyoTNSp1obMx2ECk
         9vd4xzU9xEDBY4aBxovTvm3sBqMgCWAKxFMGmPyytigDGKxWqBlFQKRyaNK01QQF7xnN
         zdBA==
X-Forwarded-Encrypted: i=1; AJvYcCXuRjvERGDUrV5Z3MxCUWJ/dWqwYd3Zj3mo7gULStOGZMWAYZed6r6bq0jE3NClyxHXys0jP5HBmjs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyLGs7wKeIdPlv2g4N2ia1RDqiJMY6kpY8uhLYBctx+Xpp4F+L
	DG1ubr+I3mOFi7Z3zs4m3f0uADMCCUtiraYlKZsVZruXfzNZdYbbhmk1mXboGVg=
X-Gm-Gg: ASbGncsTw/BLT/iyeESV+HGCOjez/ysQvSXjp31NZXNhUZM26jMfrclcwJwIyxi/uW5
	tr9B5c1TUnGTGHkeD8kgNeAHu9t+6GJSHUqCEzbtRozg7hvlk/iqh8Aav7n58q77iJ1WZ/W9YmX
	czw4kVV1ZwrAAJkMy5r/m1+jxraZQo9UKT3CNksgY9kqcGuKTJ3TNd0UFskf4rhl9xUV6wvmKra
	uaWFUIp9wqhSJgTfaodpvM3J+rJ7i2DBJw5Y6j/CEmpaZQOoqUjUpajmf4Tid5LF3jF0cgAJca3
	o0hCZHqX/xDN5zRDTn7qiZXyDnVxItad6vaSGj4XdXdMVTbvtdlFRHhGuu8YS9ANGjbtV5l/oB1
	N
X-Google-Smtp-Source: AGHT+IESz/E4eI0MhmXQMQkBoqB2xjogbiGsCXXe0qD+Mbg5ugdkYMFO/KDTISnaHkB68zUZBZxAog==
X-Received: by 2002:a05:6870:9a22:b0:2c1:3d93:c192 with SMTP id 586e51a60fabf-2cbcf7e2558mr8560619fac.37.1743547838707;
        Tue, 01 Apr 2025 15:50:38 -0700 (PDT)
Received: from [127.0.1.1] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2c86a860267sm2541894fac.36.2025.04.01.15.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 15:50:38 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Tue, 01 Apr 2025 17:50:09 -0500
Subject: [PATCH 2/5] iio: adc: ad7380: rename internal_ref_only
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250401-iio-ad7380-add-ad7389-4-v1-2-23d2568aa24f@baylibre.com>
References: <20250401-iio-ad7380-add-ad7389-4-v1-0-23d2568aa24f@baylibre.com>
In-Reply-To: <20250401-iio-ad7380-add-ad7389-4-v1-0-23d2568aa24f@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-iio@vger.kernel.org
Cc: Michael Hennerich <Michael.Hennerich@analog.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Jonathan Corbet <corbet@lwn.net>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2396; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=TFjwmH+xYODJDHRu7+6zpGJURRvrNkpc2t3jrzy9BBE=;
 b=owEBgwJ8/ZANAwAKAR+K+IyC93wDAcsmYgBn7G23egjxV4yz3dj26AK7uLICaoldkTDiVP/xg
 guuGaexxGSJAkkEAAEKADMWIQSKc9gqah9QmQfzc4gfiviMgvd8AwUCZ+xttxUcZGF2aWRAbGVj
 aG5vbG9neS5jb20ACgkQH4r4jIL3fAPr0w/9EkuROxujgEl8VHDj4h5nwtZmLdOqXy00Ra5uSIV
 l5d1vmMRw6yCTUAK0SPtgWfxerm/fCf+anaH0jr7QIgr3B72JZ+HIU+dY5GFyjI9hGGR+Er00qy
 cvkwd0EQxzV9gplODJ6+b2K2TO6OZjIyK7JH/UtxvOZb95mVEecYG1KPJmMDWw3OLXDS+xdimrF
 1RuD7e/JiyX19/Bb7jgRRFWboRa83eUF3ONzDWalKc5aI+f1EcGfP47tnAwHrNUQ6qKHYlJINBg
 jd2Jkh1jq4lkF+OOzHRLN5MlHSqSOberl1Ws8q2EBxCH7pLaaXoySE/rORj+CJKszygf0JGvN37
 AaXbvRzvDSylQRIyfzNWzaVCvkLlw7YtJbdqgz1LcWsVUkbOBi20G+hsC7mCDy/CIIxMjj5KrKO
 q/sc0KjzAUXoItTWgy0wyKFgQwf0LR2gfxLFK3TZPy3fhhoN02LSgwDGh6PxCxx8ipi4eWux7Ff
 6CbkgVjikdPNL7/ffhwtKau2joe/7Fso0PADHTCGGd8hlYtsj5rnEjSOMt8H3QNyddd+EKdERnV
 WAzVzsY9yzEMJTqtaWHc5J1WqlmDliY7E4UEfIs1kbzhWwc4JVsFtbpjrYv8v+6JnWil+hQYWhm
 fUsFEaPYsLfQeRtc0laxu/yrJnmblapSNE3vHGW0/WtE=
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Rename adaq_internal_ref_only to internal_ref_only_adaq. There are non-
ADAQ chips in the family that are also internal reference only, so the
adaq_ prefix is misleading.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/ad7380.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/adc/ad7380.c b/drivers/iio/adc/ad7380.c
index 4fcb49fdf56639784098f0147a9faef8dcb6b0f6..18ed07275be8e031e54f3595f70afe47514084cd 100644
--- a/drivers/iio/adc/ad7380.c
+++ b/drivers/iio/adc/ad7380.c
@@ -119,7 +119,7 @@ struct ad7380_chip_info {
 	const char * const *supplies;
 	unsigned int num_supplies;
 	bool external_ref_only;
-	bool adaq_internal_ref_only;
+	bool internal_ref_only;
 	const char * const *vcm_supplies;
 	unsigned int num_vcm_supplies;
 	const unsigned long *available_scan_masks;
@@ -806,7 +806,7 @@ static const struct ad7380_chip_info adaq4370_4_chip_info = {
 	.num_simult_channels = 4,
 	.supplies = adaq4380_supplies,
 	.num_supplies = ARRAY_SIZE(adaq4380_supplies),
-	.adaq_internal_ref_only = true,
+	.internal_ref_only = true,
 	.has_hardware_gain = true,
 	.available_scan_masks = ad7380_4_channel_scan_masks,
 	.timing_specs = &ad7380_4_timing,
@@ -821,7 +821,7 @@ static const struct ad7380_chip_info adaq4380_4_chip_info = {
 	.num_simult_channels = 4,
 	.supplies = adaq4380_supplies,
 	.num_supplies = ARRAY_SIZE(adaq4380_supplies),
-	.adaq_internal_ref_only = true,
+	.internal_ref_only = true,
 	.has_hardware_gain = true,
 	.available_scan_masks = ad7380_4_channel_scan_masks,
 	.timing_specs = &ad7380_4_timing,
@@ -836,7 +836,7 @@ static const struct ad7380_chip_info adaq4381_4_chip_info = {
 	.num_simult_channels = 4,
 	.supplies = adaq4380_supplies,
 	.num_supplies = ARRAY_SIZE(adaq4380_supplies),
-	.adaq_internal_ref_only = true,
+	.internal_ref_only = true,
 	.has_hardware_gain = true,
 	.available_scan_masks = ad7380_4_channel_scan_masks,
 	.timing_specs = &ad7380_4_timing,
@@ -1847,7 +1847,7 @@ static int ad7380_probe(struct spi_device *spi)
 				     "Failed to enable power supplies\n");
 	fsleep(T_POWERUP_US);
 
-	if (st->chip_info->adaq_internal_ref_only) {
+	if (st->chip_info->internal_ref_only) {
 		/*
 		 * ADAQ chips use fixed internal reference but still
 		 * require a specific reference supply to power it.

-- 
2.43.0

