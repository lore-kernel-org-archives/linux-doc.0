Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128974756DF
	for <linux-doc@vger.kernel.org>; Fri, 16 Oct 2026 13:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792157380; cv=none; b=Zri04ivZ07faqz6+RkWglh//Ns/UCNjNje4X2f+4j41aei40bt0EM8kC4a8rZcRCu3YhV1biX5tGebPsjK9XZnTcuSXVoAtfhKR/YkUGBOBmdvsCFSOem9ZuJJ158f5OaXhUZMmSMrhoJ2OrgxxymUwx/r/NLloaH0Z6mBq2TRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792157380; c=relaxed/simple;
	bh=YBJCnJ8rsdKqrUNhHjjL6sBtv233CpMKpsd1Gw/TmLw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Na/VTJRJxrVvaLU/XrcEz2YWoNYNyshESh79Vya0XCY8XtawITCHRaslQQtf46DGVMXDYJeDbW4T/h2DziO6QYB5Co0oV3gdBip2WVsgxtbXPmulmr+/Ya2sbuKPqx/BQrazle4e3QBF8H1G69n7MdDyKwbRoRsMiVnPkIkY7E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZpU/OEyL; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZpU/OEyL"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48bbb06e746so1570890f8f.3
        for <linux-doc@vger.kernel.org>; Fri, 16 Oct 2026 06:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792157377; x=1792762177; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8jpDLmMBbHfkeVF10s2tGINPrgBL1dTjWhJOL3aqJTw=;
        b=ZpU/OEyLXA+Mq7KbIo199qfX5BpcXlLuOPVbM/KdkSf4q9Vj0sIt7l0tzl/IIZAWT2
         Qp0ncOfC8Ban/DUJzDJ81C/UFjZryqF+NXb5oPVSC9URR6w+JxCnrgNcu81jVqyvSWzX
         ogzCDVrnbVOixRbZF9950FqGuy6WHAtXxJQopx2JjA1E12inU71N1T1PitZIeHKfeOOw
         XZWKSEcpmjAX7E/CzFOQ5EtVQ6oy0i8s391QuKZeT2t2la1WoyUNqlv6LSQRQ2UO3LJF
         DJ8sE9SibYexUF+opKbsxkwykQfboZnU46jcbR4P1npGa9Ww6vUGemzkGP8aiHzN2t1X
         Yo+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792157377; x=1792762177;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8jpDLmMBbHfkeVF10s2tGINPrgBL1dTjWhJOL3aqJTw=;
        b=jLcVdDhHkt/3B3nzc0LcmBeG+Sl/tj9XrodiCNiX7k5OoJtPdiHeX+MDx0Vo4yn810
         DAhWDlmmYGFURWzUT9d7dY+rYGSJBXOx7ketEN6T+BQTq09p/8KfRhu/SsaYBEHj72Mb
         eQg87013/uw2ps/TqQiF3M2al2Q97eeqU5PqDEH0M5GWMCDugehbT98SFC5hZixUcgty
         VaMAlQAAvtinq/yoImoGYz+gurMIIEkXAsV60X90/RWre/dF5C6JLFtRVwKOrrDw7lk4
         XH0iw/PRjZ1SADlYmIgEOByCPOiP9/Ls7vOBBzY5CiP+QLT5eyxSpv17qBTP+90fRhs6
         bUtA==
X-Forwarded-Encrypted: i=1; AKwUvBxWaTqEQg3sv809wn7xgIkoaIU78CGqP9lq9KIVf5NLMw4AGDkRWmU9faLzYMv8q8qC4KV9nwvNXVc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLRuKfCLC66KLKg7FURf59YCYHhBKdlMEiB3yUaoq324n7PIR5C
	KPmj+FijMI9aLrBTmbGNADEaXypSpQXw3Lagvi/UEcMewSChYLksh7eTGmj3F2BT7JE=
X-Gm-Gg: AYBFou1se6+QKMjdL7wsPTi7BIv1eZKhk1ryBl/9ANEUNKGo/Tj8d645SMHtjBEM1IW
	jXh/hZQlgQxZA63LN2+nYtMYh0H4aOLRa+3Fd9anYab8FTguSUSndWGxGqKTex2GCQCJyiB8Xzb
	dxOknJDlGz/c2BRu+DYS5rbgclnpebIE75tYrVay80lyA9OaDYPY35yd2I2HXO79eKWTGN15YJn
	K3kbi2tC3Gzh8cebRfvl+03/7Q1TV3vVK5HSax3ljrwgKAafzK4nINpWDPYdCMAQND0mTciBq2f
	CzfKLSDTLslmKLbVBIjSQNpRASXlM0gH4QUpEKZX09ZLdz1i/UlXL7wDIp11sOVdDidmIAJhDt6
	XnHIIXJthlLo4iUMCJ6V8Xxx+Pgjh53cKQNdr455hDHjUUN06PmnOLgttfdvmWmcJWo6xReFEMC
	qxqyqf7F1pjlk10tXU6UJqQC4AkNIKZiHpQbMtz0U12ik+9/Pz1iHblmggfe5kBHXOJup+jUNaC
	nE=
X-Received: by 2002:a05:6000:26c7:b0:48d:f851:ee5f with SMTP id ffacd0b85a97d-48df851f00dmr9820547f8f.24.1792157377206;
        Fri, 16 Oct 2026 06:29:37 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4d4dddsm5173034f8f.22.2026.10.16.06.29.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 06:29:36 -0700 (PDT)
Message-ID: <f1a7dac8-5a01-4fc2-bf81-b7609e332e9d@linaro.org>
Date: Fri, 16 Oct 2026 14:29:35 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/25] perf/core: Prevent AUX sampling from racing with
 pause/resume
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
 <20260915-arm_cs_support_aux_sample-v1-2-35cf6f297d20@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260915-arm_cs_support_aux_sample-v1-2-35cf6f297d20@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 15/09/2026 16:48, Leo Yan wrote:
> AUX snapshot sampling and AUX pause/resume can both run from NMI
> context. Each path currently guards only against its own recursion.
> An NMI can therefore enter one path while the other is changing the
> AUX hardware or buffer state, allowing snapshot_aux() and the PMU
> pause/resume callbacks to overlap.
> 
> Use aux_in_sampling and aux_in_pause_resume as a shared exclusion
> scheme. If sampling nests inside pause/resume, emit the regular sample
> without an AUX payload. If pause/resume nests inside AUX sampling, drop
> the AUX action, matching the existing behavior for recursive
> pause/resume.
> 
> This prevents overlapping PMU operations without waiting in NMI
> context.
> 
> Assisted-by: Codex:gpt-6

Does this need a fixes tag? Seems like using these two things at the 
same time could have gotten you into a state where tracing was enabled 
but aux_paused=1 etc.

> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   kernel/events/core.c | 17 +++++++++++------
>   1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/kernel/events/core.c b/kernel/events/core.c
> index 17355e4b8b7c6c106117153c9eb8509e6f9a41e3..a524eb381d4b5731650ec0105d9794b8c89fba4d 100644
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -7990,10 +7990,12 @@ static unsigned long perf_prepare_sample_aux(struct perf_event *event,
>   		goto out;
>   
>   	/*
> -	 * If this is an NMI hit inside sampling code, don't take
> -	 * the sample. See also perf_aux_sample_output().
> +	 * If this is an NMI hit inside AUX sampling or pause/resume, don't
> +	 * include AUX data in the sample. See also perf_aux_sample_output()
> +	 * and perf_event_aux_pause().
>   	 */
> -	if (READ_ONCE(rb->aux_in_sampling)) {
> +	if (READ_ONCE(rb->aux_in_sampling) ||
> +	    READ_ONCE(rb->aux_in_pause_resume)) {

I suppose this means that sampling could be quite unpredictable for 
users if sometimes samples are dropped while pausing is happening. You 
might expect to receive a non empty sample even if its triggered while a 
pause is happening? But preventing concurrent use of the two features 
would be difficult and restrictive.

>   		data->aux_size = 0;
>   	} else {
>   		size = min_t(size_t, size, perf_aux_size(rb));
> @@ -8869,10 +8871,13 @@ static void perf_event_aux_pause(struct perf_event *event, bool pause)
>   
>   	scoped_guard (irqsave) {
>   		/*
> -		 * Guard against self-recursion here. Another event could trip
> -		 * this same from NMI context.
> +		 * Guard against self-recursion and AUX sampling. Another event
> +		 * could trigger either path from NMI context, in which case the
> +		 * AUX action is dropped instead of waiting for the preempted
> +		 * context.
>   		 */
> -		if (READ_ONCE(rb->aux_in_pause_resume))
> +		if (READ_ONCE(rb->aux_in_pause_resume) ||
> +		    READ_ONCE(rb->aux_in_sampling))
>   			break;
>   
>   		WRITE_ONCE(rb->aux_in_pause_resume, 1);
> 

