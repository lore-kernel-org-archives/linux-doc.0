Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793879129;
	b=SK5QfBSiNUjVFrj2HMewqGl7tQRWRzqwQn8VJq2nomiTJm4vSw6sqexM7UrVAquj0GJh
	 wGjz64drWyxHAvDwx+OqMxIfJxRkNxi8a4xMnOa3pCZOMHA7HiKXe6TdtWKAmqaVbAN2s
	 YoBwlbrYLzREPcdNRM2v7PWF/nq6Wodqs488h3A84v+MBQ6eeYoAoLYlZoHBdt66PB/UO
	 6b66sBxsCiY7cb2QmQwtdi/KphAL/GUlMNeq93qrj3X7VPnivJbkz4FsaiMk5a/KTmtGj
	 5z7Xsvu/2OWRBcb5sHsX1qfhHK0/9r6+qAnyPLqpjGYTyFwqWr3oyA/nGfPlhMk1GLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793879129;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=8nO8m5nI3CkRV1ykmT+uymlgm9DyQtIp8KkHOyYs+CM=;
	b=16y90mAUgtwUI389hsmU8Cr0HSSfG5+N5dtwCDxI4VFN9UNn4e4rHFdbBSJsPWL8oNeD
	 ovuJd/toAVU1cqKs1+bUFKYmrYv8Hk9AFEcDlcyyehexjHCtg1D85Hz0McrD/RmSDxXH2
	 q46iJFVKlth2eJol88m1HTKT5e271SaWAkZRYthtpL15/FC4NRexzfsdDNVSLYbwEKFDr
	 p38sUhDAkye2JWjdCGJMISfBGRPjCvxJdP+z0tWbUwqrdi99IFpRriod5GOnnb02pYnz4
	 usVibcYvn7Uy9ju6J830lOBGC65q14npSHhU3kOkogyAFWIIa5mSuxk1S8veWn9Ailg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="pyHQL/h/";
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B248060A2614
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 11:45:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B248060A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pyHQL/h/
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a210470b49so13102865e9.2
        for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 03:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793879127; x=1794483927; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8nO8m5nI3CkRV1ykmT+uymlgm9DyQtIp8KkHOyYs+CM=;
        b=pyHQL/h/1OccjhzKL2M1XGln5AqqkPKB3aRWWnpgUVxs+F6BHQ+G8CsT1tLS+pLyZ8
         WZS3VD2svEUucK6CuQ/fLH9kOgHqWH5cYh9Hf+Yca1Sm8tv6XZAYkddWuO5372cexhuE
         FHw8eCyngNqfNJBPYCrQYKJ3OPuACiQVPqqWinnCf4N0iTyfEe5oEs1i7bAUWEbllXlu
         fAbHtiHedKynqRKqeEJZ1b6NSM/1pMimcOOiJB4CmsNNQLZuCnrX5bg/Y1Q7i1c+Wg5q
         uZr8y7EJwNn2R3o/J9fRJKktx7DHV+RtPpg6Qli6/qDEEW6yIcUqvoT/ebSfHe1Qcp0o
         H4Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879127; x=1794483927;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8nO8m5nI3CkRV1ykmT+uymlgm9DyQtIp8KkHOyYs+CM=;
        b=1NaozO+QDqQdl/nWkjDdjj7GuhJKSpa01SVBtWvAUqzIzN+Fx/OifS2uWyng+Oxlqr
         7/Som8qZYZHidKMP2cxr2ATFKKkYEk9kzn9iNV1zpFolZzjyZczxvm/cP9JjsbeY8AYS
         TU3tj/tTXGnaRvGtKE8n49mOpJjetAijDdBknAfLO8p8lf8Nz0bUOoFi3XEfYr3R3rwc
         c2IHqR1z3W0QGF9tbd0xAXksQmQVzahjjnOXkhrzIXjY2yKlbNP82/pOQ+JT4qnchjR1
         oahr1/nhzzq6lu+fur5Efa51Vbr+tsKCdeZIuePxEqAWej/9SNr9VbSd68SApMFEtM+u
         UxuA==
X-Forwarded-Encrypted: i=1; AKwUvByGl0eu/mMjghwKcCndZK3Q2KrL3zmMNNvl+mv9vnNgFMrjVKwDx+ThhdOi8L8pCnG++mdi6lIDs/s=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Q9FxGv6z7s+/7aeKn5+tVOWml4rkF01vHtF3c+IPyAanWnwy1
	G3C4ix5Y9diVcNrL5rmfm/nolQNtfJsp+X0qbjus5FpIlkzMHyKFcEVj+J1B9Z+KbdI=
X-Gm-Gg: AYBFou0vg1gm6fvHR5uZpg2zzSvDtEO9cAr6PewhLZfCgSk1mNFoXqkuedXhebH9ghj
	ohwLRrQ3HDf+RffpuhEhBWB+5TuAClXxZI0QXsVRpWA4jE0dhya9yzltY3JKGJorRTRZ1IxdjOD
	cQctq3r6bUeo7uKDQOB8R9hfmt8uQuaIPTaREg8hHnb05ktrEdis4LFBRf07UuyUvLUDh9zoRQm
	sX63MLQwVkQHoRLNGe0EoemaONXKOb+oqa6qqHvqFTdKbdJ/jpMj1GU7u2hujTI8/4JKhkC2IEI
	YdxR0TUpjpRfmHjNa+deNK7jWxEzdOhJzqbZa2fR7JFwZyPZFj7L/ApUtr3izMkhbgUFyzCYFHP
	ptErGTE9NbcCXS3ULBWfX0cd04rsEiQ8MOPIKKsdbqDuWcUBaWU3TihFVSX76wZkekG7iKAKJzd
	F5oAQ+ou3SOIH5wCvPLMGEWTRn4K3IDrPIMjIebKVTPz9gsgeEEjvlbrJghJnIEzdt9l+b26lFL
	bcwfEl/3vbeCAYejTXzr2N0EsWAjijMbUQEj2stt6qygntdfrsJnHMkOh3A4HWm+j5aesPSsTup
	d242A0p2Wj/353IFqr1Iw7N/L1WuqfYlKg==
X-Received: by 2002:a05:600c:64c5:b0:4a2:150f:1613 with SMTP id 5b1f17b1804b1-4ac17a367edmr428463435e9.7.1793879127187;
        Thu, 05 Nov 2026 03:45:27 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b571f46538sm56679525e9.5.2026.11.05.03.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:45:26 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Thu, 05 Nov 2026 11:44:54 +0000
Subject: [PATCH v4 06/19] perf cs-etm: Don't drop previous target for
 kernel samples
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
Message-Id: <20261105-james-cs-unformatted-per-thread-fix-v4-6-7759e0ce2449@linaro.org>
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

The branch target of the previous sample is used as the start of the
range to disassemble, but if that sample's DSO is "[unknown]" then we'll
drop it even though it's useful information. This happens when recording
userspace only. Save the address earlier for "Trace On" samples, before
we get to the early exit condition for unknown DSOs.

In a later commit to change the default timestamp interval, trace will
be collected that triggers this issue, so fix it now.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/python/arm-cs-trace-disasm.py | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/tools/perf/python/arm-cs-trace-disasm.py b/tools/perf/python/arm-cs-trace-disasm.py
index 1812ccaf4b20..5a7daf927bea 100755
--- a/tools/perf/python/arm-cs-trace-disasm.py
+++ b/tools/perf/python/arm-cs-trace-disasm.py
@@ -52,6 +52,7 @@ DISASM_CACHE: Dict[str, List[str]] = {}
 DISASM_RE = re.compile(r"^\s*([0-9a-fA-F]+):")
 DISASM_FUNC_RE = re.compile(r"^\s*([0-9a-fA-F]+)\s.*:")
 CACHE_SIZE = 1024
+PERF_IP_FLAG_TRACE_BEGIN = 1 << 8
 class _State:
     sample_idx: int = -1
     source_file_name: Optional[str] = None
@@ -252,12 +253,12 @@ class TraceDisasm:
             print(f"Event type: {ev_name}")
             print_sample(sample)
 
-        # Initialize CPU data if it's empty, and directly return back
-        # if this is the first tracing event for this CPU. This must happen
-        # before the dso == '[unknown]' check because the initial
-        # CS_ETM_TRACE_ON sample has ip == 0 (dso == '[unknown]') and
-        # carries the starting target address in sample.sample_addr.
-        if self.cpu_data.get(f"{sample.sample_cpu}addr") is None:
+        # Initialize CPU data on the first event and whenever tracing resumes.
+        # Trace-start samples may have no source DSO map, but carry the next
+        # range's starting address in sample.sample_addr. Instruction samples
+        # in the first range also have TRACE_BEGIN set, so only check branches.
+        if (self.cpu_data.get(f"{sample.sample_cpu}addr") is None or
+                ("branches" in ev_name and sample.flags & PERF_IP_FLAG_TRACE_BEGIN)):
             self.cpu_data[f"{sample.sample_cpu}addr"] = sample.sample_addr
             return
 

-- 
2.43.0

