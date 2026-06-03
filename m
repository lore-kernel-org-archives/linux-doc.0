Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D91480DC3
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 18:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780512722; cv=pass; b=D3O7wFcv9J8Jgynsuh0o8c8ZAAlgR8yYbFsIpEliHiU/v+aI76ghpEu1hH0ZnwYZEiKw+md31tQgazTAWsrw2s+yGHnWsJgUikisP/QYLjRxxfMV+byUamoh/XSzdhwGKlmTi3jGBNog/Gguql5uwor6+IkLv06WhZpY9fovtO4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780512722; c=relaxed/simple;
	bh=jkn/4x7mPiUSlevt03tEoGxtXMPLrS0T6VHBMKvffzU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rpc/dPz6kRcqaZRaJExygOeCAbQmXCrEtTOUswolc1aV5rXtpi7iXUa3LHRYoKZbpnebSPvqVOOfa3ikm76Dzm8H688wcxrlYyiRpIiLAXneen9SzO4GMf5drZ3AcE73M44KgoueySFW9EdFUy48nBStUKiiB6vPru24bZiDczg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZMAR7LXF; arc=pass smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZMAR7LXF"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4903f7a90d1so120623825e9.2
        for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 11:52:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780512720; cv=none;
        d=google.com; s=arc-20240605;
        b=QJgkqKSv2BrqAOSy7IkCRKfBatHvSd8YRtKt6XwaLIkuY+BkQjSQTvR7nED8DvaxRe
         ON+hr4wwbrZTN15MsYmX1cMHhZIwox/5JIQj7KVig+EvMhkI69PRCBIwI1rbUCxosMNM
         aNsxN1jJhXRdq0h3CuKNQ9/7s8mS8OBJeosZ5HIvaPebc3BcKzhKtBFZv6g1OGaa9mrk
         cNR4EQh8Cr6KknIKwOlgaeUmB2JDYVA12+X50mV5BG+G/dPjIjBKn7tpB/4tjoAyUbvs
         G7OoSSg/oSjueI8Zv7o4lg0rAqIzREpLjld80TxZJf70VZ0InlqNm902kCahuQRjQ89v
         Zz5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e5vL3r211abayjz91d4jpb2IiE8lVazmF4WtAPu6R18=;
        fh=q2xEHxsSbUYk9WWd96ib9QC6EIFkIMjNVStnyrXw42g=;
        b=aoEgujGlJQ/Nhc+FN7Rbxx0EDsOJz+YUvNJ5KR81gld2k+2PPlamIPnIcZtoPTFqk5
         sUcTngnMzhJRmEaFVqr+qzneP69NM64Dpkc0pmIIjM4qYbNFQN4vrX7TjAs5K5rdD7af
         MDwoFDGiCRcLJ6/f1OyinfPBHR+T1rGVP4t6Pod9nqjhit5Wk2ZgXg09Meagr0tTu2fX
         +Somj+SYPf+HWIwA/rNr2URvaht/njhds+GTZQSLCXQff/vXvjE/zLioFIwYhXXlziLh
         jBOm9KgGiZ4RpX04uLWwa9sziWwVcuUNnclYPJdqt/dlNPgNcOuWZJ/4QmVHd5uEaMuh
         lTpA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780512720; x=1781117520; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e5vL3r211abayjz91d4jpb2IiE8lVazmF4WtAPu6R18=;
        b=ZMAR7LXFTwtK9KxK2QDF+yNmuITR8QjM/E05E5Hxu1qFC7L9At2BtnZIRl+Tuh8xTc
         mMlmWmdAiXi5FlEsAR6MjSHYCP+Nz8ZfJ2vS25FIZyFmG39lgXQmwMSpob+IIVGmtbkb
         L9/OXyd1f8lsRO5Jr2ZO50cdJYW8CSXg2RzOZzRUYEAA2BQ/i6HfXCwxLgg9Q0zi1A/p
         x1SBpDZz6e33kXxx18ksya062Ii8YVZFrWYTAeK+3P95AY/Bh0Y9G73/s++qo5bCrMrM
         mdYOXRDe/VpNKuRDxSOUrX7/cDduEszNAB3RFx+SsvAgEWkEQJtBfLFtuqB7McyuwMpK
         +DBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780512720; x=1781117520;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e5vL3r211abayjz91d4jpb2IiE8lVazmF4WtAPu6R18=;
        b=d94yHtwxLdKkgDlzDmsXdUaZWaSMY1jEOPRkuMlgw9X7LJcwp7C3nvGsUXZ/F3J7w4
         Po+L0MlPTDpOrneGBYnTXHAc8nDfh+5AF9zqaF6ErCmRB2xEp04H/hT9LOSCIVt23Qej
         TIwYe2BrNPHMzo7EyTuY41Wlt9XNifYxLw+/8GePjJVKJMaT+NyN2Z6f+JHAE0/1ON8s
         JOXWucUrv4DQk74Z/lz4nwUIXZKwYpSiZRs7rhdL/It+P2WANuvI1/WKc9sV1cfTDrxM
         JbKCw4S5CSTXjS8FD7geBqdYqNlljH4lQPY3Z4uOMTLI5YMmcwEcakp9NIE8NFPfYSBy
         hkWw==
X-Forwarded-Encrypted: i=1; AFNElJ9ABUph5Fb+y8F4Rjl5b2CVJ7oM5qfo/gq4/fqjjc6/AZUC9lZUNVncXjjEraelEmA0K+XKn6sVx1I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPKIbF5i1s9C7Oy6ee5KsS04m8cpszQE9N6m1eFaslAfHMhMhC
	PV7QGzZbDPyIRxHPNo/6GLuk7OtUQvb9f7/HD5QT0Lna02nSKyz05X88EhbOnz4R7Dqeq0oN/0A
	ducKhXcXET1kYnHU5QWBlyF2Yme7Wbv98OdkL
X-Gm-Gg: Acq92OGFRQ4Q/m8XsW4piadzEXcl9UM3nE1cfGTaFusV5GRAk0iHTz819iiav6E3fay
	LJWWcp6MR4GoBuI8y9qtZKDLTt9hID7pOv0gi5CZ6kJTdPFhM6Dhh7dPYi02u1bTKN0+xhuIN3G
	ubSqHa8eAftFRt131KVMkpIca1gbpR6KhjvwHlkj8X7gAGKTxqX2MOK4lXC1dHsWtCPFgvhs5Sh
	/ZM+vg6+1JNFIYdjqLmlN01I0pkHuzXe/YFCGIHtdwIdBP3iM5jVxqz8mQqgi3w5GuGza+WFmc2
	7wGawtP6pPSnMjbtdUI0G42AC1xn9fziGIF7Glbhj8zBlDa31w==
X-Received: by 2002:adf:f8c4:0:b0:460:e0f:8d19 with SMTP id
 ffacd0b85a97d-4602179121cmr5600969f8f.9.1780512719668; Wed, 03 Jun 2026
 11:51:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260526114601.67041-1-jiahao.kernel@gmail.com>
 <20260526114601.67041-3-jiahao.kernel@gmail.com> <aho-Z6wshceTAYd9@google.com>
 <ea2c1323-1440-e927-f14a-0eac54a245bf@gmail.com> <CAKEwX=PoBZ4ci30tKHQXs1o9=NDpPrtbe7RxxZTbnzVJf74ZYQ@mail.gmail.com>
 <CAO9r8zMBUMXy_bkeT8z+M=dXayU=6VGEw+-HmfDWR2fyJy=z+A@mail.gmail.com>
 <CAKEwX=NQUqqrM9vdYE2KhWEZx-YwPc7YPhfz7xaBrGVDf824bA@mail.gmail.com> <CAO9r8zO0GjTeY2+j_AjfTQ8qYOmHezZAV44f=aPgrjJcdtO9rQ@mail.gmail.com>
In-Reply-To: <CAO9r8zO0GjTeY2+j_AjfTQ8qYOmHezZAV44f=aPgrjJcdtO9rQ@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Wed, 3 Jun 2026 11:51:48 -0700
X-Gm-Features: AVHnY4KKCfMou4Ez8iKWPLzU7z8Pcq_wTI6Zo3Ilq6vW5_DwwK6THGlhJPcI_cw
Message-ID: <CAKEwX=OeFsFPdazWFf0tsKTOi3DneX3fCcreEkzwb=BOR_37hA@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] mm/zswap: Implement proactive writeback
To: Yosry Ahmed <yosry@kernel.org>
Cc: Hao Jia <jiahao.kernel@gmail.com>, akpm@linux-foundation.org, tj@kernel.org, 
	hannes@cmpxchg.org, shakeel.butt@linux.dev, mhocko@kernel.org, 
	mkoutny@suse.com, chengming.zhou@linux.dev, muchun.song@linux.dev, 
	roman.gushchin@linux.dev, cgroups@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Hao Jia <jiahao1@lixiang.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 3, 2026 at 11:43=E2=80=AFAM Yosry Ahmed <yosry@kernel.org> wrot=
e:
>
> On Wed, Jun 3, 2026 at 11:34=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wro=
te:
> >
> > On Wed, Jun 3, 2026 at 11:26=E2=80=AFAM Yosry Ahmed <yosry@kernel.org> =
wrote:
> > >
> > > > > > Is the main difference that we are scanning in batches here? I =
think we
> > > > > > can have shrink_memcg() do that too. If anything, it might make=
 the
> > > > > > shrinker more efficient. Over-reclaim is ofc a concern, and esp=
ecially
> > > > > > in the zswap_store() path as the overhead can be noticeable. Ma=
ybe we
> > > > > > can parameterize the batch size based on the code path.
> > > > > >
> > > > > > Nhat, what do you think?
> > > > >
> > > > > Nhat, since we now have the referenced-based second chance algori=
thm,
> > > > > should we consider doing batch writeback for shrink_memcg() as we=
ll?
> > > >
> > > > I just take a look at shrink_memcg() and realized it's reclaiming o=
ne
> > > > page at a time. Thanks for the reminder - I hated it.
> > > >
> > > > Please batchify it if it makes your life easier :) We don't reclaim
> > > > "just one page/object" anywhere else in the reclaim path, Sure, it
> > > > adds a bit of latency to zswap_store() if we reached cgroup limit, =
but
> > > > IMHO if we hit zswap.max limit at zswap_store() time, that is alrea=
dy
> > > > the slowest of slow path that you should have avoided with proactiv=
e
> > > > reclaim/zswap shrinker in the first place. And, setting zswap.max d=
oes
> > > > not make sense to me in the first place (I can write a whole essay
> > > > about it).
> > >
> > > Should we batchify shrink_memcg() from the shrinker and background
> > > writeback, but leave the synchronous zswap_store() path to reclaim on=
e
> > > page for this series at least to avoid potential regressions?
> > >
> > > I think this change specifically needs more intensive testing (vs the
> > > other code paths).
> >
> > I'm fine with having shrink_memcg() takes a batch_size argument for now=
 :)
> >
> > I suspect not a lot of people invokes the shrink_memcg() synchronous
> > path in zswap store though. Setting zswap.max is hard (as it involves
> > guessing compression ratio ahead of time) and induces quite a bit of
> > overhead (obj_cgroup_may_zswap() does a force flush for every store if
> > you set zswap.max to a value other than 0 and max).
>
> Yeah I agree, but I just wanna make sure we don't completely kill
> performance in case anyone is actually doing that.
>
> Regarding the force flush, it's unfortunate that we need to rely on a
> stat for internal limit checking. It might make sense to use page
> counters here, which already support hierarchical charging and
> whatnot. We'll need something similar to the objcg approach to charge
> sub-pages (or maybe just reuse that somehow?).

Conceptually, I've moved towards not capping zswap.max, and using it
only as a binary knob for enablement/disablement  :)

It's consuming the same resources it saves, so if we cap memory.max
(and swap.max until we have vswap), then we already have isolation.
The split between uncompressed/compressed should then be dynamically
determined by workload characteristics (working set size, access
pattern, compressibility) and service's SLO, and reclaimers
(preferably proactive reclaimers) will drive us towards the optimal
split/equilibrium.
