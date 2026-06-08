Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E6B3C76A0
	for <linux-doc@vger.kernel.org>; Mon,  8 Jun 2026 16:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780935807; cv=pass; b=B3lLjhz8opEpXmZwZGX3SZaZKX1Y+EaMWpWnE3dXeKt1RBLT6Oar373RcjENcHvbWAib7KlM7uC5w6FOa0AMdB6Ni8DeE0c4bBRRxjl3Cb20O5AtrCwt6JO70IcglYhDTayM+UVx1sYY1o5uhKUsAdwA69N3BXEf0MP+SlKAkow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780935807; c=relaxed/simple;
	bh=msHcKQxLBsII2jE8+s87uUuYhtqoC8UsJJE4Ma2eSao=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MTjtolO4od6yXGb4DxHCmVEtOUWp+4OQB+CnpyIIQY75YGZdvI1VuPncWc2jJRi6PQB9V0oaseBBwgTAjJHynV7VqkQxrNta6ax2FcPthuWmcBTz5fwZ84tT7HfNpkXpu35dpyQMfhZLOTFkQr2JKlL8+P6hwDGe5v9pHHNAyqM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JtHmSKsX; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JtHmSKsX"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-46013161068so2241705f8f.2
        for <linux-doc@vger.kernel.org>; Mon, 08 Jun 2026 09:23:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780935804; cv=none;
        d=google.com; s=arc-20240605;
        b=FYRBdurye0P+2FrrR6vtwT3J+7+i6FRNDz0+AQ47XtORD/25OXFJQWDb0qJtG+7cuV
         jaKq/QIQmGEoyd9VQ+59PCuTCVm9bqLMKiTqxckUP6+RFfeX7tZGU9QbH5Z0jLvDZxHa
         se1JlnbinPcfgjFjTkWm9VU6pc0TgXqJ6hPXGV9D5ps55T6+2qQ9PCkRaPpZzgnJvxmF
         YSNVug7YWDyu+dZL1nGtv+n5dEKYV7l2Hy9XJNWo6zDv2LQgwwEakVaThorch2CykHs7
         wobSscyxZ2TMy8h/uvIzkk9yTqTuiWD7sEaewlYG6uKfEpATD/dh8P2rZPIMNbpb9Vp2
         HYGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jPv+U/wIjO6pXhd0p8FcM6eyTjtkG314lWJDeM8Dul8=;
        fh=6kbT0TqwJojUjzvH6tJcA0Zk9YsFZLSs5DHUNYNqUAU=;
        b=SKiHi9kVVlRugDxX2diXT83+kdzlYbkd8y9e6KBxTFPqdBNdVn31Py/5mCZ6sWn+k5
         6lXwpI9rD8kuT8siEGbhC8n9BkjlRaQvm9/5fuL0AimKLhn5oaJBEJOwQr/HlVkXE1BT
         RDA4FzlTxdLNW+aY7KJXcZQfdz8OxKtP+bC/yAkBMgak+wFDNoANS/VKng/j+C7ef4cZ
         1XSfJV6yVjpA+GoGusdlzztGGaDWDugl20JhwuJ3u/77ZSzLUqjpBi5+Aa06+tKh09w5
         FNwJHsbUanmKhSOYoglU2UtzNhHL/G1g5XugDY8KBX5byPl6Mt5np7nR+FIq3X0zC+YK
         UNGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780935804; x=1781540604; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jPv+U/wIjO6pXhd0p8FcM6eyTjtkG314lWJDeM8Dul8=;
        b=JtHmSKsXJkKirWcUHlx0Tx0KRB2JjH5avxG1Bs1/edk/J79tVdOFOeyaqGBvjIwwXe
         Ju3X44Ls090yo1QbQRBJCZhQNq544qC7JFUtXlnYjAnp75Ct8moSHVjudaUUfALTbAZs
         PAastllztlVcP5kam3ivPBdUzKeYMiPiWOcNsJEJUVd+33QyZxPY1GyCwauII1bfcVhr
         HPHIaTKiuc+pHKphcrqE1goroh+MzhmiOGs0HwZwC5oSxX3Z4e7hV8J3GOU2u/JYPH1T
         yTEWHdjg+64jalGalQNE4I6NZCjmkIsPJU0P4H/SmcjFTao0aZNt6wYoGW1whrovuhzq
         1/Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780935804; x=1781540604;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jPv+U/wIjO6pXhd0p8FcM6eyTjtkG314lWJDeM8Dul8=;
        b=P8T2KCmOKdhXTFz68fp4/ZZ3H+Qhi7WnB10HqFaw1fT+BfJrXiHY/tiQ634466bIX6
         i5Qtp+BsqUEbhNUrx/bnjalytZVJXzTaCEJ5Uo6DCr7LKX2Gl+laaJbHrOye9dvGAoG1
         7Hob5s/YmHP/2z9/yun+4uOwC5lXHT3pPN1SLgW2pTUtZEtiSYr0XerlUHzkEPK3blWI
         at4fUQkquHz2X6Idrzd2uFXY+d1K0Lvy4CJbG2rR4FA3tLhp+mWirjQ82s6heAvJlTLo
         kdynVfsXXC0gplf/KCLoZsFwdLwi2cMC7aooNhIju4VAQCpfBnJ/2sG+DZGQKpVADrNJ
         16kA==
X-Forwarded-Encrypted: i=1; AFNElJ8FzGp1W2YkCisD9ye7TTjgfMl99ZW04dEk3iGMdYkAEumsTz7y4/CityTi+SVbk5+2E8j64b96sO0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVNRyWHAhjFqNID0Yx1mH8+yk9c2AbjYpGpQNLZ1ImoNY6U/VK
	G/8vJsJJ989TtoDt0V3xees8IVZgmM35axJuH8O21M4/uAqECcG/D2tmzVEF9VoUl6BwZSOGySt
	R31SDyX75jIYVdDBzFjQBYJmZHtuSSyRpvvVwanc=
X-Gm-Gg: Acq92OGjhDO5EpvvNqsQqWjVWjLScbKYwMetN1+L4taXErnuuIqV+21RUECvFNT3Z3C
	29h07iVvqmEtjkckdHKZlz5VX7827tnQRQwD7CD01h4hnHXKUAmgeDc2KQOxHhEVElB587BWsgn
	SYWt+0PQfcwEIyyiF5aupXr8QJLUZHQhEdSaC1CbfsL4MORlchAmT7IZhTmC+YxWdxmrWi2f8rT
	BtnasTqffFDbdVxkSXwC0bUVHBrtib48t/Nrj5IBlVzUm48EbSa1fizABeeHwwMSZFr72Hxs7lZ
	DiD5gkH1zvPK4EMD7EJgN17WvxV4EvSLqB/W+T0Z8cx0+96G413t6eaQSHK4
X-Received: by 2002:a05:600c:3f1b:b0:490:bcf6:46bf with SMTP id
 5b1f17b1804b1-490c2599fecmr275598275e9.9.1780935803894; Mon, 08 Jun 2026
 09:23:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260526114601.67041-1-jiahao.kernel@gmail.com>
 <20260526114601.67041-2-jiahao.kernel@gmail.com> <aho7nepN5jZtKmef@google.com>
 <8c0e60e1-5713-69f0-a687-088c87e75764@gmail.com> <ah4ZZGl7GYJf54Wz@google.com>
 <ff344c9f-51da-8b3a-e7a9-c4a7f4702ef8@gmail.com> <ah9i3uhh3PFiS0Uk@google.com>
 <c7870fe2-3588-79db-cbfb-bd6a2b78f594@gmail.com> <aiBpibRNi0BcM1Zu@google.com>
 <9898f83d-fae9-e284-6b85-c7f4089840a0@gmail.com> <CAO9r8zPBH6-0SQ6-_ZOhTQeyu=rz4F=ugikCrU-JR_skm6fEWA@mail.gmail.com>
 <a60eedb6-f3fd-4092-b726-04a17a695ace@gmail.com> <CAKEwX=MQ3xXBAY-2H8vA+XSX5GHNBubJ2GCYAXGD+Hra++ZM7A@mail.gmail.com>
 <90730fa7-62e7-d5f4-b638-23b22a8509f2@gmail.com>
In-Reply-To: <90730fa7-62e7-d5f4-b638-23b22a8509f2@gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Mon, 8 Jun 2026 09:23:11 -0700
X-Gm-Features: AVVi8CcQa0JXhG_fDPPqHmrr3OFhGwIKj95CSTSdP9Q_mQuoQWpHKZOKlZLp87U
Message-ID: <CAKEwX=PF9hfERC_QMq+rjkSc-BsJyawMgTe+EhwR_86HiQKm=Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] mm/zswap: Make shrink_worker writeback cursor per-memcg
To: Hao Jia <jiahao.kernel@gmail.com>
Cc: Yosry Ahmed <yosry@kernel.org>, akpm@linux-foundation.org, tj@kernel.org, 
	hannes@cmpxchg.org, shakeel.butt@linux.dev, mhocko@kernel.org, 
	mkoutny@suse.com, chengming.zhou@linux.dev, muchun.song@linux.dev, 
	roman.gushchin@linux.dev, cgroups@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Hao Jia <jiahao1@lixiang.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 8, 2026 at 5:50=E2=80=AFAM Hao Jia <jiahao.kernel@gmail.com> wr=
ote:
> On 2026/6/5 01:23, Nhat Pham wrote:
> >
>
> Thanks for the suggestion!
>
> I ran some tests and found that neither the per-memcg cursor nor
> different batch sizes have a significant impact on proactive writeback
> performance. However, exactly as we suspected, without the per-memcg
> cursor, the writeback distribution among child memcgs is highly unfair.
>
> Test Setup:
>
>    zswap config: 18G capacity, LZ4 compression.
>    cgroup hierarchy: 1 parent test memcg with 10 child memcgs.
>    Allocation: Allocated 1600MB of anonymous pages in each child memcg.
> To ensure compressibility, the first half of each page was filled with
> random data and the second half with zeros.
>    Force to zswap: Ran echo "1600M" > memory.reclaim on each child memcg
> to squeeze all their memory into zswap.
>    Trigger writeback: Ran echo "<size> zswap_writeback_only" >
> memory.reclaim on the parent cgroup 200 times, with a 2-second interval
> between each run.
>    Metric: Monitored the zswpwb_proactive metric in memory.stat to
> observe the writeback volume.
>    **Note**: The size here refers to the uncompressed memory size. Also,
> since the second-chance algorithm would cause many writebacks to fall
> short of the target size, I **bypassed** it during these tests to avoid
> interference.
>
> Without cursor (size: 1M, batch: 32)
>    child        wb_pages        wb_MB     share%
>    child0           6368        24.88      12.50
>    child1           6368        24.88      12.50
>    child2           6368        24.88      12.50
>    child3           6368        24.88      12.50
>    child4           6368        24.88      12.50
>    child5           6368        24.88      12.50
>    child6           6368        24.88      12.50
>    child7           6368        24.88      12.50
>    child8              0         0.00       0.00
>    child9              0         0.00       0.00
> Without cursor (size: 1M, batch: 128)
>    child        wb_pages        wb_MB     share%
>    child0          25472        99.50      50.00
>    child1          25472        99.50      50.00
>    child2              0         0.00       0.00
>    child3              0         0.00       0.00
>    child4              0         0.00       0.00
>    child5              0         0.00       0.00
>    child6              0         0.00       0.00
>    child7              0         0.00       0.00
>    child8              0         0.00       0.00
>    child9              0         0.00       0.00
> Without cursor (size: 6M, batch: 128)
>    child        wb_pages        wb_MB     share%
>    child0          51200       200.00      16.67
>    child1          51200       200.00      16.67
>    child2          25600       100.00       8.33
>    child3          25600       100.00       8.33
>    child4          25600       100.00       8.33
>    child5          25600       100.00       8.33
>    child6          25600       100.00       8.33
>    child7          25600       100.00       8.33
>    child8          25600       100.00       8.33
>    child9          25600       100.00       8.33
>
>
> With cursor (size: 1M, batch: 32)
>    child        wb_pages        wb_MB     share%
>    child0           5120        20.00      10.00
>    child1           5120        20.00      10.00
>    child2           5120        20.00      10.00
>    child3           5120        20.00      10.00
>    child4           5120        20.00      10.00
>    child5           5120        20.00      10.00
>    child6           5120        20.00      10.00
>    child7           5120        20.00      10.00
>    child8           5120        20.00      10.00
>    child9           5120        20.00      10.00
> With cursor (size: 1M, batch: 128)
>    child        wb_pages        wb_MB     share%
>    child0           5120        20.00      10.00
>    child1           5120        20.00      10.00
>    child2           5120        20.00      10.00
>    child3           5120        20.00      10.00
>    child4           5120        20.00      10.00
>    child5           5120        20.00      10.00
>    child6           5120        20.00      10.00
>    child7           5120        20.00      10.00
>    child8           5120        20.00      10.00
>    child9           5120        20.00      10.00
>

Yeah OTOH, we don't really make fairness an API contract here. When
you set up a proactive reclaim scheme, if you decide to target a
cgroup (and not its children separately), everything underneath it is
fair game to the kernel in any split that we fancy. If you want true
fairness or a desired split, you have to treat them as independent
memory domains and set up proactive reclaim to hit each child cgroup
separately (i.e one "echo > memory.reclaim" for each of them). This is
necessary for example if each child represents a separate, isolated
service/container/tenant. And maybe this is actually what you really
want - hit the ancestor cgroup very lightly for the stuff it owns, but
then dedidcate most of the reclaim effort at the leaf cgroups
independently?

But OTOH, this does seem like a recipe for inefficient reclaim. We
might exhaust hotter memory of a cgroup while sparing colder memory of
another cgroup... But maybe if they're all cold anyway, then who
cares, and eventually you'll get to the cold stuff of other child?

Yosry, what's the concern here? Is it space overhead, or overall code
complexity?
