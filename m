Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08DA315D30
	for <linux-doc@vger.kernel.org>; Mon,  1 Dec 2025 16:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764608282; cv=none; b=buZq3+u1tqvL+vr47T+8TbQaQHOWf8GXshY059foucs83dEd4aSP476M3IJFgSYz/RAbxpwGNktMtvlUE2IDs9Ck4R+BTkBxco5fwBxDOfsnb+IvVwpb1DvjTHk3H7tRKYrFjxCtfljy24PdCoAuedalYu8y+v5aWWWB6TGVDyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764608282; c=relaxed/simple;
	bh=mBtGhElim3MCJM8/DpYRxUAulUU52aA6dhuj3+TYVGE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MbZR1T0kKpQscCM0Shev6oWpGLaZQTMaevD8pVN1+tsfDAmDtPrnDMIO+Jf171+Rncva4Z2bXYbHPR4p7tks7N6qQKXORyajb7Pza/2aa1NlENR4udW6mZPdT8p91iKp/xdIAFKc36Lzw0YEROobZm577BiKItcvzhME7vpho1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CYgtu8wH; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CYgtu8wH"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8b2ea2b9631so408001185a.3
        for <linux-doc@vger.kernel.org>; Mon, 01 Dec 2025 08:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764608279; x=1765213079; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qkvWJrwlmiNdHgjUhorEV+q7WgGubFI+mIY+NNvMyLc=;
        b=CYgtu8wHuZ/VC0W1KOmlf/eousTQRbS2rQo4B+FJH7v9mI/nYM65EF6qRnfQFUqi0E
         TuEhHYbK+hIdq2KiD0BmWikpYIh8xf33GiQj6NVFR/RD7I68u9cyGWQGwgbaFto30KSP
         cEb558xmRpequfZMHbHQb12qFhrgkBjEFaEzXnVGL4+vjhGY+8VaUrFb7g5wo13jGn1m
         kURfb4h3Xqpw/qBpq8R4NiwdxgDICCOtZiy4nCsDmLyqri5dFcAIMFNI90hlr8qci/8E
         hUwepk0ezT1XM7Buwref5SajpXgTlOXJwkeKzOTPzO6i+gBaxvWy67gEwKACoW9pHXri
         Bjgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764608279; x=1765213079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qkvWJrwlmiNdHgjUhorEV+q7WgGubFI+mIY+NNvMyLc=;
        b=VQ+R7DylE/tb4iojvjg3UxSJjzx/OljqDP6YyYlLVtbfZH8hEdypCd5KIUpYoIhixc
         4x/YQrv7RqwpW99KDtBXmk4iXMXivFyOdjW2izDcBOyYVG4YTBe5kD7n9q5WXGEh3cxk
         2LqboTq0tTCyEYJu7kdGCggA8iflnzZ6qLMFXQxVFfK3tECqGreYSuW2+w6tZWzUJdlL
         zXw47mkO3nIAX1jVC6qlc5BZYTxTPiwoXiwnXLDJeFxZy6jYWLOwrMwzvx8Je70GG9X9
         ucs98G6ufVsKAAi9A2SaaGHsfyyApJ/eURd/UUSZr+FU83MnPFQFrNPK5z1H+JCxrn0y
         R7sw==
X-Forwarded-Encrypted: i=1; AJvYcCWu9sSmEKzy4BFVmAFuww3WPBT/GFL4UNZJZnvJ3WFaQylyWM6sdqG0kWEobSwbG7MgUJ8Y6VWeJ0U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfsQqxytv7f5mvbfF8Cmj2+Yz90YY98zrVUiaWlO0ti2W1MGUl
	3UlwqBp0vOh6aR/gooPJrE5eH2t1obf9hNts/F5hYun2bUQJ2MaBnA3ASkJB5jGb7/brXoZMuyO
	CKLKtGfb/x1UpUNk1pG6t2NQQXIhfDSM=
X-Gm-Gg: ASbGncsOAT68qPAeewRT4ruthu+w2Re8qldP6pwhBfFWlrVj8fMJW5n836wt8QcoIRZ
	cK5JUsewiEM4Ell4H3i4YR17936s6ZXCUPfdWYYgfF0KjvnvzQ/5g7oaogw560G+6aXLVtMDjh3
	uDYq7z5UjcmSLOE+fhurYVgSUG5UgTG81QNhrGwfLCkb7LA+gCBhiirVllRPEB4A9b3Yd8tlE10
	KqTukKKVm/fPAsRfmt9qBYoJet/zIhYxzd8uOHOLjlqOx1S0tbWWd7xnOowV36/oR4rheob2Hll
	tuko
X-Google-Smtp-Source: AGHT+IHamfJ56do34KTHloOqyg4CL7wLBYonp9p4OPZxpY/sikqm0enpVT+NHGV/Fsmk+dRxzzdE8dB0HZWv6DDmN+U=
X-Received: by 2002:a05:620a:4049:b0:8b2:ea2b:923c with SMTP id
 af79cd13be357-8b4ebd53b32mr4182690185a.14.1764608278419; Mon, 01 Dec 2025
 08:57:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251128025315.3520689-1-wangzicheng@honor.com>
 <aSm800KsCAptVZKu@casper.infradead.org> <ti7h5cbrg5s3zf7surof3zmxb6supnl34x7hsbziqutm7r2laf@zuunap5hwsbx>
 <CAGsJ_4xJ5qMght93FQOYrk1OiJTh-wFC4e8Nd4K0A156N3ZEBQ@mail.gmail.com>
 <86c62472b5874ea2833587f1847958df@honor.com> <CAGsJ_4w1jEej+ROuLta3MSuo4pKuA5yq7=6HS5yzgK39-4SLoA@mail.gmail.com>
 <66c62243a510421db938235a99a242bf@honor.com> <CAGsJ_4x0aVkDf-AhhGbBLU=LCxYFqYoFL0ovij-vFEQeJ46jYQ@mail.gmail.com>
 <dc8ce4f329d74a24bde62c93818df44a@honor.com> <CAGsJ_4w16G+AngPu48SEy1H+ZuE1AQngiY=cSfEs9V6=OUKX_Q@mail.gmail.com>
 <48ba80e93270438994db78f74a7acdb9@honor.com>
In-Reply-To: <48ba80e93270438994db78f74a7acdb9@honor.com>
From: Barry Song <21cnbao@gmail.com>
Date: Tue, 2 Dec 2025 00:57:46 +0800
X-Gm-Features: AWmQ_bmAmfQs_Zv2TM5O3X6YMmxuU19fTmG2_9jDINF8_95jDxDouPDEnUbDAVI
Message-ID: <CAGsJ_4yY5MxOYjkQx07U2UzgL8mCZWCaVXyJ7e6hQ8UyVCcC8g@mail.gmail.com>
Subject: Re: [PATCH 0/3] mm/lru_gen: move lru_gen control interface from
 debugfs to procfs
To: wangzicheng <wangzicheng@honor.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Matthew Wilcox <willy@infradead.org>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, "hannes@cmpxchg.org" <hannes@cmpxchg.org>, 
	"david@redhat.com" <david@redhat.com>, "axelrasmussen@google.com" <axelrasmussen@google.com>, 
	"yuanchu@google.com" <yuanchu@google.com>, "mhocko@kernel.org" <mhocko@kernel.org>, 
	"zhengqi.arch@bytedance.com" <zhengqi.arch@bytedance.com>, 
	"shakeel.butt@linux.dev" <shakeel.butt@linux.dev>, 
	"lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>, "weixugc@google.com" <weixugc@google.com>, 
	"vbabka@suse.cz" <vbabka@suse.cz>, "rppt@kernel.org" <rppt@kernel.org>, 
	"surenb@google.com" <surenb@google.com>, "mhocko@suse.com" <mhocko@suse.com>, "corbet@lwn.net" <corbet@lwn.net>, 
	"linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, wangtao <tao.wangtao@honor.com>, 
	wangzhen 00021541 <wangzhen5@honor.com>, zhongjinji 00025326 <zhongjinji@honor.com>, 
	Kairui Song <ryncsn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 1, 2025 at 9:32=E2=80=AFPM wangzicheng <wangzicheng@honor.com> =
wrote:
>
> Hi Barry,
>
> Thank you for the follow-up questions.
>
> It seems that our main testbed (kernel v6.6/v6.12 for latest devices),
> don't have SWAPPINESS_ANON_ONLY/201 - related patches yet.

Then please check with Suren whether it is possible to backport this to
the Android common kernel.
My understanding is that this should already be present in the Android 6.12
kernel.

>
> Since the max swappiness is 200, there are quite scenarios that file
> pages are the only option.
>
> Quote from kairui's reply:
> > Right, we are seeing similar problems on our server too. To workaround
> > it we force an age iteration before reclaiming when it happens, which
> > isn't the best choice. When the LRU is long and the opposite type of
> > the folios we want to reclaim is piling up in the oldest gen, a forced
> > age will have to move all these folios, which leads to long tailing
> > issues. Let's work on a reasonable solution for that.
>

We all agree that MGLRU has this generation issue. You mentioned it, I agre=
ed
and noted that both Kairui and I had observed it. Then Kairui replied that =
he
had indeed seen it as well. Now you are using Kairui=E2=80=99s reply to arg=
ue against
me, and I honestly don=E2=80=99t understand the logic behind your responses=
.

> Again, thank you for your guidance. We will carefully evaluate the
> Patchset[1] you recommended.
>
> > Hi Zicheng,
> >
> > On Mon, Dec 1, 2025 at 5:55=E2=80=AFPM wangzicheng <wangzicheng@honor.c=
om>
> > wrote:
> > >
> > > Hi Barry,
> > >
> > > Thank you for the comment, actually we do know the cgroup file.
> > >
> > > What we really need is to *proactive aging 2~3 gens* before proactive
> > reclaim.
> > > (especially after cold launches when no anon pages in the oldest gens=
)
> > >
> > > The proactive aging also helps distribute the anon and file pages eve=
nly in
> > > MGLRU gens. And reclaiming won't fall into file caches.
> >
> > I=E2=80=99m not quite sure what you mean by =E2=80=9Creclaiming won=E2=
=80=99t fall into file caches.=E2=80=9D
> >
> > I assume you mean you configured a high swappiness for MGLRU proactive
> > reclamation, so when both anon and file have four generations,
> > `get_type_to_scan()` effectively always returns anon?
> >
> > >
> > > > Also note that memcg already has an interface for proactive reclama=
tion,
> > > > so I=E2=80=99m not certain whether your patchset can coexist with i=
t or extend
> > > > it to meet your requirements=E2=80=94which seems quite impossible t=
o me
> > > >
> > > > memory.reclaim
> > > >         A write-only nested-keyed file which exists for all cgroups=
.
> > > >
> > > >         This is a simple interface to trigger memory reclaim in the
> > > >         target cgroup.
> > > >
> > > >         Example::
> > > >
> > > >           echo "1G" > memory.reclaim
> > > >
> > > >         Please note that the kernel can over or under reclaim from
> > > >         the target cgroup. If less bytes are reclaimed than the
> > > >         specified amount, -EAGAIN is returned.
> > > >
> > > This remind me that adding a `memor.aging` under memcg directories
> > > rather than adding new procfs files is also a great option.
> >
> > I still don=E2=80=99t understand why. Aging is something MGLRU itself s=
hould
> > handle; components outside MGLRU, such as cgroup v2, do not need to be
> > aware of this concept at all. Exposing it will likely lead to another
> > immediate NAK.
> >
> > In short, aging should remain within MGLRU=E2=80=99s internal scope.
>
> I would like to express a different point of view. We are working on some=
thing
> Interesting on it, will be shared once ready.

You are always welcome to share, but please understand that memory.aging is
not of interest to any module outside the scope of MGLRU itself. An interfa=
ce
is an interface, and internal implementation should remain internal. In oth=
er
words, there is no reason for cgroupv2 to be aware of what =E2=80=9Caging=
=E2=80=9D is.

You may submit your new code as a "fix" for the generation issue without
introducing a new interface. That would be a good starting point for
discussing how to resolve the problem.

>
> >
> > But it seems you do want some policy control for your proactive
> > reclamation, such as always reclaiming anon pages or reclaiming them
> > more aggressively than file pages. I assume Zhongkun=E2=80=99s patch [1=
] we
> > mentioned earlier should provide support for that, correct?
> >
> > As a workaround, you can set `swappiness=3Dmax` for `memory.reclaim`
> > before
> > we internally improve the handling of the aging issue. In short,
> > =E2=80=9Cproactive aging=E2=80=9D and similar mechanisms should be hand=
led automatically
> > and internally within the scope of the MGLRU code.
>
> Sure, we will make a careful evaluation.

Thanks
Barry
