Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1ECC2F39CA
	for <linux-doc@vger.kernel.org>; Thu, 14 Aug 2025 10:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755168685; cv=none; b=o01ixd9BiIInZflWgz/95VYlRoM4qR3DZ0K6rUmGoS0n72Oqt6ybDVJhX7UODt59UUQOz6yS91qxA29nFAJ0UK0TQ2B1FEa+ffl+ZqqgljIYNeLs2FJADSwKA4qQDTIkE2dhnV5aPZj4VDtTtRc0kTCivY0x7LXMd+f7pzjVqJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755168685; c=relaxed/simple;
	bh=Ghk9v8X6ZI95UzDotAn+mX7JIMr1ajnOOt+YAT0AZyc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X61c86m9g/a+og/DA0YDA4N++d+JWCmgnTPvoDv6pmxtPAdWpFzQE0lPEjW0kWiCHzHZcougtM9F8Ef6EcOLcJHb2NKSe0+2n4chPy5i05bXLQbpCZSggPELc6sPmkZtLBtFYjcEIHxSBYv6SGRUehoAanb3i2CLAj3JMGH/9Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OmtX9LTj; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OmtX9LTj"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45a1ac7c066so5075715e9.1
        for <linux-doc@vger.kernel.org>; Thu, 14 Aug 2025 03:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755168682; x=1755773482; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KdeJ4JSRd2ijrq8xQhXxaRgP6MLKlDNmproFaVga4Ac=;
        b=OmtX9LTjaAzR9ffv9I0XS1DaypOTDqAeBJNizUCg/DwkKSlxy9MAEfc4dfTPbZedxN
         qela5LeGTD9jubgN1tWmqQAd4XmFvHO6T1KKXZdjXy5IDi7Kh2cypGFitnVxhwyURn/Y
         3BkDHk8M5CRexplgBklaeeiElb45lIoB0Ddftdgh6I0FvXWcqHBQLZO1+pYFFlr6S2Nd
         4JhaMcmEuYBUEsYDqKCNt1D3iz5sTzUVwHEu/hlyzbXX3p7SdAVRmmUZa5VN7KH/OY/b
         KacQlQ1UPf+eBoyLDwUPanxe839rYxn4Y4dEOV7ATX3V+JtqR88wWCHbD2GtVXAh6lIS
         5/+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755168682; x=1755773482;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KdeJ4JSRd2ijrq8xQhXxaRgP6MLKlDNmproFaVga4Ac=;
        b=Wi2wgkL8sZZ/uXYmqWx6OttNZrfWjDP+2RnlwBQATNUVVD4B7MBW6wiFlCesDw8Dyw
         pp1rdA4AonqwRuZbns1YxVSPSTvaJM2SkjeH/Gzuv4BxGCx33ZgUUeYTtqzmhv4dq3a3
         jEWR9XbYoIDu/liFXULU9RWLiJ4oSWZwZ0+Ev2D7uXEa7cmi+8fl0mtmml9RwAkXxwai
         FmxGJRmC+J3nDsX9dsEp/S70shvJQyXL72nwP9zKTWRfRIIJGWJU0aDzlVpqSbNF6OXn
         mnR9FeoA7g50/kzk/nrKFU/R4EpCLAe88Rh3lAyB3cDuweFAD43vU+qbAs6/0Te4usul
         g5Wg==
X-Forwarded-Encrypted: i=1; AJvYcCUdTVz1HUmV0UhPMMb7oUUPtX+W5Nl0ltKL7yDi/ZARLlpTW5bm4bAZ4S6hOM9JendOE+N/0MiaRsw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjjaRqAUHnSq87qz13OQTO6faWxsGZyBSrNyQJrGOTUqYdvIae
	FlWHWmz6Is99TdW7BTEx5YGboWckhBUBwPbIYGggDkmwLUEnx7yCzGPMgSJNp62r6cM=
X-Gm-Gg: ASbGnctSvNwvOSWs6hiFbIkCyEvR6b0kDp51JuvPX16BlYLHH/aBOuzKNbXlhSgnmGL
	qDZlmWmh1qJZnI0eqcohREC3Nj448UaMJwAPqe/6G+SBYpPwithutai2X3CbfJumsfakiFufmz0
	IAiK+2bTAJBJEc+xRkj/pqxA6O3vV2G15Z6ImlSebayUUSIAyWnKAfdnmUwALvgx6BF/10dFxa7
	G3QJ4XVLQuzZ4NYfIViz5FKKAY6BYxcTF7pqyGa1ykCRD3Mq5UfwdRGOzoGCRKrn0H8RMgCL1f7
	6ttny9oGupQ9LZloMKHmh3UwPg+89iEemhgNTpw7c0Z4yTp9bHMULe+AehasrteSxrGrKagWElN
	SDtxhLoMUIFH3xeS6zsjiNtD9m23+JlM=
X-Google-Smtp-Source: AGHT+IGiw9zB/I+LYQU9OZmJehztvJAaw6EEWckqoahlG6F9UH7uBsO+Dc2b7nrazKkmaZlJ83qC6Q==
X-Received: by 2002:a05:600c:8b05:b0:459:eeee:2759 with SMTP id 5b1f17b1804b1-45a1b6c7e20mr20628185e9.14.1755168681929;
        Thu, 14 Aug 2025 03:51:21 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1b226eecsm14228345e9.1.2025.08.14.03.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 03:51:21 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 14 Aug 2025 11:49:53 +0100
Subject: [PATCH v2 2/6] coresight: Fix holes in struct etmv4_config
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250814-james-cs-syncfreq-v2-2-c76fcb87696d@linaro.org>
References: <20250814-james-cs-syncfreq-v2-0-c76fcb87696d@linaro.org>
In-Reply-To: <20250814-james-cs-syncfreq-v2-0-c76fcb87696d@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

Lots of u8s are mixed with u64s and u32s so repack it to save a bit
of space because there's one of these for each ETM.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm4x.h | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
index 746627476bd3..a355a1e9606d 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.h
+++ b/drivers/hwtracing/coresight/coresight-etm4x.h
@@ -832,28 +832,33 @@ struct etmv4_config {
 	u32				vipcssctlr;
 	u8				seq_idx;
 	u8				syncfreq;
+	u8				cntr_idx;
+	u8				res_idx;
+	u8				ss_idx;
+	u8				addr_idx;
+	u8				addr_type[ETM_MAX_SINGLE_ADDR_CMP];
+	u8				ctxid_idx;
+	u8				vmid_idx;
 	u32				seq_ctrl[ETM_MAX_SEQ_STATES];
 	u32				seq_rst;
 	u32				seq_state;
-	u8				cntr_idx;
+
 	u32				cntrldvr[ETMv4_MAX_CNTR];
 	u32				cntr_ctrl[ETMv4_MAX_CNTR];
 	u32				cntr_val[ETMv4_MAX_CNTR];
-	u8				res_idx;
+
 	u32				res_ctrl[ETM_MAX_RES_SEL];
-	u8				ss_idx;
+
 	u32				ss_ctrl[ETM_MAX_SS_CMP];
 	u32				ss_status[ETM_MAX_SS_CMP];
 	u32				ss_pe_cmp[ETM_MAX_SS_CMP];
-	u8				addr_idx;
+
 	u64				addr_val[ETM_MAX_SINGLE_ADDR_CMP];
 	u64				addr_acc[ETM_MAX_SINGLE_ADDR_CMP];
-	u8				addr_type[ETM_MAX_SINGLE_ADDR_CMP];
-	u8				ctxid_idx;
+
 	u64				ctxid_pid[ETMv4_MAX_CTXID_CMP];
 	u32				ctxid_mask0;
 	u32				ctxid_mask1;
-	u8				vmid_idx;
 	u64				vmid_val[ETM_MAX_VMID_CMP];
 	u32				vmid_mask0;
 	u32				vmid_mask1;

-- 
2.34.1

