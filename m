Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656ED45FFAC
	for <linux-doc@vger.kernel.org>; Tue, 18 Aug 2026 13:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787061385; cv=none; b=R1jHEoaXFZObRe+ft0KmSbV+6WjV/luXlKAkgTS5lWbTUfsO0nRLq7019mxh0xiuK8k3CDC5pC9yb6Uj3N+T2v6NP0DCEbOFlDc9MR3zLRWdsizfeALq1D5TWzqJ8KwN2pPzTakSbA9wOTSVrIr7nA184cRM34yK7hPG6tDatPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787061385; c=relaxed/simple;
	bh=UAFW1DzG8QNfOFMxCJEWJworEouQUSKkS4nGttLn4hw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lOgDUc+TMBTr6/yhyld2JyCukMBoiTptDq2R6XGdqvy5HdygP9vdxDwDZxgG2COeCVuku9VN+IC+mIPLyqqnRMRfN8V/opUa7U3dfG6kEDBn0fxfzqN4sYfN+lRXnhhub/uzfVx3M6FVy7vDpwM9jWtBCe6yI3lQIS19+43Iy7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S8P7NRlZ; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S8P7NRlZ"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c197e7e4e94so795055566b.2
        for <linux-doc@vger.kernel.org>; Tue, 18 Aug 2026 06:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787061381; x=1787666181; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BfVwBRBTF0jPp/yG8QTZc+4bKOm0do5X3TsF0PgtG70=;
        b=S8P7NRlZZocDiLDMPUD56qQuDj5hZQBhbTjcqoWGiNNeAejYcolQEIoxCxEBRei/nP
         Xq2d8cTTjeKdsu5Uy6zGFD+vdhpaRhhzG3ksBuZCzztxwKIt9VDdQnxWUOGPSQRWrvmF
         tbAAtVpy8vCgQquS0XwqWIKJvnmXsA6B8de4ddCqHcyOIA5Digi1A9DmVa6v4rQL1hQu
         I9z7kpLsMcY8/eJr7H1fn0ZwTHFeolabLz6s7y5ZK736yw3L9dVrXMlhmBBdjXVAgB7K
         7inPz6ySX4G+eHIDAWhHZzarv8HK7MygcT9ZdSuFGvGx61YAyWUhiG2mZzoWnnV+nluG
         cOKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787061381; x=1787666181;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BfVwBRBTF0jPp/yG8QTZc+4bKOm0do5X3TsF0PgtG70=;
        b=njeQzG24uoJW34RWbRkSZSVJ7cbJEE8ELnpkgCv/qNFMaRcZXqiP9QFOOqEGkPkaPm
         bkuKBAbEcVFu6lzIbs9vkPn1Qaz0fL+Vv/7+tva2O8iSnpv8v/dtLU4IdectCuT9nGMk
         1fRPrYS5k/y1MwDVbw02ClNt5X+fm6Hav0UbriiaPf20bPAsJQjylIAGjnwK+nKco1a5
         gI8WGCi11Rz7pguTJOUPpqBmMdVI3eBDJNq0/l1AZrywedJlQj6u0gfsb1rsrM+P3GGH
         KmuOdBHS4LneWFFiQP56hdKiOtd8HEJkYc11dPSZ7rqDkVeyk5u++t5k4ZH7kIA8hAkS
         Q2OA==
X-Gm-Message-State: AOJu0Yx7nTLN2TNwjb1f0dSbNHk6uCzETJyAnZTTqirj8f0r48WTx6pO
	3HQoI3S55JNpCEjyD6brrk1nOXffHJslPd91JDgY3GIr40HcKdVH+UHkLSkel6Dc0z0=
X-Gm-Gg: AR+sD12d+EA0b/fxU31jY3VVtzyJ6RuTjWhIBskqfgmBHMteIdjiV9RJhSckqnIMtfx
	q1HtxTIFL3sI5r8CkTR5NZOXCRPhDKq/vJD6XzOjzQ4GbXu+t/ZMaRiom6UXsTPiHl1aNuRtYuu
	GBw/Ui1l48WHquAz+dwmVMNceT5m4Abatpfv1zGVavk86oREb5mZ3VaXWbpDQmvNuGQKy/L0w54
	juVsl7Gy1Aa1zfdesCh0iSta9q48tqqUhgy88QdU7OYwVIRg6WvaFq/NSIGghv16SwdZxVo9j3U
	uF6PzdF7tJ71q+I7zIrt3oF3RDqfbPb/OikJl+hOk8sivDCtWHJI/8NVCuIOYMx/bOwdxcPejhX
	k3VwfSHnvDEFp1OuSVxXOpdrkBrHaTFD/hq3ysmT20MhZIicCJ5E2S1wVE2w1k71Dpqrxcp7Y3t
	1NzXUCNIrBIOS7A3VmlPLgdBcZ1YINOn+Ve741A2N7guFOa43KFYUFum25EAYAE8183w==
X-Received: by 2002:a17:907:3cc2:b0:c12:3059:4071 with SMTP id a640c23a62f3a-c212a2b2dd8mr1933707366b.15.1787061381408;
        Tue, 18 Aug 2026 06:56:21 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2185bc66bdsm163356166b.58.2026.08.18.06.56.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 06:56:20 -0700 (PDT)
Message-ID: <eecfa618-6bc8-451f-ac9e-9ae5b08e865b@linaro.org>
Date: Tue, 18 Aug 2026 14:56:19 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] perf: Add CoreSight branch history to existing
 samples
To: Amir Ayupov <aaupov@fb.com>
Cc: linux-doc@vger.kernel.org, Mike Leach <mike.leach@arm.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Swapnil Sapkal <swapnil.sapkal@amd.com>, linux-perf-users@vger.kernel.org,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Leo Yan <leo.yan@arm.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, John Garry
 <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>
References: <cover.1787005265.git.aaupov@fb.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <cover.1787005265.git.aaupov@fb.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 17/08/2026 23:22, Amir Ayupov wrote:
> CoreSight ETM can synthesize branch samples from an instruction trace, but
> context-sensitive PGO needs the branch history leading to an existing PMU
> sample together with that sample's event identity and callchain. This series
> implements that mode as --itrace=L, following the corresponding Intel PT
> behavior.
> 
> The series first separates timestamped queue setup and teardown from the ETM
> decode loop so decoding can stop at an existing sample's timestamp. It then
> reconstructs branch history in the thread stack and attaches it to eligible
> samples without replacing their IP, event, or callchain. The attached history
> is consumed after use so a later sample cannot reuse an earlier trace window.
> 
> This enables a context-sensitive PGO workflow where a cycles event supplies a
> frame-pointer callchain while duty-cycled ETM supplies the path leading to the
> sample. A dlfilter removes samples for which no ETM history was available, and
> the documentation describes the complete recording and decoding workflow.
> 
> Changes since v1:
> 
>    - Rebased onto perf-tools-next at d17c5b770972.
>    - Dropped the HEADER_GROUP_DESC reader workaround. The issue is in the writer
>      and should be fixed separately.

Doesn't it still need to be part of this patchset regardless of where 
the issue is? Running the new test is blocked on this. Also is this a 
regression? I noticed there was no fixes: tag on V1 for this commit.

>    - Dropped the branch-stack hw_idx patch after review established that zero is
>      appropriate for age-ordered CoreSight branch stacks.

This doesn't seem to match what happened. The original patch initialized 
all branch stacks to hw_idx = -1, which I think was a good fix so 
shouldn't have been dropped.

Coresight still sets -1 which I said should be changed to 0, but there 
doesn't seem to be a change for that in V2. So now we're missing both 
changes.

>    - Dropped the local wrapped branch-stack copy fix in favor of upstream commit
>      ab9c84d1cd59 ("perf thread-stack: Fix heap buffer overflow on branch stack
>      wrap copy").
>    - Added James Clark's Reviewed-by tag to the dlfilter patch.

>    - Consume branch history after attaching it so samples with no newly decoded
>      trace cannot reuse a window from before an untraced AUX pause interval.
>    - Flush all trace-ID frontend thread stacks when their physical ETM queue is
>      exhausted, preventing stale history from surviving a trace gap.
>    - Check every matching CoreSight event when deciding whether kernel trace is
>      enabled.

Were these changes due to my comment about the test not working? Might 
be worth some discussion about what the issue was on the V1 thread so 
it's easier to follow along with why these changes were made to V2.

>    - Reworked the shell test to use FIFO recording control, removed the invalid
>      bare timestamp option, reduced the workload to 10000 iterations, and check
>      proc1 and proc2 callchains independently with bounded failure diagnostics.
>    - Renamed decoded test outputs to script-L4 and script-L64.
> 
> Amir Ayupov (5):
>    perf dlfilter: Add non-empty branch stack filter
>    perf cs-etm: Split up cs_etm__process_timestamped_queues()
>    perf cs-etm: Add branch history to existing samples
>    perf test cs-etm: Test branch history on existing samples
>    Documentation: coresight: Document context-sensitive PGO workflow
> 
>   .../trace/coresight/coresight-perf.rst        |  62 +++++
>   tools/perf/Makefile.perf                      |   1 +
>   .../dlfilters/dlfilter-nonempty-brstack.c     |  26 ++
>   .../tests/shell/coresight/add_last_branch.sh  | 203 ++++++++++++++
>   tools/perf/util/cs-etm.c                      | 252 ++++++++++++++++--
>   tools/perf/util/thread-stack.c                |  17 ++
>   tools/perf/util/thread-stack.h                |   1 +
>   7 files changed, 546 insertions(+), 16 deletions(-)
>   create mode 100644 tools/perf/dlfilters/dlfilter-nonempty-brstack.c
>   create mode 100755 tools/perf/tests/shell/coresight/add_last_branch.sh
> 
> 
> base-commit: d17c5b770972854a4fe4cf5cc22e17eb21cdc787

