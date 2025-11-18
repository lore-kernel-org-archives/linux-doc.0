Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E23E2D5C74
	for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 16:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763483296; cv=none; b=Lt1TzB86f4sVGHdp/xDACI6gCztwTgm/42olYc/pjlvoEUtQFo6KMnseukQywJwaVex6Ix00q7eyNK+eKdry9AabZpDfQqKO1HZabIYxGwzidcUZva9LFAX2yDBgclV7JaXrqq7vLXxhTajPq0w5uee2BVZubbFH/cym+ttiX7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763483296; c=relaxed/simple;
	bh=N8m12iWNCLQKM0X40bESlfOrttHeXy53V/IFqVWUcrY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YJSU+c4s7lCbqlB+QSL3xiCD3xq2RedMOP0BZfYsmX9ncJbJO5FnzAyBHmOqlQQn5JUKrE8VecpEhA885Gag31ESMj7LiqYX39/M37BgrfgpD9UeB7sGOPEP4o7njm4VEEQx401Nnq9satD6N/rqNjI0O7NNqz9r8rDiJQwwHtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RdSOVb8N; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RdSOVb8N"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-477aa218f20so6548155e9.0
        for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 08:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763483293; x=1764088093; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tUoArGeF29Uq9ud9txzEkP+4OSzrCHQVStRpO2mMVQU=;
        b=RdSOVb8NU2lhf1rVX4j37WzWszNoHSpn386gdPu1Qgr3jkzoAbpn6sFohXP0tA58eG
         Ta+7MkT754SFYgzz/jMQbcDvwthraFsAzBBwxZrhywckIU5xHvYX2lQPlvtqATcM/C6x
         5AiJht26rF7+6N+qGM9cLPdl1uQaOqev5YflHCwp/LcH0XZQLUavW6rHcyzsUmnPBdow
         xK5WKg1G8wXsyEih1Dma+pMwRns20FEC7pM+gO3snFsOnE7Ml13xxH1pRrwGKwsGPYbP
         i/wI5auciDxiJLJpPtqdmH6yD4TosrIJgsFZegzAuXjdpmzlZCwGOEvQOevn3LV4xxJf
         0Wgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763483293; x=1764088093;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tUoArGeF29Uq9ud9txzEkP+4OSzrCHQVStRpO2mMVQU=;
        b=dNzGZVYj6oQz2Hw+AYv3OPjXCKm+rpjpjHMTQe7OJnr636PZTRpjB1KYBhGPXtPN0k
         cqtUb+gY2QtSZ3UO0Ln5heQE8HzXO0WwLPxtZm8m8FDGg5Gm5tziw3RKoMl2801uSnch
         47MFDmoss11aMkaamAuvXL3Qch/+6fbsk6pxEalWBwOMVpKuXxidoGIHursUoWXSVPIK
         fkwZ41GuZsGWAgZ9KT9zgctTlIkrIGIo0RHyb+uk7Se+UVQqOz+gfQfkGRbbViOS5wYw
         pN++2iS1wtkDSkG70rwhz0kKDTdnsWSJFj0QnDjd9Wz2S/lPBK7CxbnJxMd1KAOoz+YQ
         xYOg==
X-Forwarded-Encrypted: i=1; AJvYcCWxGyeqjyIjIdEfbaBrcHRdGeXdlxBxepLhYsZk5UaJz/NGdfTK57XQSyGzsfjwe/PdAolhlDlx9/I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNTxKQIkaUPBRiH5gjpx7AKSWr3PFmZ1tiCtKwH7eLsI2yY7rg
	haSF63TO4fxa2j+O3aUmA6J2aysGeb9JIVlhuPsNP6Shw7UDtMc3+MHxmSXA6pLgiW0=
X-Gm-Gg: ASbGnctRJrwmmjYgjirnnT79Bq//2SkWVepEmLxIqiqw4EKYmFHHNHNIzRo3DAN3uR8
	G80b3vLXxJWC9rBKKVGU1hVK8zeP1SOPAg75Sa38/HRgF+bnMUui1JJHCuTz/O8047E6HoGGM65
	IYnKg+mTsODj06GpNYYEE1+c36cs1KD2E299Oekt6JpFX64dIU99om4qUFkDhC4w9rlsH48J3Wo
	bc2hatcb4FDbMCo+bC1ktsiCFoOQyuzHc1vYw0ko8rTWogWhOSZUSAbKPYodhJyGuAQSUsoqVez
	tZH8xLbEOsCpas9mC4ltQeKm6T2TEFDKe+0O5+3oylxOhB6HghX960+2mBwBNgYM09Kmsg3c9s0
	A0y//vbxUQ5RpfKNBAUyrJibkObuAI1YcMzy/3qWoooXSi8hv8FO19MWhoJ+yYEgayCazFgXPJ9
	ou2BFj9IBTEuV75AFjPBzM
X-Google-Smtp-Source: AGHT+IGlqA0IJF4lpQfSJdnwbFaKhD4WAxo7jW3OY9aqCkvaIzPhjEfi9eC0wI0y+2UoYEhe+EsPvQ==
X-Received: by 2002:a05:600c:4f4e:b0:477:6d96:b3c8 with SMTP id 5b1f17b1804b1-4778fe95399mr169481215e9.23.1763483292720;
        Tue, 18 Nov 2025 08:28:12 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9dea7fcsm20369125e9.8.2025.11.18.08.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 08:28:12 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Tue, 18 Nov 2025 16:27:51 +0000
Subject: [PATCH v5 01/13] coresight: Change syncfreq to be a u8
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-james-cs-syncfreq-v5-1-82efd7b1a751@linaro.org>
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

