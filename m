Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793879131;
	b=27E4C4x3mric7qxLavusLMdF/1arHbT0+NSTP14IJOxp+yB1oES1fBP24Rs7KZwdIUsu
	 U4CVfCiVsaslmlzDm/Gc3eBJXZqz8AYprjJvn7XsGr6k+r4tVSq/l8VlAgZuixLtYs69r
	 DM6sulrV+Tq8FPyVmPi7y2TZiddJrH8EgUVz5LIqZ30B+/E0/W0nQMcxeHve3r79z4t+S
	 FEZ7oJh36JQvEEGzwDeYrW8CuMpejgaCa48Epnh++NvJgD3ivPYUGJb9LcJKo9lOMfcg9
	 45UIF5/1zu8OYkinqAXUvugstrXb3xgvbYfsByu0PJU9yfv1U1OdubPtYS+40sIgfsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793879131;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=z49MEnSEMTTPulUvnX3mC1j6+RjZ98X7wWOuw2hUt64=;
	b=fPh7KBvXbM46LkS81adcrGcR1UhNVJpLBiUeQ2/BxI8qqIAvVF6MsGxaREFFpVJ5/xdN
	 0sNiZIsc1pLmBRtQi9Xa5hCqbY+xRtAtF1hD9sZwEVZDo7d/zwZbSOIGoP2gblwCg7L7n
	 GRmKdhYJY5rGVxUHb6JV3vbSFowcS41qx6qVZxzOU4kAR72zXjuV6e4DGHAiOdHi9/b7/
	 OFzD59BdDBDjAXiERc4aHn852OKCohPyunLbcmofcWwQVS/rmCZ6ogXJOUmH4kXoK+Haw
	 mnFqZdOOj8A5iCbxz2enoyoU5lwcSt6JaMF6nz2/hud7b5mAIMH0rdGxx+4kyiM5XqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=yILaHeZc;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5562B60A381C
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 11:45:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5562B60A381C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=yILaHeZc
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so10752565e9.3
        for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 03:45:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793879130; x=1794483930; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z49MEnSEMTTPulUvnX3mC1j6+RjZ98X7wWOuw2hUt64=;
        b=yILaHeZc6PMoxawalEI2guQkSUg2FMKKo5Cp/DrUT2PIApDrUgx3D1dK02yTVA6C2x
         AmNBh2iGE6RidU1GP2wSWZcmfi9lWE1XETgYPPHCX3f/rmgnP9XR69UtHvWzy7AAnWgw
         NLrwh9FAIM5ntGj/x1V77QZGv6DoLDTxED/l/RhCA90JIL4EDtoSwIq1yh+xFLEDVq3E
         vvTkP4dbciCHCDu/UzsArZww27OYuuMrulZhNwY23B9fSKc9pzAYs5souOzEQqEFrqSI
         RKrXWWp4ZF1L6M/HYavQobB0xU72oPgjasPU1RyLF87EvMLfZZGtez6+WPWmmFKvJTo7
         owUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879130; x=1794483930;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z49MEnSEMTTPulUvnX3mC1j6+RjZ98X7wWOuw2hUt64=;
        b=oyrksb4x6YjQp+XA3CUrr/HCr9ytifgHnRUOg8CJTX++WGML5Eh+0MDYpFRTDJGltq
         VXMhTmzE9pCTOa/qujfT8yrEALxpXl79tviQ0b32JJtrEvEe0CJ4vch02Y9DQAJpl0Sk
         eRn2jH0Z5o0ZlAdsjj5Od2KK5wZfQXjMOM9gbbQJAIJlFouHmyH3plf4Or4Aje9Gd16H
         ej2MrYRkSIuX53OOB3XL3loNCzQ9+Jwf4Sy/HiQMzb8bMPhKLf1cgURluuBL/7Kt8ywv
         VzJD2pCWOC9FIQ6sF1J3na66p4ThNImzs/zLUI0ISUuE7euLWux2kluoWP+Y6h6iTZZC
         wwRA==
X-Forwarded-Encrypted: i=1; AKwUvBwb9gsPwKZ+hjJ5sTeqolygU4vxtV9Jdo2bR0ixszoY+zGM/BCOyUeI+73rgt9PsKrYLkk090Ne1zo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8lBZmD+E0jz7KyIldOuwyZL9rQt+KgwROGcYUi5UtWxDZDWNCl
	EeB2HmNnPnHDL0ZY/nv0HPhbxf9KBjhwQ+s7wsS//zURzbbBM2dLPYqIIq5qDhvimvk=
X-Gm-Gg: AYBFou3g+gAS7h3GdKRiQJKeF6SJylCxENFpYldoiwAeV5s/oqrdtuKfjPfFR+ehnHc
	T2xl/E4V+DQqqBww82PZ4NHGrgTjD++JtWgU4YMM3Xx3Bv0mNHId/O4Y3MsS8DSrJlVCYd1l/F4
	0vgMztY9GOy6cgG6xcAx16Rf07LDd7o9oSc+UNq3eJa98mDGxHzglf1cun+mXDJGEtN0OuMc/yI
	h2Z8jmnRWRMRuKataTp2GIE88mFo0eJ/efKMkL04kUSafERdehdCUwcpNm1UGetQ+WdRCDkac5a
	nXavysziUlTmeY80bl9Oc0wyrdDMuzReqTvEXLZsSvJ6DKdKeWX/xMXMqmk4Ry81gP+oHVAyOsE
	xrzVtCZb0aRtVJSQpUv4iy8G/z+nGFidP0LMo7w1Lcg/xBzuXC1nviqXwFG1lPgyduEk9cOmXQm
	ICm9Jy0rcMKkpEcMkHIj6qgwVh6CgMZXbncAV0aDvwzgPWUi+JRwvy3dr0DLtjLZ0LuWuUgfFWB
	M5YzrObMtxjsG4LocYt7fS3FWG9KlU0SoqWNtzhcgY4syWlLCUB4iYjK1AIgdSF3vhElUXMw4hE
	y0GMNRiO2UpMZS4aF9pNmoC3us/zP9bQ
X-Received: by 2002:a05:600c:83c5:b0:4a1:78c5:79f5 with SMTP id 5b1f17b1804b1-4ac1970b976mr357815775e9.33.1793879129751;
        Thu, 05 Nov 2026 03:45:29 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b571f46538sm56679525e9.5.2026.11.05.03.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:45:29 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Thu, 05 Nov 2026 11:44:56 +0000
Subject: [PATCH v4 08/19] perf cs-etm: Use instruction length in
 disassembly script
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
Message-Id: <20261105-james-cs-unformatted-per-thread-fix-v4-8-7759e0ce2449@linaro.org>
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

The disassembly script adds four bytes to each branch sample's IP to
include the final instruction in the range. For an exception sample
whose IP identifies a faulting or interrupted instruction, this
incorrectly includes an instruction that did not execute.

Use the decoder-supplied insn_len to calculate the exclusive end
address. This preserves zero-length exception entries, includes executed
syscall instructions and also uses the decoded size for Thumb
instructions.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/python/arm-cs-trace-disasm.py | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/tools/perf/python/arm-cs-trace-disasm.py b/tools/perf/python/arm-cs-trace-disasm.py
index 5a7daf927bea..7cf0af5d2780 100755
--- a/tools/perf/python/arm-cs-trace-disasm.py
+++ b/tools/perf/python/arm-cs-trace-disasm.py
@@ -315,11 +315,12 @@ class TraceDisasm:
         #     [ sample_prev::addr .. sample_next::ip ]
         #
         # sample_prev::addr is stored into cpu_data and read back as
-        # 'start_addr' when the new packet arrives, and sample_next::ip + 4 is
-        # used for 'stop_addr' so objdump includes the branch instruction at
-        # sample_next::ip.
+        # 'start_addr' when the new packet arrives. Add sample_next::insn_len
+        # to sample_next::ip so objdump includes the last executed instruction.
+        # The decoder supplies a zero length for an unexecuted instruction at
+        # an exception entry, excluding it from the range.
         start_addr = self.cpu_data[str(cpu) + 'addr']
-        stop_addr  = ip + 4
+        stop_addr = ip + sample.insn_len
 
         # Record for previous sample packet
         self.cpu_data[str(cpu) + 'addr'] = addr

-- 
2.43.0

