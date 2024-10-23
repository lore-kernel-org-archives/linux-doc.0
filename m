Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEC11CF29A
	for <linux-doc@vger.kernel.org>; Wed, 23 Oct 2024 18:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729706610; cv=none; b=mx2g26JvYFeTwCfQiOHqUqC+fPMvpMNDI5W/ld3fKPHtEVdOdV6pmvZrs/iXGyPwtZ+soxIDVXhgHKiRe8fORB7/EsKBmiX9O7oGTT3LhZpbv78dipuYAOcWz9mrUYFyyaNTdRSWanUuSFllflvv52fp8NHsyJatD9gkF37s0A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729706610; c=relaxed/simple;
	bh=hKbw9EhlyCDWsEHg69v1mV9keLiiF9vWAZwIKJxKWTI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S1JWdPkbkvQ5mVIF3pGazqelLZxsbtUvoudE5uTl3wepWjBiAb8XS9r2vAZfqHjPN1i+s5KeUScw1BzE76+pz3IbGcMfNUTrIYdGGXZTAoY/mDl6gJZHzOwqpgFSx5upgtDfRTtCAjiQOHyDLoY1zx296Swxul5GPKGjj8manfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=M0wzQ8Bm; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="M0wzQ8Bm"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a9a156513a1so112366b.0
        for <linux-doc@vger.kernel.org>; Wed, 23 Oct 2024 11:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729706607; x=1730311407; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5eFP8vDVd7jdxnDSszVWk36szMtGFtjiKJDaHiyfHos=;
        b=M0wzQ8Bm8blITpkYtXILLucKi/mj/GULG3O8/Lr3E2EItCheo3f8xYJXYgSyXfrFWc
         ehcoqVznYnTWokTsZEXfe/kZB8nHmotgZXgUuStmCXU3htNMSRMPnrrPqsM0co+5aV9s
         ZYf26H5xNkk+eWKRRwNzO2dqeF9mzBOnzo+oeXqNCwWNc0loqQJ02Y7C2pVfo1c9nQQB
         QLpDjVKcSIT+Mmkw/9bKR07GrbqqrK4zNQTS60wYzYdD0bplJQGQwVKvuYabE4337sbH
         bN97HJhTwA/7bcusEbIKLS9+16XDtRtX07V8sS/vx7rUX1HpxVUCcVuxlYMNWUT3HVJP
         irHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729706607; x=1730311407;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5eFP8vDVd7jdxnDSszVWk36szMtGFtjiKJDaHiyfHos=;
        b=nEIPyz9U97H7ubmGPSpDG4qZxuWhnCBrQgRknYmsCWYHnSQga1aJ2ZhW3kOl3n58YT
         lli56lELwwJEFfXq2tqlrqnL/mdp1EPBF/zA2Kvxb4M11QrjdEwE/5JHgt8NyWcfP2c9
         1F4ZMxGrt2YUidwzANILG8dFTSFjuqshy8w0u/b8Pg6/oRW2doVkpQi1YjvFvzFBg0Pc
         L7AOPrFY90Gp786Ej10chSrDL6KpBld8Q9Fie1AdlXzrcUzMu9wn9Gs/CxzLdrE1yfh/
         7ohRDz4xausj+URy0hJUkrGrvOv7/oWGegSK6SPyLhtouAO7ljWWyRw6Csgl6/I0EB+M
         8HSA==
X-Forwarded-Encrypted: i=1; AJvYcCXts4RZUSp/oVosBm22qOHzvV64rT6Zhtg5Xj7xvdDOEa+rKzg0X4imYhxcIPqA9PJvdw8yvvLTC7o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFWUfSm9b2OHnGLVtW8qcKI1Y71a3+xr+8Yp57OgjsA26gOfrN
	O9D4ESFtNqAfiIt0Ht0O2ajnO6AMVWob0qn0asy7YIFD5vv7oA32PWcvDTfiXw0GD8W6AdkZDni
	bGzIiLvGQX7LTFPj8NX85siEKJQZ6xW+ZsO9o
X-Google-Smtp-Source: AGHT+IGYGrcE0OeG8Xy8f+rEGoiCHvfXOe43wRySZPTgHVqK6ukFi8XSUN1CiuBKCrdlws12iFH+c5+YobynhJAzRvs=
X-Received: by 2002:a17:907:3e91:b0:a99:f7df:b20a with SMTP id
 a640c23a62f3a-a9abf964e26mr320337166b.62.1729706606270; Wed, 23 Oct 2024
 11:03:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241018105026.2521366-1-usamaarif642@gmail.com>
 <CAGsJ_4xweuSwMUBuLSr2eUy69mtQumeDpMZ1g2jFPGq6nFn9fg@mail.gmail.com>
 <5313c721-9cf1-4ecd-ac23-1eeddabd691f@gmail.com> <b1c17b5e-acd9-4bef-820e-699768f1426d@gmail.com>
 <CAGsJ_4wykOyJupLhcqkSPe27rdANd=bOJhqxL74vcdZ+T9f==g@mail.gmail.com>
 <eab11780-e671-4d09-86a6-af4cf3589392@gmail.com> <CAGsJ_4wWf7QnibY_uU8B=efuEACrvFaJJ=bJTD+9KrxFtfoMmQ@mail.gmail.com>
 <CAGsJ_4w5XLMok4F6Xw7aTAdV6rY9OvCVPM3U+hzFnKyTXBUpOA@mail.gmail.com>
 <4c30cc30-0f7c-4ca7-a933-c8edfadaee5c@gmail.com> <7a14c332-3001-4b9a-ada3-f4d6799be555@gmail.com>
In-Reply-To: <7a14c332-3001-4b9a-ada3-f4d6799be555@gmail.com>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Wed, 23 Oct 2024 11:02:50 -0700
Message-ID: <CAJD7tkbrjV3Px8h1p950VZFi9FnzxZPn2Kg+vZD69eEcsQvtxg@mail.gmail.com>
Subject: Re: [RFC 0/4] mm: zswap: add support for zswapin of large folios
To: Usama Arif <usamaarif642@gmail.com>
Cc: Barry Song <21cnbao@gmail.com>, senozhatsky@chromium.org, minchan@kernel.org, 
	hanchuanhua@oppo.com, v-songbaohua@oppo.com, akpm@linux-foundation.org, 
	linux-mm@kvack.org, hannes@cmpxchg.org, david@redhat.com, willy@infradead.org, 
	kanchana.p.sridhar@intel.com, nphamcs@gmail.com, chengming.zhou@linux.dev, 
	ryan.roberts@arm.com, ying.huang@intel.com, riel@surriel.com, 
	shakeel.butt@linux.dev, kernel-team@meta.com, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

[..]
> >> I suspect the regression occurs because you're running an edge case
> >> where the memory cgroup stays nearly full most of the time (this isn't
> >> an inherent issue with large folio swap-in). As a result, swapping in
> >> mTHP quickly triggers a memcg overflow, causing a swap-out. The
> >> next swap-in then recreates the overflow, leading to a repeating
> >> cycle.
> >>
> >
> > Yes, agreed! Looking at the swap counters, I think this is what is going
> > on as well.
> >
> >> We need a way to stop the cup from repeatedly filling to the brim and
> >> overflowing. While not a definitive fix, the following change might help
> >> improve the situation:
> >>
> >> diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> >>
> >> index 17af08367c68..f2fa0eeb2d9a 100644
> >> --- a/mm/memcontrol.c
> >> +++ b/mm/memcontrol.c
> >>
> >> @@ -4559,7 +4559,10 @@ int mem_cgroup_swapin_charge_folio(struct folio
> >> *folio, struct mm_struct *mm,
> >>                 memcg = get_mem_cgroup_from_mm(mm);
> >>         rcu_read_unlock();
> >>
> >> -       ret = charge_memcg(folio, memcg, gfp);
> >> +       if (folio_test_large(folio) && mem_cgroup_margin(memcg) <
> >> MEMCG_CHARGE_BATCH)
> >> +               ret = -ENOMEM;
> >> +       else
> >> +               ret = charge_memcg(folio, memcg, gfp);
> >>
> >>         css_put(&memcg->css);
> >>         return ret;
> >> }
> >>
> >
> > The diff makes sense to me. Let me test later today and get back to you.
> >
> > Thanks!
> >
> >> Please confirm if it makes the kernel build with memcg limitation
> >> faster. If so, let's
> >> work together to figure out an official patch :-) The above code hasn't consider
> >> the parent memcg's overflow, so not an ideal fix.
> >>
>
> Thanks Barry, I think this fixes the regression, and even gives an improvement!
> I think the below might be better to do:
>
> diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> index c098fd7f5c5e..0a1ec55cc079 100644
> --- a/mm/memcontrol.c
> +++ b/mm/memcontrol.c
> @@ -4550,7 +4550,11 @@ int mem_cgroup_swapin_charge_folio(struct folio *folio, struct mm_struct *mm,
>                 memcg = get_mem_cgroup_from_mm(mm);
>         rcu_read_unlock();
>
> -       ret = charge_memcg(folio, memcg, gfp);
> +       if (folio_test_large(folio) &&
> +           mem_cgroup_margin(memcg) < max(MEMCG_CHARGE_BATCH, folio_nr_pages(folio)))
> +               ret = -ENOMEM;
> +       else
> +               ret = charge_memcg(folio, memcg, gfp);
>
>         css_put(&memcg->css);
>         return ret;
>
>
> AMD 16K+32K THP=always
> metric         mm-unstable      mm-unstable + large folio zswapin series    mm-unstable + large folio zswapin + no swap thrashing fix
> real           1m23.038s        1m23.050s                                   1m22.704s
> user           53m57.210s       53m53.437s                                  53m52.577s
> sys            7m24.592s        7m48.843s                                   7m22.519s
> zswpin         612070           999244                                      815934
> zswpout        2226403          2347979                                     2054980
> pgfault        20667366         20481728                                    20478690
> pgmajfault     385887           269117                                      309702
>
> AMD 16K+32K+64K THP=always
> metric         mm-unstable      mm-unstable + large folio zswapin series   mm-unstable + large folio zswapin + no swap thrashing fix
> real           1m22.975s        1m23.266s                                  1m22.549s
> user           53m51.302s       53m51.069s                                 53m46.471s
> sys            7m40.168s        7m57.104s                                  7m25.012s
> zswpin         676492           1258573                                    1225703
> zswpout        2449839          2714767                                    2899178
> pgfault        17540746         17296555                                   17234663
> pgmajfault     429629           307495                                     287859
>

Thanks Usama and Barry for looking into this. It seems like this would
fix a regression with large folio swapin regardless of zswap. Can the
same result be reproduced on zram without this series?
