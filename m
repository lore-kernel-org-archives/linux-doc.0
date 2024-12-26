Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD92140E2E
	for <linux-doc@vger.kernel.org>; Thu, 26 Dec 2024 17:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735233151; cv=none; b=NCIFQe5woeK1P4cVgJmsc215KSzEBMK7v76fTBPYA7eJtedOlqWceIGLdLkix9bk8QuC4a9NkKaRCouI01evjp5SI1L4EfP+aREE9ZXjTiheC/+FSMSIdW31dKOncdU5nrlMBv4em8HkcdZIVUk84eZXpPz1YagBvMApNeg8GVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735233151; c=relaxed/simple;
	bh=LDIx3eSc7CUf2UIdrDCx1dMOOmUhysqHZhSdTh5sKqI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=BwdoHGttCOSYoMC5PEMg2cdvc+fb7Mo+Y8hbgYkid/e3bc/KROEh4FbVfksiu0yvDMYNlkjOzovr0uGxWKh7uyqWPS+vsWU9goF+ahzR5Bn6jXl7FZnOiFemcZOobS/b5yrjYKjMsWR0SiSK1n5Pf/tM3TgRjgFFLd4h47r3uzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0eqj7/2L; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0eqj7/2L"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-467abce2ef9so1684251cf.0
        for <linux-doc@vger.kernel.org>; Thu, 26 Dec 2024 09:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1735233149; x=1735837949; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5MXnyStNwZl37BgSmuBxzAQVENQnr6Y4pRG9WUmvfaY=;
        b=0eqj7/2LuW80znGKXfl97rHDvG65uJF+ajJ7qT+oRz6nYk+yBZoPp1H7xJiPKaOScw
         Tvkj3uuBpGwtoxBnDLLC7oYuG3k/h1W61F5iRp0BZZCYcebDh8mAPYz0ccdmtCJ/WrMx
         7N7pMHlQGulH1UEQodFXdlshJ3zJJ3OR1tb3HNNcAS9Wh9CPeCCDDfEsCGzFqDlbnAOL
         14aO2zZIjkYiZz5SuBpaZiJ4zOJEh3kkPvBGs4Ahzv1viovBCrq5aHAUpVlMnt26COAd
         j7+bpOl1j3P4U8PVJw/dxco6h0il2dXQOHbul4VDssK+lQ1MA0PoJVVIuhQwWCp/Lw6Z
         bwnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735233149; x=1735837949;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5MXnyStNwZl37BgSmuBxzAQVENQnr6Y4pRG9WUmvfaY=;
        b=GavsC9yhkCoJkXwZEopaERE/5aaybixhYIo97EPGBKsFvrjeOWwRlXw5Cd+qAKHse6
         2W7MI7v0cDsTurr6A6vUTyzC1uxa0MKrXJzvkZQGHvMXt9enLbPkdlrd7gk9irGTWAFu
         sLS3n8e1IchcnRDPT2HlT2vvwQ7xWRkUN+8OjD9mazlCy0kvUvQufdAAhoS91BkvltSa
         e7V+BnE+YwRgkLqBlEr1bybOAZNc2qGGMi8XR4x273PrtvnjLw53cHRC0Erog2Oq0LN4
         gq0w2SU9RIGX/qleI+28NQlLoJwtihUeoWMaryZQ/klpmMbJmRjXfCPUxFKNSIZHb6h9
         7RKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRzgT7nD0126+FNxvEG9aSmpDLcqv+VTSr3qbtCwu1BwEVOs73aM9eJw9JnVPEFn9laqNQgjnBmHg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDBcRFUC5d5A6uDg0SdMIUybhbAS/3JDBdbCpYIYubgOeSFl7l
	kY0syEPcapmZxU1mrM6KJ8GlnRjPRZhPt/f51LWq3dL0h/2fyu6Z7YqDZHDDvd+c1qKsCuUgozN
	XVrjKQdfyVWs2ixUdyWfCVtXKO7JKU6J+GrjC
X-Gm-Gg: ASbGncuIxpp3ckn+J5t08w+FmUkaUMvIAoSQXHZnHDVcNRZZ6SEsEbwiptLWqEub2r9
	SeAM5YAawn5insodKH/7hMNjr2MyP10+i7Kgxdw7XHGRz25PZFYDezJe1cDGZ/Hz5oyLO
X-Google-Smtp-Source: AGHT+IHdLDVDSP8Q+rE45soveXobHJSLC3HS4Q5maHd7IrRWZB+1jYnPYoAjtlmHFB/nhR3AiWiB7RieNc5P52YqgiM=
X-Received: by 2002:a05:622a:110c:b0:466:a3ed:bde7 with SMTP id
 d75a77b69052e-46a4a8d7ef4mr19662751cf.6.1735233148536; Thu, 26 Dec 2024
 09:12:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <jes252u5qfhla2bdmg6pdkfpi4a2jfhf7d5b6ra6ol2bmt352x@gunhzaca56df>
 <CAJuCfpFSD98fw=844AJPy+LT5y=zREQGtSEVj3_FCXiZ5cFR_A@mail.gmail.com>
 <ulbspoec633hfm54f3jzvoqs6ilskxou3qykk2u727pbaltvfl@lb53vjcaxnuf>
 <CAJuCfpHXRX=LLa67eWYvrK=UDxKMaOequFXfqOqDHbRrmsT9SQ@mail.gmail.com>
 <20241219091334.GC26551@noisy.programming.kicks-ass.net> <20241219112011.GA34942@noisy.programming.kicks-ass.net>
 <wfzu6jvbazlxdybsjc54aoivleif6memaxaacd56bcep24nkv3@s3e3aj253hd6>
 <20241219174235.GD26279@noisy.programming.kicks-ass.net> <rnanfpzs6fmojyeaowt65mug6xekorrkeefvn3b4zc7buunzhc@rrzcbhkrjdv4>
 <20241219184642.GF26279@noisy.programming.kicks-ass.net> <6nck2rfwcytqdinsavmewytgcca43mldlczmao3zztrpr5v2ci@4xn6nwp6tcih>
 <CAJuCfpFXh5mHfn3d1ySk3icJsK5ssJWuUOB_=tXvt3sA+Jh-YA@mail.gmail.com>
In-Reply-To: <CAJuCfpFXh5mHfn3d1ySk3icJsK5ssJWuUOB_=tXvt3sA+Jh-YA@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 26 Dec 2024 09:12:17 -0800
Message-ID: <CAJuCfpF5eLoWd9FCnM+aXKjnMQ_VbFmuELbp=pyQ2exYM1W6sg@mail.gmail.com>
Subject: Re: [PATCH v6 10/16] mm: replace vm_lock and detached flag with a
 reference count
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Peter Zijlstra <peterz@infradead.org>, 
	Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org, willy@infradead.org, 
	lorenzo.stoakes@oracle.com, mhocko@suse.com, vbabka@suse.cz, 
	hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com, 
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org, 
	dhowells@redhat.com, hdanton@sina.com, hughd@google.com, 
	lokeshgidra@google.com, minchan@google.com, jannh@google.com, 
	shakeel.butt@linux.dev, souravpanda@google.com, pasha.tatashin@soleen.com, 
	klarasmodin@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 22, 2024 at 7:03=E2=80=AFPM Suren Baghdasaryan <surenb@google.c=
om> wrote:
>
> On Thu, Dec 19, 2024 at 10:55=E2=80=AFAM Liam R. Howlett
> <Liam.Howlett@oracle.com> wrote:
> >
> > * Peter Zijlstra <peterz@infradead.org> [241219 13:47]:
> > > On Thu, Dec 19, 2024 at 01:18:23PM -0500, Liam R. Howlett wrote:
> > >
> > > > > For RCU lookups only the mas tree matters -- and its left present=
 there.
> > > > >
> > > > > If you really want to block RCU readers, I would suggest punching=
 a hole
> > > > > in the mm_mt. All the traditional code won't notice anyway, this =
is all
> > > > > with mmap_lock held for writing.
> > > >
> > > > We don't want to block all rcu readers, we want to block the rcu re=
aders
> > > > that would see the problem - that is, anyone trying to read a parti=
cular
> > > > area.
> > > >
> > > > Right now we can page fault in unpopulated vmas while writing other=
 vmas
> > > > to the tree.  We are also moving more users to rcu reading to use t=
he
> > > > vmas they need without waiting on writes to finish.
> > > >
> > > > Maybe I don't understand your suggestion, but I would think punchin=
g a
> > > > hole would lose this advantage?
> > >
> > > My suggestion was to remove the range stuck in mas_detach from mm_mt.
> > > That is exactly the affected range, no?
> >
> > Yes.
> >
> > But then looping over the vmas will show a gap where there should not b=
e
> > a gap.
> >
> > If we stop rcu readers entirely we lose the advantage.
> >
> > This is exactly the issue that the locking dance was working around :)
>
> IOW we write-lock the entire range before removing any part of it for
> the whole transaction to be atomic, correct?
>
>
> Peter, you suggested the following pattern for ensuring vma is
> detached with no possible readers:
>
> vma_iter_store()
> vma_start_write()
> vma_mark_detached()
>
> What do you think about this alternative?
>
> vma_start_write()
> ...
> vma_iter_store()
> vma_mark_detached()
>         vma_assert_write_locked(vma)
>         if (unlikely(!refcount_dec_and_test(&vma->vm_refcnt)))
>                 vma_start_write()
>
> The second vma_start_write() is unlikely to be executed because the
> vma is locked, vm_refcnt might be increased only temporarily by
> readers before they realize the vma is locked and that's a very narrow
> window. I think performance should not visibly suffer?
> OTOH this would let us keep current locking patterns and would
> guarantee that vma_mark_detached() always exits with a detached and
> unused vma (less possibilities for someone not following an exact
> pattern and ending up with a detached but still used vma).

I posted v7 of this patchset at
https://lore.kernel.org/all/20241226170710.1159679-1-surenb@google.com/
From the things we discussed, I didn't include the following:
- Changing vma locking patterns
- Changing do_vmi_align_munmap() to avoid reattach_vmas()
It seems we need more discussion for the first one and the second one
can be done completely independent from this patchset. I feel this
patchset is already quite large, so trying to keep its size
manageable.
Thanks,
Suren.

>
> >
