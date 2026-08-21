Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF537450911
	for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 09:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787305781; cv=none; b=jPuzuFiOD9uddvG3F7azp4JxRzLWXj3q9bv3YDm5GfukRzYe5hliSxI6aJmtm2pVUGt6NYAaPfCSkSSTSG4wUcSEk0XLesx6/+QNFXh7RcwPW1m9zpvMQgfRbMEW4S1uBigrO6QF0W0GW75RVD7u6J43Umk0eDeTuzyHG27rpFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787305781; c=relaxed/simple;
	bh=RecoXOCNMxrMx0zkiKfC1PDkmODYasriw0nUGDxsh8Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bejxFwFGsjWGkwg+N9Ap3yo9RhTALbIBI044iFd6sZo+rMwESkQOQ7KAFS/1opJV5juFw8SFa1/5I7KcKtCz+tJQxfsdQbw0C9W47hk800p2sI/KYG1tbOD3yauW1EvLeiw37IOtYGa+ljZ2UKgJm2Nkn7imlcE5xDoA7YkGvIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KsjdWvMe; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KsjdWvMe"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47fe377a217so461262f8f.1
        for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 02:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787305771; x=1787910571; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bcFhjwes9A89zvUuGgSpPmP9VQvVv75EU6Q8BfuMsS4=;
        b=KsjdWvMeIFX9sdU1ll+27diRGYXannmkx1oxidLQLoYhsgYdunjdNaxra7hwrjW1qj
         +YKlKQ35w3SCe9ArSPkhm6Hq1sAUXwSGyqerHyGmR/EC9v8zvpytCyXRtpDWnL5gAtcj
         i4YN0rjCRpFzc0//qYFdd+B0xjD06AS49SU+ZZzWpOOywKeBdqguGGRQ1cg2j9H9IDYe
         587n6KTZofTlYW3oIfoWC/svyFe0jTNqX63YkGtwn2xHscRLlA9FairwTegYMtmN1YaX
         HtjtVshcrw+CTdKTxBQNzhuYA9idqwUZ6c+au4PxpUpeNrkrOioh5u8cmu6kNTHh6vhB
         AS/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787305771; x=1787910571;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bcFhjwes9A89zvUuGgSpPmP9VQvVv75EU6Q8BfuMsS4=;
        b=VV/dfCERLsFPqUDgjdDuRc9moz4TNOGDFJPs//X8NWaKPG5J4B4PLdTIkaqwZj/6pk
         BjGqoiTc+rG28xyTbZ0gQ2PeKVpPRwTgISA+4qBQCnBkjAxrbZE8KTOaItzk/c2DonPQ
         xg5EHek4kWB4VbQvWKyqWgpm5G65j937JGodBM7nMlUp5j96YoWWEMOpCjg9STEVgx7t
         ul0z7wErsnRNuK1P34zHgA8jMbmJlJI2XwExPOg0h8Oj7IbSQEj37vYDh0k36n+8KVRo
         c2C7aHTtbreeih7Ii20wX1TrS4FSnFsKQcuJr7CXjKIlOaqvvPuvVYJODU4VcZfQu4HQ
         sILw==
X-Forwarded-Encrypted: i=1; AHgh+RqkijGRtxbfzOsdFwlZLqBkdrztQeglREneoKg5pcrmojarwE4IFatGXAxlpUH8Oa7JrXTwrKgeBtk=@vger.kernel.org
X-Gm-Message-State: AFuF++lC6NaUYowSpzC55TvaGZpbSMU/cwWJq1RLFxqJStXK9I8i01E4
	zCZ9/GTxbB7Kmz4Outji4UR+kWvRbcVdht4YGL9BJKaD93g0h41acu7LhiI3vgN0fcE=
X-Gm-Gg: AR+sD11zIhYpC8mTb4AsF+G9wspjsJ6rlLY82+/nwF5d2E6gkn2vre21W2Fnx6j7JlO
	9Jxu9G8NltDWQpB7r1NMbqzvaCvYbNeil1ylD0BHPfFS1WRhMm5u7CjejWTiT8cI6zAVnYsnEGR
	OXLZsFLVlLNf/vdKSvnx20alhNCtf399RAIz9+jVTEcTY5DNjyNjIbP2JTL7ebjIxxjNsMVvCVS
	gyyl1yPyf0O5c4WoD6ht848BC9BuzbNZQk+Ic6xkovX8lYAEnswP5KCz3xO5oh6/nQ7sboo1cde
	AtXTZgwSYe5q1A6DrdTWTFQ9Zh1KzH5EiWnt+SI1Swk27ccBMsvTIXKEXpgth7d1nl2+h8L1gFf
	QFElhFXdRNgBFb/gATwtVenxrZT4FDsX7WsaCazcMfYjeBJLbA5ynTtMMijfswnWmOd0mTB8v69
	8S9jRso5yaDUFqQ7Bnco3tH9GD/KhYGIhl68OrKuJKgtOfXO4sW3qTtx4OVvNqjzHn
X-Received: by 2002:a05:6000:461c:b0:47f:86d5:d1d7 with SMTP id ffacd0b85a97d-482c0b63396mr7979910f8f.6.1787305771015;
        Fri, 21 Aug 2026 02:49:31 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14d05a6sm17683479f8f.35.2026.08.21.02.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 02:49:30 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 21 Aug 2026 10:49:03 +0100
Subject: [PATCH v2 05/14] perf cs-etm: Increase default timestamp
 generation period
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-james-cs-unformatted-per-thread-fix-v2-5-00c4fd0701b4@linaro.org>
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

The original purpose of timestamps in per-CPU mode was to roughly emit
samples in the order they occurred across multiple CPUs, rather than
emit all the trace from CPU 1 followed by all from CPU 2 etc.
Previously there was no way to change the interval from the minimum of 1
cycle, but custom intervals are now supported by the driver.

Drastically reduce the number of timestamps emitted by increasing the
interval, which is more than enough to interleave sample generation.
This reduces the size of the trace generated.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/arch/arm/util/cs-etm.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tools/perf/arch/arm/util/cs-etm.c b/tools/perf/arch/arm/util/cs-etm.c
index d0486a164a70..d36b7e41399b 100644
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
@@ -477,7 +480,7 @@ static int cs_etm_recording_options(struct auxtrace_record *itr,
 	 * timestamp tracing.
 	 */
 	if (opts->sample_time_set)
-		evsel__set_config_if_unset(cs_etm_evsel, "timestamp", 1);
+		evsel__set_config_if_unset(cs_etm_evsel, "timestamp", DEFAULT_TS);
 
 	/* Add dummy event to keep tracking */
 	err = parse_event(evlist, "dummy:u");

-- 
2.43.0

