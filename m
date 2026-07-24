Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE3732B12D
	for <linux-doc@vger.kernel.org>; Fri, 24 Jul 2026 18:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784918395; cv=none; b=galiDkdxzBYj+Sk2JM4KQjaSVxuISYetn4okA37N6CcvGZfcskKe1A0Pf3j5B62iMxf7ELFFp+NXXTonogheNNu7MTAg1oIzXpzUf+LbyZMbcvyrLRAA1hg80QM0GJu54B2CSkPYBecq1ImKlw5aNE/6tpyemCdBZ09px3deuUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784918395; c=relaxed/simple;
	bh=yMy0RkLNIpKgOxH4+WCkTX8ET4G9jEK2AAhw88X/HIQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lR4vgS7vl7NHn82Yt9AZ3ppYXLeWfS44U68y6GL9uLbdzIc6elxPcH0KL9zMqE33J3h50/e8f+dFO9PnnQzuZ22yFmmDRWs7CdKNAKBlUBhEcQ4P0wXqeLPC9t7dLP0q1pxqq20TRdhglisQIbvfsK9iRzBXGmqzayceki4NMEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bNbUimD5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bNbUimD5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 254B81F0155A
	for <linux-doc@vger.kernel.org>; Fri, 24 Jul 2026 18:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784918394;
	bh=yMy0RkLNIpKgOxH4+WCkTX8ET4G9jEK2AAhw88X/HIQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=bNbUimD5rb1oWmYlt59f1ayMnQaUUjp8jvJQBgXnHfHjg11tTOQQ+9U0NPB7R2BOE
	 ovRdp3KRww8l4r7yJ5Vqwpx20OifzkU7lAhMTZ8IB8zoE7U/himlZoIaL39i8g3kXB
	 Ah8xmynRQwZTnXVHALrGM5UmbI3MtqnQzd8lz3I3z39DJXBf4uTE1OvO8Dm6h0a2AW
	 ux99rVYZuKrhpZXUlKONXq28uFQa6IIrlKn4MnK2aARjzW1Y8KbO7lUdom+LnfjsvT
	 Ge2bWVZqcXVTbGzcjUpur2vRAJ5SGPJHVo3Pl4pqXg3Z/1RGmhgxuK8/4Cz49HCr0l
	 mLv1NYrOgVAiw==
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c1c50c1e29bso114601266b.3
        for <linux-doc@vger.kernel.org>; Fri, 24 Jul 2026 11:39:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoQ9FqDJi/jSEKFW7TyRRoxOPJZHRerJQsY1QrNHBcUQQ2uXD+4VEQ4590yXYg8aUD3EeeUs5mnEPU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVnfLKxJCNasHnRDomfGqkwQL0fGkeCSi3WqPJq5MXbFB8wUP+
	DccmlHilcKd14oViUi60P9qMSLt/KdGCluxy5Ud1Kiok52BGTdAfFqknofxhjayo+PeR4lU9KAl
	5TPKqMbU3BpLbtJ0kHSszeigzuX3UNow=
X-Received: by 2002:a17:907:7b97:b0:c19:8408:5b54 with SMTP id
 a640c23a62f3a-c1c509e2830mr386703166b.60.1784918392986; Fri, 24 Jul 2026
 11:39:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260717085151.22822-1-jiahao.kernel@gmail.com>
 <20260717085151.22822-3-jiahao.kernel@gmail.com> <amF7_GB5Rl6OJmt4@cmpxchg.org>
 <CAO9r8zPaUPddYoLz8o+g+xkb-zdkfyB+LqaDOrkzqFSePEV-xA@mail.gmail.com>
 <amIdU1lFxqxTI3Gc@cmpxchg.org> <CAO9r8zPepaekOgaDaVBWyB_F05Ezvz+AJZ8M5+NGQ4BmiJNBkQ@mail.gmail.com>
 <d8de419d-0077-c47c-a5f1-37c229a853ed@gmail.com> <CAO9r8zNq3bRN+mumA5tcdizStpgoqTc++FYuGjvL8spbv4Q8YQ@mail.gmail.com>
 <CAKEwX=MG0F1+my1krUiOrHCn-Lypq2gq-g8Rv07Mz7sC=YEKaw@mail.gmail.com>
In-Reply-To: <CAKEwX=MG0F1+my1krUiOrHCn-Lypq2gq-g8Rv07Mz7sC=YEKaw@mail.gmail.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Fri, 24 Jul 2026 11:39:41 -0700
X-Gmail-Original-Message-ID: <CAO9r8zOH93mfdjHq+Ljm7X+ykZS_rjzAvp9OBCzo+uyTbM1fDQ@mail.gmail.com>
X-Gm-Features: AUfX_myfbn2VHTOdNwc3INo5jsB-s4YaeeA8KkqfC_LpORcf2nZ2hwByHTxg6Xc
Message-ID: <CAO9r8zOH93mfdjHq+Ljm7X+ykZS_rjzAvp9OBCzo+uyTbM1fDQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] mm/zswap: Support batch writeback in shrink_memcg()
To: Nhat Pham <nphamcs@gmail.com>
Cc: Hao Jia <jiahao.kernel@gmail.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	akpm@linux-foundation.org, tj@kernel.org, shakeel.butt@linux.dev, 
	mhocko@kernel.org, mkoutny@suse.com, chengming.zhou@linux.dev, 
	muchun.song@linux.dev, roman.gushchin@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Hao Jia <jiahao1@lixiang.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 24, 2026 at 11:37=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wrot=
e:
>
> On Fri, Jul 24, 2026 at 10:57=E2=80=AFAM Yosry Ahmed <yosry@kernel.org> w=
rote:
> >
> > The numbers generally look good, the store rejection rate is
> > decreasing and we are naturally doing more writeback which makes
> > sense. The store rejection rate actually increases when the batch size
> > increases to 64, maybe aggressive writeback is more likely to fail and
> > cause a store rejection, so that also makes sense.
> >
> > The only part I can't immediately reason about is pswpin. How are we
> > reading from physical swap more than we ever wrote to it?
>
> The same page can be swapped out once, and swap in multiple times :)
>
> Unlike zswap, physical swap in is not necessarily exclusive. You load
> the page in memory, but if the swapfile is not full, etc. etc. you
> don't invalidate the copy of the data on the swapfile. At reclaim
> time, we notice the page is not dirty, so we just skip (z)swapout.

Oh right, I forgot about that, thanks.

I still don't fully understand why pswpin is significantly increased
with batching here. I would hope that with less LRU inversion we end
up with less disk swapin. Probably the test access patterns are just
too random compared to real workloads?
