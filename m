Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9675C2F99B9
	for <linux-doc@vger.kernel.org>; Thu, 14 Aug 2025 10:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755168686; cv=none; b=S3qQZWy5PdF5PA7Rb1C6uXmn2ohcjNIkTIHH95RqnVIkIDKIw79ONfHQkMA1E3eZ+wpNfRFIv0C0XWXn0UlTLIs2RQ4wVresd6yTTPfIgfPWytTYxdGBAJFviE+yzz+Vd5WzFu14JZCs/heFImCSIvqYuHvjARRr9bgalz9O+4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755168686; c=relaxed/simple;
	bh=m7ucCcGVN0FUBECCGdzVEI3m8S2GTPWLCEum9ShUMNA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G7NW5ixhHgndsI+12tsEmHpBihXVXpzoRMFXLX00xR9wniFzsiMqGq23+H6U4Pcp6/rr0MuSnShXby3ggqZmRIKSCz/pCLcqe+884+v/p6KaSyoxqG1svhwEyEkoLvv2KmPayWpmc7QT+aUyISVDT4D2ezbofcSqgF/5D0nY8uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RtiOu9ut; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RtiOu9ut"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3b9df0bffc3so424173f8f.1
        for <linux-doc@vger.kernel.org>; Thu, 14 Aug 2025 03:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755168683; x=1755773483; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3GDsN9LxSDEitQ0pzvRQqf9bGA4AutUNUEYwRrkhQ70=;
        b=RtiOu9utFfz+FjMdc7GSDmmMWdyK6WgSNNETXNohXIpAKfY8ob2E40xm+e0afCNeN/
         XnQY9Y7e1KMfQdWPQsF5v7c+Os0PDmjc58bCrpIQ076Jr1SfYAtglbvZO5fbqV9FVqV4
         lB2YKsXJ76qW/tZJJXfSy9gp8pRtDwMxhhLkONPlmsJ8mUB2HAq6DYUP1DDCEWnGRNvJ
         6i3wB6yF2x5Il0uhFRPKjktwgsAQe7R3yKe+yzHTi2PXn+TXNZ32UCGZalrvQqsWX59S
         sP7L62v6Rj6T+j/Rzr46pfHW2HNleQbl7blpPYzpzIdG4yhfaOJ/p2ozPoS9TsZVZda/
         bZCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755168683; x=1755773483;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3GDsN9LxSDEitQ0pzvRQqf9bGA4AutUNUEYwRrkhQ70=;
        b=qEXaAC0nGn2fLkllZSax+V2KLBrPqFEtmvd61QETCeKvcqz4NQfb7V7b4RVB9sC3jd
         1q6SDlrrNB0pXYt2mg4yiFCFY3IykX0++pPegcekZair9XHAPNX112fKAZODr3AFgrgp
         dWAFeZu3wlGN65BbeBpCXcFQc+h7m8T6APEtQjyNOLkYF0h5TbR1GBSgUrwZg1p5AlbQ
         DRo+UCIeOeOh/Z11xeX5zzJr72yJVtYOe4eHYVRfTZin9PpPGcU/sP5HSDf1SC+uJ1cs
         H/g2b/I1IrgdekjfVjC3aCTHb5FAvGGvoloTHjUYS5M0VSD8cGpuG+T2Jm3u2SDI5cE1
         KN8g==
X-Forwarded-Encrypted: i=1; AJvYcCX/KCFh0SKINp5Ok1XpOqzriRR6nq9nGghRQDyLqK7cZLD7F5vfWpePdmOLKvXMRG4d1Jcc62L4pmc=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb11F+8JEymDLCMZkoRSZ6mOOY9111W3cVD06aD0/z5A8o0rln
	BXA7U4danCxPhxQ/3miARSHCRrk1YXypyWL2DtZdOh0E5YP2zBD87YgNeJJ/VOPoqII=
X-Gm-Gg: ASbGncvIftLjvfJQ1byE3jqz9t2DpFyTONvJieJ2ZeKmuYzDQvXov3MEZ2Z/20iOHqA
	CQAAADuLtBQsyUDIkeCoMCOjqPoYXW6BRUT2J0LrFdApEgifKAtS676JWfalWgasWak+kCu9/Uw
	yxkSdE+spGDv0MTS19SYR/SGP9jUiaNKBLQ9DjZ4qyrNkTFlnOoFMoi9sLBFpdHvQY9aooFwPbv
	st/78UeNDcoTauW8bQPg152s/RIMCCEYSF2kdzySToMudEVhipBNOvxqycbVz64EOTiwUFMq6Wc
	wxjGgGoKR/7I/27AZoJXUJ1AIfK7wgBKVro/joul0nnXQmuDPlyKJuhTUdp8CshZCgsZQOHeQ01
	33QeQQ4U7/MaJKH+yOYQp4vqPN7t1ruo=
X-Google-Smtp-Source: AGHT+IF5P4dyVkR12cBMw+uYpwiYnNAlcSu0vH+8udQzxGRbHLddJ/1K+6aeezIw6lInsN/G1CLYWg==
X-Received: by 2002:a05:6000:1889:b0:3b9:7c1f:86b1 with SMTP id ffacd0b85a97d-3b9edf35019mr1847829f8f.37.1755168682900;
        Thu, 14 Aug 2025 03:51:22 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1b226eecsm14228345e9.1.2025.08.14.03.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 03:51:22 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 14 Aug 2025 11:49:54 +0100
Subject: [PATCH v2 3/6] coresight: Repack struct etmv4_drvdata
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250814-james-cs-syncfreq-v2-3-c76fcb87696d@linaro.org>
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

Fix holes and convert the long list of bools to single bits to save
some space because there's one of these for each ETM.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm4x.h | 39 ++++++++++++++-------------
 1 file changed, 20 insertions(+), 19 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
index a355a1e9606d..1c67b263b01b 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.h
+++ b/drivers/hwtracing/coresight/coresight-etm4x.h
@@ -1020,29 +1020,30 @@ struct etmv4_drvdata {
 	u8				ns_ex_level;
 	u8				q_support;
 	u8				os_lock_model;
-	bool				sticky_enable;
-	bool				boot_enable;
-	bool				os_unlock;
-	bool				instrp0;
-	bool				q_filt;
-	bool				trcbb;
-	bool				trccond;
-	bool				retstack;
-	bool				trccci;
-	bool				trc_error;
-	bool				syncpr;
-	bool				stallctl;
-	bool				sysstall;
-	bool				nooverflow;
-	bool				atbtrig;
-	bool				lpoverride;
+	bool				sticky_enable : 1;
+	bool				boot_enable : 1;
+	bool				os_unlock : 1;
+	bool				instrp0 : 1;
+	bool				q_filt : 1;
+	bool				trcbb : 1;
+	bool				trccond : 1;
+	bool				retstack : 1;
+	bool				trccci : 1;
+	bool				trc_error : 1;
+	bool				syncpr : 1;
+	bool				stallctl : 1;
+	bool				sysstall : 1;
+	bool				nooverflow : 1;
+	bool				atbtrig : 1;
+	bool				lpoverride : 1;
+	bool				state_needs_restore : 1;
+	bool				skip_power_up : 1;
+	bool				paused : 1;
 	u64				trfcr;
 	struct etmv4_config		config;
 	u64				save_trfcr;
 	struct etmv4_save_state		*save_state;
-	bool				state_needs_restore;
-	bool				skip_power_up;
-	bool				paused;
+
 	DECLARE_BITMAP(arch_features, ETM4_IMPDEF_FEATURE_MAX);
 };
 

-- 
2.34.1

