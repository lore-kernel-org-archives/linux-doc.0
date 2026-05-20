Received: from mail-dl1-f65.google.com (mail-dl1-f65.google.com [74.125.82.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A772D371CEA
	for <linux-doc@vger.kernel.org>; Wed, 20 May 2026 18:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779302285; cv=pass; b=crbL7Cn+HRJdOOFG04CrWR7xniPBHmcqP8Li3/+MScLFxkY8hqpbA3xqAuJ63XTdcwREAST11u3kUyHfK6WK3axqciBu69IAFiWnvIiI6lT1/Kx7TK4ciSvTuaUcst1YwD3lhmRCY+dEPyTf1otfdObXlrxZvfjRAZUNNchXuwM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779302285; c=relaxed/simple;
	bh=Lio2FLXwC0TpzoBc6WCWqG3B4AhXxFIkYmOF2Ye6W3k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X0Eelg0vi2L4wpZDBbikza3OTsHhpHy1no1q1TYNln3ZO3mArE27fGDQSOBNRxMVHjMJsRGA35jleYjGBSR+7gyrv23QD7WaXJ2KPSUq2fVPdKY0a0x+vXVhlCltZCPwAIyJYDHg5kEQdbKXi4nM5JqgO/0fnWDasH72UxB58Pg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bQG3xB9H; arc=pass smtp.client-ip=74.125.82.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bQG3xB9H"
Received: by mail-dl1-f65.google.com with SMTP id a92af1059eb24-134ac81c445so3489179c88.1
        for <linux-doc@vger.kernel.org>; Wed, 20 May 2026 11:38:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779302283; cv=none;
        d=google.com; s=arc-20240605;
        b=cK092eaSuKTrn1q/2LdN6KrYsX2YzQEO2XJ9zHBQfsYdFF2shBDgDiYNkK9gza36/S
         lr66svKtKjxJazkT/xF0M6zuECH4O6ZqU6JHVfT1MQBwM7a5Ssac5LSbBRsls7PhFXwx
         8UYXkBEKbf0FRjbNq9/AK9l34MCh6JMKE/o4sqOAz4bxoB0E6IjKZyvkh6GknuibW+kD
         +yo5u02q/6wwTewramixP9OK7R4OS3hdUpAVQwN/Wvb3bjIgpSVwD0JD4xRq/mVK95/c
         cwSjFLMj6joAOFKLoAbXn63o55L5tqPSYo5bcp6PuhGAGaGah8xNeiyYAzw4p8thl6o1
         f5Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BAuf7MbQZyunGAyUzpAv9eVVSXT8WNUhWVQaJEfQARA=;
        fh=GyAusw/q3WGPx4FhLoxwjq3zgHuK09IOhb2M8eLqnUU=;
        b=Dem/KYSeY7ys5ETmmybFU+4oM7u6/E3s3iW4VBTEwS9gkNoaTYVnDZC6Ig4HD1viVe
         lstR+weHZqmILf/253aHsjDgtwuqmN+AKnca05dvCVheo0cxj4FIJX6/6ZBBHBnbersU
         rIcrKn1KJKodpCN4SLrRAaKNGyfrColL3Lb8uLLQEEhs/GWEWlTbHgitSyFD95inSsce
         VzXfuK7twz0H0gUmw3zYSj1GEXzjIE+z3szxZI5gSzq0EbiORKuADrOPaADjFxJQ4uiR
         oWLEq/9OGJkODDnHtCFyimxAdHJ8Qq9wqzl+87894uD9Zdf/CBRktpwdvVyvaUsjrfhR
         0VXQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779302283; x=1779907083; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BAuf7MbQZyunGAyUzpAv9eVVSXT8WNUhWVQaJEfQARA=;
        b=bQG3xB9HNCs2Ao/6NDD6RtQGA53+NzAtVlzHdEeJZ/CDd4mhREzNdUy0JV+O9F/ycV
         fGT8MfAbROnWkfUXPhHYzRV1NCOzyQVeoGm0lcAzT71vn/xHeIThkCcN+HX6lvjNULUW
         XwwmfOT6f/mrgaYnNyOWLP6XfKZKZqHT0tNMxQDaecBrWnIi8k73EAAjMj6Tkop+UVOw
         TOpoKH7Bd2cXo3BxKo1HsjnFBRtAAVlBihwfpJM5FKhp1mrAdiVP/7+O86ZU0luq8TWD
         Zwzl7IAI+8YDATbDG1c9hBSGXykszkc3fzYzZD7G2Am396jZNOawfh1fDVNcoL4rQqKk
         litw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779302283; x=1779907083;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BAuf7MbQZyunGAyUzpAv9eVVSXT8WNUhWVQaJEfQARA=;
        b=lxOkaHLgN9i1/MtbNzC32sNB56DVVuLTVI2M7+vpPTltR6jgUSuPR73yiJtLJskuzA
         +gjSRBc14vYCdiTyCWtzEAtOEg4va9uNQK1O+oXeO2JDgVvYqZy/kL2HrAN5h4Rfcsok
         ZMvbeKAj2+ohbpJg7mco/D1E69mnIKhEWyRyy5Vmc9umeDH6QhKTHFngcHb4D/iOrjXr
         BrdAw2R8YfD3NIvXAUehMqA7P7N0ds4IFCw9rXv6BkTHBao2UNgKE4PE+89ciSPZq3ZQ
         yOkdnnOJiTyOL+kyTPq9F0NvC/qjd1L2iKkWvi7jneFWnbCoGxx4bhOiYINq1ISkM0E8
         PUSw==
X-Forwarded-Encrypted: i=1; AFNElJ/9d2BQwmr+tBfKs7ppRTHhwVjK282ekmvveej1hq2oobTYJoHdTPqBHztkhYBJYnUD8DLzl3k2LaU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNN/cWwURZ9nCQO+8dZ2e2B+3B5xaPvBfniXwKqmx6XoCeD8xh
	l4pbPPx7+HukN3n/RD0BdjfVY50pTIzD4oemaSL46No1fTyPhcTNvGro9g+a4d38QXz3pHS+eir
	tgA1dMe9DQdOvDaalFGPdd/dWG3I7hg==
X-Gm-Gg: Acq92OFfW19hO0wlLiUimknfQ54Qm4p3OcQBFSQrne2DWWVDrbimwauWDkgAx+gUYBo
	wsTXJCR+oiCtCbPIZ0HSTfcBhWFUWLNUH1HO0nawO46sTfTFjxenPWbKoRX24ZTiLFY4UzASTYy
	XDoUvxFlxTd/3TE014kTOYzL0cg+QZA2IQOfqKk7owQcqN8jdJdMGLY1Yz24EkAqrjx4x0iMkg6
	C4Nm3XCzjuZzj4lJf6mSjkwhXvNtoPWCdK24zQSLQfQbU2Tut2rEc5ZWIn89A5dGl25OfA0HlmI
	QLjq/8e8iWfIo4Br
X-Received: by 2002:a05:7022:6b9b:b0:130:9b78:b17b with SMTP id
 a92af1059eb24-13504a4fd4amr11166328c88.38.1779302282639; Wed, 20 May 2026
 11:38:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260516210357.2247-4-ravis.opensrc@gmail.com> <20260517184705.4652-1-sj@kernel.org>
In-Reply-To: <20260517184705.4652-1-sj@kernel.org>
From: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
Date: Wed, 20 May 2026 11:37:50 -0700
X-Gm-Features: AVHnY4JJcjwwRzJzIvyxW5twV6UCxEviLZFBxwk7zstZSFSrNzLAY-O0iJAod6c
Message-ID: <CALa+Y14AKLXSP8HhOMQomXczok-BS7aderfj_tYG9qdS9bKgvg@mail.gmail.com>
Subject: Re: [RFC PATCH 3/5] mm/damon/core: floor effective quota size at
 minimum region size
To: SeongJae Park <sj@kernel.org>
Cc: damon@lists.linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, akpm@linux-foundation.org, corbet@lwn.net, 
	bijan311@gmail.com, ajayjoshi@micron.com, honggyu.kim@sk.com, 
	yunjeong.mun@sk.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 17, 2026 at 11:47=E2=80=AFAM SeongJae Park <sj@kernel.org> wrot=
e:
>
> On Sat, 16 May 2026 14:03:55 -0700 Ravi Jonnalagadda <ravis.opensrc@gmail=
.com> wrote:
>
> > The CONSIST quota goal tuner initializes esz_bp to 0, producing an
> > effective quota size (esz) of 1 byte on the first tick.
> > damos_quota_is_full() rejects all regions when esz < min_region_sz
> > (default PAGE_SIZE =3D 4096), so no regions can be tried and no
> > feedback reaches the tuner =E2=80=94 a bootstrapping deadlock.
>
> That depend on whether the goal is already [over]-achieved.  If the goal =
is
> achieved, the tuner will think no change is needed, so keep the
> effectively-zero quota.  If the goal is over-achived, the tuner will thin=
k the
> DAMOS scheme should be less aggressive, but it is already effectively-zer=
o
> quota, so keep having effectively-zero quota.
>
> If the ogal is under-achived, the logic will iteratively increase the int=
ernal
> esz (esz_bp), until it exceeds the min_region_sz, and finally start makin=
g some
> effects.
>
> So, unless the goal is already [over]-achieved, there is no deadlock.  If=
 the
> goal is already [over]-achieved, why we would want to make DAMOS do somet=
hing?
>
> Am I missing something?
>

Hello SJ,

You're not missing anything; you're right.  Stock DAMON's
feed-loop tuner ramps esz_bp out of the seed quickly under an
under-achieved goal -- on the order of ten-some ticks at the
1000ms reset_interval the in-tree DAMON modules use, so the
floor isn't gating anything that wouldn't bootstrap on its own.
No deadlock.

I owe a clearer accounting of where this patch and patch 1 came
from, since the same origin story applies to both.  Both came
from a parallel debug effort and should not have been carried
into this set.

The work that produced this series came out of an effort to
enable hardware-sampled hotness as a DAMON access source -- the
companion AMD IBS RFC

  https://lore.kernel.org/linux-mm/20260516223439.4033-1-ravis.opensrc@gmai=
l.com/

-- and to characterise its closed-loop convergence with the
existing CONSIST tuner on a heterogeneous DRAM+CXL setup.  Early
in that effort I was hitting random NMI-context hangs on the per-CPU
report path that prevented runs from completing, and while
debugging those hangs I wasn't sure which direction the
convergence anomalies were coming from -- the sampling backend,
the report-ring path, the tuner shape, or the quota controller.

I made two controller-side experiments as scaffolding while I
narrowed the problem down:

  - A per-tick growth cap on the goal-feedback tuner
    ("max_delta_bp" at 5%/tick) to slow how fast esz could grow
    on a transient.  That cap stretches the bootstrap above
    from ~13s to several minutes, so I added a floor at
    min_region_sz to short-cut the bootstrap.  That landed here
    as patch 3.

  - A separate access-rate seeding helper (clear-on-migration)
    for the goal-feedback loop.  Some early versions of that
    helper left the access-rate fields in inconsistent states
    and damon_moving_sum() landed in an underflow path I hadn't
    seen before.  I added a saturating-subtract guard to that
    function.  That landed here as patch 1.

Once cpuhp-related fixes on the per-CPU sampling path landed
and the NMI stability problem was actually resolved, the
convergence anomalies were tracked down to the sampling/ring
side, not the controller side.  I dropped the max_delta_bp knob
and fixed the seeding helper to maintain its invariants.
Patches 1 and 3 were carried into this set even though their
justifications had gone away:

  - Patch 1: with the seeding helper fixed, stock callers don't
    reach the underflow path -- the invariant holds at every
    aggregation boundary in stock DAMON, as you noted.  Belongs
    with the seeding helper if and when that work goes upstream.

  - Patch 3 (this one): with max_delta_bp dropped, the slow
    bootstrap doesn't happen -- the ~13s ramp is fast enough
    that there's no problem to solve.  Once stability was
    sorted I also moved the closed-loop runs in the companion
    RFC to the temporal tuner, where the bootstrap concern
    this patch addresses doesn't even arise (esz_bp saturates
    to ULONG_MAX immediately when score=3D0).

Apologies;both should have come out when
max_delta_bp and the seeding helper did.

Dropping patches 1 and 3.

Patches 2, 4, and 5 are independent of this scaffolding; I'll
reply on each thread separately with the relevant context.

Thanks again for the careful review.

Best,
Ravi

> I'd like to discuss this high level thing first, before digging deep into=
 the
> details.
>
>
> Thanks,
> SJ
>
> [...]
