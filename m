Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED2C278177
	for <linux-doc@vger.kernel.org>; Wed,  9 Apr 2025 18:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744223875; cv=none; b=Vk1AVl/e48/0yzxNrUMKLblzWZfV9t6AqYivQRz5C7hYvR6+K7wMqjSLQmoTH7py919yPwPkbhCj75AF+i9jy49VqTNiDEi49QEbF3RbZvcLK8AMuSr9zcRBSuR3TRXcmL2+i/7VHLQ43tb/Oqamfs21sdp+Hlfdy6ow9QPvmao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744223875; c=relaxed/simple;
	bh=lgsAI1C4GJ9f/lxYOr2FZ5rkqth02XBYIH8GiAkKCgM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DtTuzldi4sqE5h9QpL4PZYtByoRHfJr9DeSRRQQn8HN3/fMPno6UqnhneC+j55k0FmW3epPCN7jd7+PdOQsPFmb47a3GS6Q6jWS2VSlZV0iVjdv4aVxMZlUSzDEYgcGeTTiLlB6yhHaWGd/4lBWQnrNo4/z1yLen9EXtI5+DyIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=kaMHHd33; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="kaMHHd33"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cf034d4abso322135e9.3
        for <linux-doc@vger.kernel.org>; Wed, 09 Apr 2025 11:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744223871; x=1744828671; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QYLrYCRZJaz3Q9z9V56+5pPJKQA4s8QRrtBGVRh2868=;
        b=kaMHHd33wLPmKvgOjLsCi27pViHjgYO+lgezOxkOQ+MPM3sPx7RawFdlTFLMK/6iqw
         DkyLZDnuh+8hsVb/f/yP3LCHpugIpgweMzFXchfX3cu9wEAYKTO24l7tuFE1F87X3GzO
         mRgssJbzD7gqXC51mSQIDiu59R2PbBgsLktNabJ9DHr5yLVrtB6Pk0s9HbP8mPJ7+x2K
         nqEQO0l0M6/vg8o6U5QhW9iidV4D8FfQ84ByfvdNqaXjVx+1QVRv5fq0+m74igPaXOHo
         sAObKKAsehPstuXdO3VaL0dD5aivCopPSbLDN0MOoTu3i6O+RX6ntfKFUvxmGApQMhhX
         GTDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744223871; x=1744828671;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QYLrYCRZJaz3Q9z9V56+5pPJKQA4s8QRrtBGVRh2868=;
        b=RuDceFqAar+K62uDy9Ro3mXeoWSDa+ZgENu/168FsqVztMWJE5OOSeVyUfK6Vp8N9q
         NcyrL9APLN7Xao9yBTgOhPCBI7taWmelSKbueMIxUzmM6dlrGjX1XZE06N0COGGkeHAT
         27S2hggjLMFsVjobumDAuZRgRWaVPcvZHbTDIhpWWbJnDMxC+XDwoPyPfhpJjOh9nQUi
         q3+Vb4Gec3MX9116T2BA78LPVJx2KC5uZWIWCrY37Heo1jb4KwnzBW7ZTieX84f9GfIJ
         FLTitEsPTO53HJlucsxeFCzzMVdIOe4q05GOY3HQ8B8exIbNm4f6Q8rrGi2Ti11Poqkk
         BIpA==
X-Forwarded-Encrypted: i=1; AJvYcCXqzrp31R1Zpw6lLBP6wto+gvSnjd8C96wKUuDnLU8ACcdS1E5mDixWGuVDHM4OgPqjxvHdKHs/kEk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwjP8KqA0kBYqXpqxQEemLxxqz4JB/492+pVqGixo5Tvg8wuYd
	yovezs3Ux475SbXRhtJ/fTKVnAgzyJfyQ3ORmHP5HtpyX5A8gv8g7/ZLzwlVkGM=
X-Gm-Gg: ASbGnctbSfG6hneRxdX72WOHG4YwaUc/xP5uvC3lwqCdghFkKW7ZHDcnKoVuvX7NwiB
	UWNsONM6yIPmMzIHGgaWgKAvPMBRNWgl1Wz7hYVvH12KzQkUwdop46T8LiQOUxzvig1HsGmQDkx
	c6sVST1l3oXn/JJ3buqlV2jtfholr3i80IFMpevt1jSntw4dpGI2r7LPRWYm6ufZ8LO3Y6kyRuF
	H9Dem1cICEkpfv76dh8sPbU+nnuP+Ro6yJGlzWFXIiD+LSUCL+GBSqqHWOO1Z3oUa24eM65a9Dp
	dxv4HWqj6WZhKwc5q5X6g49V/vUcj+yHLqJ9DQSDNWx3AhnzHOzZhbOaAtjuypxZOzvPQT4HgNo
	LRgFxsUkSYe5Ju7nsng==
X-Google-Smtp-Source: AGHT+IE/ANstT3msY29/I9nmhGxxk90Rx7ljncJfbkIER2ZUBChCz7EMdmqplF2DeEMhtxHiY8pz/A==
X-Received: by 2002:a05:600c:4e4a:b0:43c:ed61:2c26 with SMTP id 5b1f17b1804b1-43f2d7d6f30mr1299565e9.17.1744223871230;
        Wed, 09 Apr 2025 11:37:51 -0700 (PDT)
Received: from [192.168.0.2] (host-87-15-70-119.retail.telecomitalia.it. [87.15.70.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d8938a808sm2380893f8f.53.2025.04.09.11.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 11:37:50 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Wed, 09 Apr 2025 20:36:30 +0200
Subject: [PATCH v5 3/5] iio: backend: add support for data source get
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-wip-bl-ad3552r-fixes-v5-3-fb429c3a6515@baylibre.com>
References: <20250409-wip-bl-ad3552r-fixes-v5-0-fb429c3a6515@baylibre.com>
In-Reply-To: <20250409-wip-bl-ad3552r-fixes-v5-0-fb429c3a6515@baylibre.com>
To: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Olivier Moysan <olivier.moysan@foss.st.com>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3533;
 i=adureghello@baylibre.com; h=from:subject:message-id;
 bh=2lP6oKpb0hmzBUffbG/vd1ZR0rWtSFsiZRG8+MHxxuM=;
 b=owGbwMvMwCXGf3bn1e/btlsznlZLYkj/tk93yjw1c9OwfQI/5UzdXZKj53dde5ln+Z7ZfXVn2
 sxFc283d5SyMIhxMciKKbLUJUaYhN4OlVJewDgbZg4rE8gQBi5OAZhIkisjwykGWw2JpcG3n9iW
 VLDm3qzwjOf0/f5SIOL/o513C/pD9zP8U3bIXJnKfYDjXOPG3GIHP6bPPeeDLSemvjJ69/vaG0s
 vBgA=
X-Developer-Key: i=adureghello@baylibre.com; a=openpgp;
 fpr=703CDFAD8B573EB00850E38366D1CB9419AF3953

From: Angelo Dureghello <adureghello@baylibre.com>

Add backend support for getting the data source used.

The ad3552r HDL implements an internal ramp generator, so adding the
getter to allow data source get/set by debugfs.

Reviewed-by: Nuno Sá <nuno.sa@analog.com>
Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
 drivers/iio/industrialio-backend.c | 28 ++++++++++++++++++++++++++++
 include/linux/iio/backend.h        |  5 +++++
 2 files changed, 33 insertions(+)

diff --git a/drivers/iio/industrialio-backend.c b/drivers/iio/industrialio-backend.c
index a43c8d1bb3d0f4dda4277cac94b0ea9232c071e4..c1eb9ef9db08aec8437d0d00cf77914ad6611b72 100644
--- a/drivers/iio/industrialio-backend.c
+++ b/drivers/iio/industrialio-backend.c
@@ -380,6 +380,34 @@ int iio_backend_data_source_set(struct iio_backend *back, unsigned int chan,
 }
 EXPORT_SYMBOL_NS_GPL(iio_backend_data_source_set, "IIO_BACKEND");
 
+/**
+ * iio_backend_data_source_get - Get current data source
+ * @back: Backend device
+ * @chan: Channel number
+ * @data: Pointer to receive the current source value
+ *
+ * A given backend may have different sources to stream/sync data. This allows
+ * to know what source is in use.
+ *
+ * RETURNS:
+ * 0 on success, negative error number on failure.
+ */
+int iio_backend_data_source_get(struct iio_backend *back, unsigned int chan,
+				enum iio_backend_data_source *data)
+{
+	int ret;
+
+	ret = iio_backend_op_call(back, data_source_get, chan, data);
+	if (ret)
+		return ret;
+
+	if (*data >= IIO_BACKEND_DATA_SOURCE_MAX)
+		return -EINVAL;
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(iio_backend_data_source_get, "IIO_BACKEND");
+
 /**
  * iio_backend_set_sampling_freq - Set channel sampling rate
  * @back: Backend device
diff --git a/include/linux/iio/backend.h b/include/linux/iio/backend.h
index e45b7dfbec35c094942a3034fc6057a7960b9772..e59d909cb65924b4872cadd4b7e5e894c13c189f 100644
--- a/include/linux/iio/backend.h
+++ b/include/linux/iio/backend.h
@@ -84,6 +84,7 @@ enum iio_backend_interface_type {
  * @chan_disable: Disable one channel.
  * @data_format_set: Configure the data format for a specific channel.
  * @data_source_set: Configure the data source for a specific channel.
+ * @data_source_get: Data source getter for a specific channel.
  * @set_sample_rate: Configure the sampling rate for a specific channel.
  * @test_pattern_set: Configure a test pattern.
  * @chan_status: Get the channel status.
@@ -115,6 +116,8 @@ struct iio_backend_ops {
 			       const struct iio_backend_data_fmt *data);
 	int (*data_source_set)(struct iio_backend *back, unsigned int chan,
 			       enum iio_backend_data_source data);
+	int (*data_source_get)(struct iio_backend *back, unsigned int chan,
+			       enum iio_backend_data_source *data);
 	int (*set_sample_rate)(struct iio_backend *back, unsigned int chan,
 			       u64 sample_rate_hz);
 	int (*test_pattern_set)(struct iio_backend *back,
@@ -176,6 +179,8 @@ int iio_backend_data_format_set(struct iio_backend *back, unsigned int chan,
 				const struct iio_backend_data_fmt *data);
 int iio_backend_data_source_set(struct iio_backend *back, unsigned int chan,
 				enum iio_backend_data_source data);
+int iio_backend_data_source_get(struct iio_backend *back, unsigned int chan,
+				enum iio_backend_data_source *data);
 int iio_backend_set_sampling_freq(struct iio_backend *back, unsigned int chan,
 				  u64 sample_rate_hz);
 int iio_backend_test_pattern_set(struct iio_backend *back,

-- 
2.49.0

