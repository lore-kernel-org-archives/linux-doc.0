Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5661325720
	for <linux-doc@vger.kernel.org>; Fri, 28 Nov 2025 11:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764330954; cv=none; b=F8xjCHUcqHGdLsaI1U8+QXptr3aVxnr7Y5m5W0XrlXb7oh8p2+1lUAV++2fJPjnw8FT6RHQLJDPXMFtgF0IbxKL/9Q99RFE75kAfeZfCZiAwT5IuzGJKreJsDY9s7xv3YA7e5Td13br90LsdFnuiFeuPELx7gGzw7AJhJuX2Lgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764330954; c=relaxed/simple;
	bh=VQKQPg2TEn2SsraZDnH+S4hBkvo3tilehtr7fRWsa8s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f0JEYJWG3a66bs33EJiE40Q8i8xID9anSsXf9EcO4B7XzsCv8FtOiG9021O4/XG5PFws4jnwqEMhaBdR1wMraeL5pzU4jqZJNXobTM4JFc10dHDixF+RImiUXpGpr6X0uyZZ4ak+ShNFMMEX7pEfnpfcQqjQFM8BRazdEyStsA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S+6RpSuA; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S+6RpSuA"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47775fb6cb4so11951725e9.0
        for <linux-doc@vger.kernel.org>; Fri, 28 Nov 2025 03:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764330951; x=1764935751; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9wCJgo3IXF+czdlE1yAyP50F+5uZ4Il24rpMbUbAKIo=;
        b=S+6RpSuAChzoNd1GwwRhsjTPBaZ/7DbRp6VkvzqjGjgbLRl+j0NTQzjQi3TFNU1Bsb
         F3AECjuj+JTV+Fbz0GP7sqESDsPSpzGRQzKPtBhnJJ+GhDjJxQWD2mh5xeEAHzNT12tR
         tZUbielOqinlLqmaENqD87YwlnI/gZZYMkV95Ma/XdSVJHZt/rdGwqp9GwfXRsI5cYAd
         2kE7ntbnyszMAZ13SjXtxRSV830RUt4p9gKU3tZxRddSuQvEmgriFrSvSZ5ibdXWBmZi
         Kugbk2+bdz3XVESKSdQq1LH2bTD7s4zJ/GXTDtTMjmGVnbdruM+HNf6Edi+3PztAzNeN
         Lh/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764330951; x=1764935751;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9wCJgo3IXF+czdlE1yAyP50F+5uZ4Il24rpMbUbAKIo=;
        b=UBwSfuDscMFUOIIN6cWXTN4Q/PPeRcucpQn+RwzpNvTVfhPiOldgesC8aX83ftzbry
         8BY39+OdKArW2ALHmI2jnVXt/m6KpE2kF+D9BtFxp5Mi1P80DCwpG1kHbsLXNPvHeLky
         1ETpnCsKoXErLLNLYdv33PIollx+3596vmA9vZZp/4L9IVEMbDRlQ80AO35EzVEESxLs
         Ig+6/Mm+Ed7gBRa2+syNHLJByynpsytPQSMXcdJl7YSyy/4rpp2n9lYWWIpK126TBDDn
         3oYWYF+Urd4EjtB+rL3oWNGm0FuhUQtDsxkL5q5eOtQDF6UotoNQfDPiF0aaDhtfb8kL
         1fJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPshRhRc6Kl6PYwL6Rxhzkk3SDIkfMNAHBTKNz+ZgjUBFA6bgLoh1GRvCSnDfuRnHEguLwGDL5siE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6E6dF7VtFzZPJZcWO9aUKUkKZ1yYAQ6dTKkKl7QQnk+ak+y+v
	rnquta4xE7sD9TVAjFdmwNopxFFotWuilBGrBgkwmsvqKI6fALy7KnMtBKslPgJUlik=
X-Gm-Gg: ASbGncsYhJg3ICN9eWqfFLCzuxG2+wmbjvNjXyapo4xwmM6/oI9cKf8AeUaIuyI14nS
	s1KFOOS2AM99AQOD2fzCtPX5RCTPyYuyOF37o/Yf7rkV2Oqkdl4UoCxbocGYHw2ietA6+S9h+/M
	IFt7TZDhJnwg2Skbfaads6bjafbTc7xE5B1TeEI/nDz1fLaemjSm8warDXY5LOdzyABEZQ0Mz+c
	S/Nfquvw6KJ/S4QDRqvPetbvI0iVxFJ9OaffOjNUYYpcioLy9AQFNG+OSrCj/+SwzcRaNgVpiBv
	jesvM7Y5mbzi4zwRae7R0L2zTFk4k0u58dSEYkAlSheof3NHL8LLZy3F0G+iq/5zt0tdVjS9+2+
	MjVrKd79yXrQd6F4utEzVl41xfBxW78iGfhs1Ba6w+w+ZVRd3UGR8dNQ5t1JAs3OfvjTdhS0GzP
	1DZ/knxAseasD0qlfvcPm0
X-Google-Smtp-Source: AGHT+IEH8XnMSqyzoApKmDX6AhUNUWYgJvQSSyuWnCcuBiDNsTGdng3bIhKQ/1hTLmU66JQfBqnS7g==
X-Received: by 2002:a05:600c:3588:b0:477:bcb:24cd with SMTP id 5b1f17b1804b1-477c11179ffmr299285985e9.22.1764330951004;
        Fri, 28 Nov 2025 03:55:51 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790adc8bc7sm158974465e9.1.2025.11.28.03.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 03:55:50 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Fri, 28 Nov 2025 11:55:14 +0000
Subject: [PATCH v8 02/13] coresight: Repack struct etmv4_drvdata
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-james-cs-syncfreq-v8-2-4d319764cc58@linaro.org>
References: <20251128-james-cs-syncfreq-v8-0-4d319764cc58@linaro.org>
In-Reply-To: <20251128-james-cs-syncfreq-v8-0-4d319764cc58@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

Fix holes and convert the long list of bools to single bits to save
some space because there's one of these for each ETM.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Mike Leach <mike.leach@linaro.org>
Tested-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm4x.h | 36 +++++++++++++--------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
index 0287d19ce12e..d178d79d9827 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.h
+++ b/drivers/hwtracing/coresight/coresight-etm4x.h
@@ -1016,27 +1016,27 @@ struct etmv4_drvdata {
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
+	bool				skip_power_up : 1;
+	bool				paused : 1;
 	u64				trfcr;
 	struct etmv4_config		config;
 	struct etmv4_save_state		*save_state;
-	bool				skip_power_up;
-	bool				paused;
 	DECLARE_BITMAP(arch_features, ETM4_IMPDEF_FEATURE_MAX);
 };
 

-- 
2.34.1

