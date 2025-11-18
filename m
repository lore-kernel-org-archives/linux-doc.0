Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C9835E526
	for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 16:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763483311; cv=none; b=p4vxagHljqDRxeLx7c3Op49FuJ8XNIgnXcG3Abv7MoCxTSCKH4ckPfiVAKKEGtngKZRAQ7C3rcHT7v+g2v5/VT8hvx4Ml2U7G8zOVz91y+fMjQbbHCvBtYkSZGN2WSXd3WDPT9zjUVq+s525+n7uPrGdFbMKqukGnNb4CciZ7sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763483311; c=relaxed/simple;
	bh=2gYGham6RcUhZnNfLTEyX5K2IIqX9Oa8+TtMYKSDzf0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YJ8XNvTaKczFwVnLBe8WpXeTnxw/FMWWmy9ytB8jxgg7hdfv4hSxt78oB0H/SwYAS4myoSzn60dxPj6FcV9y6B7avBExd8VV1CvPuw3gur3MHAPrvcYBDKPdz2L4LAQKCgALUUKNm8x+F/Zcjlhg0DK4/6fZYH+4lZdy55vLwtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i2ein0+h; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i2ein0+h"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4779a637712so23194725e9.1
        for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 08:28:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763483307; x=1764088107; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9NYmdp5K7GoriQTdww1h5siZo6lfJrXIe/VnMyhW40E=;
        b=i2ein0+hZTZXaud6ghJKswJyyXXLG8tDT7pYqcb8Ypu5pVElLd2dQlyYPSbRMfTedY
         oD075VEoOixQTExva13woMElboCRkZdPmhEjFAKe792L9gbFlG+1TkROJLQmwOlkXWSP
         RIzmGdNe11Ygp6pZOWAiuQHB7pZTitARt5I34iNwiBDEsVc1RbxS8MVHKuM9xelIrw9O
         8Iz3a20CqSaPDN8ziSC6FfElfPOTETVpLiC625W7sRoJnw3GA0uN98Hxb9HsfWQN1JGD
         5ZGM+J5N0zL1b1eu1VA5cXYpHrVWMeRjEiJo6ZEGkCMvgbODx55wyAMTOnRGJgizuKVU
         Ob0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763483307; x=1764088107;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9NYmdp5K7GoriQTdww1h5siZo6lfJrXIe/VnMyhW40E=;
        b=cg0rrEmQ/9wsHOuD59LjzjwhssZV1/8p9fbQyR5D54T1nim6HvLPepPbvTAWm/5Op0
         W0wFslOFEKIwMFOQWMHsSzRRjBW3W9biRXGrNCehtaSWQHWD8pi1ybO3b9nBTvEiCSRH
         F0yzedOi+q7kvgwlPvS/OQDhcds2YZem3MD55nzq6sIaaZ5ovNffffacPqDpyuSHBJ3+
         XLKNCGseQr6agZ7A1fJOmVnaVbzgvCOPq8x3yM+25tW5KmCSHxMomXRPkE2IvCW5H/7x
         Cpul9MbdGPHvUEi6DRv7r9wP2/vuO4n0C5yk0V17dDxpLHYrHZX4nsVpVhD6gVETtKOs
         2yjA==
X-Forwarded-Encrypted: i=1; AJvYcCXlsoBX9ubhAZawRf4f0UaaOjL+EI2zjp14v3pZdLY72il7I8vcMf6nu1Nw86hTAp08EwT9tfrzYMA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRleiJdHtQnkKu0peLsdxu8W231u5/lpEXMDVbXOkPJ/E3o2KM
	3ZXiSsZewKUdlmICsiHGy5k9bhOUvk3g6O2PbkfY78SmKhgQd39gUwawdHqhG8qTUzY=
X-Gm-Gg: ASbGncv0ejWXTMnZXZafed0mWnGYtH99+JL/3X0601TU21nHSGV8/h/wy102ksRYehX
	xL0zMnSJG5zazy/DTETpYtoju58bVUduGtDqOeyY101Gy7oPDoTTjJJbI3I2NoG5qCSrrfg83Jj
	9T0OlfnClqDXZVwpMY/MFNcWi5/3xZXpxGRY50YOkh830ubokynm4gg5WMn8oe2F+2wHP+hKmyk
	iNXPuHfPnq1y4QLsfDgtsMBaLKZ5Lh5ODI2CrwMLif/OEpQ4Y3s24SapAJGpRogkZyoxVKW1X9b
	SOvJupnuXI5op41eXUbVB/48FOB48gHqUfWVUCeyAH0yn2zdgIBAK4hJL8kTPYZYas26J7FaMUx
	GeK/cfGyBgrPqXOF2CVZlkhjeIA91+6ajpFOD1fCA7KINhB0OrxUchQkjJxQ8YErtbjl5JcAXh/
	Lmqytd/34Fao5inW12Eg9rpKKp3zAsjmc=
X-Google-Smtp-Source: AGHT+IHN5ZZ7TsSfy3KB6ZJXobAnrt1PfBhAPwW1cYqyewtyOySvk+eWd5Ld3sR20w2QmFj0p3m0Xw==
X-Received: by 2002:a05:600c:1c9b:b0:477:9fa0:74ed with SMTP id 5b1f17b1804b1-4779fa07915mr98104425e9.26.1763483307312;
        Tue, 18 Nov 2025 08:28:27 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9dea7fcsm20369125e9.8.2025.11.18.08.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 08:28:26 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Tue, 18 Nov 2025 16:28:03 +0000
Subject: [PATCH v5 13/13] coresight: docs: Document etm4x timestamp
 interval option
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-james-cs-syncfreq-v5-13-82efd7b1a751@linaro.org>
References: <20251118-james-cs-syncfreq-v5-0-82efd7b1a751@linaro.org>
In-Reply-To: <20251118-james-cs-syncfreq-v5-0-82efd7b1a751@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

Document how the new field is used, maximum value and the interaction
with SYNC timestamps.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 Documentation/trace/coresight/coresight.rst | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/Documentation/trace/coresight/coresight.rst b/Documentation/trace/coresight/coresight.rst
index 806699871b80..d461de4e067e 100644
--- a/Documentation/trace/coresight/coresight.rst
+++ b/Documentation/trace/coresight/coresight.rst
@@ -613,8 +613,20 @@ They are also listed in the folder /sys/bus/event_source/devices/cs_etm/format/
      - Session local version of the system wide setting: :ref:`ETM_MODE_RETURNSTACK
        <coresight-return-stack>`
    * - timestamp
-     - Session local version of the system wide setting: :ref:`ETMv4_MODE_TIMESTAMP
-       <coresight-timestamp>`
+     - Controls generation and interval of timestamps.
+
+       0 = off, 1 = minimum interval .. 15 = maximum interval.
+
+       Values 1 - 14 use a counter that decrements every cycle to generate a
+       timestamp on underflow. The reload value for the counter is 2 ^ (interval
+       - 1). If the value is 1 then the reload value is 1, if the value is 11
+       then the reload value is 1024 etc.
+
+       Setting the maximum interval (15) will disable the counter generated
+       timestamps, freeing the counter resource, leaving only ones emitted when
+       a SYNC packet is generated. The sync interval is controlled with
+       TRCSYNCPR.PERIOD which is every 4096 bytes of trace by default.
+
    * - cc_threshold
      - Cycle count threshold value. If nothing is provided here or the provided value is 0, then the
        default value i.e 0x100 will be used. If provided value is less than minimum cycles threshold

-- 
2.34.1

