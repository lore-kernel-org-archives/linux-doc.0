Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793879125;
	b=qaAI9SiZb3FtPOmgp+PJJDUy9di4r7tkw4N5RSZYRWBuytB925bD+b3kr8HmRI50Bvsm
	 rFsk/jtAjCKAKoASErSy+eRmhUk7M10oX1/6TxGD50p9MD8496fD3gjXflNMPUbNlcAkK
	 L0rInoRuPKB4c/pybg88jW66W1l5yfo8cKLz6oa5BTBEsurMot4MqPnR0Ocs1u8L32K8t
	 fKvBrzFNtTy4kCoswe0AONZyvng8wWF9AVxz0gMQ9jrM8Cof4MnHy1bWSbGOa7sYCNfOF
	 25v6cTIwoJA/oDr+4V2fbDV4asBhcSmuuvAokQl8J3ZdDx6NorILRocW+kxvLWFjKJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793879125;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=gUWiFRM+jw/H+hBVieDnKYNLauqU39ebBR9r6EahKCk=;
	b=CDG6LZaPx9JKMcUyuN+K3/PHkAaNL/6TA1HZD8rpP4XADs6m1J88oRzAxvuYwF2h1xAL
	 /q54D7p33E0KSNXQUGXTMuaT1Oi7/ULlinQq2llDlgZN0CVswcVCBsJR1XcF1tQXIzwYq
	 ksvUWU4PM3qGE6wk2LG5IPEv7D9jB4+4LcE1wdTeOST0iASEtHvLuBGOmwruyazhSczCm
	 8mZMG+B6adHlVGD0VqKABluMZM02W2fcdo/AefRL1kTD2rONoUlMNeCFFCJpzSksd3k3J
	 PrPMPRN5rPKvIoXkZDHO5SITPomhDB6DZRflPfYAwJHTmwuS3gXFtMAZ7C9pq85CMPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=okCxWMd8;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8AB608362D
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 11:45:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB8AB608362D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=okCxWMd8
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so11580855e9.3
        for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 03:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793879123; x=1794483923; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gUWiFRM+jw/H+hBVieDnKYNLauqU39ebBR9r6EahKCk=;
        b=okCxWMd8UfTSG2Fgtx3ehYOoeFtQhdiui/dxP9Ewf7dbpqvHLmtP6PHp8BdP2eo+Vb
         UQDkg7eHFPN2QQyBtL+QYVigs2Jgmb5w1HFRSN+Aha45rMnroRb0CSv3lwhY6Wb8ppf0
         jMJ1wq/cej5fII6HiEn1SVoKfI1j1M1uOa9aYhKupD9rk/g/Kf2qZ7UriCmD+idYtUmL
         Fo/cUUiw9wJmRyWQXgWYxxuJcM8pOjbIM0xSmJGD10IJ9EA/95E2oC0qh489wjKDuWqS
         aSMhqapZYVFgGolOvdAvBhYmxONRxhNzliVDyxs1HyMaJLms68TLquf3rQris1wqg7vQ
         v/kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879123; x=1794483923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gUWiFRM+jw/H+hBVieDnKYNLauqU39ebBR9r6EahKCk=;
        b=LCZKYKWiw0wP9N8Pnh63QkGDlflDg+99WvZplXlMEUsT9IDEX2zmi5Z6O/mRXmXbdo
         wwRFuWUGbkpGwmleS1Q7pOYBMT03n4udVfq+flTZExOKzpAwJeP/e1BNWkNKnnAIRez5
         /CAgWyBEvQoW5E2SY+u5HwQP9b7SFSAaKbNBFBPI4hsgK+2by2c4KVCDpo1QICXie3j5
         xh7yR9oBLCLSsaOCLZ17hu5Mt5hBM2tJ++1G8LPF+Qvpo/cirDlru0BSS4W966qzdUOJ
         BBE6Acir1MMenIsJdeOwYK+ilfZPJg+9WEPlSnNXK5MTLn3iIUHOmNWDIExubQgm9RgR
         krHw==
X-Forwarded-Encrypted: i=1; AKwUvByf3cGdtCU8m/5uYYz/Vty+I/B4XobtL38BihlT6zRzfoNEqN7D5bZxhEaeu05Lj/tBu9KYA18AOO4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8IbLzhwgl2JsDBL4OGDE5O3mT5S+iKdNk+fSINAay6ndZGHYbb
	WubOiLc1wKrjT+61U4yV0+z37HXQNyE2F3KBz4ku657sL4EqRO+dpN8mbK9Oc9fuPx4=
X-Gm-Gg: AYBFou221T8LHMmPUdwgz/F/qsbMo0F3rhbp0TaOPIssfoQ3pY3fh4J72eUn0WZ8E85
	Xqsh+2OQI+cAEOqjMHSvHSfjVHxFD5TTcRhKza+c38Wjh9rjv/jbuF5OfsXPamNyodeC3VoWpSB
	kgSXgsWqOhXV8cjiAuxDvDQTAj0et2XYjjjrd4d8buZHNAqKP2c6odBaCv673ivFf3TUFtJJT0b
	AaWkVCX1IL4+56rv6jE1ThYNnqdBE+WhHTWC8mn0d+XhOfEqrXi7MpRmeGetUjJoB93GiLDp/GT
	/RsClABnzpmRTIvNqmowpFaBGRUZHQ7nmmK3r0uMVlKIcvCTILEYOxE2ZpkYtgBiNuU3NTvmgJG
	CFJxV+6b/t4+rQeQceLXcEVThdaSnDE7Mt60bPD3vz3yL2zxthrKjM9EXOqyh0lKgU7xHypq9j+
	YhMxp7RHJ76SRRu2sM6Ai4RE54jt1/vqfBY/lNgQ/gGhu8j0ZEpIQpcdk5NuDk+CdvxeynYTioL
	y6UD6pyLHkCJpYEPMuE6Tmgx1WAtC9oqyg35UvmOVmaibf8Tp1t/HHZozpjlViaka5LIJIzMAw2
	6EhdRZm9fO1WFtoTvC+g/b2TfMPNTTgP
X-Received: by 2002:a05:600c:83c3:b0:4a9:18f4:925e with SMTP id 5b1f17b1804b1-4ac174711afmr401140925e9.18.1793879123196;
        Thu, 05 Nov 2026 03:45:23 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b571f46538sm56679525e9.5.2026.11.05.03.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:45:22 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Thu, 05 Nov 2026 11:44:51 +0000
Subject: [PATCH v4 03/19] perf cs-etm: Turn on context packet timestamps in
 per-thread mode
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
Message-Id: <20261105-james-cs-unformatted-per-thread-fix-v4-3-7759e0ce2449@linaro.org>
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

Practically this costs nothing and preempts future changes that will be
made to support decoding trace in order with Perf MMAP and JIT events.
It also helps keep samples in order when we add support for multiple
per-thread mode threads in the next commit.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/arch/arm/util/cs-etm.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/tools/perf/arch/arm/util/cs-etm.c b/tools/perf/arch/arm/util/cs-etm.c
index acfdb3f53821..47b4e386cc53 100644
--- a/tools/perf/arch/arm/util/cs-etm.c
+++ b/tools/perf/arch/arm/util/cs-etm.c
@@ -453,13 +453,26 @@ static int cs_etm_recording_options(struct auxtrace_record *itr,
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
+		 * Disable periodic timestamps but generate timestamps for trace
+		 * synchronization. Even in per-thread mode with a single
+		 * process we still need to correlate trace to a specific mmap
+		 * around execs, which can be done with only timestamps of trace
+		 * synchronization.
+		 *
+		 * Use MAX to support the kernel widening the field in the
+		 * future.
+		 */
+		evsel__set_config_if_unset(cs_etm_evsel, "timestamp", UINT64_MAX);
 	}
 
 	/*

-- 
2.43.0

