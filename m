Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A381255E23
	for <linux-doc@vger.kernel.org>; Thu,  5 Jun 2025 10:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749120622; cv=none; b=E2r0aPVTZiGmGO0su8N6OoatCM7aAwtEnQo8aBCUocdSvdpMGULrQjTSWCxsxkxt1LBQVcz0zNA4cdkdzIiMw8DXsJGmmw5noVNIuASNJJsEq+caNg1n4BvmDf/v3yV7axRpfgIU7S0yxIh4JQgq+6KIqtMrU1BEOI6+Dly9f9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749120622; c=relaxed/simple;
	bh=MMFbkI7zMPzBdRBdPQfb7pTJMjgrsMrJkf8SuH2PcGg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mkMo8EBNKEh9Kh5xPX9x0xfwtA6gXN71jLU8COXf4HGOQ5mWvTDMbL7KV8sYH1G0i1zYaJn9GqqoWCNUsPje6woc5bhJtofAP5+Az44xDgsvqs0Vv6yhG9oiQTED1Amxj/RdhG2mj+gHDYY94zFVbZpOKKEC/MHOBFgZFTjQ6cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s5Yneaw9; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s5Yneaw9"
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-442f9043f56so4277105e9.0
        for <linux-doc@vger.kernel.org>; Thu, 05 Jun 2025 03:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749120618; x=1749725418; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TYtpnIAkK3WcCc9sKEGdtsuC5KifjqgSXfNa01d683g=;
        b=s5Yneaw9KHvOhvd1NjYXiRndEXnRicPmtfIvSUpJbU4CCeD8zAHMw05ghUhtLD+CN9
         04gMz20XVIlaXkPYZ6p6u/AFHBvE83BFdOmbcqUrZGCsksipl/+FssurC3dVPFIH2n/7
         5AwcwzvmEQwUH9MjBGot+IjCqn+ovnNFszmQ5f17cijwjM2N+cEuIDD6TshMxKVX4JYl
         gqsAkETajdXLmeBDTn/ahpqkei0SopherOOmOj37Gg8H2XO53TW69UoalfV4asZbQ1p/
         bZyDiXQC2cTwyMrj402S5bLSVBYAhHj29o2DKqQToy1j/YsxvvQTiMavQytnkwUv7mbx
         pvPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749120618; x=1749725418;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TYtpnIAkK3WcCc9sKEGdtsuC5KifjqgSXfNa01d683g=;
        b=wW1Hx7xs1mGeuSJkIptjWn096+aH7MvT3VOrEsYH/kgQZgFjssTsG9pbLgXQZg5ZfV
         /w/XiT+EXNrdtDVsnp5A4wOMu3NtIrYOSpaitqbUZXg8WRhitgfhCWY5W+Y77e0AGcHc
         sxNhg6z0IPRfa7NSPIF7Tjg9SF9Sn33IBpJg5oyTzFjyfVl5a4EgCnFlrKQ5981K+oCj
         wwwWWxKIeGxQTjQNlVWRnSwKuXWb2EignY6+MYZq3Q8aRmpFglGJhKXAnX4zQ3AEw6l1
         RpJopAgeWD1HVibS+36nZS3vg2/x69V9SUFozer8NLa4VtdUOoY3SnqZPEa6aEw24x7U
         hgBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSUGB7tHE2fuQzIOrhzeRyn2FrUGUfE1HUW9XSTOw/284rdjxT9s5CMWnDjWu+O2ZhzKpHQhjUuLQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yys6Cr8XcZWaHYh8kKMuRwB+DHX87u7K6M/o7OzGKaouV83uCtX
	tpGUjeq9NFAAGLHpU0AAOvhRGmUF6F87LaauPc5nnjX3CJsg3yLoJ29ayGAmJlIu7os=
X-Gm-Gg: ASbGncvk29YCuTiOWafPnrNGW9/lbtif2y96WER+F8Baw1GMHiZB9tStqpRX+fP82y1
	ztNTEGmIg0xJPj+cvT6F8GzGHHjuQpFfeE3OifzKZ4Fc6KQPuYFa4Xf4EdfTBWQPpAw83E45uKd
	DhOXop4EUjx9a2lu+kvkk4KlX8IWjuwMdaVdNapz4O8GwyTFE//92VlbbOTrGyBwpCHEiDj7d+8
	7Ky4y4N1FW8A8C2OEXCEOvvNAyXCjUfFFIWO0eCYYJljpp+8zgxggRLJ12+qvjTSa/R5ldcFTLj
	0nV+q7bblqwFp9xeGgBDQCQ1qqfNYQ29SbBSKDr+3wg/F7Y8zb/7m56SK57x
X-Google-Smtp-Source: AGHT+IF209QtdWKQIFSgWNU834ITMWh9f6gxkjT2rjm5O4GQe4Nyl3IJTR6vikF94ywt0/mEA5L8wg==
X-Received: by 2002:a05:600c:548d:b0:43c:f597:d589 with SMTP id 5b1f17b1804b1-451f0b20d15mr54093555e9.27.1749120617749;
        Thu, 05 Jun 2025 03:50:17 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-451f990cfe3sm20629965e9.23.2025.06.05.03.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 03:50:16 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 05 Jun 2025 11:49:08 +0100
Subject: [PATCH v3 10/10] perf docs: arm-spe: Document new SPE filtering
 features
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250605-james-perf-feat_spe_eft-v3-10-71b0c9f98093@linaro.org>
References: <20250605-james-perf-feat_spe_eft-v3-0-71b0c9f98093@linaro.org>
In-Reply-To: <20250605-james-perf-feat_spe_eft-v3-0-71b0c9f98093@linaro.org>
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
 Adrian Hunter <adrian.hunter@intel.com>, leo.yan@arm.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

FEAT_SPE_EFT and FEAT_SPE_FDS etc have new user facing format attributes
so document them. Also document existing 'event_filter' bits that were
missing from the doc and the fact that latency values are stored in the
weight field.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/Documentation/perf-arm-spe.txt | 97 ++++++++++++++++++++++++++++---
 1 file changed, 88 insertions(+), 9 deletions(-)

diff --git a/tools/perf/Documentation/perf-arm-spe.txt b/tools/perf/Documentation/perf-arm-spe.txt
index 37afade4f1b2..4092b53b58d2 100644
--- a/tools/perf/Documentation/perf-arm-spe.txt
+++ b/tools/perf/Documentation/perf-arm-spe.txt
@@ -141,27 +141,65 @@ Config parameters
 These are placed between the // in the event and comma separated. For example '-e
 arm_spe/load_filter=1,min_latency=10/'
 
-  branch_filter=1     - collect branches only (PMSFCR.B)
-  event_filter=<mask> - filter on specific events (PMSEVFR) - see bitfield description below
+  event_filter=<mask> - logical AND filter on specific events (PMSEVFR) - see bitfield description below
+  inv_event_filter=<mask> - logical OR to filter out specific events (PMSNEVFR, FEAT_SPEv1p2) - see bitfield description below
   jitter=1            - use jitter to avoid resonance when sampling (PMSIRR.RND)
-  load_filter=1       - collect loads only (PMSFCR.LD)
   min_latency=<n>     - collect only samples with this latency or higher* (PMSLATFR)
   pa_enable=1         - collect physical address (as well as VA) of loads/stores (PMSCR.PA) - requires privilege
   pct_enable=1        - collect physical timestamp instead of virtual timestamp (PMSCR.PCT) - requires privilege
-  store_filter=1      - collect stores only (PMSFCR.ST)
   ts_enable=1         - enable timestamping with value of generic timer (PMSCR.TS)
   discard=1           - enable SPE PMU events but don't collect sample data - see 'Discard mode' (PMBLIMITR.FM = DISCARD)
+  data_src_filter=<mask> - mask to filter from 0-63 possible data sources (PMSDSFR, FEAT_SPE_FDS) - See 'Data source filtering'
 
 +++*+++ Latency is the total latency from the point at which sampling started on that instruction, rather
 than only the execution latency.
 
-Only some events can be filtered on; these include:
-
-  bit 1     - instruction retired (i.e. omit speculative instructions)
+Only some events can be filtered on using 'event_filter' bits. The overall
+filter is the logical AND of these bits, for example if bits 3 and 5 are set
+only samples that have both 'L1D cache refill' AND 'TLB walk' are recorded. When
+FEAT_SPEv1p2 is implemented 'inv_event_filter' can also be used to exclude
+events that have any (OR) of the filter's bits set. For example setting bits 3
+and 5 in 'inv_event_filter' will exclude any events that are either L1D cache
+refill OR TLB walk. If the same bit is set in both filters it's UNPREDICTABLE
+whether the sample is included or excluded. Filter bits for both event_filter
+and inv_event_filter are:
+
+  bit 1     - Instruction retired (i.e. omit speculative instructions)
+  bit 2     - L1D access (FEAT_SPEv1p4)
   bit 3     - L1D refill
+  bit 4     - TLB access (FEAT_SPEv1p4)
   bit 5     - TLB refill
-  bit 7     - mispredict
-  bit 11    - misaligned access
+  bit 6     - Not taken event (FEAT_SPEv1p2)
+  bit 7     - Mispredict
+  bit 8     - Last level cache access (FEAT_SPEv1p4)
+  bit 9     - Last level cache miss (FEAT_SPEv1p4)
+  bit 10    - Remote access (FEAT_SPEv1p4)
+  bit 11    - Misaligned access (FEAT_SPEv1p1)
+  bit 12-15 - IMPLEMENTATION DEFINED events (when implemented)
+  bit 16    - Transaction (FEAT_TME)
+  bit 17    - Partial or empty SME or SVE predicate (FEAT_SPEv1p1)
+  bit 18    - Empty SME or SVE predicate (FEAT_SPEv1p1)
+  bit 19    - L2D access (FEAT_SPEv1p4)
+  bit 20    - L2D miss (FEAT_SPEv1p4)
+  bit 21    - Cache data modified (FEAT_SPEv1p4)
+  bit 22    - Recently fetched (FEAT_SPEv1p4)
+  bit 23    - Data snooped (FEAT_SPEv1p4)
+  bit 24    - Streaming SVE mode event (when FEAT_SPE_SME is implemented), or
+              IMPLEMENTATION DEFINED event 24 (when implemented, only versions
+              less than FEAT_SPEv1p4)
+  bit 25    - SMCU or external coprocessor operation event when FEAT_SPE_SME is
+              implemented, or IMPLEMENTATION DEFINED event 25 (when implemented,
+              only versions less than FEAT_SPEv1p4)
+  bit 26-31 - IMPLEMENTATION DEFINED events (only versions less than FEAT_SPEv1p4)
+  bit 48-63 - IMPLEMENTATION DEFINED events (when implemented)
+
+For IMPLEMENTATION DEFINED bits, refer to the CPU TRM if these bits are
+implemented.
+
+The driver will reject events if requested filter bits require unimplemented SPE
+versions, but will not reject filter bits for unimplemented IMPDEF bits or when
+their related feature is not present (e.g. SME). For example, if FEAT_SPEv1p2 is
+not implemented, filtering on "Not taken event" (bit 6) will be rejected.
 
 So to sample just retired instructions:
 
@@ -171,6 +209,31 @@ or just mispredicted branches:
 
   perf record -e arm_spe/event_filter=0x80/ -- ./mybench
 
+When set, the following filters can be used to select samples that match any of
+the operation types (OR filtering). If only one is set then only samples of that
+type are collected:
+
+  branch_filter=1     - Collect branches (PMSFCR.B)
+  load_filter=1       - Collect loads (PMSFCR.LD)
+  store_filter=1      - Collect stores (PMSFCR.ST)
+
+When extended filtering is supported (FEAT_SPE_EFT), SIMD and float
+pointer operations can also be selected:
+
+  simd_filter=1         - Collect SIMD loads, stores and operations (PMSFCR.SIMD)
+  float_filter=1        - Collect floating point loads, stores and operations (PMSFCR.FP)
+
+When extended filtering is supported (FEAT_SPE_EFT), operation type filters can
+be changed to AND using _mask fields. For example samples could be selected if
+they are store AND SIMD by setting 'store_filter=1,simd_filter=1,
+store_filter_mask=1,simd_filter_mask=1'. The new masks are as follows:
+
+  branch_filter_mask=1  - Change branch filter behavior from OR to AND (PMSFCR.Bm)
+  load_filter_mask=1    - Change load filter behavior from OR to AND (PMSFCR.LDm)
+  store_filter_mask=1   - Change store filter behavior from OR to AND (PMSFCR.STm)
+  simd_filter_mask=1    - Change SIMD filter behavior from OR to AND (PMSFCR.SIMDm)
+  float_filter_mask=1   - Change floating point filter behavior from OR to AND (PMSFCR.FPm)
+
 Viewing the data
 ~~~~~~~~~~~~~~~~~
 
@@ -204,6 +267,10 @@ Memory access details are also stored on the samples and this can be viewed with
 
   perf report --mem-mode
 
+The latency value from the SPE sample is stored in the 'weight' field of the
+Perf samples and can be displayed in Perf script and report outputs by enabling
+its display from the command line.
+
 Common errors
 ~~~~~~~~~~~~~
 
@@ -247,6 +314,18 @@ to minimize output. Then run perf stat:
   perf record -e arm_spe/discard/ -a -N -B --no-bpf-event -o - > /dev/null &
   perf stat -e SAMPLE_FEED_LD
 
+Data source filtering
+~~~~~~~~~~~~~~~~~~~~~
+
+When FEAT_SPE_FDS is present, 'data_src_filter' can be used as a mask to filter
+on a subset (0 - 63) of possible data source IDs. The full range of data sources
+is 0 - 65535 although these are unlikely to be used in practice. Data sources
+are IMPDEF so refer to the TRM for the mappings. Each bit N of the filter maps
+to data source N. The filter is an OR of all the bits, so for example setting
+bits 0 and 3 includes only packets from data sources 0 OR 3. When
+'data_src_filter' is set to 0 data source filtering is disabled and all data
+sources are included.
+
 SEE ALSO
 --------
 

-- 
2.34.1

