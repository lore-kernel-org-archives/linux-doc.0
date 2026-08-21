Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C18470EAD
	for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 09:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787305795; cv=none; b=IQKCsLplJZWVEAbcQ9G7exVUDlNQ/8Q/qx5vIbL+lKJWGAjD+1vu3BXFms+PqDb9OwDdb1pJPECRyDNhOMKuQpJ9hjF31YU+USb12PYkKhSaH4atsW4OCegpoX89Y0Arp33V72kmZai7GD0tFvmspo4JB9XCUs9DXAE1Wdj7J78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787305795; c=relaxed/simple;
	bh=X5HTnmIevEAgh65VlSf446/RisR1ZaaOWZenKgokv10=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RmYwy2fsA/L+NvdokE2P3lMfb9CPAvZa9BdEKrQ20CgtX6wSe/i2zYaE+J/x6yZXN5HsQJjLfQxGgv7yBrqjS6xoD2oK9+ZY5xapqwQuobsIAMXjTTqMCBN8NBxBaU3eRaP+jwfnqWOauIEqD8Rfnukdc/THbprHXVFScsWfl/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Zd2SGbiT; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Zd2SGbiT"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47fe89fb333so422798f8f.3
        for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 02:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787305779; x=1787910579; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g282Hfq1E3bRiinvQDdFnK2jPyq4jjgh08sJOHY2A+s=;
        b=Zd2SGbiT/L/ZYqaljm8dE28XLrWdMSCZZuW9zBGHFxPtucjNYDEo0uZMhE2udnoTRr
         mwh9/tGdMMeXq7mjuzKbEGdmzIm63JdmnksEWrRAOHUsaeAt6HWg92PDHqam313cFqr0
         +beVeLSw7w4vp9M1+yQMXIG8AB69rfN0qnsicrALwG8p1b97eFXKyljqGsp5ymbFBU/a
         ZIdxQaI1Q8lwZcMrbzRfzd86fRE1XLHIdp+RpZ9L8Dnzv74MVSE2gPk7Pl0xF3DjKTEI
         i5pGLQjUaN+/TkUWcqDJuUyKW+vNr7Hn/yJS3zRkonzhd/O+XAlFj+GrKUBBW6ef1H+o
         cBHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787305779; x=1787910579;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g282Hfq1E3bRiinvQDdFnK2jPyq4jjgh08sJOHY2A+s=;
        b=XGg86Tlxrq0inwDfUZAAgX2mBTOISOIIVJMg1H3Z8nqs3hqNqDmzicGF4xLSkeyJY9
         C9zpOGNPQGvnYrcheN/SeTxjRRfgvcvM1PxnwYzVb8TnEqXu8BKRv7oWZvwP0RelPmp6
         EE78yeRcNwtFKGDkpAKxRU43iLtpO7nr4HM/fY6WGiSMv8vCGlIvmVVF8d+faVmYsPIl
         w6jH0p2bD4XExCjP9YeiCBf4J96eH1PelG5EQ2bmkY0bBzsBjJwrxTuaYYXXAAfhbdE5
         wMEQ74NHxsYQfHwhleOG7VHRUm6eI7CgudCLMZqx2qfi7lbBPFeM/vQCzM63BhP+XdvP
         sUiQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqs8Wjmyiew5g0C5jFsoL2qTfnom+F6A99RklhK+lj9WlOLxcpDrcmHwtCQ4H/vqpZYtQyo0+zb2aw=@vger.kernel.org
X-Gm-Message-State: AFuF++lJBUal8Q1Hi3xCteHySw6XC/NkSLhYsb+0UPm2NyHis62chHmn
	ZtPI5VkQ0QlOs0ly7SeuBUccSLrB9WTKV/V+tyAVwh+aqrbgfROuqoLE6HfZHmvP0bg=
X-Gm-Gg: AR+sD124ik80Gb40tw694hhKqH1UAAonkCotvB4MpG2pTLGnhRZjEw/SsJKizo+O8sK
	M8oCcGnmpxGPCc7fX70toh4cc3fuQ+V4dLPJT6J1ROSBMrKKvl0PP1WolzR3n9usvgJYs55ITL5
	eGpvPZm+UFu87V6psBv2mvdNivtZgdNNcXQknvMNhm0gIhEGBj4oglhyQF2NLn52eCvV737toZf
	K0kt15/MeSNuR3VbE2FSmQNZT55da0oo4srGnsK4h22ab6ddADC4J3/lxqXpJ1XeIfuT+TOzvZF
	WF6eOq2Wv+lSYnsmfze3I0Re/w/f+m6VUFqG23tnbzkIjQhsRpa2Bk2KSung2EBUaG2V3b/C0FJ
	NrH+3CbhmiegUkAisJwkP5oWvmL3qE6Cw5yX5Y36asOgHF5mAgG2VQJeiIsKtiINSrtvJWevphB
	4BejxerHr25fgB6bCbFC2R/BIniZl/B0HJwvTzmltrZe01ed8YPcFwtzbLh1GaNePl
X-Received: by 2002:a05:6000:4310:b0:46e:7f72:b6fe with SMTP id ffacd0b85a97d-482c0b9dbf7mr7147239f8f.19.1787305779425;
        Fri, 21 Aug 2026 02:49:39 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14d05a6sm17683479f8f.35.2026.08.21.02.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 02:49:39 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 21 Aug 2026 10:49:08 +0100
Subject: [PATCH v2 10/14] perf cs-etm: Don't print missing buffers in
 snapshot mode
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-james-cs-unformatted-per-thread-fix-v2-10-00c4fd0701b4@linaro.org>
References: <20260821-james-cs-unformatted-per-thread-fix-v2-0-00c4fd0701b4@linaro.org>
In-Reply-To: <20260821-james-cs-unformatted-per-thread-fix-v2-0-00c4fd0701b4@linaro.org>
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
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: Leo Yan <leo.yan@linux.dev>, linux-arm-kernel@lists.infradead.org, 
 coresight@lists.linaro.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-doc@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.15.2

The driver produces lots of AUX records for trace data that was never
captured in snapshot mode. Downgrade this to a pr_debug3 message as it's
only an error in normal mode.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/util/cs-etm.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/tools/perf/util/cs-etm.c b/tools/perf/util/cs-etm.c
index d1eb4ec17bbd..6e04602ec204 100644
--- a/tools/perf/util/cs-etm.c
+++ b/tools/perf/util/cs-etm.c
@@ -3318,6 +3318,9 @@ static int cs_etm__queue_aux_records_cb(struct perf_session *session, union perf
 	struct perf_sample sample;
 	int ret;
 	struct auxtrace_index_entry *ent;
+	struct cs_etm_auxtrace *etm = container_of(session->auxtrace,
+						   struct cs_etm_auxtrace,
+						   auxtrace);
 	struct auxtrace_index *auxtrace_index;
 	struct evsel *evsel;
 	size_t i;
@@ -3371,8 +3374,10 @@ static int cs_etm__queue_aux_records_cb(struct perf_session *session, union perf
 	 * don't exit with an error because it will still be possible to decode other aux records.
 	 */
 	if (!found) {
-		pr_err("CS ETM: Couldn't find auxtrace buffer for aux_offset: %#"PRI_lx64
-		       " tid: %d cpu: %d\n", event->aux.aux_offset, sample.tid, sample.cpu);
+		int level = etm->snapshot_mode ? 3 : 0;
+
+		pr_debugN(level, "CS ETM: Couldn't find auxtrace buffer for aux_offset: %#"PRI_lx64
+			  " tid: %d cpu: %d\n", event->aux.aux_offset, sample.tid, sample.cpu);
 	}
 	ret = 0;
 out:

-- 
2.43.0

