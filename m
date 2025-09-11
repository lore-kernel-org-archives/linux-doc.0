Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94104A04
	for <linux-doc@vger.kernel.org>; Thu, 11 Sep 2025 19:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757619944; cv=none; b=N94FUUpquIQqXOO6WL41OrRAvMWaDhAZNCR0NzSsomayLTPIuKwyHzyFk5fiidxZANKuGXXVEPfjXtQweIwqlK6fh9MA2qA9i8UdutSTa9MwBNEUbJvQX0p7Mmski5ovnRMsuQvABQeJ9QMDJKBS75o8hqBNrzfnsNCY0tDsiOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757619944; c=relaxed/simple;
	bh=UQ+azyfBJLEVgkFhkxQAX5mILv2bK5F4BrYoZ1qtVXw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g5LT2Q5e2x/OQ+B9dqmv5XK1jfUUEhud6VIzPQjq54NjVx4X/RCvNrGBL4bAnxh6MksIO0kwZ75oFzxoHv9qrcar+5KM5zsumuXB4aL4OYKOUt7jXujWYeBqJqD+kpAomaE+hhTpaR9c1taz97L9oVr7XksWrPm7iwgN7Tusv6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YLBcoqgU; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YLBcoqgU"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7e872c3a0d5so102041385a.2
        for <linux-doc@vger.kernel.org>; Thu, 11 Sep 2025 12:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757619942; x=1758224742; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9P8qpgTT4CD1z1EW5R7hzuqr8lbCC0uLuzD1yVLy364=;
        b=YLBcoqgU97MjY4GRNc4p/EuGAC+N80AaYgJr+GJfZLPc509VrC1VeR8HsvfR35k/cz
         qutlvx+nqrTq52jml39wKxv/4H/RUi1rxsDFpt3F6ylRJzMNuqRn48mCjui6gcUkgyhR
         RCNOmF0pICwgFXQf6LZiAv890abcvcWFts0ttbuEa1iPw/6nAFmzSrf9nUXk1MRxjLxv
         1OOoWdXOncvmYRWUBIEWxhy9wx2BzYwjJ5i44HV/A6Xi3N4/bX+STLHybAc6q+RJHjWD
         N1CCWApIhgeGyBVezzrrOyBCE/DnR5IJ0pAN/bgxkcVv8a98e65s35+U8t3eTYYts5XX
         afXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757619942; x=1758224742;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9P8qpgTT4CD1z1EW5R7hzuqr8lbCC0uLuzD1yVLy364=;
        b=w2fc6I09SKqg1P/lb0H5VH05TmE+n1zpNjQ6CxKKNKJ0VpXRbtCY83tEcNlVUolVF8
         kSr3XPh/sERJc/Vd5cWsQmugzIvrYWOkaLJJFe3lpkGsB2xR4OtYMIXLIK1xE75yuZU/
         rXBs3WbhJs+4PfMhV1zLj6xFjs8v1T2+bKkbD7saEKGlTLTX8c+J0u2yz1jh0xFWUsEq
         mxwkSVrjfcI1zilMGlAmCYV3WAVdAuLv/dZUbaCmH+82qpTUTJGx7p/w7BLmzcO7h8sk
         r1TRiZeIwG+ZJ99yuEuzEnqUx1PTuxydg9UIPmzBXrRGEDQ3Rexxd4xpV8QT5r8NzWgv
         epjg==
X-Forwarded-Encrypted: i=1; AJvYcCWN/HVTlBeTChkdKKXy3s9DdJK76kFwrT91HlDb3g2jA4qADu+cJ4i70EMgDqXb8isjf+iVAppyzlg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz885VVgy9uSTRg0569dl+C5Vui/Ikv5KwnBMVxFieEyfIihjoo
	sSTBtcJrWc29Oy10H0z6SrgceEoFZaIErbtzEffiQmIyYVeCpj8rAyiGSelYeEc24VcOpj0deBk
	CbpkHhoqv0Qv4B1A55suUsJWwwMkaZCA=
X-Gm-Gg: ASbGncs67HgbE3Ao11vkIJBLmUzX5h0MHaNYiTzDtCTc1YEMgdwpht+i0GIP1kPfvFD
	K5+lfKhYnt+q5cyn1KSxYBV12yKdZCdM5tLWhbwiflE4bnTJbDfUy1MmQVTy1GaTgCqldBWZ5MG
	jvQ7NvVtTZEC/TOlBADjMOkfasYcSLVcYiQba1VuPq54XRqqkm6Z+a0QIMJEabQLcU4SJP0gNmM
	FBkmIKze/luJ5PkD1Lpeeuuh2xAXQcA0skAWOxd1pEq
X-Google-Smtp-Source: AGHT+IHtAw0lVlpGGJ06gAtOTDihqoXPOrWbMz80FfAkP5uWz95A2L7X1pd/xRQ1MQFSLXu83sUO6jrrXMjhd4e0uMw=
X-Received: by 2002:a05:620a:d88:b0:807:87a9:89a1 with SMTP id
 af79cd13be357-823fd41926bmr100960385a.37.1757619941606; Thu, 11 Sep 2025
 12:45:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250908185122.3199171-1-joannelkoong@gmail.com>
 <20250908185122.3199171-14-joannelkoong@gmail.com> <a1529c0f-1f1a-477a-aeeb-a4f108aab26b@linux.alibaba.com>
 <CAJnrk1aCCqoOAgcPUpr+Z09DhJ5BAYoSho5dveGQKB9zincYSQ@mail.gmail.com>
 <0b33ab17-2fc0-438f-95aa-56a1d20edb38@linux.alibaba.com> <aMK0lC5iwM0GWKHq@infradead.org>
 <9c104881-f09e-4594-9e41-0b6f75a5308c@linux.alibaba.com>
In-Reply-To: <9c104881-f09e-4594-9e41-0b6f75a5308c@linux.alibaba.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Thu, 11 Sep 2025 15:45:28 -0400
X-Gm-Features: Ac12FXwgTb8F5lYaNAIGfAVGCddROzFscVCRkbUHIIucMvNsiS1K_faJqDoLwX4
Message-ID: <CAJnrk1b2_XGfMuK-UAej31TtCAAg5Aq8PFS_36yyGg8NerA97g@mail.gmail.com>
Subject: Re: [PATCH v2 13/16] iomap: move read/readahead logic out of
 CONFIG_BLOCK guard
To: Gao Xiang <hsiangkao@linux.alibaba.com>
Cc: Christoph Hellwig <hch@infradead.org>, brauner@kernel.org, miklos@szeredi.hu, 
	djwong@kernel.org, linux-block@vger.kernel.org, gfs2@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, kernel-team@meta.com, 
	linux-xfs@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 11, 2025 at 8:29=E2=80=AFAM Gao Xiang <hsiangkao@linux.alibaba.=
com> wrote:
>
> Hi Christoph,
>
> On 2025/9/11 19:37, Christoph Hellwig wrote:
> > On Wed, Sep 10, 2025 at 12:59:41PM +0800, Gao Xiang wrote:
> >> At least it sounds better on my side, but anyway it's just
> >> my own overall thought.  If other folks have different idea,
> >> I don't have strong opinion, I just need something for my own
> >> as previous said.
> >
> > I already dropped my two suggestions on the earlier patch.  Not totally
> > happy about either my suggestions or data, but in full agreement that
> > it should be something else than private.
>
> To just quote your previous comment and try to discuss here:
>
> ```
> On Wed, Sep 10, 2025 at 01:41:25PM -0400, Joanne Koong wrote:
> > In my mind, the big question is whether or not the data the
> > filesystems pass in is logically shared by both iomap_begin/end and
> > buffered reads/writes/dio callbacks, or whether the data needed by
> > both are basically separate entities
>
> They are separate entities.
> ```
>

Hi Gao,

> I try to push this again because I'm still not quite sure it's
> a good idea, let's take this FUSE iomap-read proposal (but sorry
> honestly I not fully look into the whole series.)
>
> ```
>   struct fuse_fill_read_data {
>         struct file *file;
> +
> +       /*
> +        * Fields below are used if sending the read request
> +        * asynchronously.
> +        */
> +       struct fuse_conn *fc;
> +       struct fuse_io_args *ia;
> +       unsigned int nr_bytes;
>   };
> ```
>
> which is just a new FUSE-only-specific context for
> `struct iomap_read_folio_ctx`, it's not used by .iomap_{begin,end}
> is that basically FUSE _currently_ doesn't have logical-to-physical
> mapping requirement (except for another fuse_iomap_begin in dax.c):

I don't think this is true. The other filesystems in the kernel using
iomap that do need logical to physical mappings also do not have their
context for `struct iomap_read_folio_ctx` (the struct bio) used by
.iomap_{begin, end} either. As I see it, the purpose of the `struct
iomap_read_folio_ctx` context is for processing/issuing the reads and
the context for .iomap_{begin,end} is for doing all the mapping /
general metadata tracking stuff - even for the filesystems that have
the logical to physical mapping requirements, their usage of the
context is for processing/submitting the bio read requests, which imo
the more high-level iomap_{begin,end} is a layer above.

> ```
> static int fuse_iomap_begin(struct inode *inode, loff_t offset, loff_t le=
ngth,
>                              unsigned int flags, struct iomap *iomap,
>                              struct iomap *srcmap)
> {
>          iomap->type =3D IOMAP_MAPPED;
>          iomap->length =3D length;
>          iomap->offset =3D offset;
>          return 0;
> }
> ```
>
> But if FUSE or some other fs later needs to request L2P information
> in their .iomap_begin() and need to send L2P requests to userspace
> daemon to confirm where to get the physical data (maybe somewhat
> like Darrick's work but I don't have extra time to dig into that
> either) rather than just something totally bypass iomap-L2P logic
> as above, then I'm not sure the current `iomap_iter->private` is
> quite seperate to `struct iomap_read_folio_ctx->private`, it seems

If in the future this case arises, the L2P mapping info is accessible
by the read callback in the current design. `.read_folio_range()`
passes the iomap iter to the filesystem and they can access
iter->private to get the L2P mapping data they need.

> both needs fs-specific extra contexts for the same I/O flow.
>
> I think the reason why `struct iomap_read_folio_ctx->private` is
> introduced is basically previous iomap filesystems are all
> bio-based, and they shares `bio` concept in common but
> `iter->private` was not designed for this usage.
>
> But fuse `struct iomap_read_folio_ctx` and
> `struct fuse_fill_read_data` are too FUSE-specific, I cannot
> see it could be shared by other filesystems in the near future,
> which is much like a single-filesystem specific concept, and
> unlike to `bio` at all.

Currently fuse is the only non-block-based filesystem using iomap but
I don't see why there wouldn't be more in the future. For example,
while looking at some of the netfs code, a lot of the core
functionality looks the same between that and iomap and I think it
might be a good idea to have netfs in the future use iomap's interface
so that it can get the large folio dirty/uptodate tracking stuff and
any other large folio stuff like more granular writeback stats
accounting for free.


Thanks,
Joanne

>
> I've already racked my brains on this but I have no better
> idea on the current callback-hook model (so I don't want to argue
> more). Anyway, I really think it should be carefully designed
> (because the current FUSE .iomap_{begin,end} are just like no-op
> but that is just fuse-specific).  If folks really think Joanne's
> work is already best or we can live with that, I'm totally fine.
>
> Thanks,
> Gao Xiang
>
