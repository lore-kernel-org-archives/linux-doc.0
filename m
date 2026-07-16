Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10EC6446C01
	for <linux-doc@vger.kernel.org>; Thu, 16 Jul 2026 18:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784225944; cv=pass; b=fzcLXqxwPwrbwzY8DmWp+GZVvCXjwhZqBOJMb03JCFatNYDcN3tdSUVyKsNoJcR4BZuR5TatZZYe80wHx63KJMximt7gtSo72gtOBH+3LElZ8fXVKtlpWSo/sfXGVkr9b/vN8gMmc+4MLZUWQ/lzEZBBSa1iNB42Z+GbhKV7F7s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784225944; c=relaxed/simple;
	bh=40CP3ck5nVy6QPOWWJBMR4rjP7Y/oJjXJIQelgpWKGg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DPpt6TS0CKdFHRE293x/UM6kBKiWK875ecykZfZ6BckxgKZAEfeSuhObgYXzOYI3LLH4L5TIZ5/ohZV7QmCQ99dildhF++YSjl53nPuqiZKzOgwLVnEkVrRth2rjP/5foqk8TbD83aG1hhEqrVA+3oqoOBSK7jEmIdVcHxGqScU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e7dZtMHV; arc=pass smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e7dZtMHV"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4703bc0a99aso4565914f8f.3
        for <linux-doc@vger.kernel.org>; Thu, 16 Jul 2026 11:19:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784225938; cv=none;
        d=google.com; s=arc-20260327;
        b=XubmoFwXZMSrW107IBXan+X6hTnp35c8L7MK+IxcM61D2A6Xg5bGnQssNYlx6XrmKr
         mqp9YyGDr4PuGiLjLNf7FTxhYqNwdGLm9ifzPh3V7RmMIgzU6pWpDLR/hDY8+TkAd022
         hXGhemmr7tNNKaweECqVQuaF+zIy3WHyzb9v26TwFwzS+SSsfZl6cUx6sCIgolIVMcX0
         RI9uGJwhAJfCJVlPGh9Qv3KnfJnuTtq0RMW9O6ebptcAiAFrW5wSh8pi7XTczfvOXGfP
         Nmt7VBHi6PpTbzihPjBWmJMrVA5p0QcWHEVzeyqFE9hI4DfZ9b06OqkD7X775mnUpo5b
         zB9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RCJWw44Yt9QfTMjmF/5pzznV1wMqLVnfAfzAdUp6RWc=;
        fh=Br3F0otQakZRb8wxETc5O5PrePbTBr5jRbhRFD9gXZ8=;
        b=aLoiz2Ge5PwBsju8v3p6FudDyz+BnyoOEeaFFpChDY+z7uYL4Ya7cLU4p8+c7CYn+5
         Jtnetgj7AxnjFfuDEGHpWp19mYfm4joro0bp93cX+gqHxKw9sXxMZ0yMEJ+1JKek4fqH
         6k7WeE4SlMqNsoixdENEzeWpmaKme4DlLYOHhhzAWhEzdbPSD23zH1YcxAYgFjF/lscF
         xr0JpQGW3x98yVFc2zwNtaKw/mXKLx7DthsSYeHo8tGVFQkm6NUYK91bBLTjnWVsljYl
         hBCWqQ03KNyrHkjWJcIT6S4Y2nOY1rgmqfLOiqx3MtETA3y40dnt/zlSp7RNaQHjlEaO
         TvZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784225938; x=1784830738; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RCJWw44Yt9QfTMjmF/5pzznV1wMqLVnfAfzAdUp6RWc=;
        b=e7dZtMHV8W1WFXBv5njNMIwwKMR4ccU2LNIzI4y3USlM6Uebp6GpnVuEoff70Kb0a4
         WlsrxK4epVDfdSiGUDWFe668OJe6s2/Rn4O7fj4E2mqNknwHKetLY7fhQjgJazOAHF6T
         TKVAT4/jS1bt/sKweV085w0Jsn+/dFbleu1CQ2YMyOuBg/T7rJ1ansjHj/t6ndqyBhIj
         AJoHAvxeFIZCL9oLNqIVvDWV729/AAQAKc03sz9lupckCSkckcmrhAObDXpdZdvvEego
         6RtoOVkv2Cj4YCTQ5p+Z9OadJq9d6ZlgYQlz8xIZizciykkJIC4fc9tb9aY5YC0zw5mm
         ydKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784225938; x=1784830738;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RCJWw44Yt9QfTMjmF/5pzznV1wMqLVnfAfzAdUp6RWc=;
        b=gZ7zbxEZCDF7E7Sx1Z+gBm8HPDYz/TKhleRexZTnuRgxwodvH93bVZoPnGPbuTKvTO
         YR09DqrwWtn98/iXo33r6Es2z5CKO1txpSLuF9yNoQ/LE038cNr6VGbx1FHMognzDiZf
         jRaHNJMJ6H/r29bzzlygY1urvy97vqsbxx1PdDPbw2QVksjG2XxESziS/Few+ye3bAyA
         1KqDAbRPaqwOAdt+VB+FU4s3QbwIIY3xU9tCcBu1b8lWhnlr+Ra27kpRY1OammLoMsrZ
         4yc3MhlLI74A3fJynENjCUqyJ/Xtfuioo8r6z4YX3Q/GON5SzXB/gBg5UgVqkNXXoKoH
         O7kg==
X-Forwarded-Encrypted: i=1; AHgh+RoD7xARvUKm6+MtQdMbOtMZXCzk9m+WsrXnBhew+9qWY+o6hrVoO6RUhwrPLOglfi6Y7ZLGRglOXww=@vger.kernel.org
X-Gm-Message-State: AOJu0YwC+7TkM69g0ntg60n2VYEOnHpYYmavxA7dTdvkmhi5lXJSOiXV
	BtXEJWj5hreSkSbrzZBU4bsf8Hojm0BurdB3kGc6LQxV1BW2Nk5cBR+8X5oawezVXfKJk0tX3tj
	iRnKqKDUKEXlzue6mwk8vPR1zIp1T1Ac=
X-Gm-Gg: AfdE7ckwTWu5jFYFOLrCksTK3X/nUPkxPiEAzIzFbjRezinxBpoeHdYZqPC87vhFvCD
	hg9Z41uJJslG+fkq7zGGd2HSsuC+qcBbV1dlCykyE+cEXqg5oshEQg+r0jdmY2zvhf/Hn08Em11
	kgdTxK0ZBD4x7IKN0aOJp2iKhYp5Pab+I2AF0cOpW64qPlrn8QmYpG1hpIrmZLjE4PxOBHVcEK6
	fsMhR1P2oMXD5JtkS+iX0Q3Kb3ZCNVnWQK57ICjyDmlzkibK2S8CnGmdsDJdWBcKpEBIfaZsHP5
	KLjSKdu2sMYtlaWCgLhKUA22Q5Ma1wAFBA==
X-Received: by 2002:a05:6000:490d:b0:47d:ec60:657e with SMTP id
 ffacd0b85a97d-47f4fcd91c0mr9789980f8f.39.1784225937975; Thu, 16 Jul 2026
 11:18:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714081510.16895-1-jiahao.kernel@gmail.com>
 <20260714081510.16895-2-jiahao.kernel@gmail.com> <CAO9r8zM5nzDqNcx5UoDgGexvR6jf8MmJV9SomM4AS7n-rZ2o5Q@mail.gmail.com>
 <20260714193129.f81711f516504b659d544741@linux-foundation.org>
 <7a1fe347-7ca6-4768-9308-420bf1251f54@gmail.com> <CAO9r8zMDndmoxi_XvQv3rkkhCfb+aW3=8JdE3gAv2YOKiyiFSA@mail.gmail.com>
 <7b35fd4e-7662-10ae-159b-303350e4e59c@gmail.com>
In-Reply-To: <7b35fd4e-7662-10ae-159b-303350e4e59c@gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Thu, 16 Jul 2026 11:18:44 -0700
X-Gm-Features: AUfX_mxIpAby5cOyODbdsd_vYnsokVJLS1QcOfP3fFXU1u6G5EgnSr-TbOWYryE
Message-ID: <CAKEwX=Ob9shetuJK4y=NZods3KkT=U_3W4S_ALzxX3EDLomWEA@mail.gmail.com>
Subject: Re: [PATCH 1/2] mm/zswap: Fix global shrinker when memory cgroup is disabled
To: Hao Jia <jiahao.kernel@gmail.com>
Cc: Yosry Ahmed <yosry@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, tj@kernel.org, 
	hannes@cmpxchg.org, shakeel.butt@linux.dev, mhocko@kernel.org, 
	mkoutny@suse.com, chengming.zhou@linux.dev, muchun.song@linux.dev, 
	roman.gushchin@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Hao Jia <jiahao1@lixiang.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 15, 2026 at 7:21=E2=80=AFPM Hao Jia <jiahao.kernel@gmail.com> w=
rote:
>
>
>
> On 2026/7/16 00:13, Yosry Ahmed wrote:
> > On Wed, Jul 15, 2026 at 5:31=E2=80=AFAM Hao Jia <jiahao.kernel@gmail.co=
m> wrote:
> >>
> >>
> >>
> >> On 2026/7/15 10:31, Andrew Morton wrote:
> >>> On Tue, 14 Jul 2026 09:52:59 -0700 Yosry Ahmed <yosry@kernel.org> wro=
te:
> >>>
> >>>>> When memory cgroup is disabled, mem_cgroup_iter() always returns NU=
LL.
> >>>>> Therefore, the global shrinker shrink_worker() always takes the !me=
mcg
> >>>>> branch. After MAX_RECLAIM_RETRIES empty walks, the worker simply gi=
ves up,
> >>>>> so it fails to write back anything.
> >>>>>
> >>>>> Therefore, when memory cgroup is disabled, fall through with the !m=
emcg
> >>>>> branch and shrink the root memcg directly.
> >>>>>
> >>>>> With memcg disabled, shrink_memcg() only returns -ENOENT when the r=
oot
> >>>>> LRU is empty, which means the total pages are already below thr. Th=
e
> >>>>> loop then safely bails out via the zswap_total_pages() <=3D thr che=
ck.
> >>>>> For any other return value from shrink_memcg(), the loop is guarant=
eed
> >>>>> to terminate, either after MAX_RECLAIM_RETRIES failures or once the
> >>>>> threshold is met.
> >>>>>
> >>>>> Fixes: a65b0e7607cc ("zswap: make shrinking memcg-aware")
> >>>>> Cc: stable@vger.kernel.org
> >>>>> Suggested-by: Nhat Pham <nphamcs@gmail.com>
> >>>>> Acked-by: Nhat Pham <nphamcs@gmail.com>
> >>>>> Acked-by: Yosry Ahmed <yosry@kernel.org>
> >>>>> Reported-by: Yosry Ahmed <yosry@kernel.org>
> >>>>> Closes: https://lore.kernel.org/all/CAO9r8zPVzMKFbCixxD-qgtRrkFxWVr=
HiZZeLc=3DeyTPKPVQgX4g@mail.gmail.com
> >>>>> Signed-off-by: Hao Jia <jiahao1@lixiang.com>
> >>>>
> >>>> Patch 2 doesn't really depend on this one, right?
> >>>>
> >>>> If that's the case I think this can (and should be) picked up
> >>>> separately as a hotfix. Andrew, WDYT?
> >>>
> >>> Please update the changelog to clearly describe the userspace-visible
> >>> effects of the bug, thanks.
> >>
> >> I am not entirely sure if my understanding is correct here, but maybe =
I
> >> should add something like this to the commit message?
> >>
> >> When cgroup_disable=3Dmemory is used (or with CONFIG_MEMCG=3Dn), the g=
lobal
> >> shrinker fails to write back any pages. Consequently, the zswap pool
> >> fills up to its limit and rejects further storage, preventing memory
> >> pressure from being offloaded to the backing swap device.
> >
> > I think you can simply write that zswap writeback when the limit is
> > hit is broken when memcg is disabled.
> Will do. Thanks!
>
> >
> >>
> >>> Also, AI review has flagged several possible issues, all appear to be
> >>> serious:
> >>>        https://sashiko.dev/#/patchset/20260714081510.16895-1-jiahao.k=
ernel@gmail.com
> >>
> >> For AI review comments on this patch:
> >> I suspect this scenario might only exist in theory. For zswap LRU to b=
e
> >> empty while zswap_total_pages() > thr holds true, it would require a
> >> prolonged state where there are always more than thr zswap entries on
> >> the zswap LRU whenever zswap_total_pages() > thr is evaluated, yet the
> >> zswap LRU happens to be empty during shrink_memcg(root_memcg).
> >>
> >> If we want to fix this, perhaps we could do something like this?
> >>
> >> Yosry, Nhat, what are your thoughts on this?
> >
> > Do we need to do this? The last paragraph in your changelog explains
> > why this can't happen because zswap_total_pages() should be 0 in this
> > case. Did I miss something?
>
> The loop would require the following sequence to repeat indefinitely:
>
> 1=E3=80=81zswap_total_pages() > thr evaluates to true.
> 2=E3=80=81During shrink_memcg(root_memcg), the zswap LRU is concurrently =
drained
> to empty.
> 3=E3=80=81Before zswap_total_pages() > thr is evaluated again, the zswap =
LRU is
> heavily refilled such that zswap_total_pages() > thr holds true once more=
.
>
> For our case to manifest, it would require zswap_total_pages() and the
> zswap LRU state to repeatedly hit this exact window with perfect
> alignment over a **prolonged period**. Therefore, I suspect this
> scenario might only exist in theory.

Yeah seems very artificial indeed.

If we want to be extra careful here, maybe we can put a cond_resched()
there or replace the continue with goto resched or sth?
