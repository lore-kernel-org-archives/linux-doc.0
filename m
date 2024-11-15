Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E055014A088
	for <linux-doc@vger.kernel.org>; Fri, 15 Nov 2024 19:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731697532; cv=none; b=mPPGCmau4wDVQyO/E/0wsX2xJa/yrefeqjdqFTh1K5tYpxIW5UubvEgdatJ2A3P3AygLbAZiKvkvBGR1DFnbJgjgx/eqJnhjvLwjj1OvAxLiALVXGH2Hs6qp+zNdG5fQzdj2mFHPnjNqoGzZNGLoK7w0GionINMcdplV1K88wA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731697532; c=relaxed/simple;
	bh=GmgfIh5oKShk2Li2+R08NSkfoXUqiD4RPd7S43qB+ZY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L0qwQIg2X+SAM8r/NE5tmSYwngcPSFFuET7+vpvRqGN3s0lRkISE0fE2J7DE+H1FdxILhXPiEasxzjTT8ewSaFtVW4Snm5jBHl7ILEU7/4MSk5c7Wx1UWAP8xqUHNNG0mmFLV1CRBCpGBKdCTngMSymVRpSwtPcg1TpTTzSmlSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=U8hd3uMR; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="U8hd3uMR"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5c934b2c991so759a12.0
        for <linux-doc@vger.kernel.org>; Fri, 15 Nov 2024 11:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731697529; x=1732302329; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gDWuaRLf4nb/ylGZiblUFCFUDRY0JX9/yactR3zSqMM=;
        b=U8hd3uMRkuI+KQUwZzJ39FjopAWDJS1I/0vLwd7e+C6UgUyEs8zHtD5Pgi5HIFr20K
         k8FGZJF1kqXXb+HCnj266N4CHWCpsQAdKfPRzxE8ThLa/F6dY2u2rnWRmv3kgZpKUQMu
         kNpnJ/LPg2r4HATQFj4/JWFsGFWFNctr6NuKSCMwJxPmIwI6eP4cgfEskeo9dflvdo7p
         9l0KWBVtQ8a5oCz5h6/m44tbxg6pBddemUEbTZweKM0o61GvvkJBr2Rok/SIF7LZSKLI
         ig4D4ECkb0yyTVUlSHHhmN6sQHXyeWpP5jwQiJOuqR9KwL+TUr4+bMo+4ERnUlNv3XET
         395w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731697529; x=1732302329;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gDWuaRLf4nb/ylGZiblUFCFUDRY0JX9/yactR3zSqMM=;
        b=PV80PukrF1i4CMDY23xncPUOXxRBZVbdEMRQ3M7WDsQxJ4FdFuFs1kICMu4mWoWNxQ
         uM81vPYy7oKbLm3HGsr0yCp4p4rU5sWxDIiqwAVHncdPNne3z4eMrNB0ReadzcapAeLM
         u/0XR9pIua1hEktNHMat+sZWhKL8XW/uPX05xFs+R3SpBNlL5C2AbhK6gnbIplc9bd2T
         XTumZwFgLhcX3d75HsEjPzA2/M5BWePfZfi4W07XXNzO48UzKXC1bEZ3YhGAt2trz2WF
         f4EVxis02ACm85aIGfD9F/qrP4NUN362slujYN4/bHTZs+Yp8l4G/tdTtk8HEdaSz6Zr
         gD7w==
X-Forwarded-Encrypted: i=1; AJvYcCVxKKf7mTqQTgwD7g+MLfghXDWZFWIUZWC0jNLVeInfZzOtg5fh/Q8DX72wat8Qw1qeNFIS5SnkjN8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9/0Vxx5XmmFzS2M5g4B14Ia9fZhHKzFv4BMqKfVn0ZXK9dJ0p
	E+nw2EBbrD+vlMlGB5lgoageksfIKxbjk6zrD1jm2hgQamIhrRAdWUdkbzf2lrJxAb2BjvxcS2i
	bRVOZ2yyIkyRV+VZzzBd04pfvSf9wjHGVyZJW
X-Gm-Gg: ASbGncvoYZni9Vz/ksObMkW3C4w8A3mI8CKuWJDCfqiune6rE5LwF94s/0zOBnc1noV
	KBTJe6W9xvgaDWWok3oGH2wWTGOlkXU9h7uJUVO0p9nVgLoq866WEv1VlvvkJ
X-Google-Smtp-Source: AGHT+IH2FVzAeIWK86Xx4AyI4g2VPcmvGFZpyALoloI/Iew2ZIYilnXSKG0ndR3wDy/v+PfdpX7vaVXBwljNuB74B30=
X-Received: by 2002:a05:6402:1a25:b0:5cf:7b8f:3ec0 with SMTP id
 4fb4d7f45d1cf-5cfa28a8ef0mr1074a12.0.1731697528635; Fri, 15 Nov 2024 11:05:28
 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241114-vma-docs-addition1-onv3-v1-1-ff177a0a2994@google.com> <61f84216-75fa-477b-a9df-6f24476ecd8d@lucifer.local>
In-Reply-To: <61f84216-75fa-477b-a9df-6f24476ecd8d@lucifer.local>
From: Jann Horn <jannh@google.com>
Date: Fri, 15 Nov 2024 20:04:52 +0100
Message-ID: <CAG48ez31XxOa=OJO-H8b4cEeSGjx50403+BejPvDFwvV3vdpMw@mail.gmail.com>
Subject: Re: [PATCH] docs/mm: add more warnings around page table access
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Alice Ryhl <aliceryhl@google.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Hillf Danton <hdanton@sina.com>, 
	Qi Zheng <zhengqi.arch@bytedance.com>, SeongJae Park <sj@kernel.org>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Matteo Rizzo <matteorizzo@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 15, 2024 at 7:02=E2=80=AFPM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
> On Thu, Nov 14, 2024 at 10:12:00PM +0100, Jann Horn wrote:
> > Make it clearer that holding the mmap lock in read mode is not enough
> > to traverse page tables, and that just having a stable VMA is not enoug=
h
> > to read PTEs.
> >
> > Suggested-by: Matteo Rizzo <matteorizzo@google.com>
> > Signed-off-by: Jann Horn <jannh@google.com>
>
> Have some queries before we move forward so would like a little more
> clarification/perhaps putting some extra meat on the bones first.
>
> Broadly very glad you have done this however so it's just sorting details
> first! :>)
>
> > ---
> > @akpm: Please don't put this in your tree before Lorenzo has replied.
> >
> > @Lorenzo:
> > This is intended to go on top of your documentation patch.
> > If you think this is a sensible change, do you prefer to squash it into
> > your patch or do you prefer having akpm take this as a separate patch?
> > IDK what works better...
>
> I think a new patch is better, as I'd like the original to settle down no=
w
> and the whole point of this doc is that it's a living thing that many
> people can contribute to, update, etc.
>
> For instance, Suren is updating as part of one of his series to correct
> things that he changes in that series, which is really nice.
>
> > ---
> >  Documentation/mm/process_addrs.rst | 21 +++++++++++++++++++--
> >  1 file changed, 19 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/mm/process_addrs.rst b/Documentation/mm/proc=
ess_addrs.rst
> > index 1bf7ad010fc063d003bb857bb3b695a3eafa0b55..9bdf073d0c3ebea17078125=
08a309aa4a6163660 100644
> > --- a/Documentation/mm/process_addrs.rst
> > +++ b/Documentation/mm/process_addrs.rst
> > @@ -339,6 +339,16 @@ When **installing** page table entries, the mmap o=
r VMA lock must be held to
> >  keep the VMA stable. We explore why this is in the page table locking =
details
> >  section below.
> >
> > +.. warning:: Taking the mmap lock in read mode **is not sufficient** f=
or
> > +             traversing page tables; you must also ensure that a VMA e=
xists that
> > +             covers the range being accessed.
>
> Hm, but we say later we don't need _any_ locks for traversal, and here we
> say we need mmap read lock. Do you mean installing page table entries?
>
> Or do you mean to say, that if you don't span a VMA, you must acquire a
> write lock at least to preclude this?

Yeah, this is what I meant with the "you must also ensure that a VMA
exists" part. (Context is that I was looking at some non-upstream code
that was trying to do exactly this - take a userspace-supplied address
and walk down the page tables at that address. Upstream also once had
a UAF in pagemap_walk() because walk_page_range() was used while
holding only the mmap read lock, see
<https://project-zero.issues.chromium.org/42451485>.)

> This seems quite unclear.
>
> I kind of didn't want to touch on the horrors of fiddling about without a
> VMA, so I'd rather this very clearly say something like 'it is unusual to
> manipulate page tables wihch are not spanned by a VMA, and there are
> special requirements for this operation' etc. et.c otherwise this just ad=
ds
> more noise and confusion I think.

I guess maybe we could replace this entire warning block with
something like this?

".. warning:: Page tables are normally only traversed in regions
covered by VMAs. If you want to traverse page tables in areas that
might not be covered by VMAs, heavier locking is required. See
:c:func:`!walk_page_range_novma` for details."

And walk_page_range_novma() already has a comment block talking about
why an mmap read lock isn't enough to traverse user virtual address
space outside VMAs.

> > +             This ensures you can't race with concurrent page table re=
moval
> > +             which happens with the mmap lock in read mode, in regions=
 whose
> > +             VMAs are no longer present in the VMA tree.
> > +
> > +             (Alternatively, the mmap lock can be taken in write mode,=
 but that
> > +             is heavy-handed and almost never the right choice.)
>
> You kind of need to expand on why that is I think!
>
> > +
> >  **Freeing** page tables is an entirely internal memory management oper=
ation and
> >  has special requirements (see the page freeing section below for more =
details).
> >
> > @@ -450,6 +460,9 @@ the time of writing of this document.
> >  Locking Implementation Details
> >  ------------------------------
> >
> > +.. warning:: Locking rules for PTE-level page tables are very differen=
t from
> > +             locking rules for page tables at other levels.
> > +
> >  Page table locking details
> >  --------------------------
> >
> > @@ -470,8 +483,12 @@ additional locks dedicated to page tables:
> >  These locks represent the minimum required to interact with each page =
table
> >  level, but there are further requirements.
> >
> > -Importantly, note that on a **traversal** of page tables, no such lock=
s are
> > -taken. Whether care is taken on reading the page table entries depends=
 on the
> > +Importantly, note that on a **traversal** of page tables, sometimes no=
 such
> > +locks are taken. However, at the PTE level, at least concurrent page t=
able
> > +deletion must be prevented (using RCU) and the page table must be mapp=
ed into
> > +high memory, see below.
>
> Ugh I really do hate that we have to think about high memory. I'd like to
> sort of deny it exists. But I suppose that's not an option.

(FWIW from a quick look I think only arm and x86 actually have this behavio=
r.)

I mean... we could try to just make userspace page tables live in
non-high-memory based on the assumption that nobody nowadays is going
to run a 32-bit kernel on a device with significantly more than 4G or
8G or so of RAM, and probably most memory is used for stuff like
anon/file pages, not for page tables... but I don't think it actually
matters much for code complexity now that we need RCU for page table
access anyway.

> As for the RCU thing, I guess this is why pte_offset_map_lock() is taking
> it? Maybe worth mentioning something there or updating that 'interestingl=
y'
> block... :>)

Yeah, and not just pte_offset_map_lock() but also pte_offset_map() and
such which don't lock the page table.

> Or am I mistaken? I wasn't aware of this requirement, is this sort of
> implied by the gup_fast() IRQ disabling stuff?

This is to protect against khugepaged/MADV_COLLAPSE deleting page
tables while holding only an rmap lock (in read mode), the pmd lock,
and the pte lock. So a concurrent call to MADV_COLLAPSE (potentially
in another process) can (via retract_page_tables()) remove the page
table while we're traversing it, but the page table will only actually
be freed via RCU (thanks to pte_free_defer), and so this doesn't cause
use-after-free. pte_offset_map_lock() ensures that on success, it has
locked the current page table (holding the pte lock prevents the page
table being removed in the future, and rechecking the pmd entry
ensures it hasn't already been removed), so we never end up installing
PTEs into page tables that have already been removed. pte_offset_map()
does not ensure that you always see the latest page table; it could be
that by the time you're looking at a PTE inside it, the page table
you're looking at has been removed, and a new page table has been
installed in its place and populated with PTEs. But removed page
tables are always empty, so the only possible consequence of such a
race is that you wrongly think that there is no PTE at a given
address.

The fourth paragraph of the comment block above
__pte_offset_map_lock() sorta explains this.

> Please expand :)
