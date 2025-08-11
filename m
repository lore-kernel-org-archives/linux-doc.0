Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73272DE70B
	for <linux-doc@vger.kernel.org>; Mon, 11 Aug 2025 09:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754904768; cv=none; b=XACd5M8xAMFdFubMrzYkvzy538SqqS7GY9xhTY6PvpFz21gA2WRaVemor60SHGnKZC//Flvh2RvgOrpw37tL/u6Rr5+NfyI3aRRRN1l3MU/StdwUDxAkrzjgUkvXSwhtYnEGoS4f1PU9hUy6xrZJhra8ZfydbGSP/ZUoC7P3sCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754904768; c=relaxed/simple;
	bh=m7ucCcGVN0FUBECCGdzVEI3m8S2GTPWLCEum9ShUMNA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mhXk7vaGBd3zQVDH1BMplyAZxhTPFQG/IHCcIIJ+JNhKAT0q3mlrLuCQNWPnO7cYiTVo4JdCqKNGmWThG+pl0RKb4OAmEqg6epVv3j1seEfHloMJfXNGeWZZONSQe9qdTrsaPZTFjsCbJkvCxuZ63dqK7A+FFzAP2ozG208vjX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bOyCkbIl; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bOyCkbIl"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-454f428038eso37706565e9.2
        for <linux-doc@vger.kernel.org>; Mon, 11 Aug 2025 02:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754904763; x=1755509563; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3GDsN9LxSDEitQ0pzvRQqf9bGA4AutUNUEYwRrkhQ70=;
        b=bOyCkbIlQGlaaFvckPGg9UK/kyDTwKtKG7AHC5+YeUbp3TfntVNJ3nXrItmFgixAp+
         NZZkhw7zgyL4TTXafNkqjvo25tmBZW62Nfisn5btteUQPxRd1ot0vXkbnhZoJ3TQTt7w
         d7JAodKnFY75Us+QSnAUI2Gkx2CxrNrgZVHNCesydn5F+s9Qn5TYdViybWRAACOySflg
         FlZ9tb97+HMR0U8i8y1qUmUbJto35VufmOBbllB8smXW4I3mEfnD38DwkJc1PANgRZuA
         WTCO7uyEBBAANyxIReAR85bRblqi+BZSX/OXmGw4njWcw3HL1owKUnbAMVIGQV3ugK7k
         VBXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754904763; x=1755509563;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3GDsN9LxSDEitQ0pzvRQqf9bGA4AutUNUEYwRrkhQ70=;
        b=oj1yYJFrEoVBAIpGp2bQIGY/DFQgTCvrM8i5F3FevgdhKBYizVvbJNKIvBGomLbBF2
         zt875sErr5TBrSwvdID+9xPuo8UBZfPcZJqfNMY1FIMAuLz3ckrHRib6ZuBWMfu2A+gz
         whE1p9Jc6bXSaAlC8Q7R3PiSEODewFu3OKGDzLVf744jIm9VFEbxgI8VD9inhMYFEMA/
         nErl48D+PGFvUrn00SQupMuTUTWSY/qffqL9beAvEv6FTTvUx4+zN961msECoGULghRa
         1fUcH0X0L74XguC52YlhfrbUxPKMCjY2gEgXuL+4omvj2SUEgtl5C+BlAZSOGxghe6NA
         cMPw==
X-Forwarded-Encrypted: i=1; AJvYcCXa5kyMw4KovTx5qFW/mzD/cLAfOtDFrQhu157Uetnvx6a92BEJgiSUl/n6bQx4A7HE0SIo7cYTcZM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+jB/AwOZY8vxyqwYEQksSndSZoPcqep3Nbr/kdCrMLYYmWGXF
	gNWfEUud0xtblMGPqfiOqUdJF9h60PhDY1dKeS1gwnlm6hDpY+yN4mAPVLEIGKNT5GM=
X-Gm-Gg: ASbGncuXqVj0iFg1Aa+Lsa0W8shcc+oLlKNFBuoFq1C72+t79X8Qtj88rVmK47l7ut0
	V+4t23twI+RNzMRq3X/ikvOOVO3Gw7DPPBciXAF565eiVfhaL7hu8YyWR7pqnPnxc0JRZ6gy8Zl
	xUnrbc1etMVNtxLRNROHYVn/72ddmZk69E9mOSXemjUDeQnLQtheuYQ64KpMUik8sub2Fkghkvo
	D1z65eYp2joo9seJoHroDYzZeZZdbwUgocwskZ9u9EfVY8mBZS1FXe1P4BWpI1Nn5ru8j44PC3u
	2SSxvP8GxkfbobcgPB9NxMx2OTs+3A/sJ9P95FVaOGS121F4W2NKyW3MC64w9YUJZcX3h/MEWtU
	ym0G9+6EYvg8+ZT3WL/eAh3lz8iYxf2Y=
X-Google-Smtp-Source: AGHT+IGq+ywQDRPYbHWh34YnCQ/IpGU3if6J27Zgp8ZmTttsheGYVInR3KO4d/MWZnAmbDz0jxuqcA==
X-Received: by 2002:a05:600c:450e:b0:456:1006:5418 with SMTP id 5b1f17b1804b1-459f4eb5e2dmr95609655e9.13.1754904762901;
        Mon, 11 Aug 2025 02:32:42 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c45346asm39904799f8f.39.2025.08.11.02.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 02:32:42 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Mon, 11 Aug 2025 10:32:08 +0100
Subject: [PATCH 3/6] coresight: Repack struct etmv4_drvdata
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-james-cs-syncfreq-v1-3-b001cd6e3404@linaro.org>
References: <20250811-james-cs-syncfreq-v1-0-b001cd6e3404@linaro.org>
In-Reply-To: <20250811-james-cs-syncfreq-v1-0-b001cd6e3404@linaro.org>
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

