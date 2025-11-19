Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF6F17B506
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 16:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763569103; cv=none; b=YRyga8Yt+/5gWxVMx1Fw8lY0PboUrwId0EJTK+Fkmk+ZDOy+JeWahM8YrG2jgxE4EbhYzpHgt5CQ96sS9TfdWz+PuelPH0ve6ts6bZvxAkbxNFcXeA6PQm66Z6ZfQLtuIuOjcehR7XEr9EcbsOUlwjPlSOTGkrqUcA1NPRrdZHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763569103; c=relaxed/simple;
	bh=N8m12iWNCLQKM0X40bESlfOrttHeXy53V/IFqVWUcrY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JpRVbP+r33M5bPRN9slnIw2IcFq7s4I9WpnVCW+F+xIUe62VFN207vBEHY7Bo3brLraU9z586+3+d2F+jXBZ1Fi1igAV4/M5pE7i77a8oxlq6d+XnHCbT/QFFCGjLxI2vudsdqNlcseBOON03g7eYDyQ0xNu+FqnI6wEVXZlcIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GMDlHN2F; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GMDlHN2F"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-477632b0621so45824195e9.2
        for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 08:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763569100; x=1764173900; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tUoArGeF29Uq9ud9txzEkP+4OSzrCHQVStRpO2mMVQU=;
        b=GMDlHN2Fs8EV/sz8U0ADZlGPhl9Hs/aTyxYxC8UR2M0tgD/2juRTAzaYVr5/qcmotf
         r2OsylGjLL44JxpokOCqwymzLqY468bQUCL8j+ajychISk7ByrrYU9zXgoe9LRNA4kQJ
         buftxVWalYJIwfIInLJkxLaohk5nxfd910etY1mZOybzU0zILYukIwICRfdYESCtZgFq
         AzZ0Li+hSQ3L/jMN4+m6Wosr5uVDVO8K7ulsP3et2R5yYaiPTu7ATrOqX2LjR9Rs2pRx
         Dx3pQ7BRrQQt2JWu8IyAFgpzZ3BTB5nIVp/m3fcHvNsk5o0zHkMk4J0GNha3t0YN0+pg
         X6Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763569100; x=1764173900;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tUoArGeF29Uq9ud9txzEkP+4OSzrCHQVStRpO2mMVQU=;
        b=hlJYa7ZKk5CP6aWB7qPgHeZHNg8Zu/rHcv91C1gMfCsI3njTGYYlow+Mp8dSCkNDWf
         bnuTOaEHP/Nag0D0s5fiUl102oAbpTIq/NeUktFJdTsGbZKn4ajTDKM/G+K74/Q8e8Mk
         qqDVMgcMDs2D+KTpqjI1QcQtaRpPEer7M3E1ShZuaBc7dYYJvhIIBqm+rdKvqlF2T7wY
         xn8jb8wZNuv9yzr5b77uKMOMOAPrSgS6jfy9Kgxw+9EsMfk4Dw02RzD8PFyHUxOTbxE7
         WJEo5XgUeuMwy19NhgeESRfbh1Ms4dsMFw05Qns1590IoAv0DAQ67QvI04NXnYmjh3uD
         Zcfg==
X-Forwarded-Encrypted: i=1; AJvYcCVexKvibP0KwRQPg2dD1AYXS7l7p0QD5G1YEj8lI9KfQXBCrhXE8aqbzOHLKcC+nY7EMrL0sSwYsRc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCZ5tfgziNyER95Op1Vtbw4qXbpY3F7E4qQA4K6oGsG9LHQ3HO
	zkrxkxJCbw3ZFXgGAfAZXFipuRjafB/pnc2sZR2oeOpqvZMCdt9+1JGbQs81uRf7Otc=
X-Gm-Gg: ASbGncuTzLJn61s3DzkooU0ZIl+NXQTT8ZtzxlPrWQFBuDMYeOO2qT2xmHpHwQ/C6fT
	Aocw0aue03fTgbDnpB0oVxS8V4YgNtuFy21YtrH5uBZ3g3Z0awrRcSTdeaGs/nb64Uyaq8wemc5
	3/oh4D4tUpz0Md/54he6TX6wcNFL7yCP0vpjZi9kjQRRxRot2WSg1DA7HcV+8g7bLi25Ib9yVo8
	yihhLFKjMoYO7fv4VW8+NRI7RBzWv3t5+t7ZGF4YWOK2+yAEYNY/vHFDI0JVbSWkn+szU3HVljL
	aob++bWDJijMGTNnJwO1h8OQevmCltBiXNj5DZFuSZvf1kj6rpEDJtAOIlNZovn7iTfbb/+DGF5
	YFtuZ1a7d+bWaFjrJPIJyhXctfL9RO9Q9WDd1qnN1YNXhV9McriQY/ztJKkQFcE0SSrCFO4zRmr
	YMS2LHBA69bDVUGFrGKabWuH0JvmxZEok=
X-Google-Smtp-Source: AGHT+IG5zkbyvNDDF+/srY2VnksVzVbMRA7ZXXnfHsHEkkB6nqJQFj2bl5BZT9jLuHwXG4/EzZQ6RQ==
X-Received: by 2002:a05:600c:c4a2:b0:477:c37:2ea7 with SMTP id 5b1f17b1804b1-4778fe9ac28mr192001055e9.21.1763569099997;
        Wed, 19 Nov 2025 08:18:19 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b10142d3sm63205425e9.5.2025.11.19.08.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 08:18:19 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 19 Nov 2025 16:17:57 +0000
Subject: [PATCH v6 01/13] coresight: Change syncfreq to be a u8
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-james-cs-syncfreq-v6-1-740d24a29e51@linaro.org>
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

TRCSYNCPR.PERIOD is the only functional part of TRCSYNCPR and it only
has 5 valid bits so it can be stored in a u8.

Reviewed-by: Mike Leach <mike.leach@linaro.org>
Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm4x.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
index 012c52fd1933..0287d19ce12e 100644
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

