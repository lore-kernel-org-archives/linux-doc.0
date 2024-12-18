Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D251D1E9B0D
	for <linux-doc@vger.kernel.org>; Wed, 18 Dec 2024 15:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734536564; cv=none; b=q0h5OSfdmFJgtGMqjXZVZHTAJVV1Qy9gWntpu39kOL+xVR63xN5Xwl8ZyGIWTke6CC2ebQVYFTjqmYfFm+sLh8E8xUXni73vVx+B6JhJw15Cxy1TE/HXbj0J1Xv3iV8Zq/q4/mMp+w9kEj25jzL9kwNhj36GE1YAagCgsaBAWhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734536564; c=relaxed/simple;
	bh=QuzBh1hQijAsprS57EczNl26gBM1KUjMRsatvy3GdDs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YdYSI3/axXuDyULLKOMm939En8+GbxS66eBS8Gl68N1OoXoc5YeBXfi92RRVWLxDU1hHX0lpTod3PiHvQJUMo03jNEX1xArHvXtzTfPT1GYnvvdNY5PMBcI6ecl54kVvzmCD7yV3N2/KuRwSEK34kH1pJi3JS/hGorapsrIP4oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OEYZNqiw; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OEYZNqiw"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4679b5c66d0so242801cf.1
        for <linux-doc@vger.kernel.org>; Wed, 18 Dec 2024 07:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734536562; x=1735141362; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RhLwZHFFLal8r/YFxj6rYNit8ZadJWy9LCabm24mSbs=;
        b=OEYZNqiwJoaHp8k4WOFSCCAoBdAm1soSord/NoNsiO7np1u9ze4cLbwnVqM+k/59Ot
         +GUKGdYEKh/iHW68EQa/JAS9Hcgw4fes4DBrZl4mY5C9yQdkBYj9gFjYCJp30iukL2Ve
         4Zk1NCwbUL3C/9jkdE3+GChDnE4Vo1A580jPnV96KGa+LVPyWWMt9rJRzBSKs+Hx6Xxm
         J9P3DOTgEvIl8ua2RE8D+CpwmfSIr8aew39vglgUafNFYbXPv6DAqowqfyMYeYo3/Xmx
         Uhtu/eCoR8sS4oJAOEgJ7+NJpD/IuLo5fJf/1jJDkPAfEkOKAwOW5B4uKirVL4Nl2Nj4
         6RZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734536562; x=1735141362;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RhLwZHFFLal8r/YFxj6rYNit8ZadJWy9LCabm24mSbs=;
        b=hBSEgBmZcwNhyN289CWuSK+tNBAIR8YxM5yRlZEBIXqLxtfWbqkv4VhTVy+KyVnkJB
         UG5GpiXty+mGTIebxpqOs20015ts8796X4LQuZyENqmNtIxkvjCgCGi+tEa7q5Wr+uUJ
         WhY7PvImpZP8hiEDizDDuQn7FGPOc9aAg3ocKIGYnMNMeayewOcFFvcOfPAgJkoU7TjG
         Naaanp2wSheaxAnIN0W45Lqb8wgmPLakofrAZwrSIPHKQ+tM15RXNAcXviVlBIiCtvIl
         s3gLm16mIIKRSIgHGbKVk3Z0dC/qn3hBXRlmIXgzsWhOAL+5D/dIItVQJ6yDMovnI3IH
         U2+w==
X-Forwarded-Encrypted: i=1; AJvYcCVL/Aq4FYNz863CaNhg4RJIJ++CF10EOh3boMoIEc0FmnL6JAYuInrUkPAm6bkZezSyLr9BGrCowdI=@vger.kernel.org
X-Gm-Message-State: AOJu0YygvH490NKa7AewjklbNnqs1hKMMvTojUAd/39XesRZHY3bUjNB
	SmnVT4+w2oncfx9J/7DNCeCS8JVSKpyXHOIvyQSq6ruNxZ5/J2JS94tWVGBtY5H8Z3Y0VUqHkH5
	y3dfo1Y+u8dy6+VQubCXxuLysVR9LmlrHUfZi
X-Gm-Gg: ASbGncvJ6zb5N22gSA4I+8A34E3jHSzxtIGje1UnxlCdU9MbXpuvmABHoHG72bi9m96
	ew/tAssfncuf3rnBNDcTrqn3DcbQFISflapKbTQ==
X-Google-Smtp-Source: AGHT+IHIVrlAuAEmTItLgcIAZKH1cOIzgAhlTg75ribMwVg4yaOTqgzEJEFSBKfxanrmcExN/1AW/CMo/9X1UD4BkME=
X-Received: by 2002:a05:622a:2298:b0:46a:312a:54bc with SMTP id
 d75a77b69052e-46a312a580emr2326541cf.24.1734536561349; Wed, 18 Dec 2024
 07:42:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241216192419.2970941-1-surenb@google.com> <20241216192419.2970941-11-surenb@google.com>
 <20241216213753.GD9803@noisy.programming.kicks-ass.net> <CAJuCfpEu_rZkC+ktWXE=rA-VenFBZR9VQ-SnVkDbXUqsd3Ys_A@mail.gmail.com>
 <20241217103035.GD11133@noisy.programming.kicks-ass.net> <CAJuCfpHzsQeejdPPbDdA6B3Wa=-KusnYRUyt1U0WnCRr8OKfGw@mail.gmail.com>
 <20241218094104.GC2354@noisy.programming.kicks-ass.net>
In-Reply-To: <20241218094104.GC2354@noisy.programming.kicks-ass.net>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 18 Dec 2024 07:42:30 -0800
Message-ID: <CAJuCfpHkTScPqME=++tzv=qu0aev-ewprLa=GGw8Qp4PQtTL9w@mail.gmail.com>
Subject: Re: [PATCH v6 10/16] mm: replace vm_lock and detached flag with a
 reference count
To: Peter Zijlstra <peterz@infradead.org>
Cc: akpm@linux-foundation.org, willy@infradead.org, liam.howlett@oracle.com, 
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

On Wed, Dec 18, 2024 at 1:41=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Tue, Dec 17, 2024 at 08:27:46AM -0800, Suren Baghdasaryan wrote:
>
> > > So I just replied there, and no, I don't think it makes sense. Just p=
ut
> > > the kmem_cache_free() in vma_refcount_put(), to be done on 0.
> >
> > That's very appealing indeed and makes things much simpler. The
> > problem I see with that is the case when we detach a vma from the tree
> > to isolate it, then do some cleanup and only then free it. That's done
> > in vms_gather_munmap_vmas() here:
> > https://elixir.bootlin.com/linux/v6.12.5/source/mm/vma.c#L1240 and we
> > even might reattach detached vmas back:
> > https://elixir.bootlin.com/linux/v6.12.5/source/mm/vma.c#L1312. IOW,
> > detached state is not final and we can't destroy the object that
> > reached this state.
>
> Urgh, so that's the munmap() path, but arguably when that fails, the
> map stays in place.
>
> I think this means you're marking detached too soon; you should only
> mark detached once you reach the point of no return.
>
> That said, once you've reached the point of no return; and are about to
> go remove the page-tables, you very much want to ensure a lack of
> concurrency.
>
> So perhaps waiting for out-standing readers at this point isn't crazy.
>
> Also, I'm having a very hard time reading this maple tree stuff :/
> Afaict vms_gather_munmap_vmas() only adds the VMAs to be removed to a
> second tree, it does not in fact unlink them from the mm yet.

Yes, I think you are correct.

>
> AFAICT it's vma_iter_clear_gfp() that actually wipes the vmas from the
> mm -- and that being able to fail is mind boggling and I suppose is what
> gives rise to much of this insanity :/
>
> Anyway, I would expect remove_vma() to be the one that marks it detached
> (it's already unreachable through vma_lookup() at this point) and there
> you should wait for concurrent readers to bugger off.

There is an issue with that. Note that vms_complete_munmap_vmas()
that's calling remove_vma() might drop the mmap write lock, so
detaching without a write lock would break current rules.

>
> > We could change states to: 0=3Dunused (we can free
> > the object), 1=3Ddetached, 2=3Dattached, etc. but then vma_start_read()
> > should do something like refcount_inc_more_than_one() instead of
> > refcount_inc_not_zero(). Would you be ok with such an approach?
>
> Urgh, I would strongly suggest ditching refcount_t if we go this route.
> The thing is; refcount_t should remain a 'simple' straight forward
> interface and not allow people to do the wrong thing. Its not meant to
> be the kitchen sink -- we have atomic_t for that.

Ack. If we go this route I'll use atomics directly.

>
> Anyway, the more common scheme at that point is using -1 for 'free', I
> think folio->_mapcount uses that even. For that see:
> atomic_add_negative*().

Thanks for the reference.

>
> > > Additionally, having vma_end_write() would allow you to put a lockdep
> > > annotation in vma_{start,end}_write() -- which was I think the origin=
al
> > > reason I proposed it a while back, that and having improved clarity w=
hen
> > > reading the code, since explicitly marking the end of a section is
> > > helpful.
> >
> > The vma->vmlock_dep_map is tracking vma->vm_refcnt, not the
> > vma->vm_lock_seq (similar to how today vma->vm_lock has its lockdep
> > tracking that rw_semaphore). If I implement vma_end_write() then it
> > will simply be something like:
> >
> > void vma_end_write(vma)
> > {
> >          vma_assert_write_locked(vma);
> >          vma->vm_lock_seq =3D UINT_MAX;
> > }
> >
> > so, vmlock_dep_map would not be involved.
>
> That's just weird; why would you not track vma_{start,end}_write() with
> the exclusive side of the 'rwsem' dep_map ?
>
> > If you want to track vma->vm_lock_seq with a separate lockdep, that
> > would be more complicated. Specifically for vma_end_write_all() that
> > would require us to call rwsem_release() on all locked vmas, however
> > we currently do not track individual locked vmas. vma_end_write_all()
> > allows us not to worry about tracking them, knowing that once we do
> > mmap_write_unlock() they all will get unlocked with one increment of
> > mm->mm_lock_seq. If your suggestion is to replace vma_end_write_all()
> > with vma_end_write() and unlock vmas individually across the mm code,
> > that would be a sizable effort. If that is indeed your ultimate goal,
> > I can do that as a separate project: introduce vma_end_write(),
> > gradually add them in required places (not yet sure how complex that
> > would be), then retire vma_end_write_all() and add a lockdep for
> > vma->vm_lock_seq.
>
> Yeah, so ultimately I think it would be clearer if you explicitly mark
> the point where the vma modification is 'done'. But I don't suppose we
> have to do that here.

Ack.
