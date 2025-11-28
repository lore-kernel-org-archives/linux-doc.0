Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A70328267
	for <linux-doc@vger.kernel.org>; Fri, 28 Nov 2025 11:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764330959; cv=none; b=XTYwzA0jxKSUAYSK8oyMgkN7/nlcEkINz7EQt4LaVb3tYT5Kg53jOIyNtQNxREYViruRZBIE2JVfQWlBmccIJ/YutbvplZSiEocWVF5cmSWkEl6GjQ4XF/ZIWq9iPI9b4jYSa4BhVDUzX9M04/KjNeWJ6pCkpkOQV2DGJyAhSug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764330959; c=relaxed/simple;
	bh=qqoEOyHFgkQ+/d+FmDiZIMG2BecOO8j1vwceae6L9yw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZIhb7NacoPZC9QCojTNRVqzMnQlf4AfIb53NZMNkIiyYBlJJkXUvlrS+zb2sblqYka2sDgznN3nFBxMbuxbMbEMpm5/CTG6T6KQ5n3+N6IvD3jsNFkae6Wyw3fxh21rg0QNbeR32jJJqBDxPvH635iQn1vq5VIpp9kFHfi9IqCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DHgMhcaa; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DHgMhcaa"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4779cb0a33fso17039645e9.0
        for <linux-doc@vger.kernel.org>; Fri, 28 Nov 2025 03:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764330956; x=1764935756; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CMHK8eau4h9JU7tjhkGUHgs7VKxsV93yd4KGWWLggZo=;
        b=DHgMhcaaS3l9oufysKqZMpehm878tS6uaJGkjsBaAKAvx4lPRwGpnnNza/uLY/aMxs
         YevtwTnkewD02BavV88pcOS8PjWIzfq2PE6Zj6A/lG9W5AtmMVoe8KpfTX8dK0ch+HAy
         SbnoMRCrlR26bnvFFIJvrQq2LKak4UXJSIkKvD0LCTgUE60cO4z8NuBeccuOgFXtHLJw
         ronpzkugF++3FJDIqxgd+2o1lMezB98pT9/1PE+E/pblmmzabwLCXOLHEZ3nUqMzDZu4
         t84zTscUfsr2YpnqMnSyTGk5jSdk5yc3iAXFjsimzypezROOlFZxc16J+sE9q1rFut0M
         wKXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764330956; x=1764935756;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CMHK8eau4h9JU7tjhkGUHgs7VKxsV93yd4KGWWLggZo=;
        b=OqKBpuL258SywNnmf5jjwuzMEcONLWe/6TI9MX5MraQSZPH4jPJMNjXjrwER+y8SfO
         UO5t0A2xNeRqSLAlT6tW5q7BxWfhyjhzE43mjhIMsk5oG1npfvPx7oULwSGJZyUG5J5m
         3+kwWog2EOzTTtW2tkyIlTsevi/RuulCqMMJCFObdYmhyj5tBpl2U8Bj9DGWkVETOf5l
         yVpuquVylM+M+2c1uL3m6RBqauvyqMAt4x7TTQqgJ3oNmSa3Jn2eros8FTlzLtXmWES2
         IIE3crk3Njrs4qJG0LKwUYPewHDvJnM7jLUWnHgo4DEz66YqwWCpwMiWnIOR+8odU0Kq
         vtTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkb3J4XOjYoeQMcDC34H6VDm8ELIjaCikJShUUpY653MdOOjTQoRCd0Qail8DP+Ahzqbsp0Ym8ID8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvUgSstwmtVKQUxwMmT9R9CdZVAXuocrDDco7CKEoLPhIJyESv
	FB8FoZivIrtLglQDKIF5PHRGGminQyl7pEmAENrZXx6dY26qyxvVBsDieG6bLBs/P0o=
X-Gm-Gg: ASbGnctNExIjYNDtkJCOt9z0e0T1fWX9yTSuGExo7XjxNnPkODmuvQ89BlF1SWEzuZ6
	KIdzqnPDnZ5qOlWc+MXQFxOTSb5+oxmN6JfgfSknO7Vsk63glh/lCPL4jDMRYx6OVdWQIX9uspZ
	aBVYVyGqxU5U6pKyJ3mPMhBXJ7acCNozD54BCP3mARsd7ASSCHjdP7Y2nZjDom/8o1rdaQYI2xE
	AnkBQeT6//Lj4RGTMZ9WDVubVMtGUwAqtmQazBoEwPq2Db/UcNCCFatlYY1rDJH7pBAiE7PavV2
	eGfjsIJxs+qwrelBy1H4NSq9SKes2MKrkwBAI9RLm0Q1JbWOG/eywluaJH9p9wt1d2qSm+vte2F
	czw5vUjK0ew6TAWKcsf43RUv0cBWpwvsSaqEPVmiFZYOJ1LhYnwEhy/MVqrEMMmojPhr2n7kl4Y
	yCvKsFui9r+lKiPaKreL9C
X-Google-Smtp-Source: AGHT+IGeMULI7kQJcckUl8PhFqbeqzvrMMwqX3WFQrSju3KHYudqhjgjNPWItcVO3ZzItgHnZsRjuw==
X-Received: by 2002:a05:600c:4e88:b0:46e:7247:cbc0 with SMTP id 5b1f17b1804b1-477c01d4af2mr277966615e9.18.1764330956063;
        Fri, 28 Nov 2025 03:55:56 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790adc8bc7sm158974465e9.1.2025.11.28.03.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 03:55:55 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Fri, 28 Nov 2025 11:55:19 +0000
Subject: [PATCH v8 07/13] coresight: Don't reject unrecognized ETMv3 format
 attributes
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-james-cs-syncfreq-v8-7-4d319764cc58@linaro.org>
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

config isn't the only field, there are also config1, config2, etc.
Rejecting unrecognized attributes is therefore inconsistent as it wasn't
done for all fields. It was only necessary when we were directly
programming attr->config into ETMCR and didn't hide the unsupported
fields, but now it's not needed so remove it.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Mike Leach <mike.leach@linaro.org>
Tested-by: Leo Yan <leo.yan@arm.com>
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

