Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C1C16BE1B
	for <linux-doc@vger.kernel.org>; Tue,  6 Aug 2024 23:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722985265; cv=none; b=hQiSI9pEy3m+b3eHIsi2LnXNU7C4dQdstuCwu/kHIYHWnmQIBvNb4EKWPVLwyC51A329KR/HM41Pl2Dp/bAI6+hzvlYYd01O3FmQrkWNwmrOgwlq+qohB3Tc3qHxh8i+9l+KSoDXPtQ+VcCilhMDiebUUdnzYshOjoa6+y9PwRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722985265; c=relaxed/simple;
	bh=3QmhHNzLVdqCL3bdWzZ7LYa+8zX30H7zX+17oS8ce28=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yf/NGwewTvArehXu8QM2xGZ6RjT2NfE4RXahEDmCnWvjemcgdcHX44+Odw5iWTGxjJgV9vYx+6O0kuGbNnwR3/bO5+vaJI23yHqHI/jfoGh6z+9PL/lT9ybebuMw7TKizLf9GBmkuNTGDxT2ikpXIHEmwZE6jN2I9WX022oWmSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vimeo.com; spf=fail smtp.mailfrom=vimeo.com; dkim=pass (1024-bit key) header.d=vimeo.com header.i=@vimeo.com header.b=mBjtzr0/; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vimeo.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=vimeo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vimeo.com header.i=@vimeo.com header.b="mBjtzr0/"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2cd34c8c588so799704a91.0
        for <linux-doc@vger.kernel.org>; Tue, 06 Aug 2024 16:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vimeo.com; s=google; t=1722985263; x=1723590063; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YPNbLMtMlLLk3ef/8hupZv2oNZsASyGwoL+TsrWxtR8=;
        b=mBjtzr0/RxfPzjs2Bgs1nhEuDYQskqEo0v34J+6sEsDvKgOQtxPhWCdTf1GLTH1Lr1
         Z2BUTcKyY29KHw1XCW0o83i2a4iLlo8/y3nTD7mzXxHJKGXjjVulZK2X8DwzvfdfPvMi
         xAFiCv/SIEldY+m390cUivxYtihx5/sawTDqw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722985263; x=1723590063;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YPNbLMtMlLLk3ef/8hupZv2oNZsASyGwoL+TsrWxtR8=;
        b=cfS+hxs5O6FTFBPVJdkRBWALsDhwXRBD65iFhibVz9ysXZPbL6Rqadu88diCwl41Jz
         lB+l0wPlBe2Osbf+TmtL9Kj6aM1Kx5hjAf33X0cPQElBuabZVFEicqYQDSlxS1M84/zV
         TAF29ePUJ2VpI9cywPWInpv3AfSFXttts3WVpnHVZZop1ZnFHI5GXPdQo8BLCuzG1iea
         Nbsa22TVcFhE13WsfxGz7RyJtgn3XwcPs2ifI59k0+VrSBBdlGSCPcUL+lwmJZWMdpAB
         aBbLs7Sxq7dY+o8rxHc/HJvdNkDXpCoTy6mfukwXraVic1J0n4UCg+NI/0Z21yJ3UkpV
         eu9g==
X-Forwarded-Encrypted: i=1; AJvYcCXdT4IuwNlhci8V43Z2VMOQc0Ck3tLSLyx2I+6GPDF8VIWjD5GMw+nqjviDSdnONbegE0oZUWxDHa+DJYHJ/C24cVlUjfguUXNz
X-Gm-Message-State: AOJu0Yw67MKlybBP9lSyfG+7zbc2Mii1w1WUozbvrqUcYTyq4EV3aud9
	aFRK8U7zHSbOpOgsgjNLUXMTPFRdY1PqrcqW5qSRvmCO+u2rZZ37JsKJTWgM67ujchBG2kPwNzQ
	yqc/G4SEjIGJmvNks1GddNtwujnrge9WMrx6qyQ==
X-Google-Smtp-Source: AGHT+IEN2odX5l/+pi6H8JnpGZi2+DwjbVmGTdY2gmufUn0E5fEtEbcCHGIJv7xFQvKm5zmLKFlcZB0qzECMPqVeKCc=
X-Received: by 2002:a17:90a:788a:b0:2cb:51e4:3ed3 with SMTP id
 98e67ed59e1d1-2cff9432e02mr16249465a91.18.1722985263381; Tue, 06 Aug 2024
 16:01:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240730231304.761942-1-davidf@vimeo.com> <CAFUnj5Nq_UwZUy9+i-Mp+TDghQWUX7MHpmh8uDTH790HAH2ZNA@mail.gmail.com>
 <ZrKFJyADBI_cLdX4@slm.duckdns.org> <20240806153637.4549ee6c1d1300042dd01c4c@linux-foundation.org>
In-Reply-To: <20240806153637.4549ee6c1d1300042dd01c4c@linux-foundation.org>
From: David Finkel <davidf@vimeo.com>
Date: Tue, 6 Aug 2024 19:00:52 -0400
Message-ID: <CAFUnj5Nq74s4TVP=Ljmu4L5zUo+eqswfM0y57G5L6wD8wCdZAw@mail.gmail.com>
Subject: Re: [PATCH v7] mm, memcg: cg2 memory{.swap,}.peak write handlers
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Tejun Heo <tj@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Roman Gushchin <roman.gushchin@linux.dev>, core-services@vimeo.com, 
	Jonathan Corbet <corbet@lwn.net>, Michal Hocko <mhocko@kernel.org>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Shuah Khan <shuah@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Zefan Li <lizefan.x@bytedance.com>, cgroups@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 6, 2024 at 6:36=E2=80=AFPM Andrew Morton <akpm@linux-foundation=
.org> wrote:
>
> On Tue, 6 Aug 2024 10:18:47 -1000 Tejun Heo <tj@kernel.org> wrote:
>
> > On Tue, Aug 06, 2024 at 04:16:30PM -0400, David Finkel wrote:
> > > On Tue, Jul 30, 2024 at 7:13=E2=80=AFPM David Finkel <davidf@vimeo.co=
m> wrote:
> > > >
> > > > This revision only updates the tests from the previous revision[1],=
 and
> > > > integrates an Acked-by[2] and a Reviewed-By[3] into the first commi=
t
> > > > message.
> > > >
> > > >
> > > > Documentation/admin-guide/cgroup-v2.rst          |  22 ++-
> > > > include/linux/cgroup-defs.h                      |   5 +
> > > > include/linux/cgroup.h                           |   3 +
> > > > include/linux/memcontrol.h                       |   5 +
> > > > include/linux/page_counter.h                     |  11 +-
> > > > kernel/cgroup/cgroup-internal.h                  |   2 +
> > > > kernel/cgroup/cgroup.c                           |   7 +
> > > > mm/memcontrol.c                                  | 116 ++++++++++++=
+--
> > > > mm/page_counter.c                                |  30 +++-
> > > > tools/testing/selftests/cgroup/cgroup_util.c     |  22 +++
> > > > tools/testing/selftests/cgroup/cgroup_util.h     |   2 +
> > > > tools/testing/selftests/cgroup/test_memcontrol.c | 264 ++++++++++++=
++++++++++++++++++++-
> > > > 12 files changed, 454 insertions(+), 35 deletions(-)
> > ...
> > > Tejun or Andrew,
> > >
> > > This change seems to have stalled a bit.
> > > Are there any further changes necessary to get this patch merged into
> > > a staging branch so it's ready for 6.12?
> >
> > Oh, it sits between cgroup core and memcg, so I guess it wasn't clear w=
ho
> > should take it. Given that the crux of the change is in memcg, I think =
-mm
> > would be a better fit. Andrew, can you please take these patches? FWIW,
>
> I took 'em on Aug 4.

Great!

David, your spam folder beckons?

Oddly, I don't see any email from you on the 4th.
I do see my patches in mm-unstable now.
(I didn't see them there when I looked over the weekend)

With that said, I had a message go similarly mysteriously missing yesterday=
,
so it's possible something's wrong with our mail system.

>
> >  Acked-by: Tejun Heo <tj@kernel.org>
>
> Added, thanks.

Thanks again!

--=20
David Finkel
Senior Principal Software Engineer, Core Services
