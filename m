Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7997429009
	for <linux-doc@vger.kernel.org>; Fri, 24 Jul 2026 10:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784888535; cv=none; b=llfoRCjNQUCgbc2Bj7CbxaiMnCRpG9rbDV0JO0JUVm7qI6SfPnp7j7BeR3zyeOcuPY+CeQ9Y1N/URehuSuLYRvJReXmvUAQTL7zALWONqPJCS1Bx6cnOLpXEp6Z4eQaBxUKKn6GtCvxht3k5E/SykGPnRaJhuvvD5l3waB6uQ7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784888535; c=relaxed/simple;
	bh=EHvWl82n0n7uzF29LI/GYIha5plZ2gekMSFm++1M26s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tMOCvmjhD15da94pRLHENtNImXygueoMp3gTZkJODUwwinpxAJFnd3S7k1nNILtEmjFimNBLSqKAyyXGYfOliaVm7eCtz1ZsFqiXczFSowmYilJkja+cgsSQEXYcRb1yQJC4mUBXsgT0J7gPbD1T/vB3UlOb/s9+sMmD9w1T94o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tGki3KfT; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tGki3KfT"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-848479c9bd5so171527b3a.3
        for <linux-doc@vger.kernel.org>; Fri, 24 Jul 2026 03:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784888531; x=1785493331; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PjEtanJscU+kRHtICYaoHdn0dLIQ0TxUX75oiJzMbAk=;
        b=tGki3KfTtaygut4cbC7NxLDgI0XW+yq8UVHtMe5vreWmKMAg4F08yfkN5kgw4Mng6o
         82GDotNe+nZ5huGszSMvkmhsFu5ltUAMsfKAQ1UniUBwLYNkm9nZhU7LzgReNn/iQoHS
         GBIZef90HgS6hvWvbxlyS1micgmlX1K3Bc/X6//tJMDNlWCH/X9krw7HTAvLVgdt31aJ
         00NubZBZbX1UY5+LdwUc/krcSGNUPWmqIZ0Oi1NOeXSNr6TosBCrtnXXNiUWy63rtj8k
         SvGYnUvWQHQwQuBqV5yHY3Vl4QA9tn5Sm2qgDlE6EJiJBzIiEmJtsXj3rKq3ufgOb72n
         Fv3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784888531; x=1785493331;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PjEtanJscU+kRHtICYaoHdn0dLIQ0TxUX75oiJzMbAk=;
        b=CrnqMyYM1fdw66rNco955jVSIkfl6ygJHZ8xP01FyT+qf1Mq96fGuW0tMLfnSzouZ9
         qpKFBu2pev0HcenRbZaPSSzcrGP6vCHrclRmxA1METP8VX2qtm39O0NAwudDxz4nljSc
         t4cgPbnBgSTznJfk534iFchax1QTyUHRArv/7X3pmqOvEhINLEcEreEEWOixN8MROi7N
         tRfk/aHfSUnnvDUsMcx2j073VQVOUzCZXRoF8N8Z6Ea8ogp8hlfY/LSNfeu9U357o0nQ
         bq5y0hD3qluF3u00ujGvpFzMqfX0bMUeReguaHOigbS6ZltWW7n7QwnxNZfJt1qvzM3O
         TALA==
X-Forwarded-Encrypted: i=1; AHgh+RrafRufPBlQ5InXUm5eP6alqNZksVXycNCi1I9dOZTiu+ZAoqI1kkQySolK69k+96h8nES84lFE7bI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUYWSTU9xpxZjgWFQPMNQ+YoW4dDR7GXHcAUR/bEn9tKAHgKws
	mzagOpqN2Yc1jCsOG8fCr7h/8kpskuwMi+1Z8kSf1hQCzbNCVFtXkdow
X-Gm-Gg: AR+sD13JCWJITsK7LttWFjBmEzjTF955IEk8gZ6LsmStfMf0O49iv2vDaYaMoFgkFeX
	cpb3v8zAbH2+Eqfkabi+0ktb1OEmlJtJX57pJBwRiB7dviLIw4dj7+V7rrHKpY69I7hM8BU/XeI
	gbYj25/zReDxHbAT4n46HlmQObiwRc/277uRgAalK5FimJViLL3/Ygbhm6UvdT+6SJeO9PGLJPM
	v8KIqOKtAg62aXQmcozHaEPJH/cyjd1k+f/NqUp34r/SXuUoKyr8mxCrxAR184dzZ0mBMPcttyJ
	BiIoorX31N9hzIM+NfbU21gTj0ZyRmsgOowAjrhrzaBrXg5SFZRBJpPXaTEOcMj3XpDeMnkPIdc
	bIowtPqGYF/NPQBB+M8VqvZveA29ZpOx+aKZOE0i48sNdgj+sERPEo2xHfeMwUuhxA7mvULD8j+
	H+59tmtRsPk4JKNga10viodw==
X-Received: by 2002:a05:6a00:ab83:b0:848:65fa:542 with SMTP id d2e1a72fcca58-84e2bbba2b5mr7126501b3a.53.1784888531583;
        Fri, 24 Jul 2026 03:22:11 -0700 (PDT)
Received: from [10.125.192.96] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e17573c0esm4486650b3a.38.2026.07.24.03.22.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 03:22:11 -0700 (PDT)
Message-ID: <2e61a4e1-20ed-4fe0-158c-5a9d060ce01a@gmail.com>
Date: Fri, 24 Jul 2026 18:22:00 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH v2 0/2] mm/zswap: Fixes and improves the zswap global
 shrinker
To: Yosry Ahmed <yosry@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, nphamcs@gmail.com,
 tj@kernel.org, hannes@cmpxchg.org, shakeel.butt@linux.dev,
 mhocko@kernel.org, mkoutny@suse.com, chengming.zhou@linux.dev,
 muchun.song@linux.dev, roman.gushchin@linux.dev, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Hao Jia <jiahao1@lixiang.com>
References: <20260717085151.22822-1-jiahao.kernel@gmail.com>
 <20260717181839.c94d0335ccef0084707d3d85@linux-foundation.org>
 <CAO9r8zOrXqsEaCEJUUAxbAhhN_OQb8ejogeUa6k8hX_JV8hxxw@mail.gmail.com>
 <20260717214031.8b22e9a37ea3b0c564b466f0@linux-foundation.org>
 <7dbde343-fbbf-6a1d-1785-ebf9f5a04f6b@gmail.com>
 <0a96b7ec-0d8d-2abd-afaa-739c562bc985@gmail.com>
 <CAO9r8zO6AsdZZWoYibAj6urMxgM3eq4bg9JDhr443UZONPF_6Q@mail.gmail.com>
From: Hao Jia <jiahao.kernel@gmail.com>
In-Reply-To: <CAO9r8zO6AsdZZWoYibAj6urMxgM3eq4bg9JDhr443UZONPF_6Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2026/7/23 12:49, Yosry Ahmed wrote:
> On Wed, Jul 22, 2026 at 6:21 PM Hao Jia <jiahao.kernel@gmail.com> wrote:
>>
>>
>>
>> On 2026/7/20 09:26, Hao Jia wrote:
>>>
>>>
>>> On 2026/7/18 12:40, Andrew Morton wrote:
>>>> On Fri, 17 Jul 2026 18:28:04 -0700 Yosry Ahmed <yosry@kernel.org> wrote:
>>>>
>>>>>>
>>>>>> The [1/2] changelog lacks a description of how the flaw impacts users.
>>>>>> Please describe this fully and maintain that info within the
>>>>>> changelogging.  This info helps -stable maintainers and others
>>>>>> understand why we're proposing a backport and helps myself and others
>>>>>> with timing decisions.
>>>>>
>>>>> The first line in the changelog should be sufficient imo: "Zswap
>>>>> writeback on hitting the pool limit is broken when memory cgroup is
>>>>> disabled"
>>>>
>>>> "broken"?  Perhaps this means "fails to occur".
>>>>
>>>> But what is the userspace-visible impact?  IOW, why are we proposing a
>>>> backport?
>>>>
>>>
>>> Perhaps the first paragraph of the commit1 message could be modified as
>>> follows? I have added a description of the issues that occur without
>>> this patch.
>>>
>>
>> Hi Andrew, Yosry, and Nhat,
>> Any thoughts on this change?
> 
> I would front load the user impact in the first paragraph:
> 
> Zswap writeback when the global pool limit is hit fails when memory
> cgroups are disabled. The pool remains full until it is organically
> drained by swapins or memory freeing, leading to zswap store failures
> and pages bypassing getting written directly to the backing swap device,
> causing LRU inversion (hotter pages with higher fault latency).
> 
> ...

Will done.

Thanks,
Hao
