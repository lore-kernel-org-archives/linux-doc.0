Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793621757;
	b=kNEMPxCM8HOewt3JcUIhEsPAaOqGpARABA7026fziCRl6pWERLTJNP0pYHVF/YbnhH3D
	 NyXnpWWxtYVo2NSHvptKDMY3rtQaoSBI5IHF/r7E6Mzs74SVantiQoZFgX0gZQ3mLK7EJ
	 DFwxmkzqskJZG7yCJKX41mm3mVjpW0stNTwHKooNFQyoZ+rHv66mLyXsvZnYLizAH4oTG
	 Nd8a2AJgrPDOK2s5Wm4+fUfc/d9epRymKkdxpW26/KqvOx42Pj+TxsZRKQMywxITDulYP
	 v8TIeFmfPsvY6v4elzQAA8ATlERkeVWh98wsuMrztaTW/GhWPTPxFMbrTSXGMlozzKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793621757;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Tfbh1sEe/bDWqkSnXbEmJhwFJWqdcIiSyVXsN0XzB/g=;
	b=taS9l96PzGBl00540Yw7Abt0/ylNHTz+lSLcy7Hy0EzSIM9LBPpumH+L7YzCkTEJJy0G
	 rNWlG6qgH3TbyJ8F0qFq6xqeNBb1qA+zul50Z9EQmJSbV9bB6Ut2Rjzd9E+9KQTvqfwPQ
	 r80s7a5nbqqPZBg0fM5xQTekFWzYYwI2UtYOtNi9w2xzjktlJyYswkZmrRaj7kOgEOTJD
	 ZAbQc0MunAeoEEkUen8vDT4qq9CIDkkdpeilMicJb1tI4Z+oI1dGugyIsd6unMm/Lb5C9
	 /5fsQIAIytDwhBF1XEsRB25GoQgdlRyMmQS/7qxpBo7rvoovpiQI4atoIrptNFBTXyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=sYcKzM9d;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0261606A337
	for <linux-doc@vger.kernel.org>; Mon,  2 Nov 2026 12:15:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0261606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=sYcKzM9d
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a214af2076so22142395e9.0
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2026 04:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793621755; x=1794226555; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tfbh1sEe/bDWqkSnXbEmJhwFJWqdcIiSyVXsN0XzB/g=;
        b=sYcKzM9d8EFXn7TM4eMl1zoSRfzsSlaSLAx3Z8IDMXtzXqFiEsUKVtZwQsAbuG1VQw
         J3MgoBeHHlU/4tbivrBpkvPi7EniiVRta8VwZ0SPYSEsAduZrB4OJ51LHA9CrUw5Fjx3
         Q5C46GTXDKDu67KAJ70dfar78IKwJm/O40k0QXnz20v7B6U7s1YUmdhX/g6ZUHB9qEd2
         nIfS9Bo579b72d5LSpoz3HTpLWJ46vSGAcahvoAsYegN/P8EA/9EhzKLMs/cuF82aCcO
         T5Ams4qCqzYqO4nWIckNmTKO5sQNWhkO68qw3DlrUV2/sH6OmZpQtDIu6jsubzMsSSWX
         Ps9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793621755; x=1794226555;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tfbh1sEe/bDWqkSnXbEmJhwFJWqdcIiSyVXsN0XzB/g=;
        b=ad85ZzyfzDsIZmi95RrvufxeELmNFbiNGIPSDrobrRb0sdZIekUh++TA9DlVcqCsEm
         OZQQg6YuxWYRHwxpTNa2qA6OvM4T17s2ob+k+KkTFnDGySr3Zd4r0Db1DrN5tQrMFILo
         2qYXHu/12z5qvfnww43zLfUCzGY42Gx9TDDeNj84xD6xxTEyOkfC2F0epZkSuA8l/ldc
         IUI17Y+0ZMdfZ+EHvSRIdR/QHCc8cUFHMVz+jMf9i+eYKOnhnYqa/x7nqIXwaJFegKFH
         PGomrWjxo9nwE74mC6zuOV/lH336zTeDfbTOcp+ttzowcpVe2HrXKCY0oF0Z3M+31uFH
         R3gw==
X-Forwarded-Encrypted: i=1; AKwUvBzmQZVxW64M6/k8sKYwQEk3/JQ2zImuF9B3q48jXHxpe/fVC98xEGq5Fha54IUE+R8tVE0hcl0HumA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6U6OwPMgWLuZ92PRqkqRWx44/8JyHilAUPm8vZVEGXMvy3DbC
	bFYzWVzS3hfm1ApKjxkoLMWwnoM2pweHvWydScw1+y3xQ+ZXraMgmxsIdFi22LLoBAs=
X-Gm-Gg: AYBFou3p4HnYIkL7Azb9qcCXT6KIEdS8oR9SQ+tRgxBsnNHuq1gT1uFSJHHNpU4pkta
	kXJK4oseroZSA+lonHiao1z8fVDQTqkNuFIsVSzcXwNpKrxYbuD6nyRgdufXp02vQ19IHMOf2DT
	RqvSEQ5yht8sv17oz0pu/faKRWUeGNfzIgqi4k4uEZ38CidZtyLGLNnIBcF5HJP9G1BIOTialh1
	FmnY1st/Iv5RGWfrA+YKy9If2qVNimPcvZgR2U9p5CDUg2a1E3ARE8vMZwnoZrNW3iF08yxh9uo
	ZoVh8WhopbZp9JFVsrjP7ZhisR/mHqsEFAMUqnanneEc9eff81PPlvk2qTm6xS0Z8BMETwwg93E
	6589B+6fyRoWFkjn+hKNcTTmweV4833mkDxmeLV7xS6+Sv2OZPe2wuhH5AYhAZgZ5pH4j4GthEs
	8+667Kaf8pbKh/hlLM45x9sM/Ib09AznLBaOyE1jKQ2Ur00yXw9EBxaUaekQepGxlcmQvNWAGyV
	xQ3sbAYQ7+BaSLi4GBcFG754hRnendxGL6QesRDDnmgV2V6bsI1QgncymAqmfm5iqRnJrVrgmNv
	V5pwkKDMjjp2lZQXIge4O83ttPhraD6j
X-Received: by 2002:a05:600c:8b61:b0:4a2:1398:dd05 with SMTP id 5b1f17b1804b1-4ac17752ee4mr210928905e9.16.1793621755020;
        Mon, 02 Nov 2026 04:15:55 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm434974855e9.3.2026.11.02.04.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:15:54 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 02 Nov 2026 12:15:23 +0000
Subject: [PATCH v3 09/18] perf cs-etm: Increase default timestamp
 generation period
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
Message-Id: <20261102-james-cs-unformatted-per-thread-fix-v3-9-dbcb0c281b9b@linaro.org>
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

The original purpose of timestamps in per-CPU mode was to roughly emit
samples in the order they occurred across multiple CPUs, rather than
emit all the trace from CPU 1 followed by all from CPU 2 etc.
Previously there was no way to change the interval from the minimum of 1
cycle, but custom intervals are now supported by the driver.

Drastically reduce the number of timestamps emitted by increasing the
interval, which is more than enough to interleave sample generation.
This reduces the size of the trace generated.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/arch/arm/util/cs-etm.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tools/perf/arch/arm/util/cs-etm.c b/tools/perf/arch/arm/util/cs-etm.c
index 47b4e386cc53..5e7d09b7170c 100644
--- a/tools/perf/arch/arm/util/cs-etm.c
+++ b/tools/perf/arch/arm/util/cs-etm.c
@@ -70,6 +70,9 @@ static const char * const metadata_ete_ro[] = {
 
 enum cs_etm_version { CS_NOT_PRESENT, CS_ETMV3, CS_ETMV4, CS_ETE };
 
+/* Default timestamp period of 256 cycles (2 ^ (9 - 1) = 256). */
+#define DEFAULT_TS	9
+
 static bool cs_etm_is_ete(struct perf_pmu *cs_etm_pmu, struct perf_cpu cpu);
 static int cs_etm_get_ro(struct perf_pmu *pmu, struct perf_cpu cpu, const char *path, __u64 *val);
 static bool cs_etm_pmu_path_exists(struct perf_pmu *pmu, struct perf_cpu cpu, const char *path);
@@ -458,7 +461,7 @@ static int cs_etm_recording_options(struct auxtrace_record *itr,
 		 * Timestamps are required to interleave samples from different
 		 * CPUs.
 		 */
-		evsel__set_config_if_unset(cs_etm_evsel, "timestamp", 1);
+		evsel__set_config_if_unset(cs_etm_evsel, "timestamp", DEFAULT_TS);
 		/* Context IDs are required to associate trace to a process */
 		evsel__set_config_if_unset(cs_etm_evsel, "contextid", 1);
 	} else {
@@ -481,7 +484,7 @@ static int cs_etm_recording_options(struct auxtrace_record *itr,
 	 * timestamp tracing.
 	 */
 	if (opts->sample_time_set)
-		evsel__set_config_if_unset(cs_etm_evsel, "timestamp", 1);
+		evsel__set_config_if_unset(cs_etm_evsel, "timestamp", DEFAULT_TS);
 
 	/* Add dummy event to keep tracking */
 	err = parse_event(evlist, "dummy:u");

-- 
2.43.0

