Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2049A325704
	for <linux-doc@vger.kernel.org>; Mon,  6 Jul 2026 19:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783366433; cv=none; b=i5dEydZzqX/uElEUJmevQ7pCJHHZ7e3VqgWKLQAKabD9gtgrjfA+WEO23ns8BNyJC4yjRAJbup28RXZgTBDR8HVFveVwOxIPBjLATrRY1GaNj4xJ7365tLFGuqpsghUsHq2XiSm02cPWus9/VEJbC2szxbQSIzsTn0imyWG2TEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783366433; c=relaxed/simple;
	bh=am63m0vWibO7YQ7icq03k3Ymm+H6WupYa8r/m0O9+ZE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NTiuqylI0IumfVam/CNiLnL2LSNxG4P1OxTsMvxW6UefNxo5lU6ZlorgxhWHNGeRBUmZqsJz/JAyCyeTqug9pjJQq8FhVp6xa9Ky/HpPR7a5iO882GqYFt/7y2T1Zs4Nl/mztK90O0QHB85R2SXvNjzLjP/+D9hZlaGXlqSnxHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=do+qsvS7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="do+qsvS7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAAD81F00ACF
	for <linux-doc@vger.kernel.org>; Mon,  6 Jul 2026 19:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783366431;
	bh=LgeAs0ILMEUxRaUEmhq6DVdls3/aBsdrj6eO6rYrOOg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=do+qsvS7AFlAkXCPeq2WOuGUNZLmIP/FFCnkzVr8WVRMt2kohwsPQA3So565D7jmc
	 DilSS4ApSr9NLjZVFcpZvNVvuJKT8Gb8s9GWBJZBOjDIl7gLjikvGn6CSwsivgQQ9p
	 xGQymHmRr4A5cOUnsGj6bNvsCufJi+BwrGJ5r/yfrWkIgxfWAj4ACdgmoMan1dK0Z3
	 3H5o1sJiNa5bTO5yraoUmm1jivQ2ej2WNqNpIKqQfUJwuXdJpP6kTlyKmT+/SOJMvu
	 2pQvZAKWuc+0xKgAUqkeYEBn47Bl/+yTpHQYlusZSeSKKgOe4NAWBRM3xcRQMuuBvo
	 l+89LBB312HZQ==
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c12a1a3cdb9so330136266b.0
        for <linux-doc@vger.kernel.org>; Mon, 06 Jul 2026 12:33:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/JwHmXTYY5OPczbegreHL2PeoGp1ZgBkEHvuIM7wSTwUJjorpolStHJSbP6robPzzINuXpx0pwO1Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+ubOfRj8HuW4jGucE7U6cmbwmqfFYVLx+1ljca6PRRT2l6+Aj
	G73/vp+WOyJfV6B6rD8sC01qxJL5BR2fsuj8huZq9DynQmg51gujtoWnz+d1PCVdw/UVfOrCdUM
	uwszZ5eKPwGiwmw2fhuexcSx31lbbHrc=
X-Received: by 2002:a17:906:2b0f:b0:c12:70e8:6025 with SMTP id
 a640c23a62f3a-c15a679c178mr91843266b.21.1783366430587; Mon, 06 Jul 2026
 12:33:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629112032.20423-1-jiahao.kernel@gmail.com>
 <20260629112032.20423-5-jiahao.kernel@gmail.com> <akMJ8UfeZXrVe5LN@google.com>
 <cbbdf506-b67d-193c-2c94-bacf828d559f@gmail.com> <CAO9r8zNCEis2QHROEsM5QZsb_H4ofNjA_sE-pM7SVxtgHg_rqg@mail.gmail.com>
 <4ec2bd64-af40-8ebf-b8a8-2dd7421a1100@gmail.com> <5ce4035b-7f56-d1d2-2d2a-668446d870e8@gmail.com>
In-Reply-To: <5ce4035b-7f56-d1d2-2d2a-668446d870e8@gmail.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Mon, 6 Jul 2026 12:33:39 -0700
X-Gmail-Original-Message-ID: <CAO9r8zOLe5eJfNmoszCX3rtD=6YEa_7xrvDV1acVDOtZg4vWYA@mail.gmail.com>
X-Gm-Features: AVVi8CeAj3ZDhW9qHe6cGwTDwasOvswtbG6oJ2oKJtzbR49964SalAtsxIJukwU
Message-ID: <CAO9r8zOLe5eJfNmoszCX3rtD=6YEa_7xrvDV1acVDOtZg4vWYA@mail.gmail.com>
Subject: Re: [PATCH v5 4/6] mm/zswap: Implement proactive writeback
To: Hao Jia <jiahao.kernel@gmail.com>
Cc: akpm@linux-foundation.org, tj@kernel.org, hannes@cmpxchg.org, 
	shakeel.butt@linux.dev, mhocko@kernel.org, mkoutny@suse.com, 
	nphamcs@gmail.com, chengming.zhou@linux.dev, muchun.song@linux.dev, 
	roman.gushchin@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Hao Jia <jiahao1@lixiang.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 2, 2026 at 5:32=E2=80=AFAM Hao Jia <jiahao.kernel@gmail.com> wr=
ote:
>
>
>
> On 2026/7/1 19:45, Hao Jia wrote:
> >
> >
> > On 2026/7/1 00:10, Yosry Ahmed wrote:
> >>>> Before going through more versions we need to figure out if this wil=
l
> >>>> pivot to be a proactive demotion interfcae for swap tiering.
> >>>>
> >>>
> >>> Yes. Should I drop patches 4-6 in the next version and wait for swap
> >>> tiering to be finalized?
> >>> We can try to get the non-memcg parts (patches 1-3) merged upstream
> >>> first. This would also give them plenty of time to bake and catch any
> >>> potential regressions. Thoughts?
> >>
> >> Patches 1-2 can be sent and merged separately, yes. For patch 2,
> >> please include some numbers for the writeback performance before and
> >> after batching.
> >
> > I'd love to collect some performance data. Do you have any recommended
> > benchmarks for this?
> >
>
> Perhaps the following test case could work?
>
> Test Setup:
> - Total memory: 32 GB
> - zswap settings: max_pool_percent=3D1, accept_threshold_percent=3D50,
> shrinker_enabled=3DN
> - cgroup constraint: memory.max=3D1G
> - Workload: Run the following stress-ng command inside the cgroup for
> 120s to
>    continuously force zswap store failures and trigger shrink_worker():
>
>    bash -c 'echo $$ > /sys/fs/cgroup/zswaptest/cgroup.procs ; \
>    exec stress-ng --vm 4 --vm-bytes 4G --vm-keep --vm-method rand-set -t
> 120s -q'
>
> The following comparison results were collected over multiple runs via
> bpftrace
> and the 'written_back_pages' sysfs interface:
>
>                           Baseline         Patched
> ---------------------------------------------------
> shrink_worker wakeups       5,587             878
> shrink_memcg calls      7,823,853       2,347,320
> written_back                  257         781,214
>
> Conclusion:
> Under the same workload and duration, the patched kernel shows a
> significant reduction
> in both shrink_worker wakeups and shrink_memcg calls, while successfully
> executing a
> much higher volume of page writebacks.

Hmm this is actually a bit concerning. Yes, we are invoking the
shrinker less, but we're writing back *a lot* more memory, orders of
magnitude more. We are using a batch size of 64, and making ~1/3 of
the calls to shrink_memcg(), so the number of written back pages
should be ~20x more, not 3000x more? I think I am missing something.

Also, ideally, the batching wouldn't result in significantly more
writeback, but a similar amount of writeback over less shrinker
invocations. If we are writing back significantly more pages then the
batching logic is probably too aggressive?
