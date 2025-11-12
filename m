Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045C533BBA7
	for <linux-doc@vger.kernel.org>; Wed, 12 Nov 2025 15:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762960959; cv=none; b=k5X4150nCJe0KlIGDe0GIPn7/YNlwQPM26WRU+B5+ArmIQ5DY2fsbReuqgSutr5L8AyZNutDa4JayAETDAzb8icEdQccEUltLCvDLLhdA00XUGZV4OZ4ng16JTtcVl7hupi1Uo5L1iAJW59h0hFyb8XcfaRkWACE7fyh4CprJpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762960959; c=relaxed/simple;
	bh=0Kw4cpAnclJkB05dC5A9233l+BCrc/iioVGiD2gkc6w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JTNB1ekDAmH7xvdN//V94wHB89bA2LV+xJpe4ODSpwketRfa1bNDnexyxBvTVF91b6siiy0dyshnIDI5JED/YUvsZZznuRVYgwDZlLWIgt7kzN2avZegBtDfY9jLvRC4t46V9GGnk3Q7uOX0uG1oCLcPLIp6NkgCDkVSw9MZBQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UmspWNsv; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UmspWNsv"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-429ce7e79f8so705545f8f.0
        for <linux-doc@vger.kernel.org>; Wed, 12 Nov 2025 07:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762960955; x=1763565755; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4QaaKNFNqowM2WQP3QSzkztxHtPDe8RFUGO77+dvhWo=;
        b=UmspWNsvPvOWfvCEgO4livn3MDzJHD+lGmgXXC9cF/wiNRgEbKuHAa6dKc/ygACMuO
         +9cggkIjOkZK3JokUj3iASvyQoNrpT62S9VfCr/jAlJgLnUbPkjdF8JZ5fAnHtXbswg5
         vHn7KQpIQG5Ojd2vXxlOsa3OfKljo4HRN8q/H9Gc56QRY9sznACw8eKUiFq3in7kxJLl
         jeJPRo4KMMQznf+NvbPK6PExPfMfTMMZyecz67iQazPbmsJzfp9whDIOr30iWgWUVIZA
         9o4vwjtyjS6gXwkgt/1dMCAkXRktTZvDEKZoIJv0mVxlnnRYqqXSLqPQJRM01XutDjsc
         ZdLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762960955; x=1763565755;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4QaaKNFNqowM2WQP3QSzkztxHtPDe8RFUGO77+dvhWo=;
        b=HorsGKw5C5E+5SjbvMVMzuI/NMGnnDQzl140FaVAg8C7zrpPPNRXYOPJL1Wa19MJ/k
         ez6gzlOrfIBBqDgRstI5XniNjQuakJX+Fb5QEMW6DDwlMOUFpU/e9EJWXyvLThU00MzU
         nSb2Pqg+mm9wZEnN1nq1nAXDNSuOmOUkgY5g2/E/6/X5FPK4vz++reDeAYPE8FkJdsQy
         PpqiJY4UjrZ0iBBNncCW63VkSutQyFerDaL4kdo/PzPskULSH5tYkN+SQ4mWFxJ0Jx0r
         EbYslc7UL7vzD28hsulYJhlSybRKrjPT0PGfHbL+j5s4qW9+XatuWZX8wYCFtLeJAfSK
         QqDw==
X-Forwarded-Encrypted: i=1; AJvYcCUUJ0E8+uBzPXkFCfeYlQJajijfv3Q79YA7+D8j+zhocElZc+wJs7e8UKEOBZUdHbqkWih8af9dO+s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAT9EUjCsLtBujm41+24G6Y6LEraz+gUjWUkkeTArrFkd0upl2
	f01zOcIwQXvTIKR004UVa7N2zihhp18TmclhnVwH6hEBFRY/N/pKQnoCw/ulWXZFV0Y=
X-Gm-Gg: ASbGncsoN4wy6OHFBKdS+KApKDL1pbOR0PT6w0cIA/y/912iv74gb+wzS11RIDAdJSz
	f0lw3E8BLgsIHpX7ZvWDFHif2khst0CqRWnYAuUdyLN3C6Hy9igTiq4pZ4tDYdS0+FyZlDiol1T
	5O1niK2+B2qwMQtOwEXhw83JmUtbNccXQn81UE/2KWkBHTaFt+jr+KM9RgV7KwTK+Fnflr/Xok5
	orDE3NqXQ6waZKRWAMPXEExGBkHoEhM+Swuivc+N79qu+GKqJlvwOenyW5Vu55WkxtLl0uXnfs/
	pmbXF/EossqY9Kz3ACrxtyH3Y3YQVk2QGwWUnzEB8aaA13a+OnsBB190w+7bD2kwOjzgoy25P7x
	eo1UUsZMg7G3e3K9LhMc5dLNgwc8mystnsxcFDEv1rxFsfUq5MQJU+B/1F2IGZnY/rzUCf21x+h
	bgYK790OeXTg==
X-Google-Smtp-Source: AGHT+IFw8jUIYvhHHQaSc4qHGp9oC+g6GYxlDDWV26ZjuQvhCnuoCCgNV1aDlJVXL+R28ybNJLrR3w==
X-Received: by 2002:a05:6000:1786:b0:42b:3ccc:91ec with SMTP id ffacd0b85a97d-42b4bb9fb98mr2774010f8f.22.1762960955263;
        Wed, 12 Nov 2025 07:22:35 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac677ab75sm33573485f8f.35.2025.11.12.07.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 07:22:34 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 12 Nov 2025 15:22:13 +0000
Subject: [PATCH v4 07/13] coresight: Don't reject unrecognized ETMv3 format
 attributes
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-james-cs-syncfreq-v4-7-165ba21401dc@linaro.org>
References: <20251112-james-cs-syncfreq-v4-0-165ba21401dc@linaro.org>
In-Reply-To: <20251112-james-cs-syncfreq-v4-0-165ba21401dc@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

config isn't the only field, there are also config1, config2, etc.
Rejecting unrecognized attributes is therefore inconsistent as it wasn't
done for all fields. It was only necessary when we were directly
programming attr->config into ETMCR and didn't hide the unsupported
fields, but now it's not needed so remove it.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm3x-core.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
index 4511fc2f8d72..584d653eda81 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
@@ -333,13 +333,6 @@ static int etm_parse_event_config(struct etm_drvdata *drvdata,
 	if (config->mode)
 		etm_config_trace_mode(config);
 
-	/*
-	 * At this time only cycle accurate, return stack  and timestamp
-	 * options are available.
-	 */
-	if (attr->config & ~ETM3X_SUPPORTED_OPTIONS)
-		return -EINVAL;
-
 	config->ctrl = 0;
 
 	if (ATTR_CFG_GET_FLD(attr, cycacc))

-- 
2.34.1

