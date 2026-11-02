Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793621746;
	b=ZJJPwYAHtccO22Zc3utGfhoqWoEomg+bPIGnFbpkNPlqfHtOGwrjI3d+2dia1Ogej9PE
	 uNeVAvmKN+Z01R0nSwQYPxX2VC1Awv0m74zcHoKcFXkso8qnUwnoJGuaqMF+avAyd0ZHa
	 +C3X5GmXBxpE2B14I+QpGsSJbTLYuEhzYymrGB31udh8W6w9PmqTGiKH49Pjg/xFXC/w8
	 yGOyx8ivd3qaOlLIQ0PigFNiieJsdXXLHxj8600ZRyZF26gtGJH5trpZHNSi8r9pnDKHw
	 dOQQWv8MBblhGIET717mTSrrx6glL/ZpZDMza5P6pOyAcLfG8vW6Rcck2QRzbRCVEOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793621746;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=ITCoMNDpL30MY89egTwFARcFVAAHOqspG7oErRSdzzE=;
	b=SpfNfC4QCE0xvOuFL1P9bGIL9/il62zCA+tAxx7KldAe8ZKrY1AfEJ7gwnxvVey+25mI
	 OtK2xfkx6QIccq7Shq/mdvB2E2NXUZ2LvyTa4+U+tEjBsMmxfYKAvtNqxbwDjtfX22th0
	 aXcgEhphQRMQLuL02qP6DfALKBrrvD87gVrPesiITxBWfWnAzxwNgCrQAdcFLXBoG5vCk
	 9IMkJz4/aezTVZJSQiM0sYw5DdBdESsVykyv0ebzM4kIX6j2WlMFOwG29nkJt8DEkuOO9
	 hdCfA+239xype7rjZVAi1jBXBzhdP87bGu/nPeCk3UoVhvRTfC7K03QwskVnW5Hue4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=m5IrfOIA;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B30606A333
	for <linux-doc@vger.kernel.org>; Mon,  2 Nov 2026 12:15:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49B30606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=m5IrfOIA
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a4dc547987so14970965e9.0
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2026 04:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793621745; x=1794226545; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ITCoMNDpL30MY89egTwFARcFVAAHOqspG7oErRSdzzE=;
        b=m5IrfOIAVDpYc1M50pM62wsyTxiPDCTiw+cam/tLVnjwdpOBSVau6FgHz93uQ2w9rK
         HqgWKm1r5/nwqAJB9yOBZUhtnT7oxxMTnea+KfsWJBvi4p7l80i91jAxA44dFRs1c/mq
         wgqgDPzIttI/Xgu29+1qFyztWH0IqX60ir5MHs8mmyGG+nAlZM+Lf9jlF/iucreYdz2H
         gg5wEe3bwIzwt0+cBXKeuthobcVjuQURvHgv5om7L0sdfNsOnWzQfZxu/t2cduzjr4Pe
         sU6RfXdtWOej9BKpC4DqLu4qR7+15Ydv5unv+K9GRd6jv6kYUksP/NLk1apYe0fjkQb6
         YJrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793621745; x=1794226545;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ITCoMNDpL30MY89egTwFARcFVAAHOqspG7oErRSdzzE=;
        b=LeZYt5776BVzsagCq0uMsExxP+vHxTTJO9DPn8F8PjqDPfuCJj5Byf7Z2lUmrm7Miz
         flRKmXAQ8+fj6IuzCSk6uHtI/j1EKGxDi3iGFHLTRWdy7CowVP99pp/pB9lLVkcptPy3
         H4SgRMTfPuzLIk5xrsrzmRAocqPOr3A4msVUdKos0v2uHD2xQfyTZWorV9bj1F6UNSKS
         oHJ/Oiapd1GBey4t12Nq1jHFmyGR6WE03oZuVytrtH53wvWe8VN1n9X1/OGeJLPcWU+m
         DCoEaVKhHjJQrCkbIAXEwfwbRvjN5IXTWUJrNfUfe26Dc4ILDynMLg6ThdtsjhC5hHeb
         wBUA==
X-Forwarded-Encrypted: i=1; AKwUvBz+FUYcGaMQDhV14Ue8yGdVHqPIneKxMPRjCZJUDg3OLS6ED5BeHoxfuH6KYyAG8A+UcA3pTHQlL8c=@vger.kernel.org
X-Gm-Message-State: AFq9FYIv30NEhQFSIeVUC0nX21x4AjMtfMVe2Sv7+CnKv/S6mFTou0H4
	mL3ivUotjLRpNL1nXhQXcp1zfeKt2u0qM4H6Pp6ThFmIVcURxTkpEltgP6ils6A9lM8=
X-Gm-Gg: AYBFou028D4ePaK3wSYZIq1vxToiRUKeLDA7u31scW1o75JgpuHsUoGPQxLmNkJPmek
	gQZ61y79AKoPB2d1Mt708tb5gS5V97bvWLYWXiaCD0riRaRceAnb8FC6lHKee6xdDepkWESA+0a
	PAmJ1I9g48MDjkYBuxq8qBunvytRNT36o1fcMGoGyqsNjroWiLbTqCTtLKnxPCp/DFUxenUcYxN
	ovno1QshD83WOiEKpuYthvXCgGT+ixJC+wb9ogIGCLNT+OMqkqtUbQBaM9iFFa0YdKP7JUhauhz
	NTT2Zj7MEyCuvJeNctKwTdGnmrki3TNabCvkYDokXgizHDhnyiYUSYztvJR4gPv4+O4sWiUFeYI
	+8cv470E0h3QsW0UdgXFkNQJtp2j4Gk0D+VQROjrTDvvgcwxPDq8WFcudhKbjNa9WlJQE/rI4mH
	4E3/bFpPGhXY/xsjEMSSipydFg0DMZ1EmtOIbnoUTZEpLKGm67DjT2dH8Kn3RRkQ/O3xcfQGzPa
	9DiiPVVXj3szRDZyXxYk2TdkLuk/K0frnI0i6wEkhgvWCucI96UvTe3g3i7tsnxpWXtAFktGjIq
	9nAN1fNVHZnUnXgAm5CqHoQSh3lZOo1t7ztnaFX8/z1qdevSTLlPWQ==
X-Received: by 2002:a05:600c:3b0e:b0:4a7:7d22:c50c with SMTP id 5b1f17b1804b1-4ac150b2243mr246272115e9.2.1793621744767;
        Mon, 02 Nov 2026 04:15:44 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm434974855e9.3.2026.11.02.04.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:15:44 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 02 Nov 2026 12:15:16 +0000
Subject: [PATCH v3 02/18] perf cs-etm: Warn for invalid timestamp option
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-james-cs-unformatted-per-thread-fix-v3-2-dbcb0c281b9b@linaro.org>
References: <20261102-james-cs-unformatted-per-thread-fix-v3-0-dbcb0c281b9b@linaro.org>
In-Reply-To: <20261102-james-cs-unformatted-per-thread-fix-v3-0-dbcb0c281b9b@linaro.org>
To: Leo Yan <leo.yan@linux.dev>, Adrian Hunter <adrian.hunter@intel.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>, 
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Arnaldo Carvalho de Melo <acme@redhat.com>, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>, John Garry <john.garry@linux.dev>
X-Mailer: b4 0.15.2

Instead of silently returning an error, print a useful warning.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/arch/arm/util/cs-etm.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/perf/arch/arm/util/cs-etm.c b/tools/perf/arch/arm/util/cs-etm.c
index d2861d66a661..acfdb3f53821 100644
--- a/tools/perf/arch/arm/util/cs-etm.c
+++ b/tools/perf/arch/arm/util/cs-etm.c
@@ -176,8 +176,11 @@ static int cs_etm_validate_timestamp(struct perf_pmu *cs_etm_pmu, struct evsel *
 	 *  0b01000 Implementation supports a maximum timestamp of 64bits.
 	 */
 	trcidr0 &= GENMASK(28, 24);
-	if (!trcidr0)
+	if (!trcidr0) {
+		pr_err("%s: timestamp not supported by HW, disable with %s/timestamp=0/\n",
+		       CORESIGHT_ETM_PMU_NAME, CORESIGHT_ETM_PMU_NAME);
 		return -EINVAL;
+	}
 
 	return 0;
 }

-- 
2.43.0

