Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8317A1AD3E5
	for <linux-doc@vger.kernel.org>; Mon, 13 Jan 2025 17:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736791023; cv=none; b=LpwW0uTJDyd37luhJSwUDi+ocWLno+sgJ0RG6NdeFRFm0GxPIKj6z8BCV70bwxL1ETnOsaWX9gBR8AK3mAGOFthgunE8w4/r6GARxOewvkAWthh2Zu3CIOF4qo+LeAeV3aBMFNge+KzKlFKy3JAzcVXoxooQXrvje/5p4eVyBIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736791023; c=relaxed/simple;
	bh=fpqakuYqnBCWRBAJ/5t/Rss46UOXsCeIIDE4p8Q1M8g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oXJaLjUL+MYFVAj5VQYdVr6nJ8CcMzqh48uEdUJ4b0FuuOgamuNivqknpmVwLxOw6QueUQpcq8xw2ng8ZrF+hAZoHW4EjECIzkruof8ASXBKjsROowf6bn3phL/dZ+SWQOOIUfCzNqeJYJSDdOs4ZQpZse4KATe1oZYKHCtjG3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hFYYYc73; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hFYYYc73"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4679b5c66d0so351cf.1
        for <linux-doc@vger.kernel.org>; Mon, 13 Jan 2025 09:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736791019; x=1737395819; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dsnKCzZTFBXoelPsVIOpgU5ec5YIwNewGQBegIpuFsU=;
        b=hFYYYc73OBLUC35D8bCxyRFJAIUqYbUyaSc2Qm5NLs83ydeb1Xjnywrb+74j+CVLeA
         fHgXaxoCywGkglcoUHwT6Roaz7hmn/S4tLnc5YyR+yg/j/TXTT3EYc1k160QNpUPeDwL
         CJirpszlYepprYI31OZPq7/Y/WBXvoFIu+4LsYzbqQ74jj6m7yuZI2gj5MEr9M1GAMxg
         oGM74TIus24qoKIoQFm10dQt+bW8qvbaIPxyRXtllHaK1XFRtDJn1sXT285sTXyBxLHw
         wmdNjawzNsgPZRW8K5HrOd8haf0+zW0Q9o5vX+jrUd2dOnF1a+3vTSB5PSm7ucEp/RRR
         vQNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736791019; x=1737395819;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dsnKCzZTFBXoelPsVIOpgU5ec5YIwNewGQBegIpuFsU=;
        b=KjQhFYrTv7vRGQley4+GPrOWdXguCdN8qh14VEkoH8hlhpsjeaxo4x4LQA1bkU/4OV
         Dc1c8wY1XPPNLNKDs9rF8+In7uMDBgeCRjwI7azftC4po9LYXlWq1UAfwiHljV/kDUmx
         efJphW9Zt5sfVAzvZuW7hDttG8b+rPOef1m9pt6e5k7FLl5Bfwfz5LA6VFj0cY8PhxG2
         UPIKZmMMo50h6v2Z0NgeUIuIVrugmDL+L87DfjUJrka4Q1KBqTm6f4NptOv2VpCiB3oC
         Q/+HrZXDnyaVK4uCg5p3BGxWrzdS2rJaIHWTHnGDJezlUaSlTraLJWFIhmIJQJLqBm3f
         4ADw==
X-Forwarded-Encrypted: i=1; AJvYcCXyf/QEIECDT1wUzcQ7oorNmFliBdwlWHe6RdXjP9uXz7p0EOpKG/2AT5U2ryVtLUT9Y8dSddEb0nI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr0P0L9nCQOCBcOriKEuKH9oaLsqSK1d7u4TkuqUhdax1REPJ9
	jijAvGCCHFLuhKU5MD00+vW6zDPOSqZ1l0lL29whOm+GJPRt31GnbtTQYaDFit2V8zZpk0kLG2x
	+5oP7peOB/q5LbPWhJqjtRcx3eEXpdkySWGcu
X-Gm-Gg: ASbGncsB4P1UDazWyyYbglqyeBI9CfLB3ZW29MABbmOpKswPq4y0bh4vXkfI4WNCN8R
	sYc/4Vzx2obW0vSwDvDPpi0qungQgdbgCXzaAbQ==
X-Google-Smtp-Source: AGHT+IGzcJo1I1YVox7rWqfGYoNZYNvup0scNLk1JR/UjsMbtJu6gVOf+7JEyklWdJNDczaONo32EGH6Yhgo5fbYmf0=
X-Received: by 2002:ac8:574a:0:b0:466:7926:c69 with SMTP id
 d75a77b69052e-46c87f3c47bmr12873421cf.20.1736791017719; Mon, 13 Jan 2025
 09:56:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250111042604.3230628-1-surenb@google.com> <20250111042604.3230628-18-surenb@google.com>
 <096e5619-a717-4263-983c-e55c8c26f7e9@lucifer.local>
In-Reply-To: <096e5619-a717-4263-983c-e55c8c26f7e9@lucifer.local>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 13 Jan 2025 09:56:46 -0800
X-Gm-Features: AbW1kvZlyO4Ui26K7o5PUCTV3eMe4od3BesRZkKNlUkSMs9bz2M9h5XzyggEQAg
Message-ID: <CAJuCfpGHWKVHquOTAjt1WSyy+mkqCzR5xCRipJi5ztQcMdFLQQ@mail.gmail.com>
Subject: Re: [PATCH v9 17/17] docs/mm: document latest changes to vm_lock
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, peterz@infradead.org, willy@infradead.org, 
	liam.howlett@oracle.com, david.laight.linux@gmail.com, mhocko@suse.com, 
	vbabka@suse.cz, hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com, 
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org, 
	dhowells@redhat.com, hdanton@sina.com, hughd@google.com, 
	lokeshgidra@google.com, minchan@google.com, jannh@google.com, 
	shakeel.butt@linux.dev, souravpanda@google.com, pasha.tatashin@soleen.com, 
	klarasmodin@gmail.com, richard.weiyang@gmail.com, corbet@lwn.net, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2025 at 8:33=E2=80=AFAM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> On Fri, Jan 10, 2025 at 08:26:04PM -0800, Suren Baghdasaryan wrote:
> > Change the documentation to reflect that vm_lock is integrated into vma
> > and replaced with vm_refcnt.
> > Document newly introduced vma_start_read_locked{_nested} functions.
> >
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > Reviewed-by: Liam R. Howlett <Liam.Howlett@Oracle.com>
>
> Apart from small nit, LGTM, thanks for doing this!
>
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>
> > ---
> >  Documentation/mm/process_addrs.rst | 44 ++++++++++++++++++------------
> >  1 file changed, 26 insertions(+), 18 deletions(-)
> >
> > diff --git a/Documentation/mm/process_addrs.rst b/Documentation/mm/proc=
ess_addrs.rst
> > index 81417fa2ed20..f573de936b5d 100644
> > --- a/Documentation/mm/process_addrs.rst
> > +++ b/Documentation/mm/process_addrs.rst
> > @@ -716,9 +716,14 @@ calls :c:func:`!rcu_read_lock` to ensure that the =
VMA is looked up in an RCU
> >  critical section, then attempts to VMA lock it via :c:func:`!vma_start=
_read`,
> >  before releasing the RCU lock via :c:func:`!rcu_read_unlock`.
> >
> > -VMA read locks hold the read lock on the :c:member:`!vma->vm_lock` sem=
aphore for
> > -their duration and the caller of :c:func:`!lock_vma_under_rcu` must re=
lease it
> > -via :c:func:`!vma_end_read`.
> > +In cases when the user already holds mmap read lock, :c:func:`!vma_sta=
rt_read_locked`
> > +and :c:func:`!vma_start_read_locked_nested` can be used. These functio=
ns do not
> > +fail due to lock contention but the caller should still check their re=
turn values
> > +in case they fail for other reasons.
> > +
> > +VMA read locks increment :c:member:`!vma.vm_refcnt` reference counter =
for their
> > +duration and the caller of :c:func:`!lock_vma_under_rcu` must drop it =
via
> > +:c:func:`!vma_end_read`.
> >
> >  VMA **write** locks are acquired via :c:func:`!vma_start_write` in ins=
tances where a
> >  VMA is about to be modified, unlike :c:func:`!vma_start_read` the lock=
 is always
> > @@ -726,9 +731,9 @@ acquired. An mmap write lock **must** be held for t=
he duration of the VMA write
> >  lock, releasing or downgrading the mmap write lock also releases the V=
MA write
> >  lock so there is no :c:func:`!vma_end_write` function.
> >
> > -Note that a semaphore write lock is not held across a VMA lock. Rather=
, a
> > -sequence number is used for serialisation, and the write semaphore is =
only
> > -acquired at the point of write lock to update this.
> > +Note that when write-locking a VMA lock, the :c:member:`!vma.vm_refcnt=
` is temporarily
> > +modified so that readers can detect the presense of a writer. The refe=
rence counter is
> > +restored once the vma sequence number used for serialisation is update=
d.
> >
> >  This ensures the semantics we require - VMA write locks provide exclus=
ive write
> >  access to the VMA.
> > @@ -738,7 +743,7 @@ Implementation details
> >
> >  The VMA lock mechanism is designed to be a lightweight means of avoidi=
ng the use
> >  of the heavily contended mmap lock. It is implemented using a combinat=
ion of a
> > -read/write semaphore and sequence numbers belonging to the containing
> > +reference counter and sequence numbers belonging to the containing
> >  :c:struct:`!struct mm_struct` and the VMA.
> >
> >  Read locks are acquired via :c:func:`!vma_start_read`, which is an opt=
imistic
> > @@ -779,28 +784,31 @@ release of any VMA locks on its release makes sen=
se, as you would never want to
> >  keep VMAs locked across entirely separate write operations. It also ma=
intains
> >  correct lock ordering.
> >
> > -Each time a VMA read lock is acquired, we acquire a read lock on the
> > -:c:member:`!vma->vm_lock` read/write semaphore and hold it, while chec=
king that
> > -the sequence count of the VMA does not match that of the mm.
> > +Each time a VMA read lock is acquired, we increment :c:member:`!vma.vm=
_refcnt`
> > +reference counter and check that the sequence count of the VMA does no=
t match
> > +that of the mm.
> >
> > -If it does, the read lock fails. If it does not, we hold the lock, exc=
luding
> > -writers, but permitting other readers, who will also obtain this lock =
under RCU.
> > +If it does, the read lock fails and :c:member:`!vma.vm_refcnt` is drop=
ped.
> > +If it does not, we keep the reference counter raised, excluding writer=
s, but
> > +permitting other readers, who can also obtain this lock under RCU.
> >
> >  Importantly, maple tree operations performed in :c:func:`!lock_vma_und=
er_rcu`
> >  are also RCU safe, so the whole read lock operation is guaranteed to f=
unction
> >  correctly.
> >
> > -On the write side, we acquire a write lock on the :c:member:`!vma->vm_=
lock`
> > -read/write semaphore, before setting the VMA's sequence number under t=
his lock,
> > -also simultaneously holding the mmap write lock.
> > +On the write side, we set a bit in :c:member:`!vma.vm_refcnt` which ca=
n't be
> > +modified by readers and wait for all readers to drop their reference c=
ount.
> > +Once there are no readers, VMA's sequence number is set to match that =
of the
>
> Nit: 'the VMA's sequence number' seems to read better here.

Ack.

>
> > +mm. During this entire operation mmap write lock is held.
> >
> >  This way, if any read locks are in effect, :c:func:`!vma_start_write` =
will sleep
> >  until these are finished and mutual exclusion is achieved.
> >
> > -After setting the VMA's sequence number, the lock is released, avoidin=
g
> > -complexity with a long-term held write lock.
> > +After setting the VMA's sequence number, the bit in :c:member:`!vma.vm=
_refcnt`
> > +indicating a writer is cleared. From this point on, VMA's sequence num=
ber will
> > +indicate VMA's write-locked state until mmap write lock is dropped or =
downgraded.
> >
> > -This clever combination of a read/write semaphore and sequence count a=
llows for
> > +This clever combination of a reference counter and sequence count allo=
ws for
> >  fast RCU-based per-VMA lock acquisition (especially on page fault, tho=
ugh
> >  utilised elsewhere) with minimal complexity around lock ordering.
> >
> > --
> > 2.47.1.613.gc27f4b7a9f-goog
> >
