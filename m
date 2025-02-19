Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696D017A2E0
	for <linux-doc@vger.kernel.org>; Wed, 19 Feb 2025 02:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739932515; cv=none; b=j/0ypDrsOL+2gabTJCtJKkrjb/SlWuJVqOTib0oMpAebWDbt9DRuGWJWLrcS8n9qb0glm6zKHT1utgUGfIeDA9BSilBlprqknxGF60loYW3ipZ2jCnqaCmpVu17LJw4rlaHKBKjW2t6c3tVpimy/TQ5ssWMGb0kii66MjseeI0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739932515; c=relaxed/simple;
	bh=xMj+a3horZECbsUTp70ryecXzS79kAANH3UKAZQH/Xw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jexLbCUiNZ/xbltVpBLWgxsjHlqGis9+vMbkA31lulWT0iK0BcSULQi4GQYeWnMDfvurL+oIa536G2RYrgTTEw8uWxwrEXIoUTdtYpWUQihbwiAvHNkXjCX4A2LuJKw/PSTK646CI5wbg1BheDUAhFq4bIZHoQbGLF/QCeU6Pj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=HFWZ/p0u; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="HFWZ/p0u"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2fc95e20e72so458669a91.1
        for <linux-doc@vger.kernel.org>; Tue, 18 Feb 2025 18:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1739932512; x=1740537312; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=09crVdPJ6DNP+ajj0y1kahMC/P/o19M63rERtGCBZHg=;
        b=HFWZ/p0u64B7il8VVyHfZpBfORrgijgprKfvMMfNtpL70oS7jQAiEpAzbEE7vP8HxQ
         cvO81QILcCVbA9zGptcJIGEjwBPA/UEuxWTu2hZwv+GMfokKYMThdMbGmNqRSX+tO5eW
         svDAneuNxXAZ+Ye7ozZQUQXZkNnU4u5wjfzGmB5/w+VkPKAWNfqD+jwG6My6ntD8m0wY
         JWG03WQfSlZ1BG5PxXKMPVDaE0CbKcCUk1Le6vPWLYZ7rJlee8rRYE8e73Gn6Abg1m2N
         kEnbkEURYrYWgRlUkz0VFvzYtVDS//M50V1+xYmCCsbyylmlkhTMHKC8JmChxp4BoRTT
         N5gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739932512; x=1740537312;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=09crVdPJ6DNP+ajj0y1kahMC/P/o19M63rERtGCBZHg=;
        b=phON9kk20ScC0U0cJb3nxV6VgK1FqMFlrwTMS9cQLFBmnHgctwaBbcxNX6dPP6qFGx
         nV1E0CtEO0KTmCVaSXz72K+ODxO0Y4jzfq3odaMBYAl+dYob+ZyJecLs2X/jUSmXuYNr
         5dCQ353XVMAOaw869JgLAcbeQf03MDri/Ys7LN7+O0nDXGaH3a+X2sFDjd/7MQpETh5i
         /lFTdfHqf/qcgioJ2k9p8DvqlwOe0Gw96J1xPVIxf7sJncAr/6BlbQs444DEjb+90ONe
         YFzb91LdzbEN3iWO/w0wa1nPg9Ar5dVE2i1jRuPzPkET/o//5nIV3bLKYsPI2aSk4QgB
         5LxA==
X-Forwarded-Encrypted: i=1; AJvYcCVyIHgpGwariEKVunKZ+m2YApnQPhvioIh4O0rW3MdcLbNEO6il+vWDKQccgNW/VuKItjxChFNrTOg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6YZ87kz/slyX/bULUysZek6x86HbxF1z1SzRjK9H1xJ1pHBTR
	ducWMEIszns66MQI/Iv6I2CcUuujvB867kUdNtDy8Jd+mW9lZzhevbv/6NXWLV4=
X-Gm-Gg: ASbGncvcSfuSULTREy5BFlWFetMruf2v5xKsFpXQbPv2OjBtcmrRfHRhPTJeUxc4ABD
	OEFv0dQaNyRz6j5O2bGWK7TP7APaSiR7BgfCAG6F0lbcNYH/OycNQCBA2YMYj9WJCcqZy1X+nCH
	4po30Y+g8rE6qMSmySoOzh2aheCypKkRh6HVQe5tafPApcULOI/MR5TWU4MgUOJiDg1R6IJM8yV
	/zxmZEP7bB/ypNuJ+OEBLgezGNj8JLWc4nSkzyTsTsp8HezqFzHo44V1wEPgySxrubO3bAdsBzL
	AIVY6kCVrjUNPw3aC4VpEUmtMUHiEdZSQevVMA==
X-Google-Smtp-Source: AGHT+IFm/ezzRUBSTF5ubokeL2y3X3qw2EPgW1gleUK8zJWAXhnpg5Xa99tIuiNpk1+QV7gj49PhRw==
X-Received: by 2002:a05:6a00:1256:b0:730:8526:5db2 with SMTP id d2e1a72fcca58-73261914657mr8861999b3a.5.1739932511607;
        Tue, 18 Feb 2025 18:35:11 -0800 (PST)
Received: from [10.4.186.143] ([139.177.225.228])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-add5a4cb306sm7248480a12.3.2025.02.18.18.35.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Feb 2025 18:35:11 -0800 (PST)
Message-ID: <cc25136d-ca21-492c-9708-cd72d7d7f2bf@bytedance.com>
Date: Wed, 19 Feb 2025 10:34:58 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Fix and cleanup and extend cpu.stat
Content-Language: en-US
To: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
 =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, Yury Norov
 <yury.norov@gmail.com>, Thomas Gleixner <tglx@linutronix.de>,
 Bitao Hu <yaoma@linux.alibaba.com>, Chen Ridong <chenridong@huawei.com>
Cc: "open list:CONTROL GROUP (CGROUP)" <cgroups@vger.kernel.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250125052521.19487-1-wuyun.abel@bytedance.com>
From: Abel Wu <wuyun.abel@bytedance.com>
In-Reply-To: <20250125052521.19487-1-wuyun.abel@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Gentle ping :)

The latest series:
https://lore.kernel.org/lkml/20250209061322.15260-1-wuyun.abel@bytedance.com/

On 1/25/25 1:25 PM, Abel Wu Wrote:
> Patch 1: fixes an issue that forceidle time can be inconsistant with
> other cputimes.
> 
> Patch 2: cleans up the #ifdef mess in cpu.stat.
> 
> Patch 3: extend run_delay accounting to cgroup to show how severely
> a cgroup is stalled.
> 
> v2:
>   - Fix internal function naming. (Michal Koutny)
> 
> Abel Wu (3):
>    cgroup/rstat: Fix forceidle time in cpu.stat
>    cgroup/rstat: Cleanup cpu.stat once for all
>    cgroup/rstat: Add run_delay accounting for cgroups
> 
>   Documentation/admin-guide/cgroup-v2.rst |  1 +
>   include/linux/cgroup-defs.h             |  3 +
>   include/linux/kernel_stat.h             | 14 +++++
>   kernel/cgroup/rstat.c                   | 75 ++++++++++++++++---------
>   kernel/sched/cputime.c                  | 12 ++++
>   kernel/sched/stats.h                    |  2 +
>   6 files changed, 79 insertions(+), 28 deletions(-)
> 

