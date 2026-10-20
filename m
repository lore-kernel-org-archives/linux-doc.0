Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792506375;
	b=TVXjYgiJS/skqbXDsmy93spmiBBtKCm1av6xxcHbAI+yzlb0ASpUCFz1nl6sw0DPy/I3
	 IemXYG6arEqSLipX+hANN6BUxZH6UHzLWsbrGNhjtoN5Yjy4lOCQebs0K3p9BAnO+iBHH
	 iEWgXwtwSp/HB1AvYpvMpGLQnWNF35RuMsXsMSnipmIJ49YH0LI7oLBFRFU39EkkbYr8H
	 7vzi0vRyhd9NPrjaXTACP1w06BHH3ZGxYr9gkRCkUh8WkdwkwKaGZrs9KFMc9O/YqBJfO
	 D2YGOFv4TtJP4kjYablbAH2TDfuTusaysYO8JicRJuK7AEXnZ1aoqwcmqoSTgZZXAiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792506375;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=lKN2Kpy24qYXb++X9M24Ji7pq7TM4o+Umqf1AAgxfzE=;
	b=QSe1oC7bCQgay2O64dSlbrdK+2rMg2dbMvgvN4yg0s7rkt0b/2ceL7jWc6/w2Hl/a7ui
	 rZf1Y9ff/P36LYnZNxZ4JHV92rwNHTgxynUGHfNX+IErQq8pRtpqTRuPDX4uT8jZYYYGo
	 ZkWrilNBd4H5pWFTUUXqX5JHwaHZaBVJPqpQXPDI+IEYCzAj8+q3yj9c1TjXTBkjVZ4ya
	 gK7DX0jwcjowOihEr87nNrBfDP+htS3F+iM77PgcSIC8HUq39v/ioblj68CKdLGgsajwC
	 8/bP1Ul5grHxcNLCRDINxUIrSgId5D7ZlbCtEdPYXFWzpiIrYMVMnAgHbMSdZ0W6ofA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="m/9U24QS";
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587D6606A320
	for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 14:26:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 587D6606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=m/9U24QS
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c263415982eso419945566b.0
        for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 07:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792506373; x=1793111173; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lKN2Kpy24qYXb++X9M24Ji7pq7TM4o+Umqf1AAgxfzE=;
        b=m/9U24QS2Bz/OBc7yLUW7ra9avWJTiDbw2N8OWcBxciX+hOnKDyxTX4KI9hZE4E+mr
         JK1LaV9jQUJ09o6pP6JRKkhbT5jyFX4Z8Zlg3cXiQeeUHlFec5KoYWgdd6jZT2d93WuG
         YxnqFvde23cuE8kQ1070EDs+wtduXbpSNpLE9kvNPHZ9TXAnEENbFp1+a79wLY3p5N/1
         OcdtFrR40UO1342c69sfjiSkLRmshc9dutjX/u7f4Ab1dhEk3uA8sRc25K03afHnDJkQ
         INhvsed/UNgSZYhjgC+H4w8CZjVB3cgdUc6lA3pS2IeA9B6vJ6HMUeiwBgEvRjCfX+0Z
         pB7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792506373; x=1793111173;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lKN2Kpy24qYXb++X9M24Ji7pq7TM4o+Umqf1AAgxfzE=;
        b=RCS4prdKz6Gc/8NgupYDUf0X8nx6ke6Xa+BlTLB4n/EZmDqN6Sb82JxDTjABd0vOfy
         lnMgOryK10g7M0IKljViKQduoukljnPMR6e42NHrPJBEbaaeAYBlj591JwOn8pHeVUOp
         GdKDJlfIruX3EP/726FgjDWoM7r9UzziECMSRkxu9gKlKTJZp7ypF+Th/GDyIt6iDKPT
         FQAOB1j/QTN1wr8yLq88mg47ieQ/a6I3ZRJHGBhCE2lOhMAdgqUlSSVoL+drszACgH9k
         1vcyvl0P3bkIF2yZBcZSjF5PA5Aph//AlGHUKROxY79wN7I48n1mipGZ9FR4W1gy4C8z
         7AmA==
X-Forwarded-Encrypted: i=1; AKwUvBwRsCcZcupJbjBlz/GW61k/GwVk4QU4DaBM7+duQxTwOWiRICXWAJPU+VHH1i3oZIb/a+ITGuCe2wc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJO0jwRHs4hn5hqwbWhqdnR2Q8+Dm46u6MswA/kEzMeRCWTf+Ti
	+FhwYp6HwqNIbSvkGiZOI75ADS+wLxVGQiAawRzHt9M0G+NNWo4ZcMpAPafFlt1et44=
X-Gm-Gg: AYBFou2furSXYo0kT6uSZmCYCYXNPZ67IgC21Ms1HAYDDkTQOIfLQQO77smpGQ4aeYb
	ww8l2Gtcrg0rJvjtQVbdyhS9qnkJcSCaGt+NqMzJU/3tG7y7RsActrgZlsdJJwu2m3t0JDnf3VZ
	NToH2fADW78HcLLPbTvIPuhu6Ke0GtTGFuIYeLiEaaGoTsJSMaXQJjBA+BwFs0bb9AQvvvyaHrc
	CVVtBPA6jTvRDK1+eqIBPQLgt+kqSeFYtXlnF4akn0rItj7Bkz6yI+Sltc3H0YTuX2DgYX+ZXGX
	AKKf1ZnP+PUGWvmdPOLoZhEqBsPRtaOyqmZlIVT7ix6dSarrIiT99olmOXt4jJZX9N+anzPvpc/
	u1teA3a4OJdvuAwopfEtXp3UFAlFxD5q9kPDbAE4ZoVXEahIKydORbQYqWlKsOQNVrYB7eD+Fcj
	uWYS7L2uVOKHrpGBDHTZ/6Mio23orvUrcTrdPSnY9tt88FDdHKd0InWRwYHt6durb18Y9FChdA+
	nMa
X-Received: by 2002:a17:906:f5a8:b0:c38:ee33:2931 with SMTP id a640c23a62f3a-c419f709659mr789055466b.37.1792506372574;
        Tue, 20 Oct 2026 07:26:12 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d810035sm6911288f8f.13.2026.10.20.07.26.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 07:26:12 -0700 (PDT)
Message-ID: <52dc152f-5417-4af4-b084-5ca5f821a6f4@linaro.org>
Date: Tue, 20 Oct 2026 15:26:10 +0100
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 25/25] Documentation: coresight: Document AUX sample
 decoding
To: Leo Yan <leo.yan@arm.com>
Cc: Ingo Molnar <mingo@kernel.org>, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Yeoreum Yun <yeoreum.yun@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
References: <20260915-arm_cs_support_aux_sample-v1-0-35cf6f297d20@arm.com>
 <20260915-arm_cs_support_aux_sample-v1-25-35cf6f297d20@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260915-arm_cs_support_aux_sample-v1-25-35cf6f297d20@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 15/09/2026 16:49, Leo Yan wrote:
> Describe recording AUX trace in PMU samples and generating callchains
> and branch stacks with --itrace=G and --itrace=L.
> 
> Explain the default decoding behavior, preservation of recorded stacks,
> context ID requirements and decoding limitations.
> 
> Assisted-by: Codex:gpt-6
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   Documentation/trace/coresight/coresight-perf.rst | 39 ++++++++++++++++++++++++
>   1 file changed, 39 insertions(+)
> 
> diff --git a/Documentation/trace/coresight/coresight-perf.rst b/Documentation/trace/coresight/coresight-perf.rst
> index c0c82b3d26ea88dad7143afdb047c4d8f502b4a6..59eda2a5b6473ed1cb6bade5d281a12bdde76bb0 100644
> --- a/Documentation/trace/coresight/coresight-perf.rst
> +++ b/Documentation/trace/coresight/coresight-perf.rst
> @@ -171,6 +171,45 @@ no branch history at all, for example samples from a thread that was never
>   traced, or samples recorded before the first or after the last trace window.
>   It is built and installed with perf's other dlfilters.
>   
> +Decode branch stack and callchain from AUX samples
> +--------------------------------------------------
> +
> +With a kernel that supports CoreSight AUX sampling, record an AUX trace
> +window inside each cycle sample::
> +
> +  perf record --aux-sample=8192 -e '{cs_etm//u,cycles/period=100003/u}' \
> +        -- ./workload
> +  perf script --itrace=G16L64 -F comm,pid,tid,cpu,event,ip,brstack
> +
> +``G16`` adds a reconstructed callchain and ``L64`` adds up to 64 branches.
> +Either option can be used alone. Existing callchains and branch stacks are
> +preserved. Without an explicit ``--itrace`` option, both are enabled for AUX
> +samples. Decoded history is available in ``perf script`` and ``perf report``.
> +
> +AUX sampling supports unformatted, per-CPU sink (TRBE) trace. Each sample

Minor nit, but "per-CPU" in this context might be confusing for users. I 
know we've used "percpu_sink" in the driver (unrelated, but maybe 
"single_source" would be better there anyway), but from the point of 
view of userspace, "per-CPU" and "per-thread" would be related to how 
the event is opened. Which doesn't affect aux sampling.

> +selects its CPU's decoder and starts a fresh trace window. The window already
> +belongs to the sample, so ETM timestamps are not required for attribution.
> +Samples without decodable history receive no reconstructed stack. CPU-wide
> +recordings must enable context IDs to distinguish tasks within a window; the
> +default recording setup enables them.
> +
> +Callchains cover only calls visible in the captured window; callers before
> +the first synchronization point cannot be recovered.
> +
> +When kernel tracing is enabled, AUX samples can include PMU interrupt-handler
> +execution before the trace source is paused. The late-sample helpers trim
> +this using instruction addresses, which may not uniquely identify the sample
> +boundary for kernel samples.
> +
> +Formatted sinks such as ETR are not supported. They can collect trace from
> +sources on multiple CPUs in a shared buffer, mixing execution from unrelated
> +threads into the AUX sample. Context IDs can distinguish these threads, but
> +trace from other CPUs can consume the limited sample window, leaving little
> +history for the sampled thread.

This isn't really an issue if you are only tracing a single process 
regardless of shared sinks. As the aux sampling driver implementation is 
quite tied to the sink, it only makes sense to say we didn't implement 
it because we think the main users only want TRBE, and it's extra 
complexity to do it for ETR. But that doesn't really seem necessary to 
mention here.

TRBE also supports multiple threads anyway, because you haven't put a 
hard limitation on using --per-thread.


> +
> +Guest samples, synthesizing instruction events, and saving reconstructed

I don't think guest is working anyway even without aux sampling. There 
is some structure left in the code for if we ever decide to support it. 
But I don't think we should mention or do anything special for guest in 
relation to aux sampling.

> +callchains with ``perf inject`` are also unsupported.
> +
>   Perf test - Verify kernel and userspace perf CoreSight work
>   -----------------------------------------------------------
>   
> 

