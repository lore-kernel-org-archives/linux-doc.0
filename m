Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB56268694
	for <linux-doc@vger.kernel.org>; Tue,  8 Apr 2025 10:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744107621; cv=none; b=DLdnfCKk/GwEl0K3KOC8gzxaUG6pzKca19Y3UeUbuQ17l4qDDpMftJIc8pkUanbZKrieJFyTiJEEK3mX7R4WBthJqyJhamK9dHJriBtyM++Xr3tl6aBwDihZQYhlIz2gpuhUQNV6FhGuS0Aubacv5EkE2L6I22q1yw7UeGwjYAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744107621; c=relaxed/simple;
	bh=lgsAI1C4GJ9f/lxYOr2FZ5rkqth02XBYIH8GiAkKCgM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RgXB7WamJNf3XZEjj5XaBYawbZOwKaG/4Keed2q/+5ELypjnqoJzoYbL87J1v24uU6tcn+6dgWip+GVfgSthbkj1RS/CDnGCclp5icH7lpgqoXr8qPnV5Bu6sBYneY6u9j4EPl5yFvGZulJQU7zHY6I5MTLD8/cr2B3sq4mVCNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=X3WEjOF5; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="X3WEjOF5"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-39bf44be22fso3576287f8f.0
        for <linux-doc@vger.kernel.org>; Tue, 08 Apr 2025 03:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744107617; x=1744712417; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QYLrYCRZJaz3Q9z9V56+5pPJKQA4s8QRrtBGVRh2868=;
        b=X3WEjOF5Q1YCT3wxvcOsbRSmVJzWjIrRGi/Q1sqnAEicm1G3sigx0vKU9Abz+54YOp
         1U4wj5BWcmB7PNm0fRt2BwyDGcJYAu0Wkof2tIV303kZKbbt4jh46yVVA5VXTcP0b6/S
         qsdSHr1boNDKWUpsBTZQCDFrs3STf8j8Sfop0Y8m/hT8wooRO4E+p/FNxo5YXpgkcrLV
         jcoZCaW10pxYE9Rw00VSgxqGnEwULDV++SzFXmOLEF3radfrE27SH51Z3YwaDq2MQwpE
         pmKYiMA8yECMGMRum5PDyWNWCysw0I7UPFP7i5j6M7fmQCUG9gVcGskkwccAL7I5ZxWu
         l2ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744107617; x=1744712417;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QYLrYCRZJaz3Q9z9V56+5pPJKQA4s8QRrtBGVRh2868=;
        b=vg2jaHsD3aVwadHWdswc24sxBmzMUeFailaDP464gtVdijuaWEti2mT0TIDW1LOChc
         0wibW9wmmxwUCsSACRzPl3iw27X0/hYlkOEKpTG/G3A0p06n/QoaoZnEgPI42DsiLpNB
         eUpTgtua1fV/Wp3LwHCfOP4kx1Fpio7xYp1ZYan6shZsUwwyGYkKeVShqEK+/vMhh9GW
         SYWl62ZKNk9100oQwX2QPg2GjMwunZnAVWdeWmeq8YV/oJXOySTMv1nR/BeRt7Wn3E2A
         ZVof0QWl2pr6DJK3WAjRKisXKXloS+49GNh+x2wMmOLUZ4O9NWXEFwyVu5aWapfngIZ0
         mOnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmKAfK/P8fEmMtBCxyXqm507iw1Lbycpdrp5xEVFHJFdzHWrNV+/9CzNNN9hVltlhjU8np7eBoHro=@vger.kernel.org
X-Gm-Message-State: AOJu0Yykc8xXMGsT9dXwVbSiSygHmxUCZyADXmTFFPyEk6bIdZZ2lJ+n
	cc+wek9PJoQfmExCcVCu1+6shkcePnj6Nq2UrI6u6RWsLdMwBBzcwTx6OMGnIj8oa8VSX5EkQYO
	f
X-Gm-Gg: ASbGncuCqxY0xNGSDMyWM8dTww1ioa7kxIk+TPcicfxuUoW3a4N9rikGp6rO2pFakMx
	xvL0cYGUHqeKdl7fb+8sJFPEEcLsIziGdY9t5AZSelWR0LN7fqox685N578smh4Xfr+23fA63ZO
	Qzn12H2yrJ6QxNk+U19x4RQIrwXjt8NTbjBGxWfq1rjeeYKhhQwXpZH2wQVu3f7DJecQ0G7WqWG
	x0nFHf0rjJ+NMBufMus4JUI4FxbWHcZm04ZwwnUkXKK4oOYTSo+tdYYNAFDrN3a8VBrqMy9ee5A
	eTm1kN26zpA6hLuLLrKhGZPDWfawFS2VOxp2M93dMjpCmfacE3o/GDeSzuMhV1YNlxJFhi2MZoM
	QA06k0YKLJEXwivq6hPM7ZQ==
X-Google-Smtp-Source: AGHT+IGxgp39FjNPJEbArAS3WynvmgHVgFnW8e0TESe1VHTjuSvvOXJpuMeA42affgvOD3UXCRT7NQ==
X-Received: by 2002:a05:6000:290b:b0:391:300f:7474 with SMTP id ffacd0b85a97d-39d6fc291bemr8609128f8f.18.1744107617207;
        Tue, 08 Apr 2025 03:20:17 -0700 (PDT)
Received: from [192.168.0.2] (host-87-15-70-119.retail.telecomitalia.it. [87.15.70.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d7c6d838bsm4396138f8f.69.2025.04.08.03.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 03:20:16 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Tue, 08 Apr 2025 12:18:53 +0200
Subject: [PATCH v4 3/5] iio: backend: add support for data source get
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250408-wip-bl-ad3552r-fixes-v4-3-b33c0264bd78@baylibre.com>
References: <20250408-wip-bl-ad3552r-fixes-v4-0-b33c0264bd78@baylibre.com>
In-Reply-To: <20250408-wip-bl-ad3552r-fixes-v4-0-b33c0264bd78@baylibre.com>
To: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Olivier Moysan <olivier.moysan@foss.st.com>, 
 Michael Hennerich <Michael.Hennerich@analog.com>
Cc: linux-iio@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3533;
 i=adureghello@baylibre.com; h=from:subject:message-id;
 bh=2lP6oKpb0hmzBUffbG/vd1ZR0rWtSFsiZRG8+MHxxuM=;
 b=owGbwMvMwCXGf3bn1e/btlsznlZLYkj/8kPI5UatbjprZUaeTtvfZUYiSee7OzwtRD3D9gQus
 ej3+Hymo5SFQYyLQVZMkaUuMcIk9HaolPICxtkwc1iZQIYwcHEKwET4zzAyHHn5SVrd8Q2bmc3z
 G+8+/LmxckLQp6fO/OITo7KYjc9fe8vw3831U5NsifpytkD93u07+Vd/yvqrrvOKe+n+mbHLipS
 WsQIA
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

