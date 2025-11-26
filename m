Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46329320A3C
	for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 10:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764154672; cv=none; b=G+I4Vt2oG024W2JwrwBoyYOXsucK29NFV897LDjhgtpsqosxFeQ/gMtlC++gQAiiSonS9HwPF5iBbxETibfRnTyKUft5J0PqdPdKIcFdldp4DVelJ2uXIEuiVraFj4Z9Bqc+CicTuciTuMHZpVOKYq37wYzq5ZXsl8hUfFUowKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764154672; c=relaxed/simple;
	bh=yKxlaA0VFabZYUg02x6IGTfX6s+yKxOXOrwNzywmdiU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dmETOXwaFWYNOXcImvANaylAkKm44X3E4NftIVNpgU24hteEl89RAgeR7qSdgZehM/UBfNhuTjsrvUSgquQsakHx5aIClFtVaxORbsTmlDzsWd0GaUZHwIrl3a1NGuZiMRXuhriRqPPTfIqT+OwrdCqvtgeCiCa/TgJvdyDYZA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IX4DZFP6; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IX4DZFP6"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47118259fd8so57413055e9.3
        for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 02:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764154668; x=1764759468; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HUVV/T8T4EDM+0Q4tOFA1c2x/rxW95efuxR6QK7Q7kM=;
        b=IX4DZFP6GgL6OQMuA1cT04e3F1y/lQlEgcCg/vlA9ZQx/AFPxSfywOPG5APf6RuLsJ
         +9Jwigd4EiU8GdhAFcaTcW/UPTMZGzGqLFBiyLCftwKbuxtOjCwLSNQW4Wx4tP496JEW
         jls3cOff3l8I+gfTv6o3E/rhixq2FaPc4O//+XvLVEQUmtuYX9sIOrefBLN0OErlzCj0
         qGEHTkcxZnfnYD9+9AwODhiPCF52dxJeLKbQFx10lNRwVku4PfOkHVStQ49QWMsw1yA/
         B8mwbi2sHHWkqz2EtvVyjHWOBTNGzk1N+b1NdUgs0En3FNt2kguUOxsBL+oZxmxfeoZq
         hloQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764154668; x=1764759468;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HUVV/T8T4EDM+0Q4tOFA1c2x/rxW95efuxR6QK7Q7kM=;
        b=JtivTcjjydp9bqU8Bb3wNYvm6N3hpvkjtbj6ovux6eTs36DmIFIVxztryI9hu9AScA
         wmfQco60zT8rLAUCmo4GbdErO5NW6dOVv0MJyxAyRrMWQyP1Hlv9z0ZJXGqEgT/1kWhC
         CQoyQz8GDUBqC/DTIqHn7zs7jPGr/3lqyrAqCWj911sJyFOzTfDNTXkzKnLbWezot5kl
         wCUuaqe5i5/kWFXK9WoiVKJ+rT1RJDxQEHZgfMMSOCKa3kglTXoHgBabchRaJL/OKqlh
         U/oJP+LNBOKKzD/Nq/V/3IVh11DgEclQz+yqwxlsImbLnY6tye/MEgLi+gQpSvfgIgt9
         zVxg==
X-Forwarded-Encrypted: i=1; AJvYcCXLKuNsEyvIIIAAM3qumGSDD2WZfRbYsDrK7VKpXLeEY4SQKLPzSIFg5r98xIKCSmRzX/XpXFPyTIg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKaMQx2pNDfo7Bpgwrz6LnkbrKbcMnO9zr0dZz3E+yL3pGmM8f
	zwFpkYwDmMG7FXIOVmuD0sm9quBGzgOPgEX1qXFyN+/oQpS2D3S35KGEcB3oqLLdDlE=
X-Gm-Gg: ASbGncsrVvQi2BH4ARFOLx99OtUctcqxKZL7YX47XBYAbN43DLxMhWWBh/+6rYrfPMN
	u3fZeHD+CB49aC5t/8H706Vc0/Q6FFArhIghjmuPGmarcyK4qD+ECDbLnba90QeqUiCYVEm3iSZ
	MYcY95Otvj/idOhjMDUe/WJ7sh4YSJcI3r82HCkU9gxL8N+5NaoEVbpsLcnNsNEwPLTj9L+J38z
	J62chu0DtQpSZPx9+8m0+5kW5R5Ff/chMGINlReopqgvWMlWtrFjgQLqMHzfx1UuIqgNRoOHecI
	62fyL4XHKOYzlakw2rlKc8S2VvCIm9iQEb7HvRC4CgPDrp+VQRDKSjP1YVO2+kGVQbfF+qwhPN1
	Zzmr3Q9egBmMuOiXBC2sEnrp3xMVBvFUBWoBP6WtumVdbjeTpVRtk2LsC3OO6YEUHblftpEfaJN
	JpkSOJ9iGU0UuL56XQmpqEvS7TeYuFJKA=
X-Google-Smtp-Source: AGHT+IHr9OD/bYa7kCE9wYLO/nvBpjL2TDJwlh9xxTIxpSRsCk2PvkdlXc82doB+y4Iey6KXw6usdw==
X-Received: by 2002:a05:600c:3b11:b0:477:8ba7:fe17 with SMTP id 5b1f17b1804b1-47904ac464bmr56206475e9.7.1764154668436;
        Wed, 26 Nov 2025 02:57:48 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790ade13ddsm36991765e9.8.2025.11.26.02.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 02:57:48 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 26 Nov 2025 10:54:36 +0000
Subject: [PATCH v7 07/13] coresight: Don't reject unrecognized ETMv3 format
 attributes
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-james-cs-syncfreq-v7-7-7fae5e0e5e16@linaro.org>
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

config isn't the only field, there are also config1, config2, etc.
Rejecting unrecognized attributes is therefore inconsistent as it wasn't
done for all fields. It was only necessary when we were directly
programming attr->config into ETMCR and didn't hide the unsupported
fields, but now it's not needed so remove it.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Mike Leach <mike.leach@linaro.org>
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

