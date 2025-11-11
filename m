Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B57E358D39
	for <linux-doc@vger.kernel.org>; Tue, 11 Nov 2025 11:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762861115; cv=none; b=GoyNXQVCqb+pmdvR7Lkv1LcFDbYCQwUFT78V07HTauu6GBxziUutw2T7zG5kZlp+8INMsUb3yV9kCMeCUSxgtNAhbFEwl333b6v7dG96kZtL5/jaxnK4xSKPKv3SWhYyYnjh2Wy+iLSBl+YXBZAQ7IXobE4I7tO8r19XaS8kQyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762861115; c=relaxed/simple;
	bh=x95u+IAe5V5q3kdJyo2Q7B3yE503oFrO1P0dSeyIme8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GaEp9+C62IkkUbbBKLIPp6S12fFgXPoxNJFC0wmzntDpRHHd+7SNRp3xs0VXjIKTf9d33jIASTmgg8IzKXv4/kNhTTcQyWCP+2QN7/LZ09mGczW/cg6b4RzUtME1R9q4UdsdwJWD/V2DvNTyAmw4OrOThU60qyO4H+hD4G2Vlb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZkwRqYON; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZkwRqYON"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47778b23f64so14811285e9.0
        for <linux-doc@vger.kernel.org>; Tue, 11 Nov 2025 03:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762861110; x=1763465910; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hfuWM/BYuIKRAqpYoUgwQd7cyFQJ3HADoloFiEPlZDo=;
        b=ZkwRqYONLunVmEc9PIqNrVtCbI/1N5gLB7N9TnqRc/9xnoA31Ejn6steSAtkZfzfOm
         Y9ZH+Ca8t5IlBWW+ATJwBv+VJ5Nmgl2HmP9cDIWrIdkkOp2df/K7bMinIxZyprq26UWw
         4sGVB4y6gvLDXoFXpjHU4/MuvTZsNSCVysrYoagHQBZ1rlEIkJtNZ5qGPSfrcyNvBUp/
         7bczIxUMf+YE3SJ+MVotPoRprFI8VAU5X5cvtmMsLW0k/fz6lU7l2kMYp49JwC/w1WCX
         m6EX+/Il7RiGc6JysB7e9wrJpmnN+Rs/K2NWEf9ZYex8qOeI90C+6UPTOWiEzjgO8dz3
         Wu1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762861110; x=1763465910;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hfuWM/BYuIKRAqpYoUgwQd7cyFQJ3HADoloFiEPlZDo=;
        b=frGrfBc5b0MfuUfxvzk4TQwOSRiiUrSHWsq+V0Y0Tg1ZY3iyL1sFK7LxDlutYNpK/j
         dEPESXKM6meunxQYlLIKXjqpfv8w1QA4IKoUQOO8/hBdGerJ8iKR8pstIAMHEU0GKYPk
         9ZUm4O1/yqYToP7z6se+BO8gFNHb7SqD7G9QF5i1AXdgKpqSbPK5P7SOj5NOKHa1TVHR
         B0XRh7pHRmf96Pb5/fRdwDAaNOx+afi4GJ5RgBBTREZs4M34b1lM2vGFIl1p7G2ds4w9
         zYO26ukFn+Brc/mMHiVd8aAof7v9knYYq8zrDnJfargVZJegadGcBcGD6DTIccc4GDu3
         lLDw==
X-Forwarded-Encrypted: i=1; AJvYcCXLPgEbdkd942sMotbKdm0otJ9kZsKIOqrPYiNcLQTVCZ/57cIICRV2mFdgIM5+kc4FiBoLuDNTFlM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8VPVfKQZ5/GWkSWO0KBtxAx5QOhe0kC5Wm68xaiH5YnEeWBOn
	Rceo5NRJFsrEFQfD9hqXxJr1Brrf6m+C7IBOgOgt46o8tPCrkgE9GuV/FljPM9JComU=
X-Gm-Gg: ASbGncsmzGCkTqmtC33YDEz9+itSPXDbAIxIlYJAlIC7crlE4yT+AjP2/HCJHLIsgND
	cBpZ0+QFv6+kFHNFl3jUaNun0IjPimwX5vbFnYAREg4xx9InsDE2ALLTXRmU73hzNSskSJ6WtrY
	/hS/+86rxajMR7KbiONJLwDkJyiCOurNT/6+yzyzJYVoK8lE0jxx6lFHaYerNw18J6cOUWAyWAl
	GQovXfP4r2NMtsEP61XEa7HOqvxFCX/xK1avSIl+tk72qxjSEGuCcweRH2LQJUInpoXe6i/UOOz
	7o12lEIUMIdwOeKVR15oYZ6gbfYh6cRWOg/OTXUtRrDMzwPGJ3zIHt2zKmOpo8SgmWmq49jjiol
	8QAvVgbbnWWqB9cKH1mLcR5LadFltzUpRZw4jwWRE1IeUhTynX59EmY2fKR1UnyeSYCVRg2z7Je
	KDwwIVHzN/lOlB0d/tarUIqMAZpbUu11w=
X-Google-Smtp-Source: AGHT+IGYPR7rqVbdbF+k3EWMkcQQ1XUolXYoeKsYoPvyE020LtvRy4kS5z2d7QV4g2hQ3KZfV9KU5w==
X-Received: by 2002:a05:600c:1c15:b0:477:7c44:c0c3 with SMTP id 5b1f17b1804b1-4777c44c1e2mr78464655e9.40.1762861110374;
        Tue, 11 Nov 2025 03:38:30 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac675cd25sm28133486f8f.22.2025.11.11.03.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 03:38:30 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Tue, 11 Nov 2025 11:37:55 +0000
Subject: [PATCH v10 1/5] perf: Add perf_event_attr::config4
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251111-james-perf-feat_spe_eft-v10-1-1e1b5bf2cd05@linaro.org>
References: <20251111-james-perf-feat_spe_eft-v10-0-1e1b5bf2cd05@linaro.org>
In-Reply-To: <20251111-james-perf-feat_spe_eft-v10-0-1e1b5bf2cd05@linaro.org>
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
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
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

