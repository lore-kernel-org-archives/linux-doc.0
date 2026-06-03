Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0287393DF9
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 10:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780483586; cv=none; b=ryH5vD4TW7i0H1MGqf76P9X9P4DonHuriGFlh6q0DE6L/SUvjmID0nb+M6UXoaiPRKqXrZfNRgOUK4TKkF9IaHLQm4xuU1ogFyw+Hg+8eiBT/wytoapszzykrHLNqUmdPu0t+DGj2dh0WHPikrr3ueEh3MCqGlLhmb8nEEcuhrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780483586; c=relaxed/simple;
	bh=+RTtXfxyz/OM4N8LoIdbI0BRF1j9mNTINWXhLlFGt9s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NdHykTfRvZ3Mrtq2gNZhjMx+sCOmKI9qPqmZVIcxZDOprLYd/VtYwMXphZwtEihRf6gHupbn9XoiocXXDC9mOAftZa988VY8SgeBdMzOCerEALZGJln38OVNtwuwubhkvCDg2iXK/fGaTfyKluOCjqLcO9Kgc4fgHDglXdn5tww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H5e0HreA; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H5e0HreA"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490b613a17bso7688175e9.3
        for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 03:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780483583; x=1781088383; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tl+jgcSk0dHHiZncMXgwXjUu4Qjxd08EiAtrl4yNhBg=;
        b=H5e0HreAK+v4P9fBa8/js/9yA8o8p1A6Q7ND/ICLnf7uwb/vWBicZBNpnPl/tazKMO
         fQJL+inhdkXEInYck2WUwwnvAOo2qZgKsygZQzXsdmISUdFxh6QpzlUrDAVseZxGZNEm
         thomBoYHzBREf8ByMEi+lefGJ/JVkURu9YTHEOvCRkUpGeX0dl0l2v7xkGc9HG0mx/d3
         gQU53aA3j0f3Oq0lQMCxMV61yQf7oW4f51iepeE4wPFiBiijZt+Q8spBD3pQO2EodbdR
         fF4gT1k8TOrNoGGaXBHtWg4VSqBU7Z2B2dTsZGXNSUzziALOeN6Yx1yWyVslgjhNFNdw
         9dgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780483583; x=1781088383;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tl+jgcSk0dHHiZncMXgwXjUu4Qjxd08EiAtrl4yNhBg=;
        b=nFGRETP2xHs8KGz8NjCmSq+i/li+9QjIo9/+Ojqn/dTkaUPIdBGYuRhJjyKPUC/Akg
         XllgHMxPbrPn0itSjt4kg9OUHBZLS52lAl6EBsM6r7oFRtGTAHxUXUkUdIBjgmqPl2eA
         STOIoa77BDvCuPnlI4X+eeQ1tExSBuG1x7ad5C1wIFgFP8p98Tx0GjIWPHIrocbK9xK/
         JYyaGZdcUzazY2vOxC/mxHIrDZmun/Tp/mpmUIh8a7lHmPSz/MBBmVAaFwta0lRfjOXM
         cV7gzJWN0Wr66ezDP52V0a8n/TIiMwD3BN83IOsjQnmI2J2tOzcA5/gvzroy78H04ozB
         gBiw==
X-Forwarded-Encrypted: i=1; AFNElJ8AlLhs7qew8iicF0WWJj/4AUWNlqLBbrv1YJMwSqns5xQ+8TU2NwasbSsRkkgZXbVsr7Xq8JbshnA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbKJWfDxZGZW8lMRkmBHLth3TSPBCfucY1ij6cWVqW38W+thEf
	G6i93I0BjYZAGNZNWQMGPFg/oNZ2+ElRtnbYgdDsfaZ0cS2NfkUtpz/CpvgJxz8/F48=
X-Gm-Gg: Acq92OEG0XUEQOaPYjAMENAMnculDqX1eVpGSvbekGhZOzN3B0bKqPVLHCIOgPHThoL
	dVpHQmWOa7UWqdpPEUpHxEenHlliNDxxQsPNnYIAPbvPAuEr95RHr1vmjkkHaYBNwf7eDibUUTT
	Tg3hjY97LQB4jvi7yLwkebMMlJ2jwOKlBIhiX4fvkFFLigz6S0Yj0FeuaQmVxbrmFopOeshx+mz
	HgJKAofC/PobLQnf1D2J4/cKEZudKiCNxqFNwn5ir+v+fo1A+bqFs/FDm40+u+lIqxWxZ6Y57VO
	r8Y1p0Hi0pt/6xsN9pTlk17NSqRYEmLf1GKeUnfzWvrY9M3PBLkLDSyUym9BQC6rF0HQPZ+YN9k
	ckMChArqCE4EjbEr46s6Gd5pN/rk8wd3aCa6xy9HDjKVL7Yd/jxRlsn+wMRLGPtNVQR0S0CZS06
	oTk4EVdGE7GLNc7kJASstAZ6vdbSSfoIkBUkWYgXw=
X-Received: by 2002:a05:600c:4ec9:b0:490:b642:ce32 with SMTP id 5b1f17b1804b1-490b642cebcmr45646065e9.13.1780483583275;
        Wed, 03 Jun 2026 03:46:23 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b6150bfcsm96449955e9.3.2026.06.03.03.46.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 03:46:22 -0700 (PDT)
Message-ID: <37a3de27-7e86-46d0-b73f-8b9139586387@linaro.org>
Date: Wed, 3 Jun 2026 11:46:21 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/18] perf test: Add workload-ctl option
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@arm.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
 Ian Rogers <irogers@google.com>, Amir Ayupov <aaupov@meta.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Paschalis Mpeis <Paschalis.Mpeis@arm.com>, coresight@lists.linaro.org,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 Arnaldo Carvalho de Melo <acme@redhat.com>, linux-doc@vger.kernel.org
References: <20260602-james-cs-context-tracking-fix-v2-0-85b5ce6f55c6@linaro.org>
 <20260602-james-cs-context-tracking-fix-v2-2-85b5ce6f55c6@linaro.org>
 <20260603104001.GP101133@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260603104001.GP101133@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 03/06/2026 11:40 am, Leo Yan wrote:
> On Tue, Jun 02, 2026 at 03:26:44PM +0100, James Clark wrote:
> 
> [...]
> 
>> --- a/tools/perf/Documentation/perf-test.txt
>> +++ b/tools/perf/Documentation/perf-test.txt
>> @@ -69,3 +69,9 @@ OPTIONS
>>   
>>   --list-workloads::
>>   	List the available workloads to use with -w/--workload.
>> +
>> +--workload-ctl=fifo:ctl-fifo[,ack-fifo]::
>> +	Write 'enable' to ctl-fifo before running the workload and 'disable'
>> +	before returning. If ack-fifo is provided, the workload runner waits for
>> +	an 'ack' response after each command. This scopes the recording to only
>> +	the workload if used with 'perf record -D 1 --control ...'.
> 
> This new option doesn't work on its own. I would spell out in explicit
> words that it needs to communicate with perf record session:
> 
>    "This option is used to communicate with a perf record session in
>    order to control the recording scope. When specifying this option,
>    the same FIFO path must be specified in the record session via:
> 
>      perf record -D 1 --control=fifo:ctl-fifo[,ack-fifo] ...
> 
>    The perf test sends 'enable' and 'disable' commands through ctl-fifo to
>    control event recording. If 'ack-fifo' is provided, the workload runner
>    waits for an 'ack' response after each command."
> 
> BTW, I'd say the naming "--record-ctl" might be more close to the
> purpose.
> 

Will do


> Thanks,
> Leo


