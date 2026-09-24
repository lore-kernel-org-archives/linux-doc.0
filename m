Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BC83B0AE2
	for <linux-doc@vger.kernel.org>; Thu, 24 Sep 2026 16:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790266837; cv=pass; b=aYVtkK3ewj6+NCvtssfq0zUBoL8z0PbaXo/1FIqAz9m1hytXEAD9mBwCbHcbcBJbN1cD75VTNd4F7wGzQ//69p+x17LSfsKVQs8rQnd8JeTAX+v8+hDStzHeBoXIs+DD3PyG11rg4OnKbVQrUy2gXL4UnOYqa6VZZWHzQ1+hmSM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790266837; c=relaxed/simple;
	bh=RSp2l1x3VML/TUH7NBwrx8HvLT3W4YMiteDUtD6oAoM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EacRfWSzYiGQ0LOKyYPlgQBeMAawE6aphWiL1fT0mRjCWapsmvirIM0PkszKkBTtTSV4q8E1CzXniZKHY1ZL6uGFyjJFbczLxk5stoqz6u5TxoA0IeDFNzwz2DMuyZni2IEQFcJa7FPnD+m+ThCJQiLg4veNhS7P1AsGbWbw+Gs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PCpCDWgX; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PCpCDWgX"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4858bc96fabso1968279f8f.3
        for <linux-doc@vger.kernel.org>; Thu, 24 Sep 2026 09:20:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790266834; cv=none;
        d=google.com; s=arc-20260327;
        b=bMtsTFVjOFD9owiFsFH7CoXi2tPCksN/6NmjBBbOf5CQP+fCrREwJNSBJemwCdCQvR
         4FJgbHYPF2JuV0HaScLKX45tRGRzfExmtkhUcmxb3tQmc9j/ev+hqcO0YUVcnuNuYB1c
         xRJ/nYf2LMgTLaOISUKZXLv6dtaGktIwumdgn2uBSGQqshu929NSnCQ9tPkR4H0/QEwc
         czZqcDudnCr+xc0Fec0j3MlS4G7mEz1/yfZulsJyvalVg7YmsO84DbIH56Uq9zcXOjnQ
         KDnP73TEj66nwdo95Kr2+1f5268URegqMNKsWSTwhXqGvJIsNjqM4DGrI0njwGygAk8L
         h9AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Y4C/eEY5hpNw6IZ6GmmYyn13brOMotH1yARGM3FuI/E=;
        fh=UJ4AR8ryLgKseo0HfcVeJLGWEo2EopwIp4E/OnQBYto=;
        b=On689mM+Grjpp6JKao7st5k3JcXJDtCJiJl8H1899sozV2ldXvZjxRNKC+UFzeSl+F
         PuIu1/Oj17etIarHTNmYzbOf6/UpGW5P6xX3tiE0IDm7Bq1WQphf+5sEYdMHjVSd1F0A
         QPjvBgyuFLTYdtlt/EBJZxEpCPAK1Fc0Yu1p9XRoOM2gEaA5kjHsMmrhxbA0fkpZljny
         joe1F7tiGLV3WiFaQ5/u0FqIkLJK+OkZZvcnvYS788tL2vO+fBZttD8vIYaf9IJ6jisJ
         1j1qhnpSdeq39Hl5HBeXGV7zsaFBvon3xXIMshSg/pKT9q+PFfo1UJoufKHNcngePZFo
         m/lw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790266834; x=1790871634; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y4C/eEY5hpNw6IZ6GmmYyn13brOMotH1yARGM3FuI/E=;
        b=PCpCDWgXouIzhtlsM1Cz/m22yXk3HLuDl/7iiEUVUQXb8dalyr/v+itsCLjAM3YU8m
         eAMbllXGH9dncQnIF4y35V3EnJCmKQMF+QGLHyoo0Ck102zKYF8l+O0RoUXq4VHWKKbw
         feTuDO9Fm1PmhpuosM75c04GnAmPGH5oybiaHrPFARtpdYKKeQMtf/Y/aV29/vw15BTJ
         mkNc01PHDd7BU1nNWb9H0b/1SAFbJspaTY1+K/roQqc5iJmL/9W3ByrRj6OtXjWxhOhT
         cE+KkUwWavN6PvWKvIseyDn/w0JfNWH2F5OzfnqP6zIclBexkEMQOicMq7P8nbnorDM6
         yrJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790266834; x=1790871634;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y4C/eEY5hpNw6IZ6GmmYyn13brOMotH1yARGM3FuI/E=;
        b=13k05TeqwptpWZa1tERmdI20Av/hIu4IVF9e4kHoMNrZGTtBQt1e3qXt9A1cNqaaBX
         Wo1rjhzGmwdjlzVvtJSxERntp/IA0+TBGQAC9fPNHWWuOh8I1k0oJunf2Rpkx7ri0NvY
         aMNPn0NovmTg2wFS6RL3exGe6iEMZwq3yxC4GWHf6kB9EKajsmr2cVR1aidzKlsxDijP
         3SVEbxzw2o8nsSpPk05sPPIeqFPMkwT9B+bIQH+5oTczezLnQAdlO0jrUdZwAb2fW8af
         p5Fkv4nD0UJeQS+7hCOO6BqXiTsLzjKbXrauB/JrrKWh96B2czw8vC3GgWwomdmfq7nF
         KgwQ==
X-Forwarded-Encrypted: i=1; AKwUvBzufi0nzUfKn0N4bKnIYpi19AicuCzCadWSyETmpVR8UusvfkfREWBGVBURN8cvHCebIPYIWc0Q8vI=@vger.kernel.org
X-Gm-Message-State: AFuF++lDKeVWngpm0lus0fBF+V1MqgIk5NnT6AQpS25kXCvvIqYFe53D
	hcG+1/tIovf90pMWZVB2CMzsF3ZELXu8IYasu6hymc/jmfQopUgG4C0d235MOjBjY1tXZs0YNlD
	+AiCXorfg7CLQHjnR432AnuR22AB/Jes=
X-Gm-Gg: AYBFou1IUk3kYll0MpfGO1xOcq9gfRaS06jsvranVI1wMau9BmcVpdzKd9kX4WgsYTB
	i4EaCzRIqOom+OTv02Gu0J+apLLtuaAWqtF5WuOiZ3LxZTCGA6SkH8t8e9f9fYV5ICsuHcerRJr
	bcqrXGWecjCAtC1OO/EZfFjxGpFJd7O4DN6BpPw34WS4bDiywGV1DGlggtY8THG+6AKhRRQAxO9
	o8m8jPGc3kB6PsYzyEdBb9bWihyfMM25++ERVTh6kVdn7BtrcnY4j9mIfa5qI77PG6A6u6fn6fs
	Nn5NLuKdqtxBhzG3/OxeOWQ99QKS3RhcwWiLHtgg2b6yC1QFvcMux4Pwi8A6lR58YxKjZXuydNz
	8Urs0O2A5Zg==
X-Received: by 2002:a05:6000:26cd:b0:486:fe8d:298e with SMTP id
 ffacd0b85a97d-48872ad7729mr4973566f8f.53.1790266833368; Thu, 24 Sep 2026
 09:20:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918180241.3424851-1-nphamcs@gmail.com> <20260918180241.3424851-2-nphamcs@gmail.com>
 <CACePvbVaDNspMDSw_qAcapKAzXj3JGV-KMYmow7aePa0POHpSg@mail.gmail.com>
In-Reply-To: <CACePvbVaDNspMDSw_qAcapKAzXj3JGV-KMYmow7aePa0POHpSg@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Thu, 24 Sep 2026 09:20:22 -0700
X-Gm-Features: AclHuK-lGJJsKLxr6Qb-y2IvmlUpoUB7yhNg4AVw4NM-rENBoqlMKdnr9zU6afg
Message-ID: <CAKEwX=OP3Gb9sVOvch+p4j7quzgy-rUY=UTZau5ztMj7heJJoA@mail.gmail.com>
Subject: Re: [PATCH v5 01/11] mm, swap: add virtual swap device infrastructure
To: Chris Li <chrisl@kernel.org>
Cc: akpm@linux-foundation.org, kasong@tencent.com, hannes@cmpxchg.org, 
	mhocko@kernel.org, roman.gushchin@linux.dev, shakeel.butt@linux.dev, 
	yosry@kernel.org, david@kernel.org, muchun.song@linux.dev, 
	shikemeng@huaweicloud.com, baoquan.he@linux.dev, baohua@kernel.org, 
	youngjun.park@lge.com, chengming.zhou@linux.dev, ljs@kernel.org, 
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, 
	qi.zheng@linux.dev, axelrasmussen@google.com, yuanchu@google.com, 
	weixugc@google.com, riel@surriel.com, gourry@gourry.net, 
	haowenchao22@gmail.com, corbet@lwn.net, hughd@google.com, 
	baolin.wang@linux.alibaba.com, tj@kernel.org, mkoutny@suse.com, 
	skhan@linuxfoundation.org, kunwu.chan@linux.dev, kernel-team@meta.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	cgroups@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 2:18=E2=80=AFAM Chris Li <chrisl@kernel.org> wrote:
>
>
> There are too many swap_is_vswap() in this series. It fragments the
> code path, making things harder to reason about. Esepcially around
> locks. I count 22 in this patch alone.
>
> I consider this the biggest drawback of this series. This
> fragmentation of the code path.

This will mirror my response at [1], but I'm responding here for the
record and for your convenience.

It is needed because vswap *is* a special device, with its own
requirements. If you don't special case-it, you'd get undesirable
behaviors.

Let's take Baoquan's patch series as an example.  It treats the xswap
device as just another swap device, without any special consideration
for it. Which creates several problem:

1. At allocation time, cgroups that disable zswap might get an xswap
slot, because you don't do any check that the device you allocating
the swap slots for is xswap. At swap_writeout() time, it is *stuck* -
we already do the unmapping step, so we cannot reclaim the page.

Ironically a physical swapfile backend could have bailed us out here,
but it's not in that patch series yet :)

Vswap both has swapfile backend, AND allows you to bypass it if the
cgroup disables zswap. Both involves a bit of swap_is_vswap() check,
but I think it's worth it :)

2. Per-CPU allocation caching: since all devices share the same cache,
xswap will invalidate the caching of other devices, and vice versa. It
would be fine if the these devices are interchangeable, but as noted
above, it's not, especially without physical swapfile as the backend
option. So you're forced to taken the slow path more often.

Vswap gets around this by adding its own per-cpu allocation caching,

So by being too lazy and not carefully distinguish the swap devices,
not only does xswap not work for the writeback use case, it cannot
even work in deployments where some workloads (cgroup) select zswap,
whereas others select disk swap. It can only work if you intend to
have a single class of device - either virtual/xswap or disk swap -
but not both.

Maybe instead of just grepping for swap_is_vswap() and throw your hand
at the complexity, read the code and try to understand why it's
necessary first, then propose simplifications if you have good ideas
in minds.

>
> This is questionable. A vswap device does not go through swap on.
>
> This changes the behavior where swap devices always go through swap on/of=
f.
>
> I wish the swap device went through swap on to be able to start swapping.
>
> Chris

What usecase would necessitate the need for swapon/swapoff interface?
Other than just trying to shoehorn it to an existing interface?

I've expressed why I dislike the interface in [1]. Other than the
sizing aspect, which we are already discussing in another thread,
priority also makes zero sense. You are literally exposing an
interface with only one correct answer - what's the point?

Justify your interface choice with real userspace use case, not just by
conforming to the status quo.

[1]: https://lore.kernel.org/all/CAKEwX=3DPEEkYiNRaVhCuM4E6mxB9huPKfkDa4m62=
VMTzedg1oYw@mail.gmail.com/
