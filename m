Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD813E9F92
	for <linux-doc@vger.kernel.org>; Thu, 26 Feb 2026 15:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772118683; cv=none; b=eDHgpqL+fV0M/UNFoNEb/5OQRDSINuXSmoc1rTMpBRYIlXXEb8IwLwRYZZ2UNg+x4P1TL8EQqj2/a15go5GiFdaiU3ReyhzUe+7J14Qkw68WyVIIx8PBUwST8hfWJD0IxRWf6O2gPT66F2NRhrA2BpLlvpuWpJJY/HD1iHJLTZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772118683; c=relaxed/simple;
	bh=eC4OcRhmLSDkTtLlMg/lYgJlFKVw7QIYt47QGv08+I0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kXhkSGW6DSROLTUAV66XAUxB/tYhLChBQoEZl55Bm04I76LLqY/fr7XwavTwhSjsOVfI4ieOdHRGSFKf3G2WHtYYUXkO1n6Ncw5Kc3/fk+UeFUcvFu5nAaT84FCVLLgvpj0xzGOn8MKFCVK71dhWlC0XSIFgUD9CR0NBYcoNHBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gebXlT+A; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gebXlT+A"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-896f5af3d8aso15811916d6.1
        for <linux-doc@vger.kernel.org>; Thu, 26 Feb 2026 07:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772118681; x=1772723481; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xGlQ2VVKxMQ5I859rXP6Jbm/Xm1NZz+UcI5mRp04U9Q=;
        b=gebXlT+AP54M//lpF04hAmIH87YXQCKgkSN5tgPkkVkYzHkvJHel53XnaW0yZ9KGsH
         oHuPae8Yx4PCBSZ+cwRSpi1p7UrEaXN9wr/hCMCixVivdFN/gVXCCwfNBP++xybY7V/+
         ErAFPtvaasTeIiQXyA2f4HGJYxgxQLTxgmO/qD73xX8zGNHxCHwQtPhVaM57lnrnzZrU
         cS3EgAMnGj/GoBQXoEFwB96EQde0ZwWT/b+FnjWAWPsnPLgwpZqyVGUXzCwImXa1Ia8R
         Ur02mTGegOaXQPRLeOxkCblFe0INypb9GE32HQUztDbZIFpYQ9OOV6qvCZ8pGYsvOE6B
         j9hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772118681; x=1772723481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xGlQ2VVKxMQ5I859rXP6Jbm/Xm1NZz+UcI5mRp04U9Q=;
        b=WIyT/cMfBiMieEO7JcO49nwpZsCBwoGzZugx2T/cHU2KBvuyxa5u+TSPB47eclbM7T
         Ec21ZeP9dI5FmiI0x2zH5VCbZuz0XsIW4psSKjzhSJl34hlur1AcCXNcVCfO82unZy2M
         /dWDVm6m9G8gkc1yw3RdkdsUlCJYF5xQyt7vDOMOJl3P5+RhSPUgOBeX7cy7975Jx67O
         LFD5beu9IoXJhFFYB4RayaXDbi5/nRYFsvG54A2II/bj5jS/dWM4UulWqP3tWkwJRpo5
         FQCAmhlMSVmr5SdoHuPseI5rv+j0yJEr9wo/jLTr93UmZkQwIBYuLNpxFwjk5DRrp75f
         hv3A==
X-Forwarded-Encrypted: i=1; AJvYcCVnr2+ti+6eSQ4aIVYCkLhvtY9FKkxS26IcnTAumlM+4GituVPQVnKmeLs8EGJ3DeCyPQZ04Wm+Zhs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHM8O6i7o6D9tZjggPOS0Bk1Ri//cSNHXGBcn4IzCbAkm7g5Pk
	k1lrG1sWtGC8C2LpUZmy/awt5wMsz6EPx3uPi1hQpPJpzm7BD53uWYe7
X-Gm-Gg: ATEYQzyhq3v+zUrQ9uAvpTghNAZ2ycflD+NaXwB16ao1k3RqJhzCgqtx78CH4kOXmM7
	dosD5+lVRJ9ckUf4D2wnUO3XCzPTXSzSH6PtMCM/5ppKx4OgACGVsCEf4z504WXkuvPW1b+vorw
	rMDfwYMLyD9hCzIce28myDp7NA2Jic89um0BmKrDydbJ2M4xLGiqWM6VhK603F7rzkDs4yTX/eS
	h0sZpIxjIv1RQ91kq7ZaEmb807uFBIYgCiE7sstDeF6p3Z5O9T7/yPJEcHBQETm7H5/awyrZxmR
	5Zb7jApB5vgT3PbG2CkUYYPrKJlgVqmQz/53SW6CdXfYlDUlv2CueuNDPti8mm5S+GVF3KVhzph
	X9vqqtK6db9fHQc6UbEg/dnvrjzpPdyc76d0Ir7QWTchYb21folyVtKWO7o5O9Q358zAEoj1w+N
	n0brSSUuti7cUH9RkdDzSg/kz9faSVqFdZRAiOE6j2cDDsdvaKevC5eOpRy7KST4kyV2v0r2Nk
X-Received: by 2002:a05:6214:258d:b0:895:4a0f:ea79 with SMTP id 6a1803df08f44-899c8017569mr30789216d6.44.1772118680750;
        Thu, 26 Feb 2026 07:11:20 -0800 (PST)
Received: from db07.1337.ma ([197.230.240.146])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899c738e661sm19275136d6.43.2026.02.26.07.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 07:11:20 -0800 (PST)
From: Taha Ed-Dafili <0rayn.dev@gmail.com>
To: linux-iio@vger.kernel.org,
	jic23@kernel.org
Cc: dlechner@baylibre.com,
	rdunlap@infradead.org,
	skhan@linuxfoundation.org,
	nuno.sa@analog.com,
	andy@kernel.org,
	corbet@lwn.net,
	lars@metafoo.de,
	Michael.Hennerich@analog.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Taha Ed-Dafili <0rayn.dev@gmail.com>
Subject: [PATCH v6 2/5] iio: core: Add IIO_EV_INFO_SCALE to event info
Date: Thu, 26 Feb 2026 15:11:03 +0000
Message-ID: <20260226151108.22383-3-0rayn.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260226151108.22383-1-0rayn.dev@gmail.com>
References: <20260226151108.22383-1-0rayn.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement support for IIO_EV_INFO_SCALE in the internal enum
iio_event_info to allow proper ABI compliance.

This allows drivers (like the ADXL345) to expose event scale
attributes using the standard IIO ABI rather than manual
device attributes.

Signed-off-by: Taha Ed-Dafili <0rayn.dev@gmail.com>
---
 drivers/iio/industrialio-event.c | 1 +
 include/linux/iio/types.h        | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/iio/industrialio-event.c b/drivers/iio/industrialio-event.c
index 4149efcd5539..a0d6fcf2a9c9 100644
--- a/drivers/iio/industrialio-event.c
+++ b/drivers/iio/industrialio-event.c
@@ -256,6 +256,7 @@ static const char * const iio_ev_info_text[] = {
 	[IIO_EV_INFO_TAP2_MIN_DELAY] = "tap2_min_delay",
 	[IIO_EV_INFO_RUNNING_PERIOD] = "runningperiod",
 	[IIO_EV_INFO_RUNNING_COUNT] = "runningcount",
+	[IIO_EV_INFO_SCALE] = "scale",
 };
 
 static enum iio_event_direction iio_ev_attr_dir(struct iio_dev_attr *attr)
diff --git a/include/linux/iio/types.h b/include/linux/iio/types.h
index 34eebad12d2c..4e3099defc1d 100644
--- a/include/linux/iio/types.h
+++ b/include/linux/iio/types.h
@@ -21,6 +21,7 @@ enum iio_event_info {
 	IIO_EV_INFO_TAP2_MIN_DELAY,
 	IIO_EV_INFO_RUNNING_PERIOD,
 	IIO_EV_INFO_RUNNING_COUNT,
+	IIO_EV_INFO_SCALE,
 };
 
 #define IIO_VAL_INT 1
-- 
2.47.3

