Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9306A3081A8
	for <linux-doc@vger.kernel.org>; Thu,  2 Oct 2025 10:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759399800; cv=none; b=HueMktmQ2Zi6/njXjJdygxwWZBkRC8TVFTjeCzTvT6L7dhUBRY191vVEaV7bTG2ti8ExLz/pzSWnWJnfCI+BnAq/z64MZVCi/CJLTi5n3T5xktyKlNAyzk8b+3XhWYdocq9lk8Bk/nUoXDaZmJQNH92npsDouNeSVbKGAkse2vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759399800; c=relaxed/simple;
	bh=sRI+ID+m2Lx9QDVOIbsgrLRcAb5ulEd5vxdqy4VfGDA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hdI0hzvvGJ9IJOmDEHmMj+c6IMgEhfKjJ3trEYJOVlBcbzHH3DX5JmJGWhU/6+v2ENxSPHb3IEiZFvawvUu50xu3E+6kWhVnIYkfQCqVmBENzldGWVnqSIachyuGx8wfMyFY2vFzmjwqE1XPndbke0uUalG+I/Y/ozLK25qIka0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wX+f9wjT; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wX+f9wjT"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42420c7de22so496321f8f.1
        for <linux-doc@vger.kernel.org>; Thu, 02 Oct 2025 03:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759399796; x=1760004596; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fNCXlVNyxqLTWGPAd727pHruXWdWdx1GVnhxX/js/0A=;
        b=wX+f9wjTw2XKqGfYjMw4q3ITYy+1PcL9MxZouUAtPWj57tk44LeNFnawYzI6OdX1eA
         jBCkgWZFoPI/CmhMelDOd06nrOVVRNIR0UNf3x6h0ZoXAnHpMNSZjJEfL1fYdDlOCXej
         MqtUYB/eAOfRxYJHpo9RmyrMpOPaVeWCLy6Tr9IPDlSpVKM8m9k24jDe5wSPB4hE8d8b
         Y2yLTYX0qDK8Jo7G0o0giouBGbSdk25ipGPpdDf5WOg1itU/gQ6DbIP4vShbv59BoE3L
         mIu/4/RqzlA+2DmeXyh26ItuwaMlLyZDFbyySycdT7gbgBvLmJXBWy1kei1jOKy1UQPg
         TdHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759399796; x=1760004596;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fNCXlVNyxqLTWGPAd727pHruXWdWdx1GVnhxX/js/0A=;
        b=hF8iCJ68yp2Y5bKq7qF7jV5jZE9nFrTLlsrI1XofeCdUjMRxsmNJd81PuLQiOnAFu9
         X9ag8D5G8T5ibLP1TT9rAmunAYVAuvD3Zog8bwo3EsdGs1qtze0EzkY9QHO7WzkO9fVs
         L3OQw4z1jZ0+/M6kheKJBmvHrxp8AhcQMSSfVb4wHFKAD/5+2G0FPGDh/BNR1xibz0w4
         CZs3mbUx1/1KRmgjcBATQ2d0mJD+4WVExCQv0Y7kgmSjS/ETqDKO0blsntiH+DLBRtBs
         f96yursbXCuycwnwaUJxeTOO5YCZ282JkYRPVKLFza8rvswsq1V0CtNfVtN6WxxOOrLR
         OjHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWkmyI5L4ZgjYzekqCeBOXs7yRml94PZcrwq8bawWzwAvg7SMGAAe+G+uOHk9VycX+uMX6E7ASmrA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzhihdJWOUVrQEZnW3EmYJEKYHL31ZjtUDBZSLRcem3kGLzfTX
	fK4mrEvBdg6RkMrACo6C7RX4318IOL4xLmy6rE+nVE5I8p1pmo5ECZIFSPBig6HeRdI=
X-Gm-Gg: ASbGncv2D7/LLXrG6CWC8RqVcCCDN7+lv/FnFXgrt42eKXIcP3JdIECSlpVXDuwLSMq
	N2GHkjY2Yqnoah24JCyep3ZZmlfHst0Keac1u4JC4N6ZPO4fijt0KI4FdH1oPhokptWKMAkQA0r
	7ca4cDDWdP43l+NkKifup7l2uKU5hITbJx+iCplF+Vt7YBPJg1VA78Q5CSfz0cwhDTiIPMaLjB6
	q7cTlMaOlBiql+brqCPhOcUrnvyzr+p7DNDC+cFC5CPaq7KPjP7pYoLVHsHjMQ3gNzMQESYS4y0
	SEWh/96+xoa8l2RrlWHCaceF3721LYAPuzKw+QYTIYAbdUSBKsh1l8USz50YPET3umOHQwEI99V
	HATugVqAJvfl+NleQT5GHVxEKMZ5AJwW/uOCEUdOADdgFuHK9ztG/nbmuxa4b
X-Google-Smtp-Source: AGHT+IH3VmgaujpFJUxnfsTdoqXNgTblqfU76kgYqYrSDq7oNx0Tfc38ceRWlaEZ0lvNiD8i/BA2zQ==
X-Received: by 2002:a5d:5d13:0:b0:3f3:c137:680e with SMTP id ffacd0b85a97d-42557a15a5bmr4399609f8f.43.1759399795840;
        Thu, 02 Oct 2025 03:09:55 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8ab960sm3017289f8f.13.2025.10.02.03.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 03:09:55 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 02 Oct 2025 11:09:29 +0100
Subject: [PATCH v3 1/5] coresight: Change syncfreq to be a u8
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251002-james-cs-syncfreq-v3-1-fe5df2bf91d1@linaro.org>
References: <20251002-james-cs-syncfreq-v3-0-fe5df2bf91d1@linaro.org>
In-Reply-To: <20251002-james-cs-syncfreq-v3-0-fe5df2bf91d1@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

TRCSYNCPR.PERIOD is the only functional part of TRCSYNCPR and it only
has 5 valid bits so it can be stored in a u8.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm4x.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
index 13ec9ecef46f..eda3a6d2e8e2 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.h
+++ b/drivers/hwtracing/coresight/coresight-etm4x.h
@@ -825,7 +825,6 @@ struct etmv4_config {
 	u32				eventctrl1;
 	u32				stall_ctrl;
 	u32				ts_ctrl;
-	u32				syncfreq;
 	u32				ccctlr;
 	u32				bb_ctrl;
 	u32				vinst_ctrl;
@@ -833,6 +832,7 @@ struct etmv4_config {
 	u32				vissctlr;
 	u32				vipcssctlr;
 	u8				seq_idx;
+	u8				syncfreq;
 	u32				seq_ctrl[ETM_MAX_SEQ_STATES];
 	u32				seq_rst;
 	u32				seq_state;

-- 
2.34.1

