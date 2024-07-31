Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245641A4F1C
	for <linux-doc@vger.kernel.org>; Wed, 31 Jul 2024 07:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722409555; cv=none; b=S9lafv7hPm0VhXrn0ETFjWDa0Ygh7psZSBUf+xTBe4sAUaQQaHe1QSzxrO0wI5Br/F46UohjtSrgkv95LiJI55YTHUeib4zOTZkGz8v6xL1CQC0DO3rmKi57UXtGMVOu/hFRxqdVm+Q5uazgNauJIrTkO26BM4xKJTB/fTAXS5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722409555; c=relaxed/simple;
	bh=DmT1lkaAUXmyCjselEQKioQon1H08Xpiwh19x8GvP9A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D6Jz6e8xbta4+fmAKoa/jDxuUpHqv5py+eWeo8qamuGJVgk15brtFviOyweTUm1DxlS6rlD/O6EptGj5c8120R1r1LcVMpscV9qMSeyyuZ0pjc1ODc78kUMPzNkszGHG2j/FhW3FMW8BQRspoYSieLQS3623PHMk4lnPlK8kqkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=mZlkrUgz; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="mZlkrUgz"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42819654737so29071795e9.1
        for <linux-doc@vger.kernel.org>; Wed, 31 Jul 2024 00:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722409550; x=1723014350; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xh88NQ9QvsN4DODTuwx5BwmanL/AOw553yOYeKfdouo=;
        b=mZlkrUgzRHEXswHt7YXtfJQ0FC+Up+umcTzWRSkkJIOFkva7Ju10l7FrrR4tS24MwH
         jk5MgxQUahDjxi87zpFtKOReoAqN++JnuTAQNSc5pq2aHEo5oa1NYs4uMH/bZ2wAL74Y
         XBpdhH9k0/61DyLZsC3vTgGBkI7yDV602QkXqkBLlQK8R4GgcDi87Xrl9x9w0Xavm7ZP
         YESHvtRry99J1Yk7z3JuGvSkfFzptJmgYpSOrMFTz5Wg78a479qrkIhwwqhWAmm7JFQW
         DHPZwvryQ+kzGMV78hu35P1B3RHOIHtJdIDi4mNFAJaTKBDrR6fQFwMVikia7L923dfo
         BkyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722409550; x=1723014350;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xh88NQ9QvsN4DODTuwx5BwmanL/AOw553yOYeKfdouo=;
        b=fYWAYEB7Ov5tM1285k/J91mPbx8UfCcYqLwElp4imXw9E7nQMNSFv1Xhcygr048EIz
         MKKqIa/sM13ZdHghttjUXiXj69+Z89hDqyW2XqJKhmTgKN+wFB3kZftAXsxqkO7SDXXA
         Bqk1flz6xizrEbMZKBO1NfaLpGnPB1mB823MN5fiId+YAmNSMAEOjfnM3M9WSn+FCxVZ
         EnXt0Fjur3D5CSSlUVwJR+8KDl1TLtSfSczwobQJqBpq3MGtjDzMzXKMkgphzYxiXaSU
         hHr4VPCFJfSB3GOhBSup3QD131duyV3dS6WNwzkzYTYiBR3zIPR80HF+sBSxEIjWCq1w
         mgZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRYS23QKa5aFRbtrzVULyzGsXzm3Rk5zXFJl/SegSMlSEd/fm6+psS9Jn0XZlqkBQoUx0ENmTZE+uz4FRKKIjhWskFK59OKWpe
X-Gm-Message-State: AOJu0YwNkxWFjvHp8uIa0Km72DoH970Zp+MeRqCzHDcHWYZFvpQP5wMP
	YUaLe3+TMGXvuPpbwuh25TaPhDC05vyCwkko6PxxowpOlQeY4g1gqdpec9FoJua/qpyc54iUTDn
	3DQw=
X-Google-Smtp-Source: AGHT+IF1BsxjqLXjQCg0o51ymFFuLeG7sRz3r2y5FeNtGXo/X7OD6zqXUXoKy9RwDi4FIdp/PydsMw==
X-Received: by 2002:a05:600c:4f8e:b0:426:6379:3b4f with SMTP id 5b1f17b1804b1-42811df0e76mr90800015e9.31.1722409550521;
        Wed, 31 Jul 2024 00:05:50 -0700 (PDT)
Received: from [192.168.1.61] (2a02-842a-d52e-6101-6f8f-5617-c4b6-8627.rev.sfr.net. [2a02:842a:d52e:6101:6f8f:5617:c4b6:8627])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4282b8a2593sm9953215e9.4.2024.07.31.00.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 00:05:50 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
Date: Wed, 31 Jul 2024 09:05:43 +0200
Subject: [PATCH v2 2/7] iio: core: add function to retrieve
 active_scan_mask index
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240731-ad7380-add-single-ended-chips-v2-2-cd63bf05744c@baylibre.com>
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

Add a function to retrieve the index of the active scan mask inside the
available scan masks array.

As in iio_scan_mask_match and iio_sanity_check_avail_scan_masks,
this function does not handle multi-long masks correctly.
It only checks the first long to be zero, and will use such mask
as a terminator even if there was bits set after the first long.

This should be fine since the available_scan_mask has already been
sanity tested using iio_sanity_check_avail_scan_masks.

See iio_scan_mask_match and iio_sanity_check_avail_scan_masks for
more details

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 drivers/iio/industrialio-core.c | 43 +++++++++++++++++++++++++++++++++++++++++
 include/linux/iio/iio.h         |  2 ++
 2 files changed, 45 insertions(+)

diff --git a/drivers/iio/industrialio-core.c b/drivers/iio/industrialio-core.c
index e6fad8a6a1fc..f18f48c7eb03 100644
--- a/drivers/iio/industrialio-core.c
+++ b/drivers/iio/industrialio-core.c
@@ -1965,6 +1965,49 @@ static void iio_sanity_check_avail_scan_masks(struct iio_dev *indio_dev)
 	}
 }
 
+/**
+ * iio_active_scan_mask_index - Get index of the active scan mask inside the
+ * available scan masks array
+ * @indio_dev: the IIO device containing the active and available scan masks
+ *
+ * Returns: the index or -EINVAL if  active_scan_mask is not set
+ */
+int iio_active_scan_mask_index(struct iio_dev *indio_dev)
+
+{
+	const unsigned long *av_masks;
+	unsigned int masklength = iio_get_masklength(indio_dev);
+	int i = 0;
+
+	if (!indio_dev->active_scan_mask)
+		return -EINVAL;
+
+	/*
+	 * As in iio_scan_mask_match and iio_sanity_check_avail_scan_masks,
+	 * the condition here do not handle multi-long masks correctly.
+	 * It only checks the first long to be zero, and will use such mask
+	 * as a terminator even if there was bits set after the first long.
+	 *
+	 * This should be fine since the available_scan_mask has already been
+	 * sanity tested using iio_sanity_check_avail_scan_masks.
+	 *
+	 * See iio_scan_mask_match and iio_sanity_check_avail_scan_masks for
+	 * more details
+	 */
+	av_masks = indio_dev->available_scan_masks;
+	while (*av_masks) {
+		if (indio_dev->active_scan_mask == av_masks)
+			return i;
+		av_masks += BITS_TO_LONGS(masklength);
+		i++;
+	}
+
+	dev_warn(indio_dev->dev.parent,
+		 "active scan mask is not part of the avaialable scan masks\n");
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(iio_active_scan_mask_index);
+
 int __iio_device_register(struct iio_dev *indio_dev, struct module *this_mod)
 {
 	struct iio_dev_opaque *iio_dev_opaque = to_iio_dev_opaque(indio_dev);
diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
index dd6bbc468283..73b75a9ff314 100644
--- a/include/linux/iio/iio.h
+++ b/include/linux/iio/iio.h
@@ -864,6 +864,8 @@ static inline unsigned int iio_get_masklength(const struct iio_dev *indio_dev)
 	return indio_dev->masklength;
 }
 
+int iio_active_scan_mask_index(struct iio_dev *indio_dev);
+
 /**
  * iio_for_each_active_channel - Iterated over active channels
  * @indio_dev: the IIO device

-- 
2.45.1

