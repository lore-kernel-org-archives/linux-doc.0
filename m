Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB2222F395
	for <linux-doc@vger.kernel.org>; Wed, 15 Jan 2025 06:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736923306; cv=none; b=V/MuFq46hR2hq7g0xuyT5PT/NVn1FxjdU1qXDjAudcZNjvhfhqmaAs3Soee0V9mDY+qngxQCtPm9S/WaQmSUKlQ3ovmAh15RtLGyLYDAjXj99rhuyiqxvESZq6OoVLT1mBOX/gCNzz1xx3BwedqYunuyKjFF+iQBc+htWLCEPj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736923306; c=relaxed/simple;
	bh=P4wocBOngoW7Yx11mQitTtV/JmxkPIiCSjIwddxlmH0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PQug/Rttl9ZZ+JRPWDOpIITH2lG00J067pT/bjyUhjR5DjTN/gp4St4l+ymUOdid0GKOJ8YI72shHM6JLnfPJX/+0pYzJeD2slCQCE/eCSyDBQ2P66YI31rQIHbiqs5gewW8Z4omUSC5MibsrsHeGykhKRLdjjJQbBS16JOA3Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YBy6sQct; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YBy6sQct"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-467896541e1so467451cf.0
        for <linux-doc@vger.kernel.org>; Tue, 14 Jan 2025 22:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736923304; x=1737528104; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0F8PYZ5W3WWK6gmkW1B/K5FiNhF6cjRAyco7aRN7IXc=;
        b=YBy6sQct/Hfp3XfGNcRH+trXIjktRI3Nvf9Yl5hrm7DsEHjK7Q1XZ6oed66vZb7Sdc
         LYA3Q7QR6DaPKEaLpPKrUQuZs8jbodHVCQZ0JMXIU8iXUESFjaP/5isPOyg8oNmkM8s0
         ik+vJxllGYtpeScYvVEK3uUgWBlKJ+iFZbRoQFwSQf9aVhzeFK6NZrO38DJcJXa6RpH2
         V5oqZoYEIGo32HYOUszfjpncKdzK+DRt+BSS5PqgpUqDcYfoDCeDvvYiGt5Q4bFd432l
         3NUgwGRruGQYbmg2HNa40cuvFu4xEhUfLyPD5JwHFA2qay7ypGWlR/OkzGxPCL92AY89
         7kZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736923304; x=1737528104;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0F8PYZ5W3WWK6gmkW1B/K5FiNhF6cjRAyco7aRN7IXc=;
        b=pEaopibAHTkkrLxCWXnw2JDJCr0mdw7hgr3LxNxW39mDkTMUe6bgtv/y3EGZM7yACc
         g6iKXSpBLdm/3S4YTp8uhvn9aRYf8NXuoAFrA7jJzp1EZ/mKYOaMNZe8adlPUeM+F4Kh
         YqewQEpylxhtHpOdlIBD2Psl0a08OinE94aQiLVafsjOvYSzc3ybWbi54beSjKP8SKHi
         RbGh/H1dgpB2pdLTzmKYrBggH4MM6D15TKwnCP46PmSdY2VDhEpiTGf3k4jK/w1j/Z0p
         1StCcP830dzNSREnZKmwP43NT29tfhpFx+UxfbJGL139/3YvnUmibrERBwbvfhZtjTXB
         ytDA==
X-Forwarded-Encrypted: i=1; AJvYcCWUlZNT30USLzhEwhZDkW75Jd8sR8tlg5wj79iA7VI0Ec4H3P5Bw+PXPDWdi0MO6zybcUjbaCvF+KQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwR9WzcBwzoUQhx5rhr7cd7A5kqKJ5rqs1j53PqUxbMaEreNEFg
	jLUfpTpAkxSBERryHLu1DITJjAnSIQQKr2JPUZ/Kb9gdnu/Vd83JpPb5gXBQd0EfuVnbW+O/32Q
	/z2joRiWeoTxEYUxcrgOwFRhX9Y5TrEOq4f3N
X-Gm-Gg: ASbGncu9Zos51FhUHqO33dsAbeqWGzx2vTUWnne3y6La5MMHSeCUx68X1E3ZkbJrQ7b
	KQ9/7jnnpHFpdObZlcx+fuaGbZcGiFhlnyyI2Og==
X-Google-Smtp-Source: AGHT+IHF1ya+ts9z9KXplqx0JXG2FHcs5cYarOSih5CGytMsdjddmPuCvdHWqMWDijvYtf46Ccwm+RiVWN2vmsDPRn0=
X-Received: by 2002:ac8:5744:0:b0:467:7c30:3446 with SMTP id
 d75a77b69052e-46df7019ed5mr1517601cf.25.1736923303787; Tue, 14 Jan 2025
 22:41:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250111042604.3230628-1-surenb@google.com> <20250111042604.3230628-17-surenb@google.com>
 <20250115022703.hqbqdqawvqgrfgxb@master> <CAJuCfpGShzXxqH8up75WQhdMzkr+Y6eE-h37nEEwVWHC6AN89w@mail.gmail.com>
 <CAGudoHH9-h68S-YV4TObYMRDFe99xAO7Nu3tXF8h_Kds2-MWCw@mail.gmail.com>
 <CAJuCfpEDfjyfPjck_3VO5vV4RX0K1UYvHe_R8pSv+6iXN=3wsg@mail.gmail.com> <CAGudoHE2aPNThzAK9UrZYAo8CrRTFfu_VuSeyq5r2EhB7x4w0A@mail.gmail.com>
In-Reply-To: <CAGudoHE2aPNThzAK9UrZYAo8CrRTFfu_VuSeyq5r2EhB7x4w0A@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 14 Jan 2025 22:41:32 -0800
X-Gm-Features: AbW1kvbgIx9td2nvyWNgkuuIvXCIMN_nt2vk4NZ_73rlrqr5bl-2SLbmzJ7RnwE
Message-ID: <CAJuCfpHO-t65K_gAioCBLSaK-nzkNQcA-95Hu6XsE00dotiSfw@mail.gmail.com>
Subject: Re: [PATCH v9 16/17] mm: make vma cache SLAB_TYPESAFE_BY_RCU
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: Wei Yang <richard.weiyang@gmail.com>, akpm@linux-foundation.org, 
	peterz@infradead.org, willy@infradead.org, liam.howlett@oracle.com, 
	lorenzo.stoakes@oracle.com, david.laight.linux@gmail.com, mhocko@suse.com, 
	vbabka@suse.cz, hannes@cmpxchg.org, oliver.sang@intel.com, 
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com, 
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org, 
	dhowells@redhat.com, hdanton@sina.com, hughd@google.com, 
	lokeshgidra@google.com, minchan@google.com, jannh@google.com, 
	shakeel.butt@linux.dev, souravpanda@google.com, pasha.tatashin@soleen.com, 
	klarasmodin@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2025 at 9:52=E2=80=AFPM Mateusz Guzik <mjguzik@gmail.com> w=
rote:
>
> On Wed, Jan 15, 2025 at 6:47=E2=80=AFAM Suren Baghdasaryan <surenb@google=
.com> wrote:
> >
> > On Tue, Jan 14, 2025 at 8:00=E2=80=AFPM Mateusz Guzik <mjguzik@gmail.co=
m> wrote:
> > >
> > > On Wed, Jan 15, 2025 at 4:15=E2=80=AFAM Suren Baghdasaryan <surenb@go=
ogle.com> wrote:
> > > >
> > > > On Tue, Jan 14, 2025 at 6:27=E2=80=AFPM Wei Yang <richard.weiyang@g=
mail.com> wrote:
> > > > >
> > > > > On Fri, Jan 10, 2025 at 08:26:03PM -0800, Suren Baghdasaryan wrot=
e:
> > > > >
> > > > > >diff --git a/kernel/fork.c b/kernel/fork.c
> > > > > >index 9d9275783cf8..151b40627c14 100644
> > > > > >--- a/kernel/fork.c
> > > > > >+++ b/kernel/fork.c
> > > > > >@@ -449,6 +449,42 @@ struct vm_area_struct *vm_area_alloc(struct=
 mm_struct *mm)
> > > > > >       return vma;
> > > > > > }
> > > > > >
> > > > > >+static void vm_area_init_from(const struct vm_area_struct *src,
> > > > > >+                            struct vm_area_struct *dest)
> > > > > >+{
> > > [snip]
> > > > > Would this be difficult to maintain? We should make sure not miss=
 or overwrite
> > > > > anything.
> > > >
> > > > Yeah, it is less maintainable than a simple memcpy() but I did not
> > > > find a better alternative. I added a warning above the struct
> > > > vm_area_struct definition to update this function every time we cha=
nge
> > > > that structure. Not sure if there is anything else I can do to help
> > > > with this.
> > > >
> > >
> > > Bare minimum this could have a BUILD_BUG_ON in below the func for the
> > > known-covered size. But it would have to be conditional on arch and
> > > some macros, somewhat nasty.
> > >
> > > KASAN or KMSAN (I don't remember which) can be used to find missing
> > > copies. To that end the target struct could be marked as fully
> > > uninitialized before copy and have a full read performed from it
> > > afterwards -- guaranteed to trip over any field which any field not
> > > explicitly covered (including padding though). I don't know what magi=
c
> > > macros can be used to do in Linux, I am saying the support to get thi=
s
> > > result is there. I understand most people don't use this, but this
> > > still should be enough to trip over buggy patches in -next.
> >
> > If my previous suggestion does not fly I'll start digging into KASAN
> > to see how we can use it. Thanks for the tip.
> >
> > >
> > > Finally, the struct could have macros delimiting copy/non-copy
> > > sections (with macros expanding to field names), for illustrative
> > > purposes:
> > > diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> > > index 332cee285662..25063a3970c8 100644
> > > --- a/include/linux/mm_types.h
> > > +++ b/include/linux/mm_types.h
> > > @@ -677,6 +677,7 @@ struct vma_numab_state {
> > >   * getting a stable reference.
> > >   */
> > >  struct vm_area_struct {
> > > +#define vma_start_copy0 vm_rcu
> > >         /* The first cache line has the info for VMA tree walking. */
> > >
> > >         union {
> > > @@ -731,6 +732,7 @@ struct vm_area_struct {
> > >         /* Unstable RCU readers are allowed to read this. */
> > >         struct vma_lock *vm_lock;
> > >  #endif
> > > +#define vma_end_copy1 vm_lock
> > >
> > >         /*
> > >          * For areas with an address space and backing store,
> > >
> > > then you would do everything with a series of calls
> >
> > I'm not sure... My proposed approach with offsetof() I think is a bit
> > cleaner than adding macros to denote copy sections. WDYT?
> >
>
> another non-copy field may show up down the road and then the person
> adding it is going to be a sad panda. wont happen if the "infra" is
> there.
>
> but I concede this is not a big deal and i'm not going to bikeshed about =
it.

Yeah, I can't think of a perfect solution. I think we should pick a
sane one and if requirements change we can change the implementation
of vm_area_init_from() accordingly.

>
> --
> Mateusz Guzik <mjguzik gmail.com>
