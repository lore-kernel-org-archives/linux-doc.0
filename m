Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E48A14A609
	for <linux-doc@vger.kernel.org>; Mon, 16 Dec 2024 21:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734386264; cv=none; b=AlQwr4LqWjwe/yguGD7vy2RKVbfqryy+WFJqvzctGIwAX78FtBgPXPhJPCRVfCId4IGzfLO3OX+MP5L6g7ybS3WgF0g5gkeiLCC7fNAFPsnAvGdmMYoByYygoK0i15omoh03Z8+e3kjlZZnlb9RXT0x0qEldf8flZElZsaRORes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734386264; c=relaxed/simple;
	bh=hirHr4W8Q6ksKkZKc4EIV/ko385cp3mjedG34EMDZtU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rIKCccYI5yEsnIkJ5U9TOVlrffm4vcUDjc6BfUl/mYvsFK8lArA59KqSFld/CWu9gximLECf6bTivuVpJuSEt8Jk1VEt1FYVcy0DgP34I6xs1kwgDTpZk8Nnj/3/oEyQTPafp9hImAr5GN/y0X0ctyW2xAPXl11sBcJhQ49/Enc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WvyhpoNT; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WvyhpoNT"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-467abce2ef9so78191cf.0
        for <linux-doc@vger.kernel.org>; Mon, 16 Dec 2024 13:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734386261; x=1734991061; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5T5roncOghweZCeQmSlAea4USG1OweAi+z5lLSWaOYw=;
        b=WvyhpoNTE6Ta0SPEFDbtVl68y5xMo4PQfP49eNOyAAZIN8uQWkg4Ck77jAgemc0ych
         pDiMx85GzziXVfK3nbYcI+JGyLv1Y8f/o0YYMo1vGxLGupkl2bJ5OipDafhIkwAazE6A
         wPyC3FkQ/Vf9DkmYSrgQsm0We/4Ac2d4ry1CHxbP9LbpwM9N0ZTKn5VRfA1+dSaZ7cPh
         n4YfJRZsbWZG46p5gxbihtOc62VOSp9l6OKt8eK2JwNHB39Gw9HX2Dch0QX77ux908MC
         ZHiorvHx96cpJa8Hu0WOPjz4LSKeBRwC6Fy3iEj7ECtJCl03Gt0oGSuAMccPqEuqN7hh
         aHOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734386261; x=1734991061;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5T5roncOghweZCeQmSlAea4USG1OweAi+z5lLSWaOYw=;
        b=QnqWTm8Ny2YmBZkRt+9YrkBE6huXIHV9O65LDiF3w6qEc0jQjlgu1PYcxmws/Vr+PS
         nSVWdzXgS+xjppOFkUxLVbF9IeURVP41Et2G6L2SbhTgiId8TD5/pqF7RFGXAJm0zMhk
         LTANehwI4W2q+E6HWA2/g9Fv2OnCzA65Xj9Rz+wfYHp/iQ0uAjiGmRe0qiXs0dqzOyKG
         y5No8F6SwTsaQOwVqfrP0LrXeJv6JJmJpd3ekXDqfEm5nVXz4xEUxPngMmij7iY3Sjck
         5lt1WiWN+Yd13gjQvna2IT2OEis2eL/gc0F+KP+kptAeTfFx5PAmZ5BHs2/4oP6PO8mq
         zFYQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3/Ll3xc5GNgRgiC3UqI9t/e+geNnehyO4ICxB2BFEzteq/Q82v9D5U0dQHPjT6D9j9pxn0ULiGC8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYWD11vNeAlozm84AaNsjkz7Ws9cd8+tEeDfboCDcteVICxeva
	OscB/98B/IGNSlIPlLJsYoLVdCWD+MfF9xrNTH0Jf6mzWeLPT8fE1emQGX7h+H0ItAODYOCwwpt
	tVkbLJfpC2YPGzgMQ7UrPEKEeV/0MhWx3bjdK
X-Gm-Gg: ASbGnctmad3Ct6nBdkoK4N0Tn/YxCXh+MFpSogR6+l9HhS+CmTh4ux6bM6SqQwhwwp+
	YcOPcWMyJiFGW94F/I0V7d+vZ5y95v8RCSOcmUw==
X-Google-Smtp-Source: AGHT+IFrMpdfUGm37FvnuIHqb4P8MJaEtKV+fo4HiTzztMreBEY3Uftz39OoGg7QpOm/Z5TrOM4DCy0JCcTHtSqaVjo=
X-Received: by 2002:a05:622a:210:b0:467:5fea:d4c4 with SMTP id
 d75a77b69052e-468fb142301mr79521cf.27.1734386261193; Mon, 16 Dec 2024
 13:57:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241216192419.2970941-1-surenb@google.com> <20241216192419.2970941-12-surenb@google.com>
 <20241216211635.GC9803@noisy.programming.kicks-ass.net> <20241216211826.GA33253@noisy.programming.kicks-ass.net>
In-Reply-To: <20241216211826.GA33253@noisy.programming.kicks-ass.net>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 16 Dec 2024 13:57:29 -0800
Message-ID: <CAJuCfpGtOXq+FOvJzTifmSdDXzpj=abxK=FjYKDmHugA-eudGw@mail.gmail.com>
Subject: Re: [PATCH v6 11/16] mm: enforce vma to be in detached state before freeing
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

On Mon, Dec 16, 2024 at 1:18=E2=80=AFPM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Mon, Dec 16, 2024 at 10:16:35PM +0100, Peter Zijlstra wrote:
> > On Mon, Dec 16, 2024 at 11:24:14AM -0800, Suren Baghdasaryan wrote:
> > > exit_mmap() frees vmas without detaching them. This will become a pro=
blem
> > > when we introduce vma reuse. Ensure that vmas are always detached bef=
ore
> > > being freed.
> > >
> > > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > > ---
> > >  kernel/fork.c |  4 ++++
> > >  mm/vma.c      | 10 ++++++++--
> > >  2 files changed, 12 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/kernel/fork.c b/kernel/fork.c
> > > index 283909d082cb..f1ddfc7b3b48 100644
> > > --- a/kernel/fork.c
> > > +++ b/kernel/fork.c
> > > @@ -473,6 +473,10 @@ struct vm_area_struct *vm_area_dup(struct vm_are=
a_struct *orig)
> > >
> > >  void __vm_area_free(struct vm_area_struct *vma)
> > >  {
> > > +#ifdef CONFIG_PER_VMA_LOCK
> > > +   /* The vma should be detached while being destroyed. */
> > > +   VM_BUG_ON_VMA(!is_vma_detached(vma), vma);
> > > +#endif
> > >     vma_numab_state_free(vma);
> > >     free_anon_vma_name(vma);
> > >     kmem_cache_free(vm_area_cachep, vma);
> > > diff --git a/mm/vma.c b/mm/vma.c
> > > index fbd7254517d6..0436a7d21e01 100644
> > > --- a/mm/vma.c
> > > +++ b/mm/vma.c
> > > @@ -413,9 +413,15 @@ void remove_vma(struct vm_area_struct *vma, bool=
 unreachable)
> > >     if (vma->vm_file)
> > >             fput(vma->vm_file);
> > >     mpol_put(vma_policy(vma));
> > > -   if (unreachable)
> > > +   if (unreachable) {
> > > +#ifdef CONFIG_PER_VMA_LOCK
> > > +           if (!is_vma_detached(vma)) {
> > > +                   vma_start_write(vma);
> > > +                   vma_mark_detached(vma);
> > > +           }
> > > +#endif
> > >             __vm_area_free(vma);
> >
> > Again, can't you race with lockess RCU lookups?
>
> Ah, no, removing vma requires holding mmap_lock for writing and having
> the vma locked, which would ensure preceding RCU readers are complete
> (per the LOCK_OFFSET waiter thing) and new RCU readers are rejected for
> the vma sequence thing.

Correct. Once vma is detached it can't be found by new readers.
Possible existing readers are purged later in this patchset by calling
vma_ensure_detached() from vm_area_free(). I don't do that in this
patch because those existing temporary readers do not pose issues up
until we start reusing the vmas.
