Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FAF842F717
	for <linux-doc@vger.kernel.org>; Thu, 16 Jul 2026 18:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784225057; cv=pass; b=qmFoUXCKp2o7KzCimV9TTlidTVNoXjwm2JAk2za+4m1eMbYbyZvZmreoIhxbH5qTCVQZGh+9OdyIobPfsYZ1BJ3RXZ3m+CvMojHE8ScIsDUmXZp60ZoMPpR7dtF3oS8XEvvla9U1fioNUkmXVSZ+H38gpsN4v1WEFZqmGcfIa4k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784225057; c=relaxed/simple;
	bh=Zmoyb7iXwpJBR3UnGDQR+QLF+DCnKn0O+JfFtMYLpaw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DRN2jXW49y7H1YUQNTctqXC194L7ChK+cFeNUFvw+xj2s39e0FWvsxVnS0ZxDvtknfkuI00TgGa1+vZjsjVc3N4UZ7GzyKMbBoLtkusVSpJGvet/WJMy9Yh0LZ0+fA9olGguVulWmQTv+F4eXEqbezt9+3M9mmPNMxfGtKoBXw4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r6nj4a0u; arc=pass smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r6nj4a0u"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso11971235e9.0
        for <linux-doc@vger.kernel.org>; Thu, 16 Jul 2026 11:04:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784225054; cv=none;
        d=google.com; s=arc-20260327;
        b=E/R1KShS+Zk02NEdKZhPGusVN+DQ8lKyCAfU7swR/e90QoTkJN1QzA9KPWHExJXN/n
         IIusnqkZmf3U4NN+ifOdmg/YcFjuHxV2FdT4T5uCa4bBbHxsfsv+TZSj/Iudg1GchN1z
         +1TJtLAX/Qk2jHJomO4ctLINmZGcFStCjxK01aOAYlnNiZqIOKJdvNraSYRXeA/5yHPa
         32LXr+g9PDCMd1xXnW4eSpT0Ej1uniZwVg74JH6vniDpZkoxtdVuek04/QfgmW8KgSDz
         XoCPix2VXZ8pdbICkaK0LhEXSV72IHbyjSxuz+3uVX05Zvk8HnC2HQsEGh/yNyKYk8kq
         vIGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=77tHDlt+8tJnQcJXrmrz9A2sC4mcOMXwb04I269B9Ww=;
        fh=NtpIj6tcNXn2jyeqmnH+ItGuo1mLFrkj9y7BKQ85AFo=;
        b=CcOY7T47+lGTGQq6jL6jYQFnQGypc7PKM66jcZ/2q7HKpuo+2x5f15lJBYWdTOzjYo
         61GTmrAzD3C06YE0U8p8aEL4kQWqWxtSnHh9f5+Srz51Gd4OCfg4HWQBbIMx5UynE8DU
         QQK6GhZOC3bfYojs44PSz71g0lOIPV9Mv2+ujzrnxiw17bmqunj9yx5zaDtzQg5sEgMk
         TzbFqYOVA0mgztf2VOefIvwTB8JQHQYE8/SEG1SOL9b9zw1JThtD6ZEt5TU+pWg7Xz3N
         mY+pmb9y50DDAWvovoBE0L4OFNYINRDwNKaV81AZ7H6QFvXFr96e0jEqTNzIEN5wmzbL
         I7VA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784225054; x=1784829854; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=77tHDlt+8tJnQcJXrmrz9A2sC4mcOMXwb04I269B9Ww=;
        b=r6nj4a0uC7EH3Ktgm3FLUDXQFZSBuSQryWvAprj3udlZYqzJokEeglQba+KhUBQKmT
         nT4XrQrw1Ly4YQTsrt1ChgA319R5Melna2atiFmPFgcnrQfNZw/xQNopw8s4slr/05fb
         0cJiZeWgJCsT60rIfzIKj6ikRirwbeTcon+TeuQrTy9R8hVDrWglneBpv0Qq2BI/+h7V
         DHBUHqsZQrb4KXBblSz0Xl6UdhoY2aX7tFFKEgqCU3uufNTR2vSXMDVE2/zoFae0Zm6N
         PPiS3mVsRjLusv7saVDdhQipm6/HiDLGbDqIztAF2rQEXX/HZHX2ZhVap2B6e10E90Mm
         sonw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784225054; x=1784829854;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=77tHDlt+8tJnQcJXrmrz9A2sC4mcOMXwb04I269B9Ww=;
        b=AaQUU/NTzlR+GGlv9/tdwqZhLxVsit6gxDJ1nlbJkoZ9xHSpl+y49glnQqs3xj6i3d
         D9QMztF2VrrRAOYIOSNU1VE3tXugmpLH7bnc00L8ECRhVrq15yNja6vJnVVFM0ZS4V8f
         aftgzv9p3GHIHIrrgkLJR0ZZD52kJIZh9RZjIy81gVHbqchHBipJJ7tp06dsSIlp5Mok
         rdWRojJbEiuRMb7p5Z58VLAOXe3BeSizlxG67zy+I3sBiDvFpA8+6f1pHLqcDcey2hR1
         1DqObfGsUGw8jpeU882GqHgQREcYLj7jcJlUSXcdb+JNZovsXSQbuyVcxeBX78UYbGaz
         /NmA==
X-Forwarded-Encrypted: i=1; AHgh+Rq8hb8+TxrxAmXUgx2DZ0UaoqYtGJU9WTIDVetbaKKDhFRE4Igwrbu7g++246Jx6qwkTO4lL9u0ADQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yynng0ikQW68VlLKGlbO7ZABHy/+Zsb7luTuPQS2Y1A5zX8I2js
	ZYGXB7zU/1s6ky0X+0cZmvhpqN95Ky2hVQnoszMnNsj8eM14TXke0QMBmeWzxF0bH1YkZRagr5+
	p2YuImH6rbYEvDUHrLSZ1JdTS3FZRElc=
X-Gm-Gg: AfdE7cnr/qKMUY0lhmcWqDTI3QU0V8JtIMH6+XdryuqFQjESJ4zLvE92ewOKVyBuopY
	Lk0EsbjtoMEJCirTA5APDTsPRX1kQpeOKyvkQQgWHTUVslJRL2xD0l4O7cI7Qvc/Tqgz72MYUBG
	ht6uW6VYk9LrO/8o8O1JAObv76M53hILSR/eJKveU6a91ooZiH16ulpnWtMeiMrTlhrDEpZK1TH
	kOZACdNpVy73s+n+VcXp+OGZX5gu7F03Gpq8RCVCRdgbSUN7Gl6iPJuoPZXDVHJZv1BCkZPoIwn
	ltC0XzVmOcow8j01LMBnmIppwExk/bdvEQ==
X-Received: by 2002:a7b:c042:0:b0:493:df5d:6ca6 with SMTP id
 5b1f17b1804b1-495483be428mr3111725e9.25.1784225054291; Thu, 16 Jul 2026
 11:04:14 -0700 (PDT)
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
From: Nhat Pham <nphamcs@gmail.com>
Date: Thu, 16 Jul 2026 11:04:02 -0700
X-Gm-Features: AUfX_mzsZSO0qoILpPdSsgOGYm9EmmbkyLHIWDWjIDJN1Fs37o-23mqOd14RmEM
Message-ID: <CAKEwX=Mdi5au5aXWdx3C7d1N4_3o2uiJh2sZ=sf6kpKAdtD1zQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] mm/zswap: Support batch writeback in shrink_memcg()
To: Hao Jia <jiahao.kernel@gmail.com>
Cc: Yosry Ahmed <yosry@kernel.org>, akpm@linux-foundation.org, tj@kernel.org, 
	hannes@cmpxchg.org, shakeel.butt@linux.dev, mhocko@kernel.org, 
	mkoutny@suse.com, chengming.zhou@linux.dev, muchun.song@linux.dev, 
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

I mean, it helps your case no? :)

But nicely done. My understanding is, this batching of the global
shrinker reduces overall disk swap fallback, correct?

Other than Yosry's comment, the rest LGTM FWIW :) Thanks for fixing this, H=
ao!
