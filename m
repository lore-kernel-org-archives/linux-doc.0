Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AFA436656E
	for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 16:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763483297; cv=none; b=B9qPseZsl94N7rQDRaStQ2GFkPyaECW3zbBUSkHwHhqMEax6N+L0pRQkgSekFFoygqf4bRHcpdA59JsiZplbZkeQaFTiN7+ohzLludBMRaN037VoTVNbyKamBACzURqfQ6NuWMvb4z0KMnHYsKjz/Hp5t3GaQg1v3dv3b/FtB+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763483297; c=relaxed/simple;
	bh=17jMP5BXtLnUallPdavwL3MYV4FkLZYfFbmfg88Z2tI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QieWI0l+5yhWZg6k6C0KsP97diyhpt+gkp238+WMPNs99xnezljDNtEGx/28iBfRNiGA1shwBIOiso7sBmPhyyQU5jttlVjsxVxXnVkdsxM1cv9LzRz9C96p2OGCPphxIs5PLebmJ6yq4KNk4z+QJWM0r+RiHbH6eYikwEx0r8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZChbTctT; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZChbTctT"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so34606605e9.3
        for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 08:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763483294; x=1764088094; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v1jmfj5dStPh0E5zFa2d+xJLlooTKEzGROAwu7cggvA=;
        b=ZChbTctTRu9QyZXJDG+6AXxBL0eXTcG4EkQvNnzgERTiIw54BsWPmmmYT6MhmZ9clz
         +KaIVIwJByea51sgX0v12hS1rSPI0QU0BxqJrfgNxl6+R3SqFVS71udy+QSAg1bv+7ld
         2vPaBSHZ+vmrvDZ3cHY1gYhQwU9fLNjdRblxEKOor9UGfQ1dVqDakAX7w7D3mt/LTBSA
         ncfdzCwx0rq5Ixu/RTkVC4HC/yUROLxjBvp1XZRgyQKDFmCNwQC3817/vBZ5ypQ2T44R
         ++Oh3EHfgrLjTfBFwj5bNaG4c6P+MRbGG/IeRVBzH/4l51wD4G1Ek2JP7ElyouFeSF9j
         MJmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763483294; x=1764088094;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v1jmfj5dStPh0E5zFa2d+xJLlooTKEzGROAwu7cggvA=;
        b=GvwH3H5U3L3PEyOoBab0zrSnW26FD7vBDsKpNEVJpPkfs5YtBOnEdvF6L9uFT8ynJ1
         eokK3M32adHUoWAeUMM/wr10DkXuCEQk1LI8K9FYyxjUj+YyANZh2R64zx6UcSQ21o7z
         95s4lwUicJp7j9HooZxZxdWuHXrVB4sgl7wL9Qo1pNtdZ7W1cR7x46IO4477wnW55ZY9
         1YE50owTr9sgPQwWaslsyrZrnvHCuqpfb7SyW64N3HjHT46y/85LGBf58oVcl27V/7RG
         f4k1e2DfCQnnNReLH6vNvmdp2r4u6tHhHtabgu7JaYBtOuzcvOwdW+FzMtg6eQLZhWeq
         IMcg==
X-Forwarded-Encrypted: i=1; AJvYcCUVA/Kmgujs6oxXFo12q74BUT+Ayfz1ZJc8YZIBFcaU5CzleSg1KCTFqfViLxUlEn+Ld+X7r+VF3jc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEcxL2Sfmq7xAoxt1FhOHV5HX9fGSvYfRwyAmoz/elcpUuGKJr
	RavU1UKeFm0AvtdGF0RUv527Vfv0PIPHSMTm/rAxe2/p3dvjY8yuEUmZ6Zivc0KHSoM=
X-Gm-Gg: ASbGncskc1DgB6oDF7I3SdIZj7ozwBDcYFyPzGz+W1nI42Bi45XzmYvEfQYEgrSbrJM
	mKlUmJkfh3l3p8+APjMcJRkv0ttJX+DrhYmhfCtXBK3hkihRFL0hnCMd60uYiUD2xZAcSkmZ5vI
	XwzLhI4AC9Bs2V+218BXqeRXraJmv7ePbKoaw0X+DuUxC6d8oeuU5rdTxK0hTH7lf+gQLXk/dL/
	X/UoOrZSB0z8sgSk2vFC3vAFzH9jd0kWd1611fxAOF0riNcgzVQ4L59kOfj1gSsMKW7ML1EE2ys
	cuoLJ5LAGPpa1ZPuU3JhE6zS3augkM2WtJCReaNnUulkocsIus15vU3CV0vdH7b1wqOQV0Qilso
	fW8JRS7Fx1QKvBTO+gReaSd9E45mur77YRk2MAlNdO38UBRljlbg8wtvBlETbh7w6aJ5n8erb/2
	3vMzxBDaJIQiYi/iQPoAz//BPdpFlnAVw=
X-Google-Smtp-Source: AGHT+IFC51NmASmxCttbHA51J4ftuaZisW7lGzCpDDloTLqiHxK+S+7Yx2njgihk2700vNnRrGielA==
X-Received: by 2002:a05:600c:604f:b0:477:9b35:3e49 with SMTP id 5b1f17b1804b1-4779b3542e2mr78799175e9.3.1763483293681;
        Tue, 18 Nov 2025 08:28:13 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9dea7fcsm20369125e9.8.2025.11.18.08.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 08:28:13 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Tue, 18 Nov 2025 16:27:52 +0000
Subject: [PATCH v5 02/13] coresight: Repack struct etmv4_drvdata
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-james-cs-syncfreq-v5-2-82efd7b1a751@linaro.org>
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

Fix holes and convert the long list of bools to single bits to save
some space because there's one of these for each ETM.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Mike Leach <mike.leach@linaro.org>
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

