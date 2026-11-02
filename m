Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793621752;
	b=NmL1ZSTFcqSIavWhxPIE3cSrL8ZCIYObaSrIyRDb/x3p+OcVfkqqAgLD3G3dovo0wUhA
	 t8wXRWtABbiRUPocX5gszo80wUD6VlxNtUZCxE+U3jQU3ELXcE9zgc6UrYGeBMN2IbVbh
	 CS5IRq4Ts+/s5XDg4di/0ozGfvlhsnR8pRYbT9QHcw9a4KlxwY/TwAzoVkIqrwxgdi5Ds
	 mlPhQY+xZrwDE0+S58UkvDksyPRkWEEBTytNprKjuaiuBdFmTKLhSNzH658Mdd+r4uNzo
	 pFBgVcwWgmICwFIbXy80sABf8hHpkg6/6GSBUVFOe9+0IDktYP8746hMXOBQarBmgXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793621752;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=oer2FEylh2AuHX11Qb8KMHS0ZlqBiWuym9WiBTameTg=;
	b=DL62vN2VvbJ4PiEHkNO7O9NAI2jcO0o9mEN8PV57weUCOiCa6ULqOvF1G1Dd+dyNIPRf
	 hfqYwXtZDZZxbSnESYN1cP6efJUPeZf9NACnVlVUnwyEDre0qrtGht0dy+fzzaqAmKFS5
	 Sv7Ae+giXxDABjCVfTmHxhHaGurE6usEJWkDFArUNz+a+EncTErbs7jmNPNyj8ir7CnpJ
	 754jaqWDWf/v/OlEAmh26GrDm0Dt/JfKvI5IcDEhLMrm2iHr7oQZCJ+2SIFblgXAzMCHJ
	 bmxLDtO9EVu7+/7DJregLel9toN+IVQlU8RTgiCBG22lBG4QCIyYqfDLJuDAmUYXLzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gvnO6Qr2;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81F760A2603
	for <linux-doc@vger.kernel.org>; Mon,  2 Nov 2026 12:15:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D81F760A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gvnO6Qr2
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49d05d51553so18390995e9.2
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2026 04:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793621750; x=1794226550; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oer2FEylh2AuHX11Qb8KMHS0ZlqBiWuym9WiBTameTg=;
        b=gvnO6Qr2RYy5zQZT176OT/G2HVWIFwlXQzUK0wo4atjCzvz9E/z4GfaBV/6Il8L+OZ
         i8E7Lm0kFrsJcaKrMqvpGLMiTBZ2zvHVGZslCK3GlC3WrRSg2rn1Atmz58qDexatGiSl
         jdQY2U1LDfifRT9NUR7UPxFrT2DfOrL7hZPI4+FdOH/D8wOs/ZxP1JxtDfiUqXPjN1ZL
         9SHEZ8nP2o1Ecndpf7z68kI31CgVGPfj0kpckDpu0WycpRf+z3FMRrlByLcnFLgMmvHu
         kONwPH96y2jNPhcSLhgch7XLzK17ZbuxJ05/YDbDNBaFsYFPLTeJiWns7GEb7DXy+ZeR
         UK0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793621750; x=1794226550;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oer2FEylh2AuHX11Qb8KMHS0ZlqBiWuym9WiBTameTg=;
        b=KLBcW6gSHpHcAY/VnYTm7b3BlBhcMeLqoFiInXkV2p5UAQEkW+0nTKewdyR9qfjXVn
         RgQAX1+VyKt7LaX5Qe/n4K+hyUJzelbNIsvuKDdJD/i6JuVYQgyjwYzLBv2ClBPhx3ZC
         FpRnTyT9QlcEYzwzcN3s4izepchI+hTOWYAebCC9a0zleaP0yPGE58w4TAftJXCA5sSc
         QGUk3HEiY7/I5egqxltuOyveKwbihgQ5LlwKeZgqCRTJc2rY6rqJ3YQ9hvQ1zEs9uM2H
         hBpwy9XpExC7m1EB5zq+YsTqiqs7Pyp1LtoIruHQMvGlGIASjFvXMgo2bZlg03cSbRCy
         l0hw==
X-Forwarded-Encrypted: i=1; AKwUvBxUJBX4gdcSfcXCaxeO2HIb5+sMPd8Pe8Xu7jeJQQ5oxEf+dRBNBELN2wlGf1HuTA+6UcqZVrBbM1w=@vger.kernel.org
X-Gm-Message-State: AFq9FYIVqZcgl2wJtnpddqSuC97jht0mWez05ns1SOQZarpkUQ4yBhX2
	FD3nSEsjN2+/TzlbSeM97TQLJZG63x+Wd/hPhs5K86G/HJds5VSBvfQOc30M/+N7wUg=
X-Gm-Gg: AYBFou0UzalSxCse2+1Hhr3du10ourlsFXgFGt+bAXnbGBYh1Cl0tk6hjuVgQyACtaw
	vEmIn3qvEo7e45dvb0lxZ19+4P+ZKhGod7Wx5UVSWGK7bKJsv9jNHQez8/e3BoXm9wpeps6m1JX
	4xTEUnUqDtbWPv96ED2T//CrWKgnWzeqRT3HvarLW7mf7HOmY+Av647yUIGWx+mlokLUpJJBn4Z
	8RIWO6RiLCf3E0l/hdn+iSE6dxnRbt85vtc5JXQiDsC5yt935Ete/azdjoqezTvAA8OaK6Rf+8V
	KAa1Ll0noYyC6Zk+zmwEvAnfPBtxsaGFrvvIk/QSC+YTDKTPdIFMJJJAk8moWj8+CraupNDIi2N
	EWUWZDXyTnVUS9TIHOpRy5xWuUt23IG51XuVlfIIXjVSFmn9lHT+7w1XVJ9HYUPaLyvdP6UQ+8b
	jDfsjCMYksX+Msky9mBoF/wTRK5FAmFtxCdfBY5BCEeMXEN2pCdpCHb0IAc4meGZ57leSqeVYP/
	wrkwdkE+MFNOe2KQu+b1jlmhK2qaj7mtdrTSmc6WvDZsGFLOjqeG0ongZRLkZd+7d8qYRba6rcP
	o7fda6jOF7uBfMNSSzYAoOEDhHI8CEOq
X-Received: by 2002:a05:600c:4e90:b0:4a4:f48e:78fa with SMTP id 5b1f17b1804b1-4ac175669e4mr220866395e9.12.1793621750147;
        Mon, 02 Nov 2026 04:15:50 -0800 (PST)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm434974855e9.3.2026.11.02.04.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:15:49 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Mon, 02 Nov 2026 12:15:20 +0000
Subject: [PATCH v3 06/18] perf cs-etm: Don't drop previous target for
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
Message-Id: <20261102-james-cs-unformatted-per-thread-fix-v3-6-dbcb0c281b9b@linaro.org>
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

The branch target of the previous sample is used as the start of the
range to disassemble, but if that sample's DSO is "[unknown]" then we'll
drop it even though it's useful information. This happens when recording
userspace only. Save the address earlier for "Trace On" samples, before
we get to the early exit condition for unknown DSOs.

In a later commit to change the default timestamp interval, trace will
be collected that triggers this issue, so fix it now.

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

