Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B725328C009
	for <linux-doc@vger.kernel.org>; Thu, 14 Aug 2025 10:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755168685; cv=none; b=RJ90VMpJmf5ZrCan//AaJvHBekAWgKNPnucW4YXh2ZFALJUiVeBEt3lILaJp7auQz8qx1+BdDsKnfR0cB4PGtmnsNsUikjKZlJEGcCmVfVuFpaOnWi3LHU2SI8XnWth9Lbp8p+CUhkIQVSQX7ckclzq5FWCF7K1epMl0gD60joQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755168685; c=relaxed/simple;
	bh=4aYl0ZlZfO9PKf1O2NFxApvTlFmO+ImWPT/xpvy6zJ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FJlVaNGO7xFotB7UcY/5mvMEurN0iFXW/uyOIyyZYUJtZWJFFeHhEfKDqh+mhAGf2N1GKYmayOr31527PlFsivClYC/m+4kMsGz4o/SHJ1YVoxclpvyS70BPFsEPdEe66yzDmhvZImCLIWaZO4+c3yVhIdeV1E8I32NISiFifdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H0ADKPDA; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H0ADKPDA"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3b9edf504e6so383364f8f.3
        for <linux-doc@vger.kernel.org>; Thu, 14 Aug 2025 03:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755168681; x=1755773481; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=flPVDp6drpFtCapB44BZdn+149SFai2CStzeZGBA02s=;
        b=H0ADKPDAsxo6vhr5Goo7l2G3il5EtV9nvm6W2j0YYJm4GbHw01A5s2MdEoKabtL2ik
         7MF0IYaJ7Bwrtt/hbWfwSknkWcCoRtU0nk7rgjItCFTSY5rb+44+d0eFJhsZNQK93Vx1
         TQ6SEXgz5XeURscGQ+IYljvLS8AD4+IBNk3Gkv6ebJBvl+VOFgk9nwBhlqsfJLGvOQOL
         Ffa3o0K9Hbv5xZti2KIY+idZlhajew8t9NdmOh347vo7ylyWNGNDEVR8DXdoa8B/NBN5
         G4bHkjTq+J3NW6vj7dlVR27nv9cXl6axM3Jl2DqyR0x0Aqf1LBQIrO7fFSD4gXRnGpPJ
         BnGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755168681; x=1755773481;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=flPVDp6drpFtCapB44BZdn+149SFai2CStzeZGBA02s=;
        b=o0nyMKC2evLNY2/OxWGE9XScEViA2DG53nznoLuiCkPcb3JAFvVCxktFE0Cak2VS+Y
         aVFb2F4flRikkCPg6JbQJW/rrJpbCXqp93MV92b4DCMOX8tsa+HwTglA76prb8DhjN2g
         CK6bzEBaKg6AM15syFpYfFwIyt9kY9QbV2Lm+vRnA3+sHuYA7d3dASGFm2TaAvo6XdfI
         wyBY0sp/fyvGs6MJKsNc80QdMWBnCRK1Y53HjMvEg+H4Z0TYBuRwky+fN59s3F8oBnBB
         iW0m/jn3aYxl3myLoQ4NsUmYZAOTTpMn48eZhBoL4Tzq5Ozd/mqhlS7Pu/ieYHc6A5fF
         AZjg==
X-Forwarded-Encrypted: i=1; AJvYcCVrwaj67UF/hGnsJOJpdeVVn77LyFjLTW+c/AL7ufKZtSk+0tpOCSLaHp1Fe0f2xFxavZucakM6oGI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyToYvo5UV09/WMeCCB2/QsWS5WyejMQ8O7Cj9jW2srgrWCI2k
	/cXcUyfUZzCC1UJPtCkAHKbu+H/iNMT9l543kcliVctYXnuR/cBHaf77skLHFQp/myI=
X-Gm-Gg: ASbGncsIaDS6Ie/oAG/+ECGh0zvXIAyIad4bTwOTtM1Vj0ngFJpg4h5D2DhpMeRke/8
	gnnpeyZYaoJroQdu0VqMIb85cx3CJ4lNEI51NDdXAg8uRnqRC42ZEaPrY0Q+t+cJbt0wZ6l1esQ
	+v8PkvnF8u96mY43BThZRlWjXURRCBqG8LZOn1014inQy4d+44gdw86YOHSN2i8pOmBbsgH6cY+
	dVSToxSUcomuWeqPSARs6s6dcDuD8JN5KvSpc53ewca1KaoPCduryUEFpZkshK5Tht55/Yj8WqI
	xzc68jtfUMCpqGXAJhR77RynANZiZVWDeuFAFCBTuSrsgWfQmf5EDcWT8cUakRdfLjc+mUnqn7N
	cqB6AuIHgtdU58rJUgf2YN32HLiJBZEA=
X-Google-Smtp-Source: AGHT+IETr1S2IB5p0qvTLAX5im7MRWeRvzS+YGEJ7c0VQq1WWHunLmPo9zoxHd949lhLeds4azm7BQ==
X-Received: by 2002:a05:600c:4ece:b0:455:f187:6203 with SMTP id 5b1f17b1804b1-45a1b654a11mr20355505e9.27.1755168680945;
        Thu, 14 Aug 2025 03:51:20 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1b226eecsm14228345e9.1.2025.08.14.03.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 03:51:20 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 14 Aug 2025 11:49:52 +0100
Subject: [PATCH v2 1/6] coresight: Change syncfreq to be a u8
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250814-james-cs-syncfreq-v2-1-c76fcb87696d@linaro.org>
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

TRCSYNCPR.PERIOD is the only functional part of TRCSYNCPR and it only
has 5 valid bits so it can be stored in a u8.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm4x.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
index ac649515054d..746627476bd3 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.h
+++ b/drivers/hwtracing/coresight/coresight-etm4x.h
@@ -824,7 +824,6 @@ struct etmv4_config {
 	u32				eventctrl1;
 	u32				stall_ctrl;
 	u32				ts_ctrl;
-	u32				syncfreq;
 	u32				ccctlr;
 	u32				bb_ctrl;
 	u32				vinst_ctrl;
@@ -832,6 +831,7 @@ struct etmv4_config {
 	u32				vissctlr;
 	u32				vipcssctlr;
 	u8				seq_idx;
+	u8				syncfreq;
 	u32				seq_ctrl[ETM_MAX_SEQ_STATES];
 	u32				seq_rst;
 	u32				seq_state;

-- 
2.34.1

