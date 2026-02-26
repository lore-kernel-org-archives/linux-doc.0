Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C4B3ED100
	for <linux-doc@vger.kernel.org>; Thu, 26 Feb 2026 15:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772118685; cv=none; b=gq0oYZPq8cVJgJ2rPVNWm/5PESFWRKCqs7BqRjas6EcZEivJVu+eIu4MxQUaWsUtBvsmFiVuPCTGFKiyaZOafrKWwpYzcpbxTp2MpsmPc5sXJt+b59VISWgq4pvTn5GfhnugPdejSt2XXv+q3ogFGMAnEMwDwDspnu5eRbtih4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772118685; c=relaxed/simple;
	bh=NNWTiEb//BrzQ/xGozL9s9RqDOS1KYPUzlwFVG2TNDA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z3O1imdXYxeCQW7Ablq7ntvS1sHXplozIaiIxj1CQy8p3tvvgevvao+FYC0NP1azn3dShvyhnbEngzdSzj5Q3+RwqRGB91c51CN6qCRZr/oWZMgtgAnHTdJIOW8z0Vr1j4rRzW0/Ad7CiaAb/yPxYn+4RAfXmEUy847OEsfdd38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iyRelujL; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iyRelujL"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-896ff127650so15704786d6.3
        for <linux-doc@vger.kernel.org>; Thu, 26 Feb 2026 07:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772118684; x=1772723484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4+TBrmc0fLXcmkm0VaaldSqs2PcXgyH2nxurKdQgp9Y=;
        b=iyRelujLQxQalRlxdGj27+QL+6ETlNkXWwxxgpW8LruqdUVmCOVor28GPNJRMvSgFA
         IwXd9wRwo5PldLqP0XEetMOGc/RgXzYFj4IV/lnScG1/8Huja+bvB0QbARlyvGad+xIX
         NdpuWH5VQ5pxuELSyKNawbziendaXLptybFIGCuERUeX+TSyxT2VFMH+NEVaVPuNaFMR
         yqhBs2raARgmS6RkFl/sMg014/2suHf/xx0GjhXxv1Hzrib8HzUFCfxTUT2I5ZwM/A8P
         mZnZzQwF9DVw/6yfxRo6x+n+BjjbOsfgiWsR6glgmCuqs2F21HZvc+EgDTQIG2PG3zN/
         qTTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772118684; x=1772723484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4+TBrmc0fLXcmkm0VaaldSqs2PcXgyH2nxurKdQgp9Y=;
        b=jQr3fZjWJDEroNg2JXNZzXNmk3HgCXmp4ZN30Zc/dBnNJeXSqKvNgdj63YTiRlBPjA
         kEaVXIEKgyvl/cpXiZ6WwOUpXnsMK832Njjl8Bq1KRtqVckTUHa+Qq7mWqWwe2BgISZx
         +tf/e7yRf1yxGVjvF7KhUN9qa+o/Q/bUHbqi6VyYEs5FMqXKbkkybliqfx7xfTNZ4ztK
         0/QGL7zCiIJzrlsMzkxnekC9c1bU5cbESYRHy0Lq+hapZvfGawA/C6yiNDP/Lgrx0QPB
         1eFjD2vDGidZXs0B8mhvV0hFLgtG32fCxOBzCKXkcU9B6g2X0dYyJyUt0RCez5xFH6EL
         eZLA==
X-Forwarded-Encrypted: i=1; AJvYcCWmy+oTHPk8ANUiFTZdfyB73oQZUx1KKIBV4njWwk1R/xMTaB30pVBFpC7xV2B93C9J0s/ZX7tQJYA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWvjiGxDLGX8sNS3QMGeKuxRrJoCHbhk/0A0lU7dmOgN6HSQZ5
	hT/6VwWp/D+tV+v1T/By0mMsp6w+CuAL4Gf7qqTiV2piuiymjMkes5iJ
X-Gm-Gg: ATEYQzy3gfqI59NjA7sk/eeRZEb0rMx0EdbP0YBJGZDqjRPM71SHg4Fq83E/IWLS7KQ
	MJkDab5lOlH2MqCieAmfKpznMIzsJYq6ssDKGdfCLDdcm4YJ5xPdsspq4TzDBRpXCinJQMsebnq
	7w06Tl+U0tZR4FUhVYV+Ivon1n+AwSdrnKSvcvG0flDDBNxmBT53suE0lvj9d4uAKzpIW7IlvuM
	D9oqUvORg1s+p/N4Ow4OSIaWHlLyTw34pjfFbchH9ast/XOeVooY5FyKstnNott8UWiRbu2FInA
	3lSkU7D3+Vj8CzqkZ9GkSvrwnvUQKRbo8yFTYhIGTgYZazCBDEPn3oK2ZS84LbKPaPyhaB5VsuX
	Eclgnotk9VCyem5Ss3w4aFbODvlIumr6p2QcY7oGMae5NWl9pYjYnMYwbKjGFjJZlOeXFCNTK6h
	+mFgIL/OcKvivQYT6K0TI8z4JTWiv287/vXryfjo1Fn9s/UjHDg5mRG24YMHs3YQ==
X-Received: by 2002:a05:6214:1bcb:b0:899:bdae:beb2 with SMTP id 6a1803df08f44-899c13fea0bmr67244086d6.24.1772118683547;
        Thu, 26 Feb 2026 07:11:23 -0800 (PST)
Received: from db07.1337.ma ([197.230.240.146])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899c738e661sm19275136d6.43.2026.02.26.07.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 07:11:23 -0800 (PST)
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
Subject: [PATCH v6 3/5] iio: accel: adxl345: Expose IIO_EV_INFO_VALUE for double tap
Date: Thu, 26 Feb 2026 15:11:04 +0000
Message-ID: <20260226151108.22383-4-0rayn.dev@gmail.com>
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

The ADXL345 uses a single hardware register (ADXL345_REG_THRESH_TAP) to
store the threshold for both single tap and double tap events.

Currently, the driver only exposes the IIO_EV_INFO_VALUE attribute for
the single tap event.

However, the IIO ABI dictates that if an event is supported, its
associated configuration attributes should be exposed to userspace. This
applies even if writing to one channel property alters the value of
another due to shared underlying hardware state.

Add IIO_EV_INFO_VALUE to the double tap event specification to ensure
full ABI compliance.

Suggested-by: Jonathan Cameron <jic23@kernel.org>
Signed-off-by: Taha Ed-Dafili <0rayn.dev@gmail.com>
---
 drivers/iio/accel/adxl345_core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/accel/adxl345_core.c b/drivers/iio/accel/adxl345_core.c
index 78e3f799ecc1..96d1417d77c6 100644
--- a/drivers/iio/accel/adxl345_core.c
+++ b/drivers/iio/accel/adxl345_core.c
@@ -235,7 +235,9 @@ static const struct iio_event_spec adxl345_events[] = {
 		/* double tap */
 		.type = IIO_EV_TYPE_GESTURE,
 		.dir = IIO_EV_DIR_DOUBLETAP,
-		.mask_shared_by_type = BIT(IIO_EV_INFO_ENABLE) |
+		.mask_shared_by_type =
+			BIT(IIO_EV_INFO_ENABLE) |
+			BIT(IIO_EV_INFO_VALUE) |
 			BIT(IIO_EV_INFO_RESET_TIMEOUT) |
 			BIT(IIO_EV_INFO_TAP2_MIN_DELAY),
 	},
-- 
2.47.3

