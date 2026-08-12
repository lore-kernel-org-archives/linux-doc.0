Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720F33655ED
	for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2026 14:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786544128; cv=none; b=ond8Uo8CtJA5LysR9iocVnz9J+EAGgVpUmrHo1cZW1QeU8ovhKClaeLd5AT9+JBSM+1OjRmWiwACJsHIUkGTChKzAOgF+fTOo+HzO+u7A6HfVKDOVOsSR5ipfrN8dcbEJMua+V2EARNpMccmCDNTYTi8ZBGkVh8fTczcfwsGPdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786544128; c=relaxed/simple;
	bh=60YKVSV/wRwrfG2iI7sMmT2CPegYFp4aQIsg/p7KJIk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N1T38TMx10QNrSrUE37LqeQcuG05NGH9s/MvRneRzZkxEFNSpBB40rTQeKIcNtw7WLJnlHfXmXiQmOw89A26/dfR/aWW8/4GzDFL0cynUaXaF3FGGI28i4pRVno1xHdiwsLf5wE2+yROZy8moprAsR8FQDOregzS8Q+QvDyKoL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yyVRs8Bl; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yyVRs8Bl"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47362928f65so791618f8f.2
        for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2026 07:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786544126; x=1787148926; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HpEHIdjrgsJVHjWro/18EmwhZ9NM+fW368nfv0gWPro=;
        b=yyVRs8BlgWVZwL/Rcblk2Ri3klvBYUg/tJH3dZsIzkBT2vKqdSV3NZfdpKo8Xp5N0M
         a4KPqZtKvuM1wbQ31wo/xAHFvolprGdqSf4XuczV0JLGU6FA15VbvT8Qug/x2qCcBbJO
         GHhAeSlxIHU5KqnsNjVD/gIWnvn88v07mt+ZxriBOl1ZuPMJBoLQN77zbVYldh0o0UTY
         nFThUeM6hZJOqAJ4bGpxSHvvV9h03eaW+CLm9Dk9ljgzjd5Q2FrHVxMSD6RNNnCcQYRw
         LybL7gS4wm4w8OiI5w+10Ew+bUNj+kK3IjFfzEaNiLeCBCf7rjuNYB3U6tCgDviOi16q
         Tgng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786544126; x=1787148926;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HpEHIdjrgsJVHjWro/18EmwhZ9NM+fW368nfv0gWPro=;
        b=Sb6ZDxpP7ghKDfZYPUCcVB6BBe4VFYw9KW8ldgQgO1LN5BEykr3evHcz2tFx4iNNfY
         Q9B7JTLluciuN3ddf8TFlIoytvx9xShAuA/GEQJt9xXowJipft94bWQJJU+hqOAjbGAq
         WsgQBNbh0XP96IyGBWl01a9o69scSQj12vSudYAxqzViDPXP2DWTCdFk0/qQmcS+1vS1
         bSBUorHBJtNOfBj8l/s7cNzFmkiN6l24E36Z5IoIm35Gicw8YKjHTXXCM4yHapuwfcBj
         NtuPOUSvywuPeJFcjQvw20YPtZbB+VwAznMz6opSp4Em3GxrdR1fQTCEQ1T+v6V8S+/X
         6u7w==
X-Gm-Message-State: AOJu0Yz9a2fRbcl3H98FBTq+n88q2aTdoAf5pyC3nhB230Yn1PSEPmsd
	SyFW9oRTaIUCeHW3yknc5l4k8Az9sbPO/PL3mT+U4TCAHQV0FfEUGUuQW3tDUEj/Rfg=
X-Gm-Gg: AR+sD12RESB+9lIfCgTo9eGoNFNGFIo8vUm8IYPQICEQH9LyZ4D3zdvrR/pc5NhbYfv
	o/8pFIw6tVkW5mVYfoYeooqf8CEH/ACpca+kme7aZkq+anIQm9FRe2ew8TDiXMQuz8g70DXY+0S
	F1aQ3n78IsaoipT0KFECK73OOVJHOqhfb7Hl0V4+z8KzMN3mzp6xP4rY8gUIUHnkzldRnhNARFI
	m4Bp0B9qgimK9tbB2FPdkm5ongyrRg5CdrNnXYzvapeFQBQ/b0ZNLeBSKCmFlaZbB/CI5/itfFn
	Gt5OZAqL5DDdaOXQYLilBpIGjkdPBtja7NCZBlw1My4/aX9AgpOove80gXF7eKrAPUJzGr14Ykj
	zbsbkpDN/KMET1PcQBNC7z5flwsNtyQ9jG5PP6UoKTOcNloc1cWDppUref8R6cgDo4RF7FnJKtr
	HJpCHxBnwt6mQ4I48ZUx/G1b8QuuNg19v00I+0HDkN8CQQ2sncRzx0b8UI3IbBJKiRDQ==
X-Received: by 2002:a05:6000:606:b0:47d:ee9d:90c8 with SMTP id ffacd0b85a97d-481528ad9cbmr8183311f8f.3.1786544125695;
        Wed, 12 Aug 2026 07:15:25 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48150d72232sm7848055f8f.37.2026.08.12.07.15.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 07:15:25 -0700 (PDT)
Message-ID: <80a801e9-5c95-46f6-8ee0-f07a17cfd287@linaro.org>
Date: Wed, 12 Aug 2026 15:15:24 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] perf test cs-etm: Test branch history on existing
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
References: <20260803090640.2412336-1-aaupov@fb.com>
 <20260803090640.2412336-7-aaupov@fb.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260803090640.2412336-7-aaupov@fb.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 03/08/2026 10:06, Amir Ayupov wrote:
> Add a CoreSight shell test for --itrace=L. Record timestamped ETM trace
> with explicit -T sample timestamps and AUX pause/resume events, then
> check that the pause samples carry both a multi-frame callchain and a
> non-empty branch stack for each of the workload's two processes.
> 
> Decode the same recording with L4 and L64 and reject any branch stack
> deeper than the requested depth.
> 
> The test skips when cs_etm is absent, when not run as root, or when the
> recording turns out to lack virtual timestamps. It exercises the
> timestamp-gated path and the requested-depth bound; it does not attempt
> to verify that the attached history is correlated to the sample.
> 
> Signed-off-by: Amir Ayupov <aaupov@fb.com>
> ---
>   .../tests/shell/coresight/add_last_branch.sh  | 175 ++++++++++++++++++
>   1 file changed, 175 insertions(+)
>   create mode 100755 tools/perf/tests/shell/coresight/add_last_branch.sh
> 

[...]

> +
> +record_data
> +check_callchains
> +
> +decode 4 "$tmpdir/script-l4"
> +check_process_samples "$tmpdir/script-l4"

Minor nit, but these should be capital L. l is a different option.

> +check_branch_stacks "$tmpdir/script-l4" 4
> +
> +decode 64 "$tmpdir/script-l64"
> +check_process_samples "$tmpdir/script-l64"
> +check_branch_stacks "$tmpdir/script-l64" 64
> +
> +cleanup
> +exit 0

