Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92EE37E304
	for <linux-doc@vger.kernel.org>; Thu, 16 Jul 2026 20:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784234151; cv=none; b=XIHwFQpuw4oMyDflN3HupXVWEKojDFEVHLzs5xK1tkyaDhVu9+shtXB5nUiJxZkVczWR1ZqW29LE6TaRH7NmrsTEzCQOOTZb67tFwIxaWzj8JBBqJGwI+eQEkua6Ui8c/5Cw/q0bIHgYmLG5lPcDA3B8MmJIClatwm+7PD7W9/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784234151; c=relaxed/simple;
	bh=vHpgHE9MehsCHmkPPxhIGM8o7x5QkVG+ybJPdynHl5s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rcmah5OLfmtmTKbofhhzsxeGWwP2HVz2ugNnTC5B9nC7c4h85pQAFoCz/np6qIE5gAkXWKAdfgE8a1K67/0FMf/wP/Bs+tt9Nu6jvH2H8OVHXAcRrS6WRXgs1IU3Zpg4QtmD5VTyQkgFi9ck9Fx8ST647ILxBV1nzKp+TO+C/QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=on85Wbbu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="on85Wbbu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E6641F01558
	for <linux-doc@vger.kernel.org>; Thu, 16 Jul 2026 20:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784234149;
	bh=VRWx41NRFgTecmM6KmOP+beLAPd4keVAZx1WV12sXws=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=on85WbbuidISrNOBZAzYZIuanG1MWPgiEexydexAg7nvc5+evnbEqJAvCIJa/QfAR
	 Op88aHpQzsmqNWHobMNCD+sCF0k0jpuSZqo2HZsDBjQiXeoUIK+nC1Uzj7fCEcz2ki
	 pDixRm4nsFYkYjUCP5ngH66fXjqBm49SL/HBU4EzA+IULRdO56Z2lDd1K/S7+w18GF
	 fKxop6AE2/FG3mrIP9I+Cc272GtbZST63shlT3fe7qtmvjC/e5RqnKsmk1jVZz89YX
	 wj6UZKB7LTBEIG/UXx9kCWzv66GMsQ7N2110COMKhBWLgr0M47fdkO6VAHFXH+tuoD
	 +ZWTkpXvupm5g==
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c15b33f7b23so1047631666b.3
        for <linux-doc@vger.kernel.org>; Thu, 16 Jul 2026 13:35:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpY7pyCdHWWQ0uJ58E1N0tI0Js6PEoGyah7PrPo9CmaM8VA4VGQ/0SfxXdKYBWSSA+ttaL+EQ78byI=@vger.kernel.org
X-Gm-Message-State: AOJu0YznaOjaeJyZdpO0CMSKjR1cWUuEH+aAeb0ntD/mDN8AikU9q6ib
	Q61NM3pooPqQuCsg2XkKnyV4/rH9sYXeyp4h1lpfqUdxMULhsMnBjRyrkdauf4Bs9P/72j+or6y
	Zdico3FMheRL6tuVchQm1ZNm85x3gTwA=
X-Received: by 2002:a17:907:3e05:b0:c16:aad4:2d55 with SMTP id
 a640c23a62f3a-c16aad43b3emr62858566b.3.1784234148367; Thu, 16 Jul 2026
 13:35:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714081510.16895-1-jiahao.kernel@gmail.com>
 <20260714081510.16895-3-jiahao.kernel@gmail.com> <CAO9r8zNiT63LUHx8X5i_aboX1UWuGkcFf+p9ch-pekURUuDdXg@mail.gmail.com>
 <2bc8e4f6-46a0-5b74-6eaa-59e7aef9227e@gmail.com> <CAO9r8zOFg_mnNGbFFd_h8FAwRCbQ9vXk47EF5f1CLg1cDVGB5Q@mail.gmail.com>
 <b910e870-9583-a2f5-b681-e69edb9af290@gmail.com>
In-Reply-To: <b910e870-9583-a2f5-b681-e69edb9af290@gmail.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Thu, 16 Jul 2026 13:35:37 -0700
X-Gmail-Original-Message-ID: <CAO9r8zMLGMpsQ+HbLA5SFSMEc_ctuZoScJMkybnXMp+_0MW-yQ@mail.gmail.com>
X-Gm-Features: AUfX_mwTGzvIQNQhF060UOLCh2zaMJh59HMirX7aHamE1mBFkxh5HCs1pt2xGHk
Message-ID: <CAO9r8zMLGMpsQ+HbLA5SFSMEc_ctuZoScJMkybnXMp+_0MW-yQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] mm/zswap: Support batch writeback in shrink_memcg()
To: Hao Jia <jiahao.kernel@gmail.com>
Cc: akpm@linux-foundation.org, tj@kernel.org, hannes@cmpxchg.org, 
	shakeel.butt@linux.dev, mhocko@kernel.org, mkoutny@suse.com, 
	nphamcs@gmail.com, chengming.zhou@linux.dev, muchun.song@linux.dev, 
	roman.gushchin@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Hao Jia <jiahao1@lixiang.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 15, 2026 at 7:54=E2=80=AFPM Hao Jia <jiahao.kernel@gmail.com> w=
rote:
>
>
>
> On 2026/7/16 00:14, Yosry Ahmed wrote:
> >>>> Test Setup:
> >>>> Total memory: 32 GB.
> >>>> zswap settings: max_pool_percent=3D1, accept_threshold_percent=3D50,
> >>>> shrinker_enabled=3DN.
> >>>> Allocate 512MB of anonymous pages and fill them with random data (to=
 avoid
> >>>> compression), then use cgroup memory.reclaim to force a large amount=
 of
> >>>> anonymous pages into zswap. At an interval of 2ms, allocate a 4K ano=
nymous
> >>>> page where the first 4 bytes are random numbers and the rest are zer=
os, and
> >>>> then trigger a reclamation of this 4K anonymous page through cgroup
> >>>> memory.reclaim. When the pool threshold is reached, shrink_memcg() w=
ill
> >>>> be triggered.
> >>>>
> >>>> The test data after running for 120s is as follows:
> >>>>                              Baseline         Patched
> >>>> shrink_worker wakeups          5363             85
> >>>> shrink_memcg calls       11,345,012        188,264
> >>>> written_back                  40214          40275
> >>>>
> >>>> Conclusion:
> >>>> Under the same workload and run duration, the patched kernel shows a
> >>>> significant reduction in both shrink_worker wakeups and shrink_memcg=
 calls.
> >>>
> >>> Please also include data from the case where zswap store failures are
> >>> observed and pages go to disk, and compare before and after this
> >>> patch. I think that part is also really important.
> >>
> >> I retested and added some collected information. Perhaps
> >> `pool_limit_hit` and `pswpout` can explain that batch shrinking of zsw=
ap
> >> can reduce the number of pages that fail to be stored due to the pool
> >> limit, allowing zswap to skip zswap and go directly to disk.
> >
> > Oh I meant the other test case with high memory pressure where we saw
> > a lot more writeback with this patch. Do you have similar data from
> > that test case?
> >
>
> Below are the results from stress-ng (high memory pressure case), which
> lead to a similar conclusion:
>
>                                Baseline      Patched
> shrink_worker wakeups         5,640           987
> shrink_memcg calls        8,481,500     2,504,818
> written_back pages               260       768,576
> zswap_store calls           2,742,756     2,301,414
>    store succeeded (ret=3D1)     934,640     1,308,686
>    store rejected (ret=3D0)    1,808,116       992,728 <-
>    store reject rate            ~65%           ~43%
> pool_limit_hit delta        1,181,310       101,593 <-
> pswpout                     1,808,376     1,761,304
> pswpin                      4,288,497     3,902,658
>
>
> pswpout =3D store rejected + written_back pages
> Note that pswpout comprises two parts: the store rejected count (where
> we skip zswap and go directly to disk) and the number of pages written
> back by shrink_memcg().
>
> Therefore, we can directly leverage store rejected to evaluate the
> scenario where zswap is skipped and pages bypass it to disk. This
> provides a much clearer picture than looking at pswpout alone.
>
> Do we need to include both sets of test results along with the
> comparison data in the final commit message?

Yeah, I think you can include a summarized version of both sets of
results. I think the important part to highlight here is that batching
results in a great reduction in store rejection rate, which translates
to significantly more writeback, as the LRU ordering is maintained
more correctly. We are also doing a bit less swapping from disk
overall if I am reading this correctly, which means we are placing
less hot data on disk as expected.

It is a bit alarming that the store rejection rate is still 43% with
batching, but we can worry about this later :)
