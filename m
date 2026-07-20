Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F9C1DA23
	for <linux-doc@vger.kernel.org>; Mon, 20 Jul 2026 01:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784510823; cv=none; b=THl8yUef6j5c7ThNYjfkYXX+GJxu+28DliIdFte71UenERo1DJ7NNqAPkvaMbMoqgGMMGaJILu9/lu0OxdCkx1Hj8Ga7QEeVtcA8I8Gk0V1frs9GlCWa4QKwLfD5J9lODwUG7JX2LdPfc9z/K3sJLnQSjPVxtCWi5PXMr9osOkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784510823; c=relaxed/simple;
	bh=HGYuSPtjGaJQmKS1H4EHNovCQZ/qJMDtrtwwlCqhRsg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VbwdedkuZG0myrR3nyzYqo9cWhgUUi88PeAtFOwOjvS+So78bjqKC/yhc9PX51Co3ge6sEWBYm1a2ngocma/hfn/RKxhYP5jEjFb1NCPC7T9EJa7IbFw8uLlkzkyKm80CwCH05kFPog0iePD9tP0Zd70bv24f3dfiekaYsI6CW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QgIa23Vb; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QgIa23Vb"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ceb096e675so92589155ad.0
        for <linux-doc@vger.kernel.org>; Sun, 19 Jul 2026 18:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784510822; x=1785115622; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BFiv0hXx9c1wz+9oCFT2VYuHi8ADjSyN7c0ptHnERB4=;
        b=QgIa23VbE8E8Hx9hJngW6nyLoC4C4gCVAeloWndSOJUW+yRmWzgqyeArDWv7Cb5bE6
         DJHi/S7Ito4dKn/PvhVsV2ergid+bKZIODPukG04ErXPHrihEnJbS00Q3OTZZNfh6ysB
         lX7T7tpvG0UdUs6JHIXjTPVcBCZ1he6UEoxPOk9XM/wPTyzUrRbHIjjdmpt6//uvNzvA
         qZPLu8q9tKlIE7dTuOuttFT+gkY8M8+b9TtRpfyNU+gsYsiaHfMVBjB199IsmwUc59ZM
         Q63GUejT4iqHknx3P3sMdwQcJiJa9bpUK+M93J7Of+whFkSftierVnWcpkF+o1THXeF3
         irOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784510822; x=1785115622;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BFiv0hXx9c1wz+9oCFT2VYuHi8ADjSyN7c0ptHnERB4=;
        b=dRvQQK2vAriIjmnj4xP7SibR/zZ2I0A8Y9K//5ECBefpoOj3KUMqzV6QdRiX6+rlWM
         ma4kznd0CE3go3sDBER/MbLbOZTZ+5pEyhbePnq2bHklC127aecd6/KEXJ/X6vih1G1v
         RkktfTUIoHLzf7ryYmWi2/bj2V3/iah4GMFuAmZrVrQ8d9ZrDIglt8s1BrCgYs6fOYwy
         vxa+7rwg7GLRpkp+vIkFYMmtpaaiAlJLsTfVnbRb5gc27k5Q/MbLbjDkrs59JHJDGUvW
         Qm/qw9M6v/dhzun7B0JR3yMmyY9d3Jqs3/J1fr3zODf5/Zzl0xJPnUSADP38/vLLZO83
         qcTQ==
X-Forwarded-Encrypted: i=1; AHgh+RqcOZj4fBEUUT+KQ7dTBwq5XssxCSmBy5nCUxwL+3TGA5m8iMx05gy4nUmZLa5829ihnPm3JOUOtzU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKlioelpcCv+XklJo3ZnYIY6CMF6gBqaGQ8i4Uz+KngpwcP/g/
	rd7Lvn7U7Hz0DNXGtTiWYH6QMo4l6DOHs+eUf3pKmiq175NLAkKRvGMu
X-Gm-Gg: AfdE7clKbuaxKUqnYLZ6vjL0vQyrp3pR/1SnrsTPGgUxXlk7vo4D7mGPc18yDiRIlNl
	Lk/wU3tdOJsDlAVO7Yp8/ALpeCUZiHGpSIKQwLz3lq+Ff5YPH0GybTi8AGEO7xDyFxvhzPvXvz+
	3bnZuRNsR/LgNW+GuM1H+GdOOvP/oePblAfeBoUiH6DMz7C5EmqagcZaY5MyrDSlkzDkhovqXce
	sIzKRDE1RSzojlaoN6eDWdxbH1k/kV+sbYnXnoT2CmlcXrD3ykvGr337QptWyqm16YsVbzv0rhb
	4/Y/a9eEuFuk4MzZCm6OhSdj2S1UvBaGVFJyMFL34M7agToVxStf/MmjqGTcdhNGxBOlgvjZnqM
	ti6q7Wn8ox1ZjlG3hqE1w8HMu5uxdJzs/84DkXTwH8rLNYcul3okh+Fu9EHgFPhsflwDMRZCbMQ
	g6ZsSuz34QFgot7lO0pPb6vUUG+mZnGs6BYqtr5Eej7LA=
X-Received: by 2002:a17:903:2ec5:b0:2cc:77f3:a927 with SMTP id d9443c01a7336-2cf34961e63mr155206525ad.26.1784510821982;
        Sun, 19 Jul 2026 18:27:01 -0700 (PDT)
Received: from [10.125.192.64] ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf347554a2sm48005765ad.73.2026.07.19.18.26.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jul 2026 18:27:01 -0700 (PDT)
Message-ID: <7dbde343-fbbf-6a1d-1785-ebf9f5a04f6b@gmail.com>
Date: Mon, 20 Jul 2026 09:26:50 +0800
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
To: Andrew Morton <akpm@linux-foundation.org>, Yosry Ahmed <yosry@kernel.org>
Cc: tj@kernel.org, hannes@cmpxchg.org, shakeel.butt@linux.dev,
 mhocko@kernel.org, mkoutny@suse.com, nphamcs@gmail.com,
 chengming.zhou@linux.dev, muchun.song@linux.dev, roman.gushchin@linux.dev,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Hao Jia <jiahao1@lixiang.com>
References: <20260717085151.22822-1-jiahao.kernel@gmail.com>
 <20260717181839.c94d0335ccef0084707d3d85@linux-foundation.org>
 <CAO9r8zOrXqsEaCEJUUAxbAhhN_OQb8ejogeUa6k8hX_JV8hxxw@mail.gmail.com>
 <20260717214031.8b22e9a37ea3b0c564b466f0@linux-foundation.org>
From: Hao Jia <jiahao.kernel@gmail.com>
In-Reply-To: <20260717214031.8b22e9a37ea3b0c564b466f0@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2026/7/18 12:40, Andrew Morton wrote:
> On Fri, 17 Jul 2026 18:28:04 -0700 Yosry Ahmed <yosry@kernel.org> wrote:
> 
>>>
>>> The [1/2] changelog lacks a description of how the flaw impacts users.
>>> Please describe this fully and maintain that info within the
>>> changelogging.  This info helps -stable maintainers and others
>>> understand why we're proposing a backport and helps myself and others
>>> with timing decisions.
>>
>> The first line in the changelog should be sufficient imo: "Zswap
>> writeback on hitting the pool limit is broken when memory cgroup is
>> disabled"
> 
> "broken"?  Perhaps this means "fails to occur".
> 
> But what is the userspace-visible impact?  IOW, why are we proposing a
> backport?
> 

Perhaps the first paragraph of the commit1 message could be modified as 
follows? I have added a description of the issues that occur without 
this patch.

Zswap writeback on hitting the pool limit fails to occur when memory 
cgroup is disabled, because mem_cgroup_iter() always returns NULL. 
Therefore, the global shrinker shrink_worker() always takes the !memcg 
branch. After MAX_RECLAIM_RETRIES empty walks, the worker simply gives 
up, so it fails to write back anything. As a result, once the pool 
reaches the zswap limit, every subsequent zswap shrink work run is a 
no-op. This leads to zswap store failures, forcing pages to bypass zswap 
and be written directly to the backing swap device, which can trigger 
issues such as LRU inversion.


Thanks,
Hao
