Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA2D3D9035
	for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2026 09:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792402513; cv=none; b=ddzlusUisFFb2UmvLRVe82aWWGPOs8zsd7DXxlMxtChgVd6aSNPepW7jeii7isGZX0xZjwUl2Fey5vIB2wXnfM+2e+bZEgeE8DbfK0LouwBepp3YhQ/Keu8VLmvqcIbnQbyjFe99H/sNf2hEntpWTU4p3KwB2WFB/YKdiARW5KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792402513; c=relaxed/simple;
	bh=4QAG6NlT/0nwL//USt0n95Bo3PHood1TAUditJeGxo0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a6Lg3718s0uc3hLcTyMYsf7vpTD9erhNe9HXJ7X0LOJeF++5spGztk8PaopgYSxAmmw64vWnPpiYq60LKUni2UiF3uOXHx9DGB4d9tx2PWKupP+ouQUu1yEtanjnvv6SETZBCSwDYZaPfMxQHictK7dR2hwHY0bSS9RGScw1fbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=edjQydIV; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="edjQydIV"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48df54150dfso1380876f8f.0
        for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2026 02:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792402510; x=1793007310; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fTaWLyJQguuj+iwhlfuFOJfOVGeQt6aW3eAE90gC5/k=;
        b=edjQydIVroGocCiby5po1vFmjvDcWPtZAZPZVWWaAQ1jwmG39Y9jPKIQBl7/DQ3xlM
         n17Zhg+K67XwA7oS05ZDr3ks80jEhO8rHJWhmLQ3uQReOJKLqjhstfOroDhkT6kus0Dy
         lbTF8NgOVrI+Bb8kvPRQ+UZXRbCgbYxLInpKRidFoL77PUHiTdu8gLTZAmhMGPqfydtm
         N0aSuSa47TSzFPPqbgEC6eWYDtqorQ4yHtwAYKeD+IozijiDUBUFzNogMR6am5bcO87O
         N1vcvToVR8FiFpVbp0vxGxxq5//rHi/fDLxFmqgvISZH+SXHl4kpYfaWqFQWH7E/I7XY
         s9KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792402510; x=1793007310;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fTaWLyJQguuj+iwhlfuFOJfOVGeQt6aW3eAE90gC5/k=;
        b=nTPO+6gruVLJelXK77aQ8sDqxkADuEJmgrPbLyBfGw3/Ku0kiOUEsQ+l2YrO1HQNo9
         5oKo9ovF1X8RR+HQLdENTKDZunNtlXyYrce338uW7XaEm4aIZ4ue/7TZOt2/YtqKhulk
         bww7puuQLJQdsdYDneOSGU7Vd9EV14g2fl5vTHCAN2TlglNTZF5O3RQzZP/QyyRCZvqk
         gmsTaYtsu5cBu9N/fkJXQTxOAvN4tx2VitPYbusKuiARphBs3MNe8PqXISN1i3HoXN1i
         CtNeFLPHfd+4iqZTAXqS6lVS7KaTeBrSeJ+JIBSZ+8nRH7gUcI5qdCseQDwswnQJFmY0
         HRHg==
X-Forwarded-Encrypted: i=1; AKwUvBx7z6eYIcASDI1DG16aKHbcpjosL2mcW24lTGojj2tYi4+48Wx7Gb3vMW8XMo9zt7yh2OAzAUda+08=@vger.kernel.org
X-Gm-Message-State: AFq9FYKEu/HjdcGWLRA8sGlh7WbCVDsxd/8rA0ROg5RFOuPlO7/g+T1Y
	nRrKiv2pXvPyz9a2u65GtxLVpHLo1Kphgh0aqMYMD9rKxCtQILIOVedSz5vLF+jWAc8=
X-Gm-Gg: AYBFou211oD5gSLiumt3iHZzSo42UrImOkwleqYGaBA1XP4zj3bJT4RZpDvTsfxzq4V
	XWw74UMRA5bkotJibXm+W54EX76KJ/LhVWDnQoxKdeDgqatgrpugNvISFbsgX6Of0SCSId9mSWc
	TJCDJp2spXb0w4WF3B3Zq8W+0mlnEYAX1nuF9QN0Q5pffPAsqiJxTja/IzMZB+8oUqLVJbKk13g
	9aDKPsLSA+YzHRURMVjJXKFLPi2y1K7vIvKDEY8UW7jSUVFDwORW8obFvIrXnZenHjQXd6teaeu
	X1I9CNN8XPIiA8LXWo0dKTxbtR98efCulKri+SDPhpfMNf7c77ugiGUveY5GW/dqmurwh0Pyoee
	bB5awGVDJNje8lZdTkwiWhgToWuuVWeAzWn93ObbUcGMqliydlKYE4JSicWquQGDia6OMAratbs
	cLJcTW1EXfJSth45dPA7rf/BUL0q3BBAa4d1RadMMDcxsauUvIjkktQIyhTFuHgRXg60i5OR1t3
	4yE
X-Received: by 2002:a05:6000:4b1a:b0:48d:f034:7fcd with SMTP id ffacd0b85a97d-48e07fa2f48mr12167246f8f.51.1792402510355;
        Mon, 19 Oct 2026 02:35:10 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd471a1fsm18752727f8f.3.2026.10.19.02.35.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 02:35:09 -0700 (PDT)
Message-ID: <296f398a-a351-4290-80e5-d18427a88dac@linaro.org>
Date: Mon, 19 Oct 2026 10:35:08 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/25] coresight: perf: Improve hardware state transitions
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
 <20260915-arm_cs_support_aux_sample-v1-9-35cf6f297d20@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260915-arm_cs_support_aux_sample-v1-9-35cf6f297d20@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 15/09/2026 16:48, Leo Yan wrote:
> Keep hw.state consistent with event activation and AUX buffer updates.
> Initialize events as stopped and up to date, clear both flags after a
> successful start, and set UPTODATE after committing an AUX buffer
> update. On resume, clear UPTODATE only on success. Preserve state on
> resume failure and ignore duplicate stops.
> 
> Add helpers for setting and clearing state bits. Use READ_ONCE() and
> WRITE_ONCE() to prevent compiler merging or refetching of state
> accesses.
> 
> Assisted-by: Codex:gpt-6
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-etm-perf.c | 58 ++++++++++++++++--------
>   1 file changed, 40 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
> index e3c9d3cf84c502f357a430bc3bfa854a776618f1..f66c99b26e1862ab04105704276c901b21728207 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> @@ -150,6 +150,20 @@ etm_event_cpu_path(struct etm_event_data *data, int cpu)
>   	return *etm_event_cpu_path_ptr(data, cpu);
>   }
>   
> +static inline void etm_event_set_hw_state(struct perf_event *event, int mask)

Extremely minor nit, but inline does nothing here.

