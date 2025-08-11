Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4531F4161
	for <linux-doc@vger.kernel.org>; Mon, 11 Aug 2025 09:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754904764; cv=none; b=JN6eGp5tQVjnFTNTYw0Qxh1H9/UD+D4s5wIQGIk+rzmKpjaObZQILRy6kpnbWc9o+XrMwce8NEogDexOX/o3inU0GolVDJ8Oi5/yJGiLgC7e0KuRQXpByGwPTxtWnMw4KdEHWXzvDSrFe8zfzjjjSXMwdfyp0252chPtPJYmg48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754904764; c=relaxed/simple;
	bh=4aYl0ZlZfO9PKf1O2NFxApvTlFmO+ImWPT/xpvy6zJ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nvwU6A1IDwS1PY724SNtY1gPehoC+eBu8BuwXfQsYX2s3KBny2f2luWd3O/Bham/F6HxueJfShnHQk5d1kYptZsaK2GDfUtsVID5EjZ7ctHUAkr8yLHZIe/2r2OlOCcSmFwxMR6zIPs2RMS6f1lE3vJdvE06M3ehnCJtcSqGQnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K1SdOJXA; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K1SdOJXA"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-459ebb6bbdfso26041625e9.0
        for <linux-doc@vger.kernel.org>; Mon, 11 Aug 2025 02:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754904761; x=1755509561; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=flPVDp6drpFtCapB44BZdn+149SFai2CStzeZGBA02s=;
        b=K1SdOJXAHZNRwKl4MCArq+IXqJgyKu0plDhI96JvCiAOfwwAlfCu3caJB7lTqE3zjS
         HYWqtaArVYTADDEf9KZhuaJuxmXGpN+RT9mSvxbwA1yC07ERoXs06yeyt+8n5VdSnbx2
         BzBHja4Dp/qyMFFeRuL7DzwkeHREoiSQycr5/YM+Ul5DeJw9R/y9vyglWoTzyOgsSdWH
         HbW/HdPlBVW6jftdYFTUFtki9QXt4LWRZO1LGvPPT+N5pK32c0x5vH4cArCEG1jKl9KD
         DeV/vJVDGN1EypiLfHEAbgH3AunfraScibyqV5jZMhC0wOEBbTM3F5iagHTSABiONK5p
         6xGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754904761; x=1755509561;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=flPVDp6drpFtCapB44BZdn+149SFai2CStzeZGBA02s=;
        b=bhWmpHERbGlpWOilk6R8GasRavjmIX62YT5goizF9D4VtU0AaoasfyHDwFWvU3ASkR
         jSB+6KjYiF/3ktX9nCC8BTrCZtxx6fPZAa4BP5tPbyLmFyijgEZaCowZNrpJhMz7IKm0
         QpCeuktot5L2BBfQpfUlPepvtBJ42MZYMO5OrcwqvMGHaEi26nkER00isCStZPwjevA7
         x6TM1Qh/4iFaFCZ9lo9Kk3CJ1GqHo+6TFqpyyQO82JSvz8VTXO9+oSxn7FTJb8vUQE6+
         ZYvEtFyZpuzOk+UgAB78+SKT91i2XbEOgt1DTsGYFo0pdn3wya58sQ/7847F6Cnuh4gE
         76GA==
X-Forwarded-Encrypted: i=1; AJvYcCVm65L8csBDrirbNK3Zqo9zFuz5VVIx27tfBEbPx7uQMeXuYa8C8oAkAZuPlb4spL8rIy9m0McyOws=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuBh5U9b/yQJyBXQ41gf4tYuNofirossdTd2Ou2N2cG7RvteOx
	hC4dHV60Xs/7k802hf98KjXF8SZkImENlaTOcVglLnrFafZq5tjDvqunuGrNCdDErKQ=
X-Gm-Gg: ASbGncsAlRcnDM49VAWDXtT5PXOncaYW/WOLVsiYkBaT4L8URzPXMH8duDwa8u3mRod
	4AtleTiNU555yiAs3Pl441Y+S12QqXXtahofQw/xTFKAhPcbDUYF/+o/F3no4Ee3Y+Tpl7sRo83
	DowyR0eJtCbmC+pFOmkOkPODT1AtBULJhTctNIPxSbBh2623MQKwtSOYRD/Ef1dM6OnstMeYS+m
	cvpxa6/n5R1go5LwMlYoJxvFE2aF7IWGWv6+VPGlzP7s9rlvhdHyh4FRNP1yrhNf9RmuDw3wNpo
	IEQoD4sHAO9LB+5kL31/2N/Fe+io32OKWzQFhRPzh6acFFVqzE3bv7YmsZeqxaQ0rSmCJ3ikFyU
	5yJF2PnfjkzBdpxw3b75dEjkEnL7uUgg=
X-Google-Smtp-Source: AGHT+IEnPjhNqasqLPJXNXfyUk55gExFDeENYeLrLoOeeRhVHgumgF4nMbyLg4qCMWphC66ZYVvMpQ==
X-Received: by 2002:a05:600c:444d:b0:43c:fe5e:f040 with SMTP id 5b1f17b1804b1-459f4faf68cmr95076395e9.23.1754904760755;
        Mon, 11 Aug 2025 02:32:40 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c45346asm39904799f8f.39.2025.08.11.02.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 02:32:40 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Mon, 11 Aug 2025 10:32:06 +0100
Subject: [PATCH 1/6] coresight: Change syncfreq to be a u8
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-james-cs-syncfreq-v1-1-b001cd6e3404@linaro.org>
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

