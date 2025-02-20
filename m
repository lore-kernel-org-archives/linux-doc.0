Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA2520CCCA
	for <linux-doc@vger.kernel.org>; Thu, 20 Feb 2025 20:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740081957; cv=none; b=J9ZGJiADpgT4YpPb6E4/IDqqc5c6/cvitI0O0Pq+9bnUrb6B0mGZg5PS6VtOK6jlpsjRMxT5jfVc+OSZ1YYMKAfF1wJ/qnG8PfZDz8d31iYY2AiqLdTOjgOIgozyhupeMUjCCkCmXqZnEg1mICYo6EeiPP70ZPuEzOn4iuSdOlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740081957; c=relaxed/simple;
	bh=IJow1z7dhxz8U07mAsnZNtj71/6KBe7c5qMG6/IG0RU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rB9cAAgOLPqdQt3f+56DCHsjM97OSOu34/AZ6cFv4nvNVEzjyJa1pvG4ctZUSwZ0fECyx0Xg0eexznX7bQyR6clUx7+9pAOc5MZyQZXXIkJEzFyEp2IpA5A2IwYqMf8Y9xG36NTjurHIISaVZW6/6PAv27tZd5+5TcTm9L0ovW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zA7e5Idv; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zA7e5Idv"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-471fbfe8b89so78501cf.0
        for <linux-doc@vger.kernel.org>; Thu, 20 Feb 2025 12:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740081954; x=1740686754; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rNja6bf2CBLil5N3vi6N4tMwJOKIzlMCtRpPJd2q9CY=;
        b=zA7e5Idv7Zglowpdh9Y/q7K/rZX4AxKBeN33SbYU0cT6fzN0hjffWa66uYznuAuToH
         sLMPtz7S0Bmq9sq7wXHzeAat5a1+9UXgPYPcU4lPmWzdIHwX0TbH2/6SbzdXlhJkkEYw
         Sp0nhec1+KANBPSZwffbKDstnRWt/SgDhsenUnXusFqlbOcYL+45/rStOxJzS+gydE45
         tuxNN0rBLs/8R1w8faEDYS/222ksFh5nZN6UbeB/gYOiCnG+CqIw9CyIUxlM2PIFFNyQ
         d+wG+u5U/Fc0L+XrjDMBg3mh8hHZxdkBVYvd9URljqjRQBB2KgTt61kk1mnQ9w0B/Wmn
         Dq8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740081954; x=1740686754;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rNja6bf2CBLil5N3vi6N4tMwJOKIzlMCtRpPJd2q9CY=;
        b=q9cZmzFL5zUdek1IRrdfV420gT1bAl13OuoRFkQIpLZDXJ6kUdETbnewr/Rvai8T6s
         u3JIBE17FniODQYu9p+BWUih50SIxyR76vKr03blCWn320b4D40s5U9YIvC9sVzxwGBx
         eq4iHWm1xmimnJvFUrBZOYSQz9P4XWPPURqC3PE2JAVFbbezcMG79oQFDrUQP+mH4Hgi
         FxDWyx40YVfi+KEcTAbk0o1anDZG4m4ixGNa6Nv/gTOpgvTFgYc6otjBLtzKsnjFaZiP
         au8UPGp1XDnhNqOJ+6ln8a+NDjr/sThF6LIBJWboSvJ770l+wLA1RU5nJ0RxceiVZ5o/
         ZPKw==
X-Forwarded-Encrypted: i=1; AJvYcCWxD0BRQW9dK928P62sEG58A9aZINOgo8G3EXfm2q8eTXgD5aY7TnbdJAGr/+GtNp5fHSbCdcO5T60=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4Q7q2u4EhRIEsC0VyYWJX+wat7ArZzLJQ2Cw+MLCaZVrv6/ey
	t6DgHYKbuRvNdfopyoVxcpLg1zj7hvctk27FcmcKRaQBmmdQmEyZaRus7/CSqydQDpk4mhA+fGS
	cIvFQrBQmmvarrSwSAohgNsFQ4i42R97kyR9T
X-Gm-Gg: ASbGncuSfhudmmmHQFCrp8fCo0BhNARIYjt5x78L2lAjQEcoiIBdHhAfabjfcpBKpq1
	2xTo6UA/sSKoloBjv0FWuaYawqC/+FL6vbDYrk9KebwX6BpLQARzwxNx/xU1VcqWJrG7Anj/KM+
	b10DzQTgZh6DOaQZL0i5roHKfPChg=
X-Google-Smtp-Source: AGHT+IHpz6m4G/n59ZlD8R9nrH67RBcmMemJBj92EGjiGmRxgpyfygUckCwhV73JoH60FmYTGhx1XKBybLiRY1/9bnM=
X-Received: by 2002:a05:622a:254:b0:471:eab0:ef21 with SMTP id
 d75a77b69052e-47223afbfb2mr371871cf.13.1740081954006; Thu, 20 Feb 2025
 12:05:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250213224655.1680278-1-surenb@google.com> <20250213224655.1680278-13-surenb@google.com>
 <20250220185304.8313A7d-hca@linux.ibm.com> <CAJuCfpFPaVY1EHus1p0SY1=hpiGogdPCkgtft7fNZ4gPPj2TGA@mail.gmail.com>
In-Reply-To: <CAJuCfpFPaVY1EHus1p0SY1=hpiGogdPCkgtft7fNZ4gPPj2TGA@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 20 Feb 2025 12:05:42 -0800
X-Gm-Features: AWEUYZlbD-smqwGs3rLt0rUzzc_SeICGoC9WORx4H6WlodkEvgawJox22U4G20I
Message-ID: <CAJuCfpGc+Q=rabcTZoxOj9YSZJnR7GzaTNa-PL-G-3hdO+SmjA@mail.gmail.com>
Subject: Re: [PATCH v10 12/18] mm: replace vm_lock and detached flag with a
 reference count
To: Heiko Carstens <hca@linux.ibm.com>
Cc: akpm@linux-foundation.org, peterz@infradead.org, willy@infradead.org, 
	liam.howlett@oracle.com, lorenzo.stoakes@oracle.com, 
	david.laight.linux@gmail.com, mhocko@suse.com, vbabka@suse.cz, 
	hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
	david@redhat.com, peterx@redhat.com, oleg@redhat.com, dave@stgolabs.net, 
	paulmck@kernel.org, brauner@kernel.org, dhowells@redhat.com, hdanton@sina.com, 
	hughd@google.com, lokeshgidra@google.com, minchan@google.com, 
	jannh@google.com, shakeel.butt@linux.dev, souravpanda@google.com, 
	pasha.tatashin@soleen.com, klarasmodin@gmail.com, richard.weiyang@gmail.com, 
	corbet@lwn.net, linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 20, 2025 at 11:03=E2=80=AFAM Suren Baghdasaryan <surenb@google.=
com> wrote:
>
> On Thu, Feb 20, 2025 at 10:53=E2=80=AFAM Heiko Carstens <hca@linux.ibm.co=
m> wrote:
> >
> > On Thu, Feb 13, 2025 at 02:46:49PM -0800, Suren Baghdasaryan wrote:
> > ...
> > > While this vm_lock replacement does not yet result in a smaller
> > > vm_area_struct (it stays at 256 bytes due to cacheline alignment), it
> > > allows for further size optimization by structure member regrouping
> > > to bring the size of vm_area_struct below 192 bytes.
> > >
> > > Suggested-by: Peter Zijlstra <peterz@infradead.org>
> > > Suggested-by: Matthew Wilcox <willy@infradead.org>
> > > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > > ---
> > > Changes since v9 [1]:
> > > - Use __refcount_inc_not_zero_limited_acquire() in vma_start_read(),
> > > per Hillf Danton
> > > - Refactor vma_assert_locked() to avoid vm_refcnt read when CONFIG_DE=
BUG_VM=3Dn,
> > > per Mateusz Guzik
> > > - Update changelog, per Wei Yang
> > > - Change vma_start_read() to return EAGAIN if vma got isolated and ch=
anged
> > > lock_vma_under_rcu() back to detect this condition, per Wei Yang
> > > - Change VM_BUG_ON_VMA() to WARN_ON_ONCE() when checking vma detached=
 state,
> > > per Lorenzo Stoakes
> > > - Remove Vlastimil's Reviewed-by since code is changed
> >
> > This causes crashes (NULL pointer deref) with linux-next when running
> > the ltp test suite; mtest06 (mmap1) test case.
> >
> > The bug seems to be quite obvious:
> >
> > > @@ -6424,15 +6492,18 @@ struct vm_area_struct *lock_vma_under_rcu(str=
uct mm_struct *mm,
> > >       if (!vma)
> > >               goto inval;
> > >
> > > -     if (!vma_start_read(vma))
> > > -             goto inval;
> > > +     vma =3D vma_start_read(vma);
> > > +     if (IS_ERR_OR_NULL(vma)) {
> >             ^^^^^^^^^^^^^^^^^^^
> > > +             /* Check if the VMA got isolated after we found it */
> > > +             if (PTR_ERR(vma) =3D=3D -EAGAIN) {
> > > +                     vma_end_read(vma);
> >                         ^^^^^^^^^^^^^^^^
>
> Doh! Thanks for reporting! I'll post a fix shortly.

The fix is posted at:
https://lore.kernel.org/all/20250220200208.323769-1-surenb@google.com/
Quite embarrassing... I missed removing that extra call. This change
was done only in v10, so never appeared before.
