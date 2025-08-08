Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A67274B2E
	for <linux-doc@vger.kernel.org>; Fri,  8 Aug 2025 11:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754652239; cv=none; b=clGO1GPOt3v/+EOgI02SnVwzQDrK93240mZHNj++inPo9OnnfJvmYAjCWwOKWq38WbSM3kNaj3aAwG/WKRKsD/sxhxFdQQ84On/cK9rpLNVVDHfQqEqYxd39dJwiYBHvx3NufMQXbd7iHR7NW8oXk28yVhqQiQosKSvBCP4xb6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754652239; c=relaxed/simple;
	bh=3yjrpHkX+aMdTK90nxuOJyMh4ajXQ8n+rTYB1GAa/ak=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J/rn0zt+gGv28j0GUPHJ8i45LjJVRL4VzvBdzjw/kooqgQsq7iLpV6GS5IRsxE5YSs8fLyFaFDlblwbpNU+u07GIKklvdEs2I5hU1c+Nd8jdcbp9FVZMXd84ryGpgBK3xqA9ldp4S6spK78Hunk04JH9sO9xqgT9lvTnPnG41hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RaH50ZvG; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RaH50ZvG"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-458bece40fcso11037055e9.3
        for <linux-doc@vger.kernel.org>; Fri, 08 Aug 2025 04:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754652235; x=1755257035; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=45z9IaVf3DvIHNyRK9bNlm2YHb8XHVPseevdKZOW65I=;
        b=RaH50ZvGPhQ8bMszL2JExGwns8Ohq4uLiS7Fwao37U496oSk0c/4gs2SAbUq/TY86c
         ux459xL4OGPmGMoDDCArqmhbE+SHf+5SS5RYAgoiY319JSiHokUYptKbbwn+zEhx+zXO
         84et9TN4ZeRQA5G9xecY/5qPI2Al1ojBoK6nGGmlV1wwor87U7oLKNFo7xKpVWcbr9SQ
         RdZ21JDLFeQYw/jxDx815vU4FWNO0kMhFG1lY1uPkyrZJWpgzWhuUyWVLAWrBnCULUro
         f7PskndpE27012BDb29GDh0Xn39gqPJoFjp4tJCnzKtiHJ4cj6sOtRVUIYRotOqInBSn
         3r/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754652235; x=1755257035;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=45z9IaVf3DvIHNyRK9bNlm2YHb8XHVPseevdKZOW65I=;
        b=bN5UKubBeb/Bkvwvne/iqaZqfRAv3R14zIZ/P26mc9yo7uiwLUNi/6jl+/vBMNFIko
         oZkN62AYltiXAKIrOFahvBM2OsJJFrNTFhex0vJ3PybvnNVuq/n44p8sFBFQC1GXysna
         LX+/aCOaRe0PwatTYT1a3M7vjdj1wbtMDeceLzjW/MmVtMCFpLa0zaCnwislhMRP+Mza
         3ATA5tfvPy4AnV7ngVFnXBA26LOrmdtfKAU5V6OiwMQSglFwZNr3PlWRfNZZKwzAy+2N
         f0keFJoDe9AOE40n+fdw7f4leySNjL4rBaXNuOejfQqr0u/1efNsSwJ9iq5M5/eK2c9Q
         TD8Q==
X-Forwarded-Encrypted: i=1; AJvYcCV0bn6B66282boBvF4xoBfv0Swcz6pnN5A/JNWsBtR0GF0tb2KwF3PT1vpn4YCsUmldU8MbBwc2EXE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx6OnVi34MK7l5UAv6JJNyOU8Rtg5RF1gYOmZZ3nKqF29UBvBA
	wxzoWdxLzxD9uBTzVUKiLLRlm9aot2qXNOV5159e/13EZBqtX1GZ168oEXk2uzvOoQU=
X-Gm-Gg: ASbGncuZGXgHiuvYY2Ef9D2vAdFC+UYudJ4d3qyCc2uR4NjngWMrQdUJXDsLsbJ44v8
	fvZi1usdoc9Em0BfJj+MJyMH6biIZn4SOGaFT5JSslbvoL5KfmYVu6RCpUfMbMEndvt3cQoUApE
	ByaCQABOtJ6Dp8QKlnA7fvS4ATM1C7Ruvy0ajO4gDSeldX+3nfnln5PkFzepEmcKmD73J/Ja7T9
	UmDvRMWHu0tMvILm61ckH9GcU2a5N/52e6Ftg58yJwOvkYwb1VJXB1BcZGuVeQC3oYZbVx8dq+L
	Q/6OMbnAX/diRS1iyJghzob2odLbEi+3q9D2GaggRq7bEa8RaXcj/yJ9WCaOvAmK13JqVoXPTod
	qwFA6EGvmdU/SlPiaIWykhjvPPrucHkI=
X-Google-Smtp-Source: AGHT+IHOQ18gbVsDEVyKCfZAIEJklPYVqKw1aZ8vUXtA3WE+OW7IGcXWNxJyWSMYhUVtrh63ytt5Fg==
X-Received: by 2002:a05:600c:198c:b0:456:13b6:4b18 with SMTP id 5b1f17b1804b1-459f4fc3a9emr26503515e9.31.1754652235388;
        Fri, 08 Aug 2025 04:23:55 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45923c34af8sm233482635e9.24.2025.08.08.04.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 04:23:55 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 08 Aug 2025 12:23:05 +0100
Subject: [PATCH v6 08/12] perf: Add perf_event_attr::config4
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-james-perf-feat_spe_eft-v6-8-6daf498578c8@linaro.org>
References: <20250808-james-perf-feat_spe_eft-v6-0-6daf498578c8@linaro.org>
In-Reply-To: <20250808-james-perf-feat_spe_eft-v6-0-6daf498578c8@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, Leo Yan <leo.yan@arm.com>, 
 Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

Arm FEAT_SPE_FDS adds the ability to filter on the data source of a
packet using another 64-bits of event filtering control. As the existing
perf_event_attr::configN fields are all used up for SPE PMU, an
additional field is needed. Add a new 'config4' field.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Ian Rogers <irogers@google.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 include/uapi/linux/perf_event.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/uapi/linux/perf_event.h b/include/uapi/linux/perf_event.h
index 78a362b80027..0d0ed85ad8cb 100644
--- a/include/uapi/linux/perf_event.h
+++ b/include/uapi/linux/perf_event.h
@@ -382,6 +382,7 @@ enum perf_event_read_format {
 #define PERF_ATTR_SIZE_VER6			120	/* Add: aux_sample_size */
 #define PERF_ATTR_SIZE_VER7			128	/* Add: sig_data */
 #define PERF_ATTR_SIZE_VER8			136	/* Add: config3 */
+#define PERF_ATTR_SIZE_VER9			144	/* add: config4 */
 
 /*
  * 'struct perf_event_attr' contains various attributes that define
@@ -543,6 +544,7 @@ struct perf_event_attr {
 	__u64	sig_data;
 
 	__u64	config3; /* extension of config2 */
+	__u64	config4; /* extension of config3 */
 };
 
 /*

-- 
2.34.1

