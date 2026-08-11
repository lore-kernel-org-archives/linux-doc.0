Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F543B7763
	for <linux-doc@vger.kernel.org>; Tue, 11 Aug 2026 15:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786462254; cv=none; b=t7i3sGlc+CqmnX0eLFmLJyGY4VLmEal+ujypsNjO/o8PLaedigEesNlFxvUXQGdAuXSrBS+EzSwhNrcHFQmWHzEGjFbB589Epl4ap9qP4vIbBnpeYESb5jfg0QDbnT86J3Kv4Nl8ZlL6pQISCKoUa5ULThYfDj6sj8h3gOGRapc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786462254; c=relaxed/simple;
	bh=fP2IfPP/3FxAZdBFPU46BWk56GVJBXw30IVSIBNxU7M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I3zBd/8A/NUJDcg3wzlIPBNhLUIGJ2l/wN5qv2esIyjEjg2f2apV3IPSEIzQp6gYyKP9FdlarcAgcb9DC8KsOLIZdHMxx5ObmmccJjIstLpSTbFgWh9PlRb4h3nnUUlt1+0SlDcPcRzKeyoyxriyA7aKV2KzDlGn7KAJtrkjzc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qByNlg0R; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qByNlg0R"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49954b88fffso35230705e9.0
        for <linux-doc@vger.kernel.org>; Tue, 11 Aug 2026 08:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786462250; x=1787067050; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SdlWRdH/H8iL8QSy1QmXwkvjy5+5wNnPwJoBbpgZwJA=;
        b=qByNlg0RehNdU0PIGepICwOUkqvYcrNh7Rz8af9UL/+NdixtzxN7mpIQqt1x2Ksolp
         VJB54Fn4U253Sqcb2FQ+SZCcsdjhpKT5TEVQKivr17ziZ5fpVDRlnQ7hHTzRUFZpLlPp
         MCZsPdUtROdqS0P+9aaVCRbY4zPpCe/IaQTy5THzbcJhrwNMMNiD5ijulHAYgrLR9yQ1
         upSPwRH1ydIGraK8WhRwqjiRlCo1+tBqP/Z82mFZZmnmN9rGQmRMe+MpbSiy62xzi7An
         826RUgHLvWGmG4N8mkPyeBTZGDCzi5g1vxMp1FQTYgNhnQL/U/nmgCdrolaYOcM64uzW
         KQCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786462250; x=1787067050;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SdlWRdH/H8iL8QSy1QmXwkvjy5+5wNnPwJoBbpgZwJA=;
        b=IuW+X00V2MXHIBzPxzJXo6q8Pxkcd7sZfoxqxWbp3rr4rkeWSBU+8QjdxZW8CCmg7+
         vqtpzrNvh/uqRd/aNseC5dReg2BBEQcsvKnlxkZ63L93y2CKJwEj7f/tVzN8M8f8pUB2
         aZFN5qCv0Osj97rcrG6DTy+7FeBA9o2k0BrOX24EDSGBSX4rKraJf7/LJPfOhCSS7B0s
         Fm8jo6OTOOIMedi04EjWkktViLVpTk9RZnWV6RUawowca0REc4jA+6Sld61QOUdwhmY3
         ZhEuMOyYtJ4e+jdXWLqNyaLtmTu/mWrRAbw8unYoyiQ6KAuUC2d5i/vrGrGp8HHvl1yI
         xvrw==
X-Forwarded-Encrypted: i=1; AHgh+RprrwF0jKwzknpocwXmrgZNdlIdKZb7fMOWbwEESlg49avarYFUNeZk5Knb5QpRTSOWpyo0+g614hs=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb1yQEjFrmjK3zyx4jhdL1CuTQ3hUuZEkWQ48IB7MvrrqY7DOJ
	5xJ1h0i3wove8RY+FEG1gc5tDz+6h2q3nBbJUFNabTK/sOU6W0dLKirGbo9fa0V4FNA=
X-Gm-Gg: AR+sD11N3QkIgVW1/W3Gys5WunMidO0r5dJEY9jjUj3Obd43WdwA08NM2miBWp/NxZE
	q8EnlNjGQ3hGKxB5ZQHV27tot1JFcywn1sQfGbruv2JAvbUYRw82hJCYYNq2nySeDV3HQB1rJQQ
	/qN1dM677AJVJH6R1QwmY549rDPuAkGwYvfDzxcVjsT1bxHaHS+P8GkgsBk0tE2RMzeWxNpZ2Am
	9lhY6ThwrEsFAhY/1WGDJoX4azjO4YR4UKPFM826jyTcI2Sm3nhPEtgT6VCrae5sxeqopwTQ6kb
	wmvchKiArSvYNo7Ekh0NKF8s6aD8eo5unyCkR+QGmuzfosiyRRqztShyQjrBX6bzi67JWdq2NMX
	2s4cThAK79Cfdme2VI8dgV09wU7Y6is/g01Hm1lmWa/hZh+zw5VRngBCQX6rGwXttC/in9OMrj0
	ojiTw1jBX8JgMb2ewQxz+x8ph5qN+62rXs8EQNl59z2RxCOlbDrn4y1Go7gvolb9A/
X-Received: by 2002:a05:600c:310f:b0:499:737c:ce4c with SMTP id 5b1f17b1804b1-4997843703cmr53727915e9.6.1786462250133;
        Tue, 11 Aug 2026 08:30:50 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49977dfacb6sm49865395e9.1.2026.08.11.08.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 08:30:49 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 11 Aug 2026 16:30:06 +0100
Subject: [PATCH 03/14] perf cs-etm: Turn on context packet timestamps in
 per-thread mode
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-james-cs-unformatted-per-thread-fix-v1-3-90565318f5f8@linaro.org>
References: <20260811-james-cs-unformatted-per-thread-fix-v1-0-90565318f5f8@linaro.org>
In-Reply-To: <20260811-james-cs-unformatted-per-thread-fix-v1-0-90565318f5f8@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Suyash Mahar <smahar@meta.com>
Cc: Leo Yan <leo.yan@linux.dev>, linux-arm-kernel@lists.infradead.org, 
 coresight@lists.linaro.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-doc@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2

Practically this costs nothing and preempts future changes that will be
made to support decoding trace in order with Perf MMAP and JIT events.
It also helps keep samples in order when we add support for multiple
per-thread mode threads in the next commit.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/arch/arm/util/cs-etm.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/tools/perf/arch/arm/util/cs-etm.c b/tools/perf/arch/arm/util/cs-etm.c
index acfdb3f53821..d0486a164a70 100644
--- a/tools/perf/arch/arm/util/cs-etm.c
+++ b/tools/perf/arch/arm/util/cs-etm.c
@@ -453,13 +453,22 @@ static int cs_etm_recording_options(struct auxtrace_record *itr,
 	 */
 	evsel__set_sample_bit(cs_etm_evsel, CPU);
 
-	/*
-	 * Also the case of per-cpu mmaps, need the contextID in order to be notified
-	 * when a context switch happened.
-	 */
 	if (!perf_cpu_map__is_any_cpu_or_is_empty(cpus)) {
+		/*
+		 * Timestamps are required to interleave samples from different
+		 * CPUs.
+		 */
 		evsel__set_config_if_unset(cs_etm_evsel, "timestamp", 1);
+		/* Context IDs are required to associate trace to a process */
 		evsel__set_config_if_unset(cs_etm_evsel, "contextid", 1);
+	} else {
+		/*
+		 * Enable context packet timestamps only (no periodic
+		 * timestamps). Even in per-thread mode with a single process we
+		 * still need to correlate trace to a specific mmap around
+		 * execs, which can be done with just context packet timestamps.
+		 */
+		evsel__set_config_if_unset(cs_etm_evsel, "timestamp", UINT64_MAX);
 	}
 
 	/*

-- 
2.43.0

