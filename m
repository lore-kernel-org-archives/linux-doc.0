Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8612F44CAD7
	for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2026 13:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786540607; cv=none; b=aRDqHeW++sCyT9sJ+sjh2zIy+3SCKgkME2IVYCvMQT0wo3Owsst+5x1uDNOjD8B7O5NmZX5OoFrN5kQ3DB9c040RrYtpiDU0ZGkX5xFn7yITrhesefJApudfiGkRESHb+gBjizn0zBCEX/zBeWwevubktBYSoPB5ENwmcAf98jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786540607; c=relaxed/simple;
	bh=HJFYkb4Hajh/GcjJG40WCp0AlZL1NY+eEFakOOHDEAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LOJm53TB/zigh+VHqiQwor0TJCxLsGS9hjZzfQJ6ZMEMIsL61FbptQfFhFJbbry6G79QEgnkQaCW4KnnFfx5ahCu5zft3G1cMOiiOx4tIybwqgMIXk1XosrKgvGVjhHda58i42e5/vDLTpdMSTETKNY1JDtG3iVCh9PPMHLXsYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QvNA2YWu; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QvNA2YWu"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-480033bdcf4so534412f8f.2
        for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2026 06:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786540603; x=1787145403; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DsZokZ/iedv/wv6L1wEU+vbKd+fdKYrALL/Ray13yqY=;
        b=QvNA2YWu4ROjz/uLpNVL3aT0aAB1tRbgjj4pRNzSkMms5tgYnAcobdi2ML8Di6F7dy
         qMtG1fGfGHQGz1gO1inKoM6vc9hn8Ld8x7azM4LWP2kjkdf4Tm7jW5BUAUk4sBUK8M72
         Puwku7nfgcDOaBMNLpFPwsuBL4Q7WrA2ulKhCxWaUnLpLgEarFD9KK0s84+ndarBgsBf
         QHIIZayFkuyui22edNa+4yNc28vyppywDGLqOvq0kCOkBvVvrdyRbDYePBwipVsQWd5J
         LbYk1E6iXFFKVaQeJVzEb5czYeLpuUqgoB9um7YFmA3FEsnptZNY217cWmswfgNG/aFK
         xe7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786540603; x=1787145403;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DsZokZ/iedv/wv6L1wEU+vbKd+fdKYrALL/Ray13yqY=;
        b=odkujCPGbX5mOIdc4k2n07cL6wcYQ1sSmOq3DyhPRktqUpPyjIRDG4mx3ogDePczvn
         UbNBmd6eZMAgWlqx6PjJ41pqllbCLBph8WmkmtlNTTdC292g12r4tiJRf5MibmGNm4IY
         dEYS6UZ89nP5b6BdAzohrknGrcbfapuZ80O0rAXfkISzl0jBH1n9gBo3fwo7pB7KYK2M
         hEt9D0FNG6ugQueQbc2me15nF0g/6izZ6iJGiGa9GDe2JYPCkc5+KwNCuoThjHtjZa+r
         2cKfhOCGSLh9UjPuK0UQuzRxYlMFSKn+U2a40Um2Juj6ysSCRpQJvIAI0CLRTaijg0FT
         G1mg==
X-Gm-Message-State: AOJu0Yycg3ff2Km2rlrIwRYDKct+yGKcI9xU30Gs6KxVUWS7J4+UNQSc
	sVyE/1XIuqv7dvgcXiQMVqaw+e4C9flX9xkS/dUNnix/l83MAApcb5vHrjy3PU4uFFc=
X-Gm-Gg: AR+sD13AmaLLCYBXVa5xGM5Jdj0epZOS3O8qUTzlWkyE7ntwd6DB2Q8y/7G8IEdDFEc
	cDZ7TnBcFotVVZbxPgGkctYQihCbBB42p4bXxyI7AH/v3vlTgiEqb2yUpTfsuJgwZDqbGq9eUGu
	FhwQauKbmhI85saHvMxJY2H7ckbgpR7d5Rnwfl7NfmSHiCvJOFLVbmmzqvzEk8lovMR/Yf+c1Jh
	Z9Aj4oLoI4+uIGRC5rGFoXraPgVZiUCyn4lHIJNyk6aiaecvY01SG+tTUPRCXoCiV4gVZbkNCIb
	KcbY9AzevkiIS6+E37HCHV6h9toVPVWuNn53rP7yG45ckysFspyWZOwhN1usXZQL0zV4u1ug6de
	iOq726h1E7nOK2biXWAZtlphLyf+YvU0zW3aNepfZBhlGp7paiBi8AreNyP9AB3ALYzy/X76dWT
	vX3JpJRYbcDUNsI6cXJw+9bKdKH6hkybzug5M/EoBM0MQhtpZ/7Av9RoQaMmGENyIqAw==
X-Received: by 2002:a05:600c:4504:b0:495:737a:7afe with SMTP id 5b1f17b1804b1-4997c12592cmr68779655e9.15.1786540602720;
        Wed, 12 Aug 2026 06:16:42 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997b34afe3sm57791515e9.2.2026.08.12.06.16.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 06:16:42 -0700 (PDT)
Message-ID: <274fdcb1-70fa-4976-8f13-bdf6568e12af@linaro.org>
Date: Wed, 12 Aug 2026 14:16:41 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] perf thread-stack: Report branch stack hw_idx as not
 available
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
 <20260803090640.2412336-2-aaupov@fb.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260803090640.2412336-2-aaupov@fb.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 03/08/2026 10:06, Amir Ayupov wrote:
> thread_stack__br_sample() and thread_stack__br_sample_late() fill a
> caller-supplied branch_stack that is typically allocated with zalloc(),
> leaving hw_idx as 0. Zero is a valid hardware index, so consumers that
> honour PERF_SAMPLE_BRANCH_HW_INDEX see a reconstructed branch stack
> claiming to start at LBR TOS entry 0.
> 
> These branch stacks are reconstructed from instruction trace and have no
> hardware index at all. Set hw_idx to -1ULL, which is the established way
> to say "not available" and matches what intel-pt and cs-etm already put
> in the branch stacks they synthesise directly.
> 

This fix makes sense in case someone doesn't overwrite it, but I think 
"matches what cs-etm already puts in the branch stacks" isn't quite 
right. Based on the hw_id docs, cs-etm should be setting 0 shouldn't it?

  * For the architectures whose raw branch records are
  * already stored in age order, the hw_idx should be 0.

-1 "unknown" isn't accurate as we do know what the order is because we 
generate them in order. If anyone is reading the field 0 is much more 
useful than -1.

Can we change cs_etm__synth_branch_sample() to 0 and update this commit 
message to not say that -1 is right for cs-etm?

> Signed-off-by: Amir Ayupov <aaupov@fb.com>
> ---
>   tools/perf/util/thread-stack.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/tools/perf/util/thread-stack.c b/tools/perf/util/thread-stack.c
> index c5ce741b07446..1a3dffa83bde2 100644
> --- a/tools/perf/util/thread-stack.c
> +++ b/tools/perf/util/thread-stack.c
> @@ -624,6 +624,7 @@ void thread_stack__br_sample(struct thread *thread, int cpu,
>   	unsigned int nr;
>   
>   	dst->nr = 0;
> +	dst->hw_idx = -1ULL;
>   
>   	if (!ts)
>   		return;
> @@ -686,6 +687,7 @@ void thread_stack__br_sample_late(struct thread *thread, int cpu,
>   	bool start = false;
>   
>   	dst->nr = 0;
> +	dst->hw_idx = -1ULL;
>   
>   	if (!ts)
>   		return;

