Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783B9470E85
	for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 09:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787305780; cv=none; b=MbuRQw0MyZrgXFaroUJhA+JUkXuvLs46Bm8nLSHAx8QJfx7AA0LLgLBdz4RL8swb2AFIpupdCb/iSz5jynHS9G8VTIAopMpk8nKzU+PeQhcuqWl38Gp8yUl8ctijYHosgeV6AFx9tnDGf0oca1KTb1dx3qkqJYIPS5cXyWT5gwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787305780; c=relaxed/simple;
	bh=fP2IfPP/3FxAZdBFPU46BWk56GVJBXw30IVSIBNxU7M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=imLEL95wzM7DgCXDyv05plsy/lxfsL7PnTGqCzUlm7g3tCD3XUR57TtxAb0kVeTmeeX93d3uuHysSQzhzOJpSPLwC4g9xu2bw+y/hQr+YSGTPLIX1TCFVlQthl+bRIoH12Xrt3DYWaiXpmUf+QfEhN6hJ9kOS4gI4Myw/A05/lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h/k48Rod; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h/k48Rod"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47f6609c657so374983f8f.2
        for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 02:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787305768; x=1787910568; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SdlWRdH/H8iL8QSy1QmXwkvjy5+5wNnPwJoBbpgZwJA=;
        b=h/k48Rodqxb3mS2n5Ozt4WGa7c1lfMDtzjRWobiRl0l0MDYLC0OrGu+r1yVZT70ad0
         9UhHiBGxBcQycjA/p7Ij24+e1ch9n66GHCuWX3CW5gPB4Xx+2kzV0Kah/StXUurroalM
         UVdQIUVBHj1FalGOgEt5lnVj/ou2/4/r+t+JJ2BQw6JHp+HWlOpv6YD3dvRyj33f2v8H
         +mkD7ey9aqaanyrTf1fffBLf0WR8FzwKmP3YIidPOzhCbIVRhdnfZC9r4EN0TS+tlFWY
         IA/6Dodk1EuNVVM34G9bX0+U8FUlt0ob8SHejSZaLyESAIISr8Ip2s+utvgtj9c9Dvvo
         Shkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787305768; x=1787910568;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SdlWRdH/H8iL8QSy1QmXwkvjy5+5wNnPwJoBbpgZwJA=;
        b=kcJ+70W7YiLkZhgDu/Ya1A65zbSRWeplXK7Uxcw7f9fkACgtafCp/aQr2aMfVA7TRo
         RqqYtvaxp/3DbuGdeMFoReJOCF25NdHrL59Ig8XWwhV5Qrfxm3S815R8cRgMJ5TfJGQi
         ctS9bdS+G3dHo/SaVfUDjuoIseRWqhK/VQ3/shaBOsBj4am1KOmXL5CrHgfQSG1o+HhY
         q4+HB3wffzJkW4c9LrKUgJq04INT5IWDqFQ9l6ekOdgXYT3jvvdYWdQ37qkEYNxbmlRD
         hLdmgOCMIMqncyQkj8xBDJw59Cb1AemYY45gsV5+dUCfOidP+liqR8UQTE0XFpJ2wdru
         e4sg==
X-Forwarded-Encrypted: i=1; AHgh+RrrqrOZDxR3vse36Xo6zWRWWncbPo/WDIw/2dwZQVAZdF8FD/sSudqJA2/9brLHICzsC+QndP4dLVk=@vger.kernel.org
X-Gm-Message-State: AFuF++n70oamSJYtzLVDsHhifkx0LEnl9fPLX2j6DNtQTQJOKN7yBrAR
	hMgTsv1+g2gUxnc5MZ97P+EmzkjC7GjK230VqUKwwRXXa9TkG/Qchsz4PrxMPMO4yQw=
X-Gm-Gg: AR+sD11lY+tAFhdxuhfMnvm0WIr+dvkelAlOR/BcSqjUxdi+WKM03aHMe6/qlZ0jE9Z
	gI/p9jVvClXB0GLwoOLM3yhoscUdXUFTL6PlTOr+0SDout4rpzF4CSCk1g787uccrnc6BwaQCm9
	3otxx9VuDnhj6lN2ZUrMZZ5eNTPhSM44mm2ilawgo5oN5PknM62lp0kxh2ZtOMbR7I6ZvssoYyI
	szTB2rjWPHkFujsVWsVLy0svzzBpD8EV6jvFj4EKup9bWDJrgp0fdYa8vManzH56XlImzx+R5QP
	DcmUfNkb1ekb4VwZzhx0edFYOwbhD1bfxUGtqX8CsX9EYM1/BSoe+8h9TjC6PDr97oa7xGCOit5
	tiHwFdHjRGiJIyekYRlcHOELkVSZV41lV+cXHykhYEsR+i0mpIVrExwu6BQwVv/yN2xadf1vhTh
	TkQ7kTPLQzoFpIRYRTiH2T+aA75A73NM4qNaCt1yo48Sy7V9xz+Pz4HPXZcxPA1pQJ
X-Received: by 2002:a05:6000:1aca:b0:47f:86af:8fdd with SMTP id ffacd0b85a97d-482c0b588eemr5703982f8f.3.1787305768520;
        Fri, 21 Aug 2026 02:49:28 -0700 (PDT)
Received: from pop-os.local ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14d05a6sm17683479f8f.35.2026.08.21.02.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 02:49:28 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 21 Aug 2026 10:49:01 +0100
Subject: [PATCH v2 03/14] perf cs-etm: Turn on context packet timestamps in
 per-thread mode
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-james-cs-unformatted-per-thread-fix-v2-3-00c4fd0701b4@linaro.org>
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

