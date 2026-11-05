Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793879124;
	b=GTdgMa5jKVCcmYFA8GPe0rSqLsp8YAWP+Z/GuotQcf46ACKlOcoDRwq/nGBX3YN7UXbj
	 v/upTV43Z3GXbygks7U/apH2UcSBQnNULXXFSNSrMXf/Pp1/RwCgkjvcXXmVsZZ+e5Rbs
	 7vXIOzgzk9UhRrRKJM01moma8uIvC1SDN1RkPX4YG9jsmmwHiF8fuOg2MTDHhiRYNq67Z
	 Y9AitRRUVfCiJ0+M48DCRgVnrHq1YgfHbqzvjeYJJSAbZYFzhXIT6BsmObb4OW0OezGB2
	 W5dstA+s5X1MWVRlni4yRYjWZjO+0cMttDDrKw6ul9fAPyL9S7Qd+iejFS3PurZWSKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793879124;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=W6GeqvCDvQ3QbN1jcZxC8ady49yeVHXTODTPfPeIuGY=;
	b=2JS6k4NJVLTCKJftLbm0LHBvDNLiDbWXUo6rVY1e9/lzKjYjf0qfeBbnuLN2roU6/g4f
	 mxx42ryBTexRhwP+ZgWm0MKQ9MQWC8XRQJfXrKD+auwMBFI9hcRMIixGmrTMQVLaxP+KU
	 qH4xhCWD/J5zT8Fxy0GVFK+uVy6t8BVjE4UgkG28INUFzBpVN3kxgbVKffpio4mxdKsrH
	 Lil2+Dh0rFLFKhiSATracHspmKbHVOVVyEuKFxYnn1D3VtqTayKODDpgiiv0eY0ZhYXFH
	 EShegsvugHFHEAJ0DRzCcHM9a8QNWW0aVam5/Kn8K3a7+3FUYdKulLDrI3t1eDzllDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Z1qyw+go;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB086083617
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 11:45:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DB086083617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Z1qyw+go
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso11830295e9.1
        for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 03:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793879122; x=1794483922; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W6GeqvCDvQ3QbN1jcZxC8ady49yeVHXTODTPfPeIuGY=;
        b=Z1qyw+goqKq0ulI1TfrViW8NeoXgdHe4XMoj/zL+7NaseRo32DFCq9fCsKIHTsSnzB
         U7XlszNcUgctorLtiL5kyyLJTODbM5IGCB6M8mqyMkmrbDqKxIvlDwePqm+cekiUBi8v
         kONFd2MxNA/8xB8erm+gufZVlW1h9IR/vUjZExpxFXqTpAc0DJ321ihd6xtCII0UyXaZ
         cmKCVzdj7FHsxT9QVZMnwPOeAtQbgWNtwVMsOoLRanYCtDdNGHemzmEvmb3z3gIGjmzR
         f7ObqX5rcpCyVYQR2Vdk6fDuIQYE/GFvDIW7sGpalgrpM81bBRG78RuYpIh8gGSJ/4Z8
         CK2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879122; x=1794483922;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W6GeqvCDvQ3QbN1jcZxC8ady49yeVHXTODTPfPeIuGY=;
        b=DIS0hr7g4uLp5Um/QJqBvP26guyqK9EmsZKwwi9TiPocJ7twP8rbb9FQGGS5iVpPW/
         5VrJbHMWhS8TfvcYGEF3djeSIWfuLkI3DTwhM1+hz+bo/OepA9ABzU5Vg8fPel4MbeNf
         37Tnux5uYdxBQ6ytQVbQbrW0K6vMAt/4latjc6YL5/VP+1FgkRBuMv1Tw/7XF/KNHgA0
         bs4F/xP1+MOPOaETSUTdfTLOUXpTvUBHdwbyMdFnkXwO4iFUFCd9ajilH33PiaiGfQv2
         /kCwSPebU1cK0mvC7/YiOq3yF+77Ng9RUlSreA4Ynkh3r1M/BvloOm+6MyP60KOYUiSR
         UAGA==
X-Forwarded-Encrypted: i=1; AKwUvBxjDwkaM6LtGgu78TMF1Mdn8XKBkvS/ONR0mSpFFZO8OgdUj92M8VdzOUx7jDzFu6bRKiV/uUXIf04=@vger.kernel.org
X-Gm-Message-State: APuU4Z8fvX5VYoPoskNLyS2yek8j/5E+aAYWHlSI2jRS42ON9cIOx0lH
	G/dNmUqIN3gsC7FrIWPTlW+OgOHmhOKSwR9Y0iXSxaqs/sruJZfQZMtrmbBUM3WJ4R8=
X-Gm-Gg: AYBFou1BrfHik8dridC2mHAGMkZbFv236WFQtfTdbhYHZCj4lEbt54lq3d3wFLZ3i7T
	n1a0NHCfNemh/odu033SLe+iAbWA0JGybG+Og4VaP7HnkqIFDQTV9T0bmqiIzNTxFd6hirEb+O8
	6nL+nSoHqmWIt4Y9puhi83oKF17OTrZ2BW84QfyoA/Bn7yvikoBsTau18TXkE5ODVGCi6jQGgxd
	oE5l4DUaRBZmyQBhLD/+C+FxSqrjSlHonmwovUM2K2FjfExXjIbPoJbyk1WCL/EhhjN7hDcjpB4
	QIXqlJcTmDJbsYYMnsH62tFkyfLhRERb3kv5yIR++Xy9yAcpndwwpuEC0VveArCjaRCMnxWFgjA
	VGnTkUjypK47YYol0sUgPJQZ+ldGP7IM/+XblL/crxzz/GYYeN1bqQHALoTetvLcg7bypF5r6zR
	J14WRizfCFD6dyMhgLJSqpws8FE40yX6FCXgFzRLuUeGPgwq9pYQyzh702HQ8i7Oek42dFzMmqC
	6UjQYhLy/H5A7Z+W1zOBPUVIlBNjhl89RIq33FPKXaXi+tIW2QXQGwVgM4aGAzP1bQAOZSL29hz
	esggu3UN2yFOvUOWgilvnGQMpAGV/HTSDA==
X-Received: by 2002:a05:600c:6099:b0:4a1:811c:8078 with SMTP id 5b1f17b1804b1-4ac185bc1d2mr385653795e9.26.1793879121877;
        Thu, 05 Nov 2026 03:45:21 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b571f46538sm56679525e9.5.2026.11.05.03.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:45:21 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Thu, 05 Nov 2026 11:44:50 +0000
Subject: [PATCH v4 02/19] perf cs-etm: Warn for invalid timestamp option
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
Message-Id: <20261105-james-cs-unformatted-per-thread-fix-v4-2-7759e0ce2449@linaro.org>
References: <20261105-james-cs-unformatted-per-thread-fix-v4-0-7759e0ce2449@linaro.org>
In-Reply-To: <20261105-james-cs-unformatted-per-thread-fix-v4-0-7759e0ce2449@linaro.org>
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
Tested-by: Leo Yan <leo.yan@arm.com>
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

