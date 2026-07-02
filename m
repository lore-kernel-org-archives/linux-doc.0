Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B6947D93C
	for <linux-doc@vger.kernel.org>; Thu,  2 Jul 2026 12:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782995574; cv=none; b=q/u6igKYJJTVuZh5xMyAwt22TTr9stiWmgWg8nIT59j1flqf508q7KzjeKYQFF/tEHT3H+A34ZkB48ZW48tIvJ4RbqVqXHyEDAg16cOEYMzuHYyacrC6qJeL0Fdr/07M+Iw6JKxzhMxPinV2kp/BTFyuCaaoC4TCOd4BIzB2jLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782995574; c=relaxed/simple;
	bh=8ybUXhYJmiXWSB4WXYhyKNgGmMpXifd0n0CIe6z90lM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=l8JsatMGo5RV9Kdk7JHSX/4k4qP+dBH8rRcrlsyzC1fHn0muZ3uP0lxF85qQEyajQSt0EJ12fAhDArZAsfX6vMordlL3P3vGFdOOg30JLG/f0lEEI2vS9PQ+PKRMlQGaVS+9Pxm7XqFa0McQypQcbHVfLeTfFdAoOAoCuhNROVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WFiwVR2A; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WFiwVR2A"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-37e0fb87b75so1664158a91.3
        for <linux-doc@vger.kernel.org>; Thu, 02 Jul 2026 05:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782995572; x=1783600372; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AAmDZHLk7Z5SMIFVpeGPWOSrWBoOPy2gY3L8xo2kvSM=;
        b=WFiwVR2ALOQzTvGVKDOwmYnIeX9ZS+xT2zmqWMyTmM4w88AMPKA7Q2xusWOPhoq+x6
         KTTruTt5kpVvxdibdrEq07Qmtph0qljg0/tsxive/XaMNsRxF3IHKHlKJatecaFirxMR
         RvPl3Wf81lKjex+ND865G0vWajS0RXaB84KhrVsyKGNEyvU5o36+o9gOpBKbtwg1guRc
         mjmrCJ20/gJyqulB4WZifQQ8OtmnRdtTS1/7oft5MEeXhnJcH3EuIpGb7l0fqS/9SZAx
         MbvSAARwGdUEZceBeKvo9BpjxGhUO49gy9jjk5WhWUFMWn55HECnGvX7Ee9mS3dx9hqf
         pdVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782995572; x=1783600372;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AAmDZHLk7Z5SMIFVpeGPWOSrWBoOPy2gY3L8xo2kvSM=;
        b=qZVa0r3QTJCOd7fIMUq4e5/2yU17wqA5e3WyyOCX/czEISaQludvehQLHE5l0b6kJT
         rdfe54ItETkpSdZ/UjUoP9mpZzyycdEMp2FK8opGh27JGjrgs0tKs14xAonxoh+YsUme
         3rJm6lkJdXwnHEJ2yi18lp0BkwyajZu7KPSTJePmf/r52lVlSjQngzgw+l9ffpqd/fm8
         bSuWpfhas6Le1DDOAgfHZvOLt/Ye7h3nC9/KY31xcBR4NLyJ/cJ4N9wcW5U88vb1SQV+
         mvUpL2miYy8D60QT6NSNW5ZvAXrfYlPU4+9VAwSr/3oDlaTmEAZmxUGBH1SuXEiGRuxl
         1HGA==
X-Forwarded-Encrypted: i=1; AHgh+Rp/DpDnCaUv2IlpJ8a4suGZbgCtzprlOAChmqjkX3/CtcrjUzcg9OFpGoQ1gk3l1C/gjJFyDjtpYSs=@vger.kernel.org
X-Gm-Message-State: AOJu0YybMdANTzHuR/bgbTn7yuDnxJpHla0V3agnKUtJ0+O/H/bL4cHD
	odguS2sQvR4Fb5r1cm0MGlqtsKHAu9Tkx9YRQKQ/5QDpdim/jM2AUBR2
X-Gm-Gg: AfdE7cmmya0q/UMMtdtvyYAs5wlfu4WasfyWI/hW+RPPRV8eqoNmyRpgCysRld42xEM
	b9d27yCghs++8d04OEwfezk7Sw9FW8gRRBkI0aooX6zux2AEXGL+oLIUrqG4WAdxGYaMlQT+nEJ
	J5CEFOiQUEfxsjQBOYClZ5oqyt3by5OjML/Uo+VhN+s53ixAKrWSIuudpVa7V1rYAN2stdM5K80
	eYTJEYDgCwOqh/i/fuUaaRG0qjZGW/bqiJOsT28teCDR4qpxcMi+ZOFkNXeh53z/LtJQ5qqyjJY
	Kse+/Bbi9bYIuElVfmYZtDLB3m64t1rWoSbcuOyouM77cO6B2AiG0NIuNxc/f7tWodKTFzeK0TA
	7s0R8Bqoekbtuj0SZFUgjcJz9IlBZx5gCMgbQuTjyjud8KULfEIFuwSF3R9xaLj0kw/Tlss188W
	wRa7VzKdtpohzI40ea7Tz/xoIZ4cIqajLqtnEgju0NtH8=
X-Received: by 2002:a17:90a:da8f:b0:380:7688:fbe9 with SMTP id 98e67ed59e1d1-380aa09b81amr6314899a91.8.1782995572462;
        Thu, 02 Jul 2026 05:32:52 -0700 (PDT)
Received: from [10.125.192.77] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-380e17aa249sm1038281a91.10.2026.07.02.05.32.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 05:32:51 -0700 (PDT)
Message-ID: <5ce4035b-7f56-d1d2-2d2a-668446d870e8@gmail.com>
Date: Thu, 2 Jul 2026 20:32:38 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH v5 4/6] mm/zswap: Implement proactive writeback
From: Hao Jia <jiahao.kernel@gmail.com>
To: Yosry Ahmed <yosry@kernel.org>
Cc: akpm@linux-foundation.org, tj@kernel.org, hannes@cmpxchg.org,
 shakeel.butt@linux.dev, mhocko@kernel.org, mkoutny@suse.com,
 nphamcs@gmail.com, chengming.zhou@linux.dev, muchun.song@linux.dev,
 roman.gushchin@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Hao Jia <jiahao1@lixiang.com>
References: <20260629112032.20423-1-jiahao.kernel@gmail.com>
 <20260629112032.20423-5-jiahao.kernel@gmail.com>
 <akMJ8UfeZXrVe5LN@google.com>
 <cbbdf506-b67d-193c-2c94-bacf828d559f@gmail.com>
 <CAO9r8zNCEis2QHROEsM5QZsb_H4ofNjA_sE-pM7SVxtgHg_rqg@mail.gmail.com>
 <4ec2bd64-af40-8ebf-b8a8-2dd7421a1100@gmail.com>
In-Reply-To: <4ec2bd64-af40-8ebf-b8a8-2dd7421a1100@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2026/7/1 19:45, Hao Jia wrote:
> 
> 
> On 2026/7/1 00:10, Yosry Ahmed wrote:
>>>> Before going through more versions we need to figure out if this will
>>>> pivot to be a proactive demotion interfcae for swap tiering.
>>>>
>>>
>>> Yes. Should I drop patches 4-6 in the next version and wait for swap
>>> tiering to be finalized?
>>> We can try to get the non-memcg parts (patches 1-3) merged upstream
>>> first. This would also give them plenty of time to bake and catch any
>>> potential regressions. Thoughts?
>>
>> Patches 1-2 can be sent and merged separately, yes. For patch 2,
>> please include some numbers for the writeback performance before and
>> after batching.
> 
> I'd love to collect some performance data. Do you have any recommended 
> benchmarks for this?
> 

Perhaps the following test case could work?

Test Setup:
- Total memory: 32 GB
- zswap settings: max_pool_percent=1, accept_threshold_percent=50, 
shrinker_enabled=N
- cgroup constraint: memory.max=1G
- Workload: Run the following stress-ng command inside the cgroup for 
120s to
   continuously force zswap store failures and trigger shrink_worker():

   bash -c 'echo $$ > /sys/fs/cgroup/zswaptest/cgroup.procs ; \
   exec stress-ng --vm 4 --vm-bytes 4G --vm-keep --vm-method rand-set -t 
120s -q'

The following comparison results were collected over multiple runs via 
bpftrace
and the 'written_back_pages' sysfs interface:

                          Baseline         Patched
---------------------------------------------------
shrink_worker wakeups       5,587             878
shrink_memcg calls      7,823,853       2,347,320
written_back                  257         781,214

Conclusion:
Under the same workload and duration, the patched kernel shows a 
significant reduction
in both shrink_worker wakeups and shrink_memcg calls, while successfully 
executing a
much higher volume of page writebacks.

Thanks，
Hao
