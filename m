Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FECB371DEB
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 16:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763569114; cv=none; b=Rd81DsUn9JGSF/P/vay82LzrdNob5M5TdQvL04y+jzbR48OHfMz53cIKItZFAbjHORKwmh+PS2NEzkS+YuT1AikLD/Azce2waCmneGPhPttrDz3e+Hflcljpstt5GP6hpcioUqcqrlBrvb9CQpB1GXvGfiz60b2oAt8EIhpMsJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763569114; c=relaxed/simple;
	bh=NNFr/LjPuIJwgQLBqv1tSqAvrhacpNfmsSLLmV7jXvU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=srbbhWbqPYAH6IufVw/J6oRwK46p6ObpvwjmN5a6qnuhIvRNQ8vAuIchG7WQ+un0aG3CJuEBKSBmSPahqcFcIL4jrLs66mDy6cTK8y7hgIC2+qGVMmWJJI1SJKh0kP8BuvafEn0CWJMLtWSWCZItRQx/p3++mS8iG1pl+vCBwmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FdacGPBV; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FdacGPBV"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-477632b0621so45825575e9.2
        for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 08:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763569109; x=1764173909; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eb0nZRqG3wPO7nucW1Po+d3Kj8IK/8D9zMABw4V5b10=;
        b=FdacGPBV0Sjd2pVBV6elQNaWvKqQudp2N1rNrQmdcDkChToscqAzSni+cjkdvMSEta
         m2Wo6HB/pSsCrBNhx+t141itUmwsYplyAPa/KJ0xyD2F/NsugVg0Ls/jloDJBHtoBeD7
         OyF7K59+pRhzhGpNPXdO04QiKVyvWd5th9YEollpWINP9VAP75KuPWEPrD0xIiaYaMKX
         1K0FJXsX8CEWnwdidGHt765ldNwD2fmwWQWwa2mEIhWGDM0u88yNRHt/A7zBcSK2Oinq
         Cwjzdr3ovkBVpnz0zxVKSL4EiAiyM6VNEZIXwVeZBT0yHbGawDv1P1f2J4GEHz4v/cPq
         WMRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763569109; x=1764173909;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eb0nZRqG3wPO7nucW1Po+d3Kj8IK/8D9zMABw4V5b10=;
        b=L9WV3vCswfqiAfZ56ns/qIuj3+ITaL2tCzhoMGW1Ukl5Fc3V4INrOAopGeKqdnTJSC
         MNOGFWcTdtMA5GfQOnfF11H/PhgwLyrkIU1yl3U563geNhj4Ay/yMiekmfyY4i8nDLGF
         yvAkqcWRHR+q2URUYuiTTSgq10b80JV1gEItn+bSPCTE+U3GuCDHlemuw7voiuNtPnRa
         TBdXA4I3KB3BHDJCq4OShfpl8wMYlGiRLKX3BMBxoOmlaN74vV0sVkIQkITSZwbQY/1j
         HSP/dNzGKf0afm8Vq+01tk8zkq8cNyEplSq4OQKmaWM3wBXLY5QIzpYSMfSOvlOnIdj/
         4+Fw==
X-Forwarded-Encrypted: i=1; AJvYcCUnvO9j+dLK7ptwnuhA9qcWmBNX1qCv3t9HnTSpnITqL+4FqSrCq8OjgkczsmEyVlsH3l2iN12KLxw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNjJRoWw+2HOH/+W9JngjnQ65MbMXI+n3PliKlzep+2gHSBEOI
	6a2JnbSdkRjXNUVQ+kld+qSp2VqBlfZ/Ckb9NrKcg/ZvI9DK1kYz2xiSrCkNxtXUPKQ=
X-Gm-Gg: ASbGncsLedTj2fmiLSXdNtSmt62ng4wNJRfvHNngMs5qnoPLMHc/iZNaqaYbhh/iPdO
	kl1I7Y7I4bTtYtl9TuBT1g0t84v8zdWgGSmw1vLcG/UQab9jNRiebPrwPQUOufAnT8pFjQwZDmo
	JoCMSrJgVqrenTFe5Y8zlErdec9fyVUdVGwb3J/JcBZ5zfGZU0Oz0SxhxDX6wvUrhwzGF8ikk6c
	gOYAyckbhptbUnjTPmZD50LuOctIWZaiccsT0ZVZc/zfZ6AZYZn/f9YnKkqfwMMSMbGisz3/CQC
	973CZrQkea1oeVzHSdtmE5Chk93w0iR4AdgousVCt2Pnl5Z00nb1YwYHHto95ttU99XPQ73jHdK
	WFCFDoorvz+pQkZV29mQ5Cjv9EtihLvZzuEbJkVY37lLBiqf/Xc/uLov5Bfpu9303vQQ3oLAsSt
	LWCEfv8xdUnWaNBpIZ//alPbdjVKE8S8M=
X-Google-Smtp-Source: AGHT+IGDAoHjrNiuL0wt3S1CON20jtX8GRGXrTHnizlFbQ1DR9gz3tuquij5PgE+xexhigojLp1k8A==
X-Received: by 2002:a05:600c:c4a2:b0:477:c37:2ea7 with SMTP id 5b1f17b1804b1-4778fe9ac28mr192009635e9.21.1763569109415;
        Wed, 19 Nov 2025 08:18:29 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b10142d3sm63205425e9.5.2025.11.19.08.18.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 08:18:29 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 19 Nov 2025 16:18:07 +0000
Subject: [PATCH v6 11/13] coresight: Extend width of timestamp format
 attribute
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-james-cs-syncfreq-v6-11-740d24a29e51@linaro.org>
References: <20251119-james-cs-syncfreq-v6-0-740d24a29e51@linaro.org>
In-Reply-To: <20251119-james-cs-syncfreq-v6-0-740d24a29e51@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

'timestamp' is currently 1 bit wide for on/off. To enable setting
different intervals in a later commit, extend it to 4 bits wide. Keep
the old bit position for backward compatibility but don't publish in the
format/ folder. It will be removed from the documentation and can be
removed completely after enough time has passed.

ETM3x doesn't support different intervals, so validate that the value is
either 0 or 1.

Tools that read the bit positions from the format/ folder will continue
to work as before, setting either 0 or 1 for off/on. Tools that
incorrectly didn't do this and set the ETM_OPT_TS bit directly will also
continue to work because that old bit is still checked.

This avoids adding a second timestamp attribute for setting the
interval. This would be awkward to use because tools would have to be
updated to ensure that the timestamps are always enabled when an
interval is set, and the driver would have to validate that both options
are provided together. All this does is implement the semantics of a
single enum but spread over multiple fields.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm-perf.h   | 13 ++++++++++---
 drivers/hwtracing/coresight/coresight-etm3x-core.c |  9 ++++++++-
 drivers/hwtracing/coresight/coresight-etm4x-core.c |  4 +++-
 3 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.h b/drivers/hwtracing/coresight/coresight-etm-perf.h
index c794087a0e99..24d929428633 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.h
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.h
@@ -23,6 +23,9 @@ struct cscfg_config_desc;
 #define ATTR_CFG_FLD_preset_CFG			config
 #define ATTR_CFG_FLD_preset_LO			0
 #define ATTR_CFG_FLD_preset_HI			3
+#define ATTR_CFG_FLD_timestamp_CFG		config
+#define ATTR_CFG_FLD_timestamp_LO		4
+#define ATTR_CFG_FLD_timestamp_HI		7
 #define ATTR_CFG_FLD_branch_broadcast_CFG	config
 #define ATTR_CFG_FLD_branch_broadcast_LO	8
 #define ATTR_CFG_FLD_branch_broadcast_HI	8
@@ -35,9 +38,13 @@ struct cscfg_config_desc;
 #define ATTR_CFG_FLD_contextid2_CFG		config
 #define ATTR_CFG_FLD_contextid2_LO		15
 #define ATTR_CFG_FLD_contextid2_HI		15
-#define ATTR_CFG_FLD_timestamp_CFG		config
-#define ATTR_CFG_FLD_timestamp_LO		28
-#define ATTR_CFG_FLD_timestamp_HI		28
+/*
+ * Old position of 'timestamp' and not published in sysfs. Remove at a later
+ * date if necessary.
+ */
+#define ATTR_CFG_FLD_deprecated_timestamp_CFG	config
+#define ATTR_CFG_FLD_deprecated_timestamp_LO	28
+#define ATTR_CFG_FLD_deprecated_timestamp_HI	28
 #define ATTR_CFG_FLD_retstack_CFG		config
 #define ATTR_CFG_FLD_retstack_LO		29
 #define ATTR_CFG_FLD_retstack_HI		29
diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
index 584d653eda81..d4c04e563bf6 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
@@ -338,9 +338,16 @@ static int etm_parse_event_config(struct etm_drvdata *drvdata,
 	if (ATTR_CFG_GET_FLD(attr, cycacc))
 		config->ctrl |= ETMCR_CYC_ACC;
 
-	if (ATTR_CFG_GET_FLD(attr, timestamp))
+	if (ATTR_CFG_GET_FLD(attr, deprecated_timestamp) ||
+	    ATTR_CFG_GET_FLD(attr, timestamp))
 		config->ctrl |= ETMCR_TIMESTAMP_EN;
 
+	if (ATTR_CFG_GET_FLD(attr, timestamp) > 1) {
+		dev_dbg(&drvdata->csdev->dev,
+			"timestamp format attribute should be 0 (off) or 1 (on)\n");
+		return -EINVAL;
+	}
+
 	/*
 	 * Possible to have cores with PTM (supports ret stack) and ETM (never
 	 * has ret stack) on the same SoC. So only enable when it can be honored
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index c7208ffc9432..cfd6d2b7bc50 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -28,6 +28,7 @@
 #include <linux/amba/bus.h>
 #include <linux/seq_file.h>
 #include <linux/uaccess.h>
+#include <linux/perf/arm_pmu.h>
 #include <linux/perf_event.h>
 #include <linux/perf/arm_pmu.h>
 #include <linux/platform_device.h>
@@ -791,7 +792,8 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
 			cc_threshold = drvdata->ccitmin;
 		config->ccctlr = cc_threshold;
 	}
-	if (ATTR_CFG_GET_FLD(attr, timestamp)) {
+	if (ATTR_CFG_GET_FLD(attr, deprecated_timestamp) ||
+	    ATTR_CFG_GET_FLD(attr, timestamp)) {
 		/*
 		 * Configure timestamps to be emitted at regular intervals in
 		 * order to correlate instructions executed on different CPUs

-- 
2.34.1

