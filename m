Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791DD3F7A90
	for <linux-doc@vger.kernel.org>; Tue, 26 May 2026 11:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779796608; cv=none; b=DDw+BnF2kZi/ZENwqbxzK+D3EOyyZ5hoDkrZ/hw1xUqHKq2Nw6IUQUyG9is8e0T+F3h2WYfvhG07hy/IlBBQatGcnVi6RVGQM5ulNxDroAaVR8lrVwTPPYQSuG1eyOM6TqCmSFjMrvDTaWUZmcoGPUW40LmlTS+ougXhbk+lx4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779796608; c=relaxed/simple;
	bh=eQi4btdZRSOuUIsDh49YQq6zAAIvQJ0rVwcZD0zz4UY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B1+TNkpmVO3mGwmZQj7cttMc68903C00GBrH4MFcNfrdH+S98zeLHUChWsML3nVEtFgbyyuxxX9OjG/lX2eT0JbeCOOXWRAMJQoeAkTcV+2DrTy2/c+hbT9KPa9wVgihu8RMvegPXWcPq5g5LWnbc/VE2HZpYPFw6TndYWU3wL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QEFHCoRr; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QEFHCoRr"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2be1dd4af34so92859815ad.1
        for <linux-doc@vger.kernel.org>; Tue, 26 May 2026 04:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779796598; x=1780401398; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e8JaNo1vOaK+r4fFp4lVpergJl5Sjg03Po9hQ9chJkg=;
        b=QEFHCoRrxb75lszLe6FGdI+DIY1HMwWo1yYsEBPLadVyPe3tZM1fta0mHlfWPbgcjc
         kPRdHrPY/OvFc+KEBUz+Xlb0VONFMaUAYdGWmRXwoIVvyz8l4laKKq66I69pgwP+9O/A
         vd6xzjUj7oY+CNKe7k41mpGmvbqnovK+skRjM0EE6h0tAviITZG6d4DIQWwx/OZSeVdE
         Xgb6I3GUMltQsHT8GLISGa6OaJegbv1lyrJp/iu+qR3xX8QSDii4wrpHfljE8V7tIi55
         X9IOScqogGu8vk/em+dO0pDjOnKCJR/HL4lv73MOwNgOdejCowvN90lp5klMnisZVrvC
         EKlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779796598; x=1780401398;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e8JaNo1vOaK+r4fFp4lVpergJl5Sjg03Po9hQ9chJkg=;
        b=HkHeoKwl/1btOzv3KbZtO1BLAN9M8BVf5qZaSg/dhHGaXRwr5saAxCHS9PwYAVYxqk
         D3vaS2zjn2QaVhznbObPHq/vldRachRMZ9N9l4E0hC9PI/c1u1YbZS9Ec19uyVCOdhTj
         f3n8RwVpxrrUx6mMVMv3BSj0hpdT11Q+IU/7FNvhVNz5SQQ/EWoQstHE5mdq5iRwe59T
         kNkQ5MnA3M+gq6P7ytha+8kadxLoV9rdyOJgs9tCqNWxVp8E6/XMe2SFSHmx5Jd/eLUv
         p3JSXfBVy6ZWcoy4beU8EMyBveBIuPDuPqydVkRWotYBHRGC1Osh7LrT31kA7UARUBh8
         nXFQ==
X-Forwarded-Encrypted: i=1; AFNElJ+zwgN0OuUu/+/tCXfljiAgPyaxYZCtQKpY0KAhOqwS+ZJo4hK8A0qLP6cJJUmXa5nlwrMOmuCf/HU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDeEIYP9dNGTMvzy9L0inf62gcGGeUd5O6W0UajaSWgCHd8TR1
	7x7DtupKHt2AzJlmVAzIdhuEySaHz/YD176VJQvwo7vSPujLjjliSmfL
X-Gm-Gg: Acq92OHhzP3bN9UEMWj4N61OOQ9q+JRuycH+xyiudVbYZBe+bwr/vK4BCK1fP4H2E5K
	z63KU/Zm4N/q1KZPRoXj7boaUyiGPHrDRlkfhN5V+WbjpqIvN1bEzzEmj65VKDLy1VXE0l0Mx4N
	gVNv3JOlrU4MKPUnQzjKTFERoYpXzi3SNSRMEAwkirK/pc3zfoAd+9GWgnkE9iatvEAOgAgPUvu
	AsINRQFGkGMH8voZ/rEmZhovRLTM+OA/UhnfWsxAcLKMOG6xSOScemzFvLMVCreodkGjFXW1TfZ
	s/ZgNcwMCh/4Pyy0LMsqJT4051+f/61D6BWOZV2JnX0Oisbd4qztDtsU+tuKBRObsimPp7YwGf9
	SCGlnVi7xpIHIa7DzYxAYQwAUIaWqKQ8962qxlVMWjt8o96atJU1bfCzMl33t0oKk7WK9BGKfnd
	9EK0+NV+OSDphUE0UsuWmV8ZQzO8oC3iE/vshy/pPfoFrITWeJpUEb9Lc=
X-Received: by 2002:a17:903:350d:b0:2b2:4cd2:e162 with SMTP id d9443c01a7336-2beb065aa18mr205863945ad.34.1779796598367;
        Tue, 26 May 2026 04:56:38 -0700 (PDT)
Received: from [10.125.192.130] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b2cd6sm126864375ad.52.2026.05.26.04.56.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 04:56:37 -0700 (PDT)
Message-ID: <9b2ac88c-a67f-2512-d898-3dadd50ec03e@gmail.com>
Date: Tue, 26 May 2026 19:56:27 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH v2 0/4] mm/zswap: Implement per-cgroup proactive writeback
To: Andrew Morton <akpm@linux-foundation.org>
Cc: tj@kernel.org, hannes@cmpxchg.org, shakeel.butt@linux.dev,
 mhocko@kernel.org, yosry@kernel.org, mkoutny@suse.com, nphamcs@gmail.com,
 chengming.zhou@linux.dev, muchun.song@linux.dev, roman.gushchin@linux.dev,
 cgroups@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Hao Jia <jiahao1@lixiang.com>
References: <20260525122242.36127-1-jiahao.kernel@gmail.com>
 <20260525122424.3b2818f06832d9d55da8d69b@linux-foundation.org>
From: Hao Jia <jiahao.kernel@gmail.com>
In-Reply-To: <20260525122424.3b2818f06832d9d55da8d69b@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2026/5/26 03:24, Andrew Morton wrote:
> On Mon, 25 May 2026 20:22:38 +0800 Hao Jia <jiahao.kernel@gmail.com> wrote:
> 
>> Zswap currently writes back pages to backing swap reactively, triggered
>> either by the shrinker or by the pool reaching its size limit. Although
>> proactive memory reclaim can automatically write back a portion of zswap
>> pages via the shrinker, it cannot explicitly control the amount of
>> writeback for a specific memory cgroup. Moreover, proactive memory reclaim
>> may not always be triggered during a steady state.
>>
>> In certain scenarios, it is desirable to trigger writeback in advance to
>> free up memory. For example, users may want to prepare for an upcoming
>> memory-intensive workload by flushing cold memory to the backing storage
>> when the system is relatively idle.
>>
>> This patch series introduces a "zswap_writeback_only" key to memory.reclaim
>> cgroup interface, allowing users to proactively write back cold compressed
>> pages from zswap to the backing swap device. When specified, this key
>> bypasses standard memory reclaim and exclusively performs proactive zswap
>> writeback up to the requested budget. If omitted, the default reclaim
>> behavior remains unchanged.
> 
> Thanks.  AI review found a few things to complain about, one of them
> described as "preexisting".
> 

Thanks Andrew.  I have replied to the AI's review comments in a separate 
email and posted v3.
https://lore.kernel.org/all/20260526114601.67041-1-jiahao.kernel@gmail.com

Thanks,
Hao
