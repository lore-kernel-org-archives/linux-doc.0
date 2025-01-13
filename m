Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B0B1CACF3
	for <linux-doc@vger.kernel.org>; Mon, 13 Jan 2025 21:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736802882; cv=none; b=fOPhd0R5OhTXH4cCmD9Tr1d+E9dIPJt40Ir0v0/t4k0Gey7EkG/A9Exye4ykWCKLr9TVU/UlHf6cysxFxeE9plfBXAt8uoaQiYf3zaLZzOlclt6IEtrq4UaWK/Y845GV/dI8Mk7C+NYvOPdS1hV0v71xDUQbVPzjmgUc57KWSas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736802882; c=relaxed/simple;
	bh=UNkuPJ1DtTDZfa5Ximfs2uBmy/S3L06ykWxrBpXoHdc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kg9+BlOHuTLhqzOIRmya6HSZQg/U2Q3gLoIs6OIyGnKqk2zCJVwxpRx7+vrjMyNEpnv3/Z0BFsrYpcP0viiqcELL1Y/23eiIoTW4viMnO38Z9sCwSMl/UwjsYEQ4/N0rTDatI17wxOFRy1bGRDc4aC5WP+gkKPzuolqCMAXUCwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bBpyha+Y; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bBpyha+Y"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-467896541e1so65971cf.0
        for <linux-doc@vger.kernel.org>; Mon, 13 Jan 2025 13:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736802880; x=1737407680; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HGjAxZWeoR4eIf6Vg1CVCHX5fLV66MedHmHZbmp5W/0=;
        b=bBpyha+Y0Ay6GpIUiO3VWsoH2XeaH7AFcaOOj7Mer/+90oFEXP1MBann/nj23XYIjr
         JJVfj4y1nLnXxi2FMs5/VoEuathQEEPDSwghe4/nhss0Rtx0q1fmoLYq2Kroo74ktXS5
         WaAOs5O3VkCzmHwF8I9y5ul51H4uZLn+RqqQ6qJT86Af9Zhl6WtHqVmrR8Dc5FRrWAp5
         +7IBDfb0GVJ+91f4rcuUmR3iF4pebXo6V118Qwfsrb5oj5rAhYQxJMD8IG86Bpk1RF2m
         nektxs65JsbUIQIeKMZWRVEqxj2ozyRsiM6cWLy1OxhxUsdEyiim1MIR9Av0xqUXamrg
         JVyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736802880; x=1737407680;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HGjAxZWeoR4eIf6Vg1CVCHX5fLV66MedHmHZbmp5W/0=;
        b=NxoMSSmjTBnrpRCAgkrGwQv5GIfWLhC7Q0DGqW/1qCC9LZGEzO4dWZkb7PUQpgunix
         oUEtOp0RLWffBsN6Yr4ZXS/rdTeEZ4ghCYhG1tVERW8e9g4YU7Db8p9dAJENTj1e5uLr
         jdRVuC1WZW2/wOnWXEoGJRT5dD/xQk+RN7gY1+GmTfMF+Km99vLZrjvOy22bdYp6SLJ7
         RmCwxavHHz12lBOogAiXZCBhH8P/+c+EXBdHc3KmFGeYpjEp3BoV8nJbU39FGbtseSIq
         Jkgz3mmatMJWSrP7kBK2mLXbSFzydXMKpJatSQnRA45yD4wwVr6q1+MKkzqOCPuc3mV2
         lFHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmLtbnCzQz0OqcHGR+0DimATZ9OXg1m4+71TthyNlY9ZJYqkVMJTsNFHkvazcjzkmmIaMNR45LawU=@vger.kernel.org
X-Gm-Message-State: AOJu0YznJMQzUnju8jE8JqL2luIs0JTrUP9Tr9OX1tpro824q/ZcaRoX
	VQhaaGjIz9xBQOdu0KUrNncij2mfzIJMOs55ruQmDyFJW1YZGaNYT4RebPEXqp/V3IpPHcjRLrC
	8hp3+M6+fEYNe80YU39pnSppKKHXtOUSksl4e
X-Gm-Gg: ASbGncsXPOjJZPOQfO9gpXQhhg9opkXFzwfOsljXPHBp9iPteB5x3koLfR/pJSujRj9
	1//8y4FGeUlV1QVIXfWG5QfP8t0Kr3E33aqfLdw==
X-Google-Smtp-Source: AGHT+IFqAHFj/WuITWcnJw0D7SXwO5J6urUwH0ERPP4GcRKHt1QNDBndCsxDS0ry+WgFlJY6haMyPc6RKz2I8foTck8=
X-Received: by 2002:a05:622a:1907:b0:465:18f3:79cc with SMTP id
 d75a77b69052e-46de99be6admr516171cf.11.1736802879667; Mon, 13 Jan 2025
 13:14:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250111042604.3230628-1-surenb@google.com> <20250111042604.3230628-12-surenb@google.com>
 <gdipfy63r4wxiqlnglsjzatpej6jjswimuzadm2l57o2e45u56@qfd763n4ysft>
 <CAJuCfpGu4UVXiBaivTVOGNBVVz3rhZ+VY27gT3_R0cTij5fTGw@mail.gmail.com>
 <20250113014729.ms5sdfnhynlamgrk@master> <20250113022545.56e2qaggdgqzlukz@master>
In-Reply-To: <20250113022545.56e2qaggdgqzlukz@master>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 13 Jan 2025 13:14:28 -0800
X-Gm-Features: AbW1kvaF5imeB8Llt20RxA_EepFLh2dl-i0UYq1OwEZlpBTwFdjifQbVhR-9Npw
Message-ID: <CAJuCfpHajPX4i=oNB3jJ=OKX_g__1WuOWzEPFETDyzk+QP0rPg@mail.gmail.com>
Subject: Re: [PATCH v9 11/17] mm: replace vm_lock and detached flag with a
 reference count
To: Wei Yang <richard.weiyang@gmail.com>
Cc: Mateusz Guzik <mjguzik@gmail.com>, akpm@linux-foundation.org, peterz@infradead.org, 
	willy@infradead.org, liam.howlett@oracle.com, lorenzo.stoakes@oracle.com, 
	david.laight.linux@gmail.com, mhocko@suse.com, vbabka@suse.cz, 
	hannes@cmpxchg.org, oliver.sang@intel.com, mgorman@techsingularity.net, 
	david@redhat.com, peterx@redhat.com, oleg@redhat.com, dave@stgolabs.net, 
	paulmck@kernel.org, brauner@kernel.org, dhowells@redhat.com, hdanton@sina.com, 
	hughd@google.com, lokeshgidra@google.com, minchan@google.com, 
	jannh@google.com, shakeel.butt@linux.dev, souravpanda@google.com, 
	pasha.tatashin@soleen.com, klarasmodin@gmail.com, corbet@lwn.net, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 12, 2025 at 6:25=E2=80=AFPM Wei Yang <richard.weiyang@gmail.com=
> wrote:
>
> On Mon, Jan 13, 2025 at 01:47:29AM +0000, Wei Yang wrote:
> >On Sat, Jan 11, 2025 at 12:14:47PM -0800, Suren Baghdasaryan wrote:
> >>On Sat, Jan 11, 2025 at 3:24=E2=80=AFAM Mateusz Guzik <mjguzik@gmail.co=
m> wrote:
> >>>
> >>> On Fri, Jan 10, 2025 at 08:25:58PM -0800, Suren Baghdasaryan wrote:
> >>>
> >>> So there were quite a few iterations of the patch and I have not been
> >>> reading majority of the feedback, so it may be I missed something,
> >>> apologies upfront. :)
> >>>
> >
> >Hi, I am new to memory barriers. Hope not bothering.
> >
> >>> >  /*
> >>> >   * Try to read-lock a vma. The function is allowed to occasionally=
 yield false
> >>> >   * locked result to avoid performance overhead, in which case we f=
all back to
> >>> > @@ -710,6 +742,8 @@ static inline void vma_lock_init(struct vm_area=
_struct *vma)
> >>> >   */
> >>> >  static inline bool vma_start_read(struct vm_area_struct *vma)
> >>> >  {
> >>> > +     int oldcnt;
> >>> > +
> >>> >       /*
> >>> >        * Check before locking. A race might cause false locked resu=
lt.
> >>> >        * We can use READ_ONCE() for the mm_lock_seq here, and don't=
 need
> >>> > @@ -720,13 +754,19 @@ static inline bool vma_start_read(struct vm_a=
rea_struct *vma)
> >>> >       if (READ_ONCE(vma->vm_lock_seq) =3D=3D READ_ONCE(vma->vm_mm->=
mm_lock_seq.sequence))
> >>> >               return false;
> >>> >
> >>> > -     if (unlikely(down_read_trylock(&vma->vm_lock.lock) =3D=3D 0))
> >>> > +     /*
> >>> > +      * If VMA_LOCK_OFFSET is set, __refcount_inc_not_zero_limited=
() will fail
> >>> > +      * because VMA_REF_LIMIT is less than VMA_LOCK_OFFSET.
> >>> > +      */
> >>> > +     if (unlikely(!__refcount_inc_not_zero_limited(&vma->vm_refcnt=
, &oldcnt,
> >>> > +                                                   VMA_REF_LIMIT))=
)
> >>> >               return false;
> >>> >
> >>>
> >>> Replacing down_read_trylock() with the new routine loses an acquire
> >>> fence. That alone is not a problem, but see below.
> >>
> >>Hmm. I think this acquire fence is actually necessary. We don't want
> >>the later vm_lock_seq check to be reordered and happen before we take
> >>the refcount. Otherwise this might happen:
> >>
> >>reader             writer
> >>if (vm_lock_seq =3D=3D mm_lock_seq) // check got reordered
> >>        return false;
> >>                       vm_refcnt +=3D VMA_LOCK_OFFSET
> >>                       vm_lock_seq =3D=3D mm_lock_seq
> >>                       vm_refcnt -=3D VMA_LOCK_OFFSET
> >>if (!__refcount_inc_not_zero_limited())
> >>        return false;
> >>
> >>Both reader's checks will pass and the reader would read-lock a vma
> >>that was write-locked.
> >>
> >
> >Here what we plan to do is define __refcount_inc_not_zero_limited() with
> >acquire fence, e.g. with atomic_try_cmpxchg_acquire(), right?
> >
>
> BTW, usually we pair acquire with release.
>
> The __vma_start_write() provide release fence when locked, so for this pa=
rt
> we are ok, right?

Yes, __vma_start_write() -> __vma_exit_locked() ->
refcount_sub_and_test() and this function provides release memory
ordering, see https://elixir.bootlin.com/linux/v6.12.6/source/include/linux=
/refcount.h#L289

>
>
> --
> Wei Yang
> Help you, Help me
