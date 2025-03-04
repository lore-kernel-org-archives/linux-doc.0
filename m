Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B952A28F924
	for <linux-doc@vger.kernel.org>; Tue,  4 Mar 2025 15:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741102059; cv=none; b=Fr2FeiOZ1u12sjkSGqjbB8dkupNXhAuhyCPhwC2uwKovjCashFY0XzfxQhu4ObPelLHDPIlLOOwLDg3TtAATppEWmyTiWDctZb80GYC1yaWLhhnPt3nEIhqBhrsK1zP036u8W8hvY9nKz+R/tZVZMqyveWWRbCQXqwfhNkkFRFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741102059; c=relaxed/simple;
	bh=uuQKh3mKy6W10Rx5aVL8Bxq79MzsKeJfW6stjMAKKC4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YTz8iin4i5t781loQS2Y/G7rPkks+6rGKqVegQ7sxfT0fqyBAMM+wXyQdIjbaVgYoyyJT+Ir/uC9K71jIt8KuZvmBJzar/PhBosQnvnPxYffQe1ZTvuqKDpgbUbkzKBOPiiJn+kWmF6rcJCIvMfdVKgzs+tSOfsavgBKGjJSTpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=IqVBDmkA; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="IqVBDmkA"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43bbc8b7c65so27019225e9.0
        for <linux-doc@vger.kernel.org>; Tue, 04 Mar 2025 07:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1741102055; x=1741706855; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3oa/LjsLwWuUnAPX0dIe4E63CiyKqmPE+fmfAuxCt00=;
        b=IqVBDmkAihvX59kShKSuCPwosZfRAMCU6ok931WXCJc/JeCzdl8J1hdPY/dTiJ81O/
         /ROhJIBi5TiaXbE8QJS6HWC7ZWG7iD7vkeloVe8yUfNn04riYjgjmh2hH5cW4zE0NMqC
         E/0YKZgnP24yX9xhkmvkYwNX2Hra3ot6YTW4gMw8uSdEuCOiYiwVR6/dQxRuO0oBZl06
         P7hPTMIxHzU/ruaVkvb16bBKgym/eBnwqmm/jJ3Xohhho4wETHKX3xewcCeaPnU2Nckr
         KQmJXrg28INF7D9JNMTUkq9T6nDbRpvcafcNRKyT2KVpe7zxqYkDpaQFOqQsDmWGJIoK
         1uTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741102055; x=1741706855;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3oa/LjsLwWuUnAPX0dIe4E63CiyKqmPE+fmfAuxCt00=;
        b=bkLuIGDsHoO5zFtoe+IyKvNGh7ZQ90dahtPv03NT4HitdFsY284rIXZbQTKBKJ71iA
         ut+X7jxPxiJhacIp4CLRe33A7hkWG/rv6YAmQDHKgYTCMbW6Xk10vWsO3hFznSTEh+Md
         v3Q7rFRDkXULS65xklf/jKEEkwQrfoOpHfuaaclJLXwvpO7clG2he0mP4n0/CGpRTJeF
         u0e1AYqPWwZan8VuLeSqBQSnP3JHKX6c32xUly9A4hsFTsfEp0Jc2T3ysFiFxIDCYj2S
         NbNFE+cF4OUJb5taHnnhwulp9GNK/vsfbTWhr7mnMTTygz3sX8UN+QP9BWhjpMTFEUgu
         Hf0g==
X-Forwarded-Encrypted: i=1; AJvYcCWinJcZI1E8+hsyahkTFZr+IvRaapEUwwo4vYWgLXTXOISJlbBM7hkrcep1G5EOr0E6xe0C+7VaiZs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZgOO0xQu369W5uANsIzE4HJ3KxyCABllzRKfbntIwRhgij4iA
	4EqrM6YxEbRf1iAXR5BlEJxkBCWpM33LqSJv9NriqD8ieLl2uSH3444/raCM4nA=
X-Gm-Gg: ASbGncsIfN64bM9SPz0hxTpvo64f5rOBwQSqhH2ZBS4tl2tu8+GTornOpAv5rC74AY5
	b/7Lh3Z4KC96oqTkLEQPQTVQl+kI4hGunjBXJ7jf2kMGXOoQ0GdOx4NLw03SumJ4gk9CEU/FBUk
	Ru1R4cTXIK0oRVFbDTfsLTPjg4Mk6L03PlHyUkdVdWZPUqStwh7MJgMmZVbA13/TWw0fiTxENQB
	nqoO44xM4mjEbFhtI/VdUmtlz9nfarC8gSIqeL63tMhEJ4hjAA6d4G0RHoSvspxqRHrkB2Xlbah
	YH2whKmGGtex1XUmFNNEryZzptKbqDxBF9gCtmNDmdyUHahkkxkWhpQhNE+N6mkiw80EfKOBnoM
	Ptgy6grykCbUfpWwmWX9WeERewEiHR2nXng==
X-Google-Smtp-Source: AGHT+IHyqFt3+P6QFQ7++XK+TXtEDjynFjltHEGg53g+W1SS5peidJaNiu6oFmUx9mlZeW4OoWsj7A==
X-Received: by 2002:a05:600c:46ce:b0:43b:cf12:2ca6 with SMTP id 5b1f17b1804b1-43bcf122e47mr14088885e9.1.1741102053546;
        Tue, 04 Mar 2025 07:27:33 -0800 (PST)
Received: from [10.2.5.157] (amontpellier-556-1-148-206.w109-210.abo.wanadoo.fr. [109.210.4.206])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47b7dcfsm18245580f8f.55.2025.03.04.07.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 07:27:33 -0800 (PST)
From: Angelo Dureghello <adureghello@baylibre.com>
Date: Tue, 04 Mar 2025 16:25:45 +0100
Subject: [PATCH v3 2/2] docs: iio: ad7380: add SPI offload support
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250304-wip-bl-spi-offload-ad7380-v3-2-2d830f863bd1@baylibre.com>
References: <20250304-wip-bl-spi-offload-ad7380-v3-0-2d830f863bd1@baylibre.com>
In-Reply-To: <20250304-wip-bl-spi-offload-ad7380-v3-0-2d830f863bd1@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 David Lechner <dlechner@baylibre.com>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.14.2

Document SPI offload support for the ad7380 driver.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
 Documentation/iio/ad7380.rst | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/Documentation/iio/ad7380.rst b/Documentation/iio/ad7380.rst
index cff688bcc2d9601a9faf42d5e9c217486639ca66..12709ce051110e68b6f0c9b9a0baefcc954f2bc0 100644
--- a/Documentation/iio/ad7380.rst
+++ b/Documentation/iio/ad7380.rst
@@ -169,6 +169,42 @@ gain is selectable from device tree using the ``adi,gain-milli`` property.
 Refer to the typical connection diagrams section of the datasheet for pin
 wiring.
 
+
+SPI offload support
+-------------------
+
+To be able to achieve the maximum sample rate, the driver can be used with the
+`AXI SPI Engine`_ to provide SPI offload support.
+
+.. _AXI SPI Engine: http://analogdevicesinc.github.io/hdl/projects/ad738x_fmc/index.html
+
+When SPI offload is being used, some attributes will be different.
+
+* ``in_voltage-voltage_sampling_frequency`` attribute is added for setting the
+  sample rate.
+* ``in_voltage-voltage_sampling_frequency_available`` attribute is added for
+  querying the max sample rate.
+* ``timestamp`` channel is removed.
+* Buffer data format may be different compared to when offload is not used,
+  e.g. the ``buffer0/in_voltage0-voltage1_type`` and the
+  ``buffer0/in_voltage2-voltage3_type`` attributes.
+
+Effective sample rate for buffered reads
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Using SPI offload, the PWM generator drives the starting of the conversion by
+executing the pre-recorded SPI transfer at each PWM cycle, asserting CS and
+reading the previous available sample values for all channels.
+Default sample rate is set to a quite low frequency, to allow oversampling x32,
+user is then responsible to adjust ``in_voltage-voltage_sampling_frequency`` for
+the specific case.
+
+For single-ended chips where 2 banks of simultaneous inputs are available, as
+ad7386, ad7387 and ad7388, if at least one channel from each bank is enabled in
+a buffered read, the effective sample rate will be 1/2 of what is set as
+``in_voltage-voltage_sampling_frequency``, this because a separate conversion
+needs to be done for each bank.
+
 Unimplemented features
 ----------------------
 

-- 
2.48.1

