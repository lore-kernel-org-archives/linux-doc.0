Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1B010A1E
	for <linux-doc@vger.kernel.org>; Mon, 23 Dec 2024 03:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734923010; cv=none; b=g5lviyFbQKYttDjIoTzHpHZC2l2xwlzO3Ggf2ZT1iXEEsZgCfB0B4iUww0PA8RtC7vx/wFDAQmz2KwHnWcWkWh+WASicrrXSy+BZW2VQErhTnH2GgBsyTSWlEFNy6Lqb/KCadKPqCz89jkXoVpPvU4iPTC8Y2t6l3ByVt2/d/ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734923010; c=relaxed/simple;
	bh=mqQ6gFDjuk8eASHuSlWfgmFHdoJN1pQtHYXceSr8CRw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=jB46Pta4sJB1ljFKGpaw+hNTV09Ks64ze5y84xU0BoSLAsH1EoJVTJFvdRh0ikfgEelm4+2b57Koc354+9fgt/RTKKhCDgTMFRDFGtzS3wlzbANWBfCXo65wFKkKNsd2Ew3tZDYxhOIAUOCu1RewNi4JNlopHH7TaACst1mBCRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EqAhlfio; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EqAhlfio"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-467abce2ef9so712781cf.0
        for <linux-doc@vger.kernel.org>; Sun, 22 Dec 2024 19:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734923006; x=1735527806; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=udfgoBpU9YC1tkAs9yYIvHXM/pzmQwYqqI8FYG0Q6jo=;
        b=EqAhlfio2vCTKyEIs/rvY0AHsKbgHQdP5cTIu7Ub7NWuzg7rZXrtr8X76hRJrnuUN+
         LJT+9Uin/+WscY9hTGA6Vl4MxYvnHpDYr9fTl5WZAv4vPLzehrVVIGs20RuVDAQKQ6vv
         Ij2BKfBS3Mt/IV7f4Y0694IrS1/su1Sxfa3P0aiVfYh0DATnQpdisGj1+ij098XqFZqY
         R2+VEspcXNzHsQF74kcP4ds+jA6bn+3lchIrvMnlEpfzYroY+lELnsjV6LJL/Srevzml
         9K+Wfnq7rS9872Ho00hONIhTspvCv9oUlEOBxWdbyYNqyQYwJztl91NAzIT7oIjucgJw
         8ekw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734923006; x=1735527806;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=udfgoBpU9YC1tkAs9yYIvHXM/pzmQwYqqI8FYG0Q6jo=;
        b=N2rGoNLPe3hJr8zFt5kRtHkGKvr+Nei2oyhkLEuXO2uAOTGPn7qcnNZ6cL5obUZP2Y
         55nSBVRAagHJ8t/ctsDkTBAaFVoIz7URTveXX3WV57IiYKGP3bGEykEk7HEf3q+t0RDM
         Bkc0HYF33hgDkxx8suqHJBAKY4PPrj/XtFEbxKJX6ifCbRjloaH79n09S1UuvwgdXZed
         kRUmFV7/RV23RmRBCP6PNKTvhx2Ag2w/uuImUeMQrMy3xAP+2K7u02JfFB5zNpf0BoU9
         DDqqULsBdemp6DU/UWOHfzjtkPYwXTCaMcg/78v2CrEkj1PeDEIahhf/Z72Jny9IRR49
         Z5WA==
X-Forwarded-Encrypted: i=1; AJvYcCVBZy4lEhFluHUXlHqGAKr8Ul3etyePidsbosCQR3FnVmTjE3Wd+mmunPhDqMOaM2D3ikHGmwDZyEc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyE4dvSs1eKifIdibvukFWHSyxkA5t4lYh8520EZbYaUod7KosU
	o0c9aHyOZX90okN/V/+qlPzfi/X5INdzukcm3WoLnUzy0q22ZIcIHDnauLQnzhZu0tTqcyi69lA
	o8AJdwllN525fwur7T/+8QswqeoGl2jAbrj6x
X-Gm-Gg: ASbGncuSlg4qoBi+qY/SmEYlQ2qZESDxiVCufXtQcVHhZII0jbKqwykEzjCc5WhaH9c
	0dmzaoFG6j1+dj1fx1BdOf5nT6AlmpM8YwC744A==
X-Google-Smtp-Source: AGHT+IH6iUjP7T3YRQZk5dM79hzQPqi3CteufuNTiNR3N7HnbkvTjhN7FGDeZFxrI0CTiNpdaa1qmm48FdBbz54rlO4=
X-Received: by 2002:a05:622a:1823:b0:466:a11c:cad2 with SMTP id
 d75a77b69052e-46a4c00cc98mr8909181cf.7.1734923005705; Sun, 22 Dec 2024
 19:03:25 -0800 (PST)
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
In-Reply-To: <6nck2rfwcytqdinsavmewytgcca43mldlczmao3zztrpr5v2ci@4xn6nwp6tcih>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sun, 22 Dec 2024 19:03:14 -0800
Message-ID: <CAJuCfpFXh5mHfn3d1ySk3icJsK5ssJWuUOB_=tXvt3sA+Jh-YA@mail.gmail.com>
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

On Thu, Dec 19, 2024 at 10:55=E2=80=AFAM Liam R. Howlett
<Liam.Howlett@oracle.com> wrote:
>
> * Peter Zijlstra <peterz@infradead.org> [241219 13:47]:
> > On Thu, Dec 19, 2024 at 01:18:23PM -0500, Liam R. Howlett wrote:
> >
> > > > For RCU lookups only the mas tree matters -- and its left present t=
here.
> > > >
> > > > If you really want to block RCU readers, I would suggest punching a=
 hole
> > > > in the mm_mt. All the traditional code won't notice anyway, this is=
 all
> > > > with mmap_lock held for writing.
> > >
> > > We don't want to block all rcu readers, we want to block the rcu read=
ers
> > > that would see the problem - that is, anyone trying to read a particu=
lar
> > > area.
> > >
> > > Right now we can page fault in unpopulated vmas while writing other v=
mas
> > > to the tree.  We are also moving more users to rcu reading to use the
> > > vmas they need without waiting on writes to finish.
> > >
> > > Maybe I don't understand your suggestion, but I would think punching =
a
> > > hole would lose this advantage?
> >
> > My suggestion was to remove the range stuck in mas_detach from mm_mt.
> > That is exactly the affected range, no?
>
> Yes.
>
> But then looping over the vmas will show a gap where there should not be
> a gap.
>
> If we stop rcu readers entirely we lose the advantage.
>
> This is exactly the issue that the locking dance was working around :)

IOW we write-lock the entire range before removing any part of it for
the whole transaction to be atomic, correct?


Peter, you suggested the following pattern for ensuring vma is
detached with no possible readers:

vma_iter_store()
vma_start_write()
vma_mark_detached()

What do you think about this alternative?

vma_start_write()
...
vma_iter_store()
vma_mark_detached()
        vma_assert_write_locked(vma)
        if (unlikely(!refcount_dec_and_test(&vma->vm_refcnt)))
                vma_start_write()

The second vma_start_write() is unlikely to be executed because the
vma is locked, vm_refcnt might be increased only temporarily by
readers before they realize the vma is locked and that's a very narrow
window. I think performance should not visibly suffer?
OTOH this would let us keep current locking patterns and would
guarantee that vma_mark_detached() always exits with a detached and
unused vma (less possibilities for someone not following an exact
pattern and ending up with a detached but still used vma).

>
