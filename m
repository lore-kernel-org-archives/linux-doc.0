Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633691D3199
	for <linux-doc@vger.kernel.org>; Tue,  5 Nov 2024 13:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730815020; cv=none; b=MGPntDd7+7218Ah5+DhrmwF5BC1PSgSSP+Rgu6z2JGGxEbYozecquOI67KeBMhAYAWzJllyw480YhQHaUZ6onGJhRaulLq12RuRCR903clsd6kjJbgLeU+1fOFjFY4g+cjNivTjcX75ZUFqUMUUPyPFdeWRJrbnWbxLJyux4T/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730815020; c=relaxed/simple;
	bh=DJkjA7NJvQi23HKgxrx3OCRxRVzocnpwy7YwAOlhaho=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RgSeY9aliNGskhCrAJPvlIbp1+sUY7bBVxnv3bBwsM/gx6ATl5/eA0XB38ScJ389AVlHDyzf3zGSZprL5hZMvJMiwp1004Qh7ZVS8aijTMtQiQNuLJBQFW5haaZIyjDQMktRZI/CrFZlPHG/MOrclKiAde0j+2bGMtn5JyEP4ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yPfSZpV9; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yPfSZpV9"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-37d4c482844so3430979f8f.0
        for <linux-doc@vger.kernel.org>; Tue, 05 Nov 2024 05:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730815016; x=1731419816; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DzlpItDjbomglGLyYv6ZYQR5XIRTbsFKXOc4xD6qxj0=;
        b=yPfSZpV9xIyHTVRjNBftb8cG+k8txZYDNGVhJaggxxTuwDRx7u7vJrGlKXiwE8wB24
         xCBDZuH4wnFZAAPMP+lOXjz0Qfzk7Z2V91POoxRw4q9uBCSjTUpuQKb/nMhD0k5tdwNl
         pcjczIzpd8cOHLuYpVhgZ/pM4WCJU5KCy/7wxx7f7LXKRC4Ly2HUZ3ifYdnUYcSc7EOM
         AQWA9ZBjDULh/zkkRtvydggWLZgj1N8GB8ywkVP79bSRIBmSQ1sSm6M+gL9CQ9DZ1ET5
         FoYlxgoz1TfTBNHRSV7xWZ5jrEWITM2v8vpjEyH0lnKaj4u46v6GoHJL2wE0UD9v+pSf
         jpSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730815016; x=1731419816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DzlpItDjbomglGLyYv6ZYQR5XIRTbsFKXOc4xD6qxj0=;
        b=VJTe3MQSzlanougfWbaEQcr5es1G4QuhWD/c3CohhttlaoHNEsMcxCbBE+nKG1xfbX
         jcxjI3nE2TKrJKoibSqsPp2EvX+lXSqBaMTM09Q9QNWR4dMgUMatqYe7RU47//jCxpBs
         aCB1qZFR4idYYNcL2naOayHdZGOzROmj/USO1BDTQ2Mb8UdxgZ+cIVhMpGqxbZ0FH/9o
         L+/90e/TvP91bwsuLviKQ3lXtGS3PHsT3vAsBdqFWq62RKn4DTHjh+yR8hB1OXpIQOc+
         oRYO8UO2PiqXtWGGF5Qd9LdIOpyuxSforHp3bTcI6BH+wAg6eRx6C3DlHjbhS4YDgj5I
         9JHA==
X-Forwarded-Encrypted: i=1; AJvYcCWqjFKKCRWsztNJ518uZG3jiTu/IVMqvGxPVSkH+uPcTk2HevHosfKuaSDO/J5Z7NBwNpsqrEGRv1g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWylFfuyC7JzeU2mKn9gL4XvoKX91zmpEM9Z8FDGTrvoqxGUav
	qOenuFLjcudaFSmypzC/4AIsurbxfLN/nv8oJs95yfqdPoe1L6qX5lIB1lyPBsS08bid7YKJd+Z
	N5k24srDkf1DQDA9W3uQYCfCOrSUzO3CJUDod
X-Google-Smtp-Source: AGHT+IGfGtcBSbUN4qfO7S8deLzFzsXT/Kon05UIs3myi6cEll38dO8bx64onPiGM+Aa+P5MdR7PO/Cmb45AkaZsNCM=
X-Received: by 2002:a05:6000:11cb:b0:37d:3f81:153e with SMTP id
 ffacd0b85a97d-380611282d9mr23992523f8f.14.1730815015642; Tue, 05 Nov 2024
 05:56:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241101185033.131880-1-lorenzo.stoakes@oracle.com>
 <CAH5fLggUZJpmSd7F_k5bVKs0-ErK_74-zpWgMyWHX4vcSM-8Lg@mail.gmail.com> <e41dcb48-b59e-4d70-98f7-da18fafba31b@lucifer.local>
In-Reply-To: <e41dcb48-b59e-4d70-98f7-da18fafba31b@lucifer.local>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 5 Nov 2024 14:56:43 +0100
Message-ID: <CAH5fLggpEezhR_o+8RPmYix-JLZ47HwQLQM2OUzKQg3i7UYu5Q@mail.gmail.com>
Subject: Re: [RFC PATCH] docs/mm: add VMA locks documentation
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Matthew Wilcox <willy@infradead.org>, 
	Mike Rapoport <rppt@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Suren Baghdasaryan <surenb@google.com>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 4, 2024 at 5:52=E2=80=AFPM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> +cc Suren, linux-doc who I mistakenly didn't cc in first email!
>
> On Mon, Nov 04, 2024 at 03:47:56PM +0100, Alice Ryhl wrote:
> > On Fri, Nov 1, 2024 at 7:50=E2=80=AFPM Lorenzo Stoakes
> > <lorenzo.stoakes@oracle.com> wrote:
> > >
> > > Locking around VMAs is complicated and confusing. While we have a num=
ber of
> > > disparate comments scattered around the place, we seem to be reaching=
 a
> > > level of complexity that justifies a serious effort at clearly docume=
nting
> > > how locks are expected to be interacted with when it comes to interac=
ting
> > > with mm_struct and vm_area_struct objects.
> > >
> > > This is especially pertinent as regards efforts to find sensible
> > > abstractions for these fundamental objects within the kernel rust
> > > abstraction whose compiler strictly requires some means of expressing=
 these
> > > rules (and through this expression can help self-document these
> > > requirements as well as enforce them which is an exciting concept).
> > >
> > > The document limits scope to mmap and VMA locks and those that are
> > > immediately adjacent and relevant to them - so additionally covers pa=
ge
> > > table locking as this is so very closely tied to VMA operations (and =
relies
> > > upon us handling these correctly).
> > >
> > > The document tries to cover some of the nastier and more confusing ed=
ge
> > > cases and concerns especially around lock ordering and page table tea=
rdown.
> > >
> > > The document also provides some VMA lock internals, which are up to d=
ate
> > > and inclusive of recent changes to recent sequence number changes.
> > >
> > > Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> >
> > [...]
> >
> > > +Page table locks
> > > +----------------
> > > +
> > > +When allocating a P4D, PUD or PMD and setting the relevant entry in =
the above
> > > +PGD, P4D or PUD, the `mm->page_table_lock` is acquired to do so. Thi=
s is
> > > +acquired in `__p4d_alloc()`, `__pud_alloc()` and `__pmd_alloc()` res=
pectively.
> > > +
> > > +.. note::
> > > +   `__pmd_alloc()` actually invokes `pud_lock()` and `pud_lockptr()`=
 in turn,
> > > +   however at the time of writing it ultimately references the
> > > +   `mm->page_table_lock`.
> > > +
> > > +Allocating a PTE will either use the `mm->page_table_lock` or, if
> > > +`USE_SPLIT_PMD_PTLOCKS` is defined, used a lock embedded in the PMD =
physical
> > > +page metadata in the form of a `struct ptdesc`, acquired by `pmd_ptd=
esc()`
> > > +called from `pmd_lock()` and ultimately `__pte_alloc()`.
> > > +
> > > +Finally, modifying the contents of the PTE has special treatment, as=
 this is a
> > > +lock that we must acquire whenever we want stable and exclusive acce=
ss to
> > > +entries pointing to data pages within a PTE, especially when we wish=
 to modify
> > > +them.
> > > +
> > > +This is performed via `pte_offset_map_lock()` which carefully checks=
 to ensure
> > > +that the PTE hasn't changed from under us, ultimately invoking `pte_=
lockptr()`
> > > +to obtain a spin lock at PTE granularity contained within the `struc=
t ptdesc`
> > > +associated with the physical PTE page. The lock must be released via
> > > +`pte_unmap_unlock()`.
> > > +
> > > +.. note::
> > > +   There are some variants on this, such as `pte_offset_map_rw_noloc=
k()` when we
> > > +   know we hold the PTE stable but for brevity we do not explore thi=
s.
> > > +   See the comment for `__pte_offset_map_lock()` for more details.
> > > +
> > > +When modifying data in ranges we typically only wish to allocate hig=
her page
> > > +tables as necessary, using these locks to avoid races or overwriting=
 anything,
> > > +and set/clear data at the PTE level as required (for instance when p=
age faulting
> > > +or zapping).
> >
> > Speaking as someone who doesn't know the internals at all ... this
> > section doesn't really answer any questions I have about the page
> > table. It looks like this could use an initial section about basic
> > usage, and the detailed information could come after? Concretely, if I
> > wish to call vm_insert_page or zap some pages, what are the locking
> > requirements? What if I'm writing a page fault handler?
>
> Ack totally agree, I think we need this document to serve two purposes -
> one is to go over, in detail, the locking requirements from an mm dev's
> point of view with internals focus, and secondly to give those outside mm
> this kind of information.
>
> It's good to get insight from an outside perspective as inevitably we mm
> devs lose sight of the wood for the trees when it comes to internals
> vs. practical needs of those who make use of mm in one respect or another=
.
>
> So this kind of feedback is very helpful and welcome :) TL;DR - yes I wil=
l
> explicitly state what is required for various operations on the respin.
>
> >
> > Alice
>
> As a wordy aside, a large part of the motivation of this document, or
> certainly my prioritisation of it, is explicitly to help the rust team
> correctly abstract this aspect of mm.
>
> The other part is to help the mm team, that is especailly myself, correct=
ly
> understand and _remember_ the numerous painful ins and outs of this stuff=
,
> much of which has been pertinent of late for not wonderfully positive
> reasons.
>
> Hopefully we accomplish both! :>)

I do think this has revealed one issue with my Rust patch, which is
that VmAreaMut currently requires the mmap lock, but it should also
require the vma lock, since you need both for writing.

Alice
