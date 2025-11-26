Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE0D26FD9B
	for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 10:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764154666; cv=none; b=rTxTEbu1XyG32sL/RUvRVNnLWKXOPtsWkeSlP3MjmU/mpvwuD7peZntxoiNKgily4RXfGvZ7YfoXNvQFvNrGzYR0SAvg93SBME5nelgjE09XC/GPPi+9vcUZnB1rAZWNqZKP9jcQEsomOnY14Gm2cj/5mF9J7CnWOkHBh3Rz6OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764154666; c=relaxed/simple;
	bh=N8m12iWNCLQKM0X40bESlfOrttHeXy53V/IFqVWUcrY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z7idJWeuIOPbsXUclw6JfOx16HZPjdpN+T9rt5KH4tOsX/BKXp/aW/W74YMpaxty924lPlQwiHCp7Gse9p5vBI+qncDb0UY8DqjcVadL+dPO8UdVotdtpMShnvBUp7Z9hfIOL8zRcDRK0fUbYmi3VHSz7TgXJFitHD8nTbOht3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g4RtKm9t; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g4RtKm9t"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so62713235e9.3
        for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 02:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764154663; x=1764759463; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tUoArGeF29Uq9ud9txzEkP+4OSzrCHQVStRpO2mMVQU=;
        b=g4RtKm9tgoXEcGAroskSTTu38MWZWs/65trKNn+/l/HHE++kv39n2IgfzbKutwz86i
         gk+z24vRSL+ez7QEIPk4+mUzOAe5tm+B9EZUhApK9LRWu3QOFRGO7fOObxkOZX9Hx6gQ
         xdsdZwoo/SdSbY+YlxQNw28r6a1kdlEkdI7aqVsbRNJHxKctQ2tnuSV1lVXD1u8YqiB/
         u1HSDtxlY5J4uriCqcXmR7mZ4ikZigKPEM4xSp4K6F/dgmZG81ibqs1sfHYm7uuHyjHK
         cKuuEGIB0bt5xeMKhg+xs8o0ZPxcBfbHtH6q+/JyO/YFNcQCctPb447O6D5pwXt05zOU
         H7yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764154663; x=1764759463;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tUoArGeF29Uq9ud9txzEkP+4OSzrCHQVStRpO2mMVQU=;
        b=l2Bk3NjRe55kUthpjNTxaGYUBvV3r89hStvjpyYzLDVOAnt2hlde8C2U1IhLfTYNNS
         dAghlqYwEBmBhDPHOUVktBUSRL/wJgSbeJHs+IoHEmE5dsd59+WyFxSJTCOXEqlzfq2+
         hgT8JH0QKw5wPgLjGXOj6tP4GuaKr1X5nodUHIZh+m+UIf5EcXi5TJE04G+GzSpUfNuS
         Hvkb2AnwxBQQmLyTzqCH4G/tjxmycOLQZacx+dkzWAep7zjcypplTe/8+k0kZYNdMqgg
         FSNt1EVHqerKGGvuM9ufnu77JRlXQfP+9UPq+twzU1ZUWKpT2K6uEzv5I3f6t3at6bGW
         BAiA==
X-Forwarded-Encrypted: i=1; AJvYcCWAgp4sPDQix2hDDL4T83I7CTk5q5wv8Ikksl5nAubUSzPZVD8laOb0NHNPCM50O8AR7OjywruizLA=@vger.kernel.org
X-Gm-Message-State: AOJu0YysnhIJefpXFzLn1rDUEJQIqqVnX3IOyGQccMttq3eolg0socoP
	vduDJrpYtPDd9pxLs06DOh7/i72Gye5gHM3HIUnHywU0jgwTqGCVAnIbHHwM01uVbYlzUHNv/KS
	gkyYL8mo=
X-Gm-Gg: ASbGncv1/rWeBd5VRvYpjLwuiMKhwjrYg+aow8JW1e48SBm09VPukciZ1ctquoH8Gn2
	1nMxLhd39i1bjyL4Jz6Z9+Gm6AnzY+nQQ5TCWZD+6FAPYKD+F24spvhKBIHhLZ3EMTPzhm5dZiQ
	npaOKZ4CTQ3+CdGMBaSpwlpUeSR2B5g/0uvWj/dyhvZiYiafEZoUTZe/fw4OCr4COVYZY9a+4Vm
	JAHFquYmL2GLqYmeg2GI8R4kp0xXCA0lAJRhrCui/4NcWCbxdGbpO4JIFkNwJ45gTJqBxg3LANR
	lSY645shMH4a83IG3J21jTDmdf9iqtIeuIkNVFy19JYr+9/KGGBE7DwmBVy/sk5G7/LCNTdmkjj
	nSWqkUR8Nu6jerVGw1VB4JtRiOsASaUjf60EExnI5T2QrgJWlwIFIVff8vAe9A+MsEUglb8XMTJ
	hUFYBvXS/U578cmSfUBQrq
X-Google-Smtp-Source: AGHT+IEq2h53SMoGIyD2yFtjfs7hfB7ruA13p+JgzFnAxaZ65GfS0NxroszsNqkmBHF8jKJbq34fpQ==
X-Received: by 2002:a05:600c:4ece:b0:477:7af8:c8ad with SMTP id 5b1f17b1804b1-477c115db0cmr208004055e9.31.1764154662715;
        Wed, 26 Nov 2025 02:57:42 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790ade13ddsm36991765e9.8.2025.11.26.02.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 02:57:42 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 26 Nov 2025 10:54:30 +0000
Subject: [PATCH v7 01/13] coresight: Change syncfreq to be a u8
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-james-cs-syncfreq-v7-1-7fae5e0e5e16@linaro.org>
References: <20251126-james-cs-syncfreq-v7-0-7fae5e0e5e16@linaro.org>
In-Reply-To: <20251126-james-cs-syncfreq-v7-0-7fae5e0e5e16@linaro.org>
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

