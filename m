Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0463A79AA
	for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 16:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763483309; cv=none; b=LNd1Eidtn7n7xEQcGqq+Aq59VsXcLIRVUNOI6Bh+HvRx2QLq7mJV31ND7XLnuPtsRQpqLQ31trF3C4BgQX/eaDgQm7enbQF4NwrPiAq0qY3iRUDTo8KRcuTiRbY4Bs1NGNPtiLdtYhLfApZPfoCYJNJ6g380a+8DY7b/wrEalzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763483309; c=relaxed/simple;
	bh=NNFr/LjPuIJwgQLBqv1tSqAvrhacpNfmsSLLmV7jXvU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ddJF5pVMP8XU2f3Bv3cyneJEfdaSEG84LdzHv7a91peoE0WKqDSmccJ6OzabDzZnmzScuUDkBc/J5r9M4ktwzzhqb1r9tUYa949c1r159+f4zAyKmvaRnO3yTTJwB4KVPlZ6fy2naIv/LuRLPer5UzaHuG3+JRlqnFB4XXZJxco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xFafDVQ1; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xFafDVQ1"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-477a219db05so17598725e9.2
        for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 08:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763483305; x=1764088105; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eb0nZRqG3wPO7nucW1Po+d3Kj8IK/8D9zMABw4V5b10=;
        b=xFafDVQ1WWP4RnnFOpVxfZ0xTh3y6fO4nE/G0lPULSMngkFH4JExauXJ+qnd89TgGo
         FN1PzBcJoD3Uux8YxFCz+LnHZascbjJQNeeIDEbhiF/83Mgiky+3Ef3//DbRr6GSsCKs
         MVUKdBp+6zAyHtRubnqPIuULayr/kW2LOAF6OgWBrsID4aNjB3tCuyuYEIbUD91hDG8k
         kUBkFjqtnHIWAXyKR/0CeeNvHzr/urZyrHbk6vSXnjPDocSxcUmAISJR2H3OTuwdqDx0
         wozQg24wYHOXam+O76EukDSkYW9AnELQBNsKL0O9Gfgnbr8lWCp2eDTjv9Jok6oJnE3p
         Hu8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763483305; x=1764088105;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eb0nZRqG3wPO7nucW1Po+d3Kj8IK/8D9zMABw4V5b10=;
        b=SAkWeT7oa2tx+mKBzt/z9cPej5Lv7p+IFoRJiGPhl+SdJfD5YP2lqxfQvkFuJODvRP
         zpApRXazHwEBt1nj9+DGyLJIbpX7CRnqHFZuhiWyJB9zMtDmuExyLLNbDt/vaF8yEw+V
         TJUkYQa1kpR8fZ0beUEWSwBzGhFxgr1/IyTz0VODPoWIgNDF86ogvjO6tVUeMTojz3pc
         XBkqIBeCALpyfCCxEECBwXJNNjwYhLjstznHMokLG3EHGuiaGx2y7mi0kvV39x6epRl7
         DK49eZCDU9K075I60ozX3h06JIUAnX10jkT4Sw8brHe69DGW6MyPgFjSbngq5kD4Mdue
         9iiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeXgybRdPVYIEp5m3QBVokjPcVBoqUkuyG3soti8mk0reMrUjnc9HJmp9uHy4VRBu2CSk1xa/LTWE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIsnP6VfDqJdKIs4I7DSgHCZzrFcpzw7BLnYt6SWOYzxkV3e+M
	lPmlj96CTGpF90uvg/n7BuEtQwFxOclcB8eno4J8T41G1mvPRVmuECb3Ay5pLt7ioTs=
X-Gm-Gg: ASbGncu+/Y5gZeZRtMwTW/q/dAP2S+yaNAHh1Zps4agiQ6hGQqw0n1ZofQLOZvoujzv
	0uK5nZkr1Xf897KIzAEcltwo7aIG9Pqr0W0Vt/x4tIo2j/mDZuKkLv2qUuS3KaZeShxgOnnpkrg
	MZGGtzWot+o7TRJHfBsgcWbN5CX6c+xINqd4zL9uvBdP+Ox7SP5T6Y1Jukc3jLcv3Jes1QT1L9l
	hPcihksZHwB8XBeflTVG87zp5EiyjhmBBDP0hhyel+Na4ZjZpDZvE+2Gs7Ogu+JmKpN0bIO1ezp
	/LBszWlD8Bdo7T4jLip7onlP1srRSoMzFxFX4O13H8EfK7JBMRaK8KXsEf+lzGkvdzHlthG+YF5
	FhE6bMCIfsyt2CTo4IkZzdckW4qlDCjhZiPAdhUvpKpRkMaQVPJdXgeFjwuxb6RWxgVnufJ687A
	Vq2EJxAKwUbci0hO6ItypJEOSsI+3WH0obBSHV7pBLgA==
X-Google-Smtp-Source: AGHT+IEgxjocht+zd5sgZk9UgQUOz1bPvElgaDdpvXL42GO6HQTKk5jhNzNQ67G2WTvucSd0gdRSKg==
X-Received: by 2002:a05:600c:8b5b:b0:477:7768:8da4 with SMTP id 5b1f17b1804b1-4778fe59f99mr148261815e9.7.1763483305277;
        Tue, 18 Nov 2025 08:28:25 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9dea7fcsm20369125e9.8.2025.11.18.08.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 08:28:24 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Tue, 18 Nov 2025 16:28:01 +0000
Subject: [PATCH v5 11/13] coresight: Extend width of timestamp format
 attribute
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-james-cs-syncfreq-v5-11-82efd7b1a751@linaro.org>
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

