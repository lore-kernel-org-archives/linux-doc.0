Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741D624022B
	for <linux-doc@vger.kernel.org>; Mon, 13 Jan 2025 17:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736791088; cv=none; b=gmMdtb0xhqHtht0u7xYvXN1wJQJkqJ7jZX0IGb2Wfi8+EA7dNxWtefH3cZqur9T1EfkEeegf1scazUNMzhvgOsgb4l9EYGyXmDoHqiRhTxqVWDu5Az/QiB0ndROoOcka6m5IeMxm/9VuzOCKHR8ewLSdXiDBLK/kerS+LfaukbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736791088; c=relaxed/simple;
	bh=GvkjyvIhQFMZ/JisSDNPEN6KXYYj3Ky0bpquul7IqPk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=GJD6T84NnO0lh0fd7x3y/eJesFJdsKo8Lb1vYkCHm3wDxU3hylRZkq1zxPMdK+O5MYlwNvTYaZnBLSZfJqKCfNNK7ZjMBQKlmVpyIwsYOE7NCZRK5KvqSaYV8TRwsB6QqPlySbRCYJfZ/C5KWkei5uRc80wMPQuTJUqcDDb+TzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oMy3m13C; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oMy3m13C"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4678c9310afso221cf.1
        for <linux-doc@vger.kernel.org>; Mon, 13 Jan 2025 09:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736791085; x=1737395885; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=90xDU8T9GXwB9Alx6oCwvrZULAsPLAPSmywSnm6C8ro=;
        b=oMy3m13CuxfT+C6clfsG6s7RWgQpPXz/NwK/k6ApLlBbkRh6e661EAcVtVZIYPx4zC
         DuINlXkYr6yljLzkmwO5fnI17ufRuNscyuVr8lTfGz3/KjVxcFl1ZsFHEiP40o78mZYv
         h8Ndnb2UTljsyg92ciMrEzwGNtXodqnJuRufVwgALcqeiL6MB8jssAlEpTxUG0OPPm56
         bQhO6pZ2bYr1e6FPYj4spLU1qj5xzoS2d/FmH0pyWmqPs+QfGKPJR6TTOjXhQbBpTDNn
         RHOhSaedXbSFtQK3Kc8QCMtvqB1I/XnQxKkKu6Oissjz0MDyM+3DUIRuU9ObuNhOEteB
         RNrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736791085; x=1737395885;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=90xDU8T9GXwB9Alx6oCwvrZULAsPLAPSmywSnm6C8ro=;
        b=wKWFZEQzhnZO+fMMgs3POT8JOZKjo80Kf+PtXtTqs//nXt+uMvtk0cGG7geleLI0Uv
         VrGf15i4k1ab2TJIIBZx1HDbci3ymrqNQSoJJMB/YMzksTLZ3BKXCOW9G4oBMOkW1x8I
         wZodqTL2YDdmZi2ebJm01TQW4YvD/cIcdc3yJoL11BydD7A6UYAHFAeGgWso02POcvdJ
         BLIi7q8kHA16P/NZb/v2rzRdGCPKVHJs4HYtSTfO66u9ELlSUr/d/D2IAyt23TyxRFo0
         iIZLH0tasY6l7onggKl+fz0Gle6q6cDGe/kaj63h2UE7ij5jLP8Yff16eNBOwgZpiZ1b
         GqBg==
X-Forwarded-Encrypted: i=1; AJvYcCW7QcAGjZQpTV9NURL3S0qoMIGjjUjufwaJQRVBKcrJivDWBdNb/7eH0zNFrWjJPLh3bimEndE/mBI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoVnJe33QFDbOrkGrvSi/lejjyXJOAwz4yZ3khC/XuIr2A7ViL
	gU51o4W/LEoklE7nxQAS1wvIcv16GbKOVWB9fKOx0YG7WJ4ft6KNBczE7xovxtN/lJeZYSuupY6
	14HmF29IRmxjJTJ5k/Xa0q0im1Ur2r6ZhnzeJ
X-Gm-Gg: ASbGncu13gNd16oTL8otpZuAb04D5ysumGBaMwhW0xVOwfgaSR6d9TaviddstGzp1Nn
	dRxIatM6uXuvwvejKHMJwnqIPjknJhN5lBi0wvA==
X-Google-Smtp-Source: AGHT+IHH7AsF4K4r5L8CTwcX7/Xvl2j8GKsJsh3z67HWxdhTnp9Y/3B7i6VCL0T5RD5JKKB8wGhwnMZDm9xmJXNose8=
X-Received: by 2002:a05:622a:1b1a:b0:46d:d452:a1b0 with SMTP id
 d75a77b69052e-46dd452a75bmr5536251cf.2.1736791085221; Mon, 13 Jan 2025
 09:58:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250111042604.3230628-1-surenb@google.com> <20250111042604.3230628-14-surenb@google.com>
 <60b60b02-5dbf-4bb0-8301-0e2f511bbc7f@lucifer.local> <frtb77uu5k6low4zub25h4eqkg5jm4rnul3ncrlniwjrgh7vbb@szwcka2qivp7>
In-Reply-To: <frtb77uu5k6low4zub25h4eqkg5jm4rnul3ncrlniwjrgh7vbb@szwcka2qivp7>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 13 Jan 2025 09:57:54 -0800
X-Gm-Features: AbW1kvY6xiVVlhvbR2OfJlzPdp0nmZtAdNS1tpMsFn-2MxLX4_cLtgzjVOa1nRk
Message-ID: <CAJuCfpG=4b31T85Wer+s7vJF4WAO7Sd0TCXsDRzETL76AW5muA@mail.gmail.com>
Subject: Re: [PATCH v9 13/17] mm/debug: print vm_refcnt state when dumping the vma
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org, peterz@infradead.org, 
	willy@infradead.org, david.laight.linux@gmail.com, mhocko@suse.com, 
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

On Mon, Jan 13, 2025 at 8:35=E2=80=AFAM Liam R. Howlett <Liam.Howlett@oracl=
e.com> wrote:
>
> * Lorenzo Stoakes <lorenzo.stoakes@oracle.com> [250113 11:21]:
> > On Fri, Jan 10, 2025 at 08:26:00PM -0800, Suren Baghdasaryan wrote:
> > > vm_refcnt encodes a number of useful states:
> > > - whether vma is attached or detached
> > > - the number of current vma readers
> > > - presence of a vma writer
> > > Let's include it in the vma dump.
> > >
> > > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > > Acked-by: Vlastimil Babka <vbabka@suse.cz>
> > > ---
> > >  mm/debug.c | 12 ++++++++++++
> > >  1 file changed, 12 insertions(+)
> > >
> > > diff --git a/mm/debug.c b/mm/debug.c
> > > index 8d2acf432385..325d7bf22038 100644
> > > --- a/mm/debug.c
> > > +++ b/mm/debug.c
> > > @@ -178,6 +178,17 @@ EXPORT_SYMBOL(dump_page);
> > >
> > >  void dump_vma(const struct vm_area_struct *vma)
> > >  {
> > > +#ifdef CONFIG_PER_VMA_LOCK
> > > +   pr_emerg("vma %px start %px end %px mm %px\n"
> > > +           "prot %lx anon_vma %px vm_ops %px\n"
> > > +           "pgoff %lx file %px private_data %px\n"
> > > +           "flags: %#lx(%pGv) refcnt %x\n",
> > > +           vma, (void *)vma->vm_start, (void *)vma->vm_end, vma->vm_=
mm,
> > > +           (unsigned long)pgprot_val(vma->vm_page_prot),
> > > +           vma->anon_vma, vma->vm_ops, vma->vm_pgoff,
> > > +           vma->vm_file, vma->vm_private_data,
> > > +           vma->vm_flags, &vma->vm_flags, refcount_read(&vma->vm_ref=
cnt));
> > > +#else
> > >     pr_emerg("vma %px start %px end %px mm %px\n"
> > >             "prot %lx anon_vma %px vm_ops %px\n"
> > >             "pgoff %lx file %px private_data %px\n"
> > > @@ -187,6 +198,7 @@ void dump_vma(const struct vm_area_struct *vma)
> > >             vma->anon_vma, vma->vm_ops, vma->vm_pgoff,
> > >             vma->vm_file, vma->vm_private_data,
> > >             vma->vm_flags, &vma->vm_flags);
> > > +#endif
> > >  }
> >
> > This is pretty horribly duplicative and not in line with how this kind =
of
> > thing is done in the rest of the file. You're just adding one entry, so=
 why
> > not:
> >
> > void dump_vma(const struct vm_area_struct *vma)
> > {
> >       pr_emerg("vma %px start %px end %px mm %px\n"
> >               "prot %lx anon_vma %px vm_ops %px\n"
> >               "pgoff %lx file %px private_data %px\n"
> > #ifdef CONFIG_PER_VMA_LOCK
> >               "refcnt %x\n"
> > #endif
> >               "flags: %#lx(%pGv)\n",
> >               vma, (void *)vma->vm_start, (void *)vma->vm_end, vma->vm_=
mm,
> >               (unsigned long)pgprot_val(vma->vm_page_prot),
> >               vma->anon_vma, vma->vm_ops, vma->vm_pgoff,
> >               vma->vm_file, vma->vm_private_data,
> >               vma->vm_flags,
> > #ifdef CONFIG_PER_VMA_LOCK
> >               refcount_read(&vma->vm_refcnt),
> > #endif
> >               &vma->vm_flags);
> > }
>
> right, I had an issue with this as well.
>
> Another option would be:
>
>         pr_emerg("vma %px start %px end %px mm %px\n"
>                 "prot %lx anon_vma %px vm_ops %px\n"
>                 "pgoff %lx file %px private_data %px\n",
>                 <big mess here>);
>         dump_vma_refcnt();
>         pr_emerg("flags:...", vma_vm_flags);
>
>
> Then dump_vma_refcnt() either dumps the refcnt or does nothing,
> depending on the config option.
>
> Either way is good with me.  Lorenzo's suggestion is in line with the
> file and it's clear as to why the refcnt might be missing, but I don't
> really see this being an issue in practice.

Thanks for clarifying! Lorenzo's suggestion LGTM too. I'll adopt it. Thanks=
!

>
> Thanks,
> Liam
>
