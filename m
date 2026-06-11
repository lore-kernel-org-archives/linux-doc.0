Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB5B34B410
	for <linux-doc@vger.kernel.org>; Thu, 11 Jun 2026 08:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781167028; cv=none; b=ZQTWfp8s8NBkishy41HtNy9C4Qp23EaOf1gXIdM1TX4tod+4rvBShpRulHLqrlTqISRUxk/cDkwDwE+csqZUKf8cSTgf248oYxj+c4bvYEYTRHjRf+RuGJ3vxMSzGhd2XTras6vfwx/rsktBr5BlKjy2S+fJw9QQZ7LnqNRTIks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781167028; c=relaxed/simple;
	bh=hgm46owwgzMaUFcHl+HzgyGCs3IA4eHkTIzGrzQLmes=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RLcbsnzXNsWneiT1pw/w6Jl7FpKPTmU4pvj13JGsp46y1XIySmHjub2Nu4tp1bpZe0QDGJudg5qk7Z4MHXfVbLAJ9S0u26+gA1NwgVYeJoucqcKuRPrmqrynQnvs7S/Db3xLmKYUdx9zOVO3wGcJo5CJM7eowPAt38h9wOx+M9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aWkF66MV; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aWkF66MV"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-bec3f69d343so1170733066b.0
        for <linux-doc@vger.kernel.org>; Thu, 11 Jun 2026 01:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781167025; x=1781771825; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BPKGA+9bAXXUvMOMX/aVwRfsICeQnV0LevsQ5Yfaev4=;
        b=aWkF66MVQgqb6PXpyOi6H+Nyw69qgvxGpI4cZuz4cqFUKA7pT+m8mH27iRXfTgl000
         zF6X0B81D21XMfonJVo89YuQKxc1cU7eVcllNWrrpKlHDswfW6AJX/6cEW2bJ6XA7ZNw
         /+e/sQ4EWgSXAsNXMp9gUSjK1yYPbKggmTQN2LJdbl9v8W4+7aBRlmp78Yh80+y7pQIG
         auHva1AgS7Mr9FSpIQyh94olBelvn8talms+ooio39HWMfCHt/fenzTf12wrO1NOKieB
         HP4ysmPC04gm9PCrKWmQT4+vOcFmsZSVx2EM9xHYR1QxEPjOwSOzgmVugY3qopSU7YAn
         w4jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781167025; x=1781771825;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BPKGA+9bAXXUvMOMX/aVwRfsICeQnV0LevsQ5Yfaev4=;
        b=l41TUpZw+tccYH/IvcLuDshvdzv11ZU8GuIUM5mSPt8su3mlqEOcQ2EkIFHRdqo4xU
         DVpHKPcOkIgLRY0wez0SdwDmKledQ34vGYf1ILP3tsu/3SMHlZaqTwAF2NeqfbE7wvQo
         lSnxwmJ6hnJwS1ouvX3TcsaRfEMAFdkdi87ZqGZeBpvWqDLXGAi6sxYxYTeVYe6Yq7dn
         43bCJ3CddkLSPcEgZHDClDzkBnuYlmW5N2pa5X8MlvE+IL97uuHsvhf1ZvOTNiBJwfk6
         yPKFTIZeblsqVBM3MhkgMxIvz35XzXaxG07SnsPEtGv/b0OffHnVmpwmQQVkHRACoCta
         2daw==
X-Forwarded-Encrypted: i=1; AFNElJ/hCxf4HzwStNXNXj6IeD/WGGJEornQab4vRo2RsWDj289IK8pcavG0F0rk13SOKbnW84EroelMm8Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxL5xvBUIi451OqNHZ9Nai2MM78lSv3RpZghxKy9XSWmkxmhRx3
	8u6YMscVO0Y7LrbRQCyJLzHEk/OxiI+2JIZ4+a0puBtU1X4/Xjkr53ZUJptNiOQf0kw=
X-Gm-Gg: Acq92OEA3Gt4IzETTRS+OG5Zsv9TTU6Twg6O06UaSsdbrIv07lrQdbKTjfPcNqDwbAB
	zZoKuAOqGfDQXqN184gZwSkBt4i4BebltEx/3OR4C801qQAaz7OfO9ybvvvfa7l1QIy54ioJ0fq
	zeCpGK9swb8wltq0uowuC6jluSrBD31vJO1Po4gqSTxEgom265t2cQJVCwuLhYd3uufWMtaEUwN
	gAf7EtilSxYpOGig2hen1lyocr5kFRNZ5JhKOr+5iox74omoUvMZv6bFmZkhpPZsJ8sx8ssri0q
	NkoARLcuFeqC2U+/ppVhCQNSzBXoYa4e5pxBlO0as+/aoex2YnqrgPldQuUZEhf/ghvEx5kJ+Eu
	Dr4dGJW1fg0S5V1S5ATzdmCoouRMX7da9GdToUjLzQK89CUX+Y/jHgdXeDx+1LPwoPRRs+qLGis
	TP5w/a/ICK+/tMR5WKCarGjavWtDfGaSJfX8+eSM0=
X-Received: by 2002:a17:906:45a3:b0:bef:12f:346b with SMTP id a640c23a62f3a-bfc85a69a60mr53713466b.15.1781167024810;
        Thu, 11 Jun 2026 01:37:04 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb0f15621sm30523066b.13.2026.06.11.01.37.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 01:37:04 -0700 (PDT)
Message-ID: <b22d3e31-754f-4490-9ae6-a47131383bb8@linaro.org>
Date: Thu, 11 Jun 2026 09:37:03 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/19] perf cs-etm: Queue context packets for frontend
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>,
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
 Ian Rogers <irogers@google.com>, Amir Ayupov <aaupov@meta.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Paschalis Mpeis <Paschalis.Mpeis@arm.com>, coresight@lists.linaro.org,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 Arnaldo Carvalho de Melo <acme@redhat.com>, linux-doc@vger.kernel.org
References: <20260609-james-cs-context-tracking-fix-v5-0-d53a7d096a19@linaro.org>
 <ainFqtxdLwhbRqrI@x1>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <ainFqtxdLwhbRqrI@x1>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/06/2026 9:14 pm, Arnaldo Carvalho de Melo wrote:
> On Tue, Jun 09, 2026 at 03:40:05PM +0100, James Clark wrote:
>> Fix thread tracking when decoding Coresight trace and add a new test for
>> it.
> 
> The issues found by sashiko seem mild and you can address them in follow
> up patches, I think.
> 
> So for the benefit of having perf-tools-next available for linux-next
> testing and the window is closing soon, so I've merged this, ok?
> 
> - Arnaldo
>   

Thanks! I'll send any I think need fixes but I was going to mostly 
ignore them, or I already replied to the same comments from it on 
previous versions.

>> The new test is added as a Perf test workload instead of a custom binary
>> with its own build system, but this requires a new feature in Perf test
>> to pass in control pipes which can enable and disable events. This
>> scopes the recording to just the workload and helps to reduce the amount
>> of data recorded in tracing tests.
>>
>> With this new feature we can re-write all of the Coresight tests to make
>> use of it and remove the remaining binaries which fixes the following
>> issues:
>>
>>   * They didn't work in out of source builds
>>   * A lot of the tests unnecessarily required root and didn't skip
>>     without it
>>   * They were mainly qualitative tests which didn't look for specific
>>     behavior
>>
>> Most importantly, the long build and runtime has been reduced. On a
>> Radxa Orion O6, unroll_loop_thread.c took 37s to compile which is longer
>> than the entire Perf build. Now the build time is negligible and the
>> before and after test runtimes for all the Coresight tests are:
>>
>>            |   N1SDP   |   Orion O6
>>    -----------------------------------
>>    Before  |   4m  0s  |    14m 49s
>>    After   |      26s  |        56s
>>    -----------------------------------
>>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>> Changes in v5:
>> - Forgot to include this change:
>>    - Test for actual length of expected raw dump (Leo)
>> - Link to v4: https://lore.kernel.org/r/20260609-james-cs-context-tracking-fix-v4-0-44f9fb9e5c42@linaro.org
>>
>> Changes in v4:
>> - Rename workload-ctl to record-ctl and improve docs (Leo)
>> - Use new packet argument everywhere in
>>    cs_etm__synth_instruction_sample() (Sashiko)
>> - Test for actual length of expected raw dump (Leo)
>> - Use -fno-inline instead of keyword (Leo)
>> - Don't test any brace or call lines in deterministic test
>> - Make sure context switch loop test does cleanup on failure (Sashiko)
>> - Remove undef int overflows in workloads (Sashiko)
>> - Link to v3: https://lore.kernel.org/r/20260603-james-cs-context-tracking-fix-v3-0-c392945d9ed5@linaro.org
>>
>> Changes in v3:
>> - Minor sashiko comments
>>    - Close some more pipes
>>    - Fix warning messages
>>    - Error handling improvements
>> - Pass packet into cs_etm__synth_instruction_sample()
>> - Fixup stale comment (Leo)
>> - Link to v2: https://lore.kernel.org/r/20260602-james-cs-context-tracking-fix-v2-0-85b5ce6f55c6@linaro.org
>>
>> Changes in v2:
>> - Add --workload-ctl option to Perf test
>> - Re-write all the Coresight tests and speed them up
>> - Pass packet to memory access function so frontend can use either the
>>    previous or current packet's EL
>> - Link to v1: https://lore.kernel.org/r/20260526-james-cs-context-tracking-fix-v1-0-ebd602e18287@linaro.org
>>
>> ---
>> James Clark (19):
>>        perf cs-etm: Queue context packets for frontend
>>        perf test: Add workload-ctl option
>>        perf test: Add a workload that forces context switches
>>        perf test cs-etm: Test process attribution
>>        perf test: Add deterministic workload
>>        perf test cs-etm: Replace unroll loop thread with deterministic decode test
>>        perf test cs-etm: Remove asm_pure_loop test
>>        perf test cs-etm: Replace memcpy test with raw dump stress test
>>        perf test: Add named_threads workload
>>        perf test cs-etm: Test decoding for concurrent threads test
>>        perf test cs-etm: Remove duplicate branch tests
>>        perf test cs-etm: Skip if not root
>>        perf test cs-etm: Reduce snapshot size
>>        perf test cs-etm: Speed up basic test
>>        perf test cs-etm: Remove unused Coresight workloads
>>        perf test cs-etm: Make disassembly test use kcore
>>        perf test cs-etm: Add all branch instructions to test
>>        perf test cs-etm: Speed up disassembly test
>>        perf test cs-etm: Move existing tests to coresight folder
>>
>>   Documentation/trace/coresight/coresight-perf.rst   |  78 +------
>>   MAINTAINERS                                        |   2 -
>>   tools/perf/Documentation/perf-test.txt             |  24 ++-
>>   tools/perf/Makefile.perf                           |  14 +-
>>   tools/perf/scripts/python/arm-cs-trace-disasm.py   |  20 +-
>>   tools/perf/tests/builtin-test.c                    | 187 +++++++++++++++-
>>   tools/perf/tests/shell/coresight/Makefile          |  29 ---
>>   .../perf/tests/shell/coresight/Makefile.miniconfig |  14 --
>>   tools/perf/tests/shell/coresight/asm_pure_loop.sh  |  22 --
>>   .../tests/shell/coresight/asm_pure_loop/.gitignore |   1 -
>>   .../tests/shell/coresight/asm_pure_loop/Makefile   |  34 ---
>>   .../shell/coresight/asm_pure_loop/asm_pure_loop.S  |  30 ---
>>   .../tests/shell/coresight/concurrent_threads.sh    |  45 ++++
>>   .../tests/shell/coresight/context_switch_thread.sh |  69 ++++++
>>   tools/perf/tests/shell/coresight/deterministic.sh  |  72 +++++++
>>   .../tests/shell/coresight/memcpy_thread/.gitignore |   1 -
>>   .../tests/shell/coresight/memcpy_thread/Makefile   |  33 ---
>>   .../shell/coresight/memcpy_thread/memcpy_thread.c  |  80 -------
>>   .../tests/shell/coresight/memcpy_thread_16k_10.sh  |  22 --
>>   .../perf/tests/shell/coresight/raw_dump_stress.sh  |  65 ++++++
>>   .../shell/{ => coresight}/test_arm_coresight.sh    |  43 ++--
>>   .../{ => coresight}/test_arm_coresight_disasm.sh   |  23 +-
>>   .../tests/shell/coresight/thread_loop/.gitignore   |   1 -
>>   .../tests/shell/coresight/thread_loop/Makefile     |  33 ---
>>   .../shell/coresight/thread_loop/thread_loop.c      |  85 --------
>>   .../shell/coresight/thread_loop_check_tid_10.sh    |  23 --
>>   .../shell/coresight/thread_loop_check_tid_2.sh     |  23 --
>>   .../shell/coresight/unroll_loop_thread/.gitignore  |   1 -
>>   .../shell/coresight/unroll_loop_thread/Makefile    |  33 ---
>>   .../unroll_loop_thread/unroll_loop_thread.c        |  75 -------
>>   .../tests/shell/coresight/unroll_loop_thread_10.sh |  22 --
>>   tools/perf/tests/shell/lib/coresight.sh            | 134 ------------
>>   tools/perf/tests/tests.h                           |   3 +
>>   tools/perf/tests/workloads/Build                   |   4 +
>>   tools/perf/tests/workloads/context_switch_loop.c   | 110 ++++++++++
>>   tools/perf/tests/workloads/deterministic.c         |  39 ++++
>>   tools/perf/tests/workloads/named_threads.c         | 109 ++++++++++
>>   tools/perf/util/cs-etm-decoder/cs-etm-decoder.c    |  21 +-
>>   tools/perf/util/cs-etm.c                           | 236 ++++++++++++---------
>>   tools/perf/util/cs-etm.h                           |   8 +-
>>   40 files changed, 926 insertions(+), 942 deletions(-)
>> ---
>> base-commit: 351a37f2fda4db668cff8ba12f2992d73dccdaea
>> change-id: 20260515-james-cs-context-tracking-fix-754998bae7ed
>>
>> Best regards,
>> -- 
>> James Clark <james.clark@linaro.org>

