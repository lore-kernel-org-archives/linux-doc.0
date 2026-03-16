Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D418377567
	for <linux-doc@vger.kernel.org>; Mon, 16 Mar 2026 22:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773701980; cv=pass; b=Wca1E/K1o9WPc3Qtr7QSDsuQlQwUWhMTY5y5/yu/WfJrbbtomU1HV1WyhJtT5eMbLP3S3uSMxUGfzHYH/1A+XQ7Y8Wzon7D/oIZ4FbFWpyGWAVn9dvexZgJTfoq7OcVSaDaOXfRHOYt6hfZ3ChcwFonIoCnCtAVgUMUu+XHbg78=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773701980; c=relaxed/simple;
	bh=n5yqztpjRLufPkj5VJdYxT7NEGdWEh93DgrTEzhQ/40=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oEIlOGO1E0H/UlvHYSR1iQLY+NuwUee6hVusws9TCtuaeagAs1dOkLGRMmyKqtpIrT78K1YEQNzgRiZcx7ROSzf2/9q2XqkmeACvWITIx4wC0zhrPjzmlTNWedbiiIN9iB89q5+qEEfluNn2DztFmcoDOvcgiCvcHQOKeC3gUGM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DMh6LtIz; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DMh6LtIz"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-50906a98ffeso251601cf.0
        for <linux-doc@vger.kernel.org>; Mon, 16 Mar 2026 15:59:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773701978; cv=none;
        d=google.com; s=arc-20240605;
        b=Zku2Wa04ixs4cm/YbtonWF65mp8PkUPlil5SAb2wRA0ovSpCm+yZmEvf6xbhMrrQbn
         Z4OVO5dPBWEc6HjUS/d+XpyTKfQEF7ugWH2MW+Rj+lloooZJqn8GIo/0JNi0wizeEa4t
         47ZfBudsZ7DHL8WXJfKVKYtaeUaAoU2w7vJba+cUFGsg9lBGbDH+qNcvX/6c4PXfPqgC
         Sg+Qy3BonJ1lsZpurhzeG5jZqsYp3+QzF7Gst1S+qIRlVPLEGA5kgXI51cuYT9d1m1FN
         oHFeCx+GIGyo/cfRSGNAkq5gdNgljM8PdTIbN8bBJ6VgtXprfEltGgfMTzNZiyAv6/Qo
         zkTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q4cJcFtf4hpm0T0e+VviEvUx2ruLtbnKyeEs5ldKrcs=;
        fh=QqsQTbLCH0kieMNpAeJ8uNQG6n76a9Y2d+U0FZNxWbo=;
        b=c8ZuscrSvvibavGllwFaGWaNl4LEpU2UTd7m5qw7aL+MPrSY0gUBF04UacaJQUPGQK
         2gEtKWk+Q/BHMHqyt87mYFkx5Lz8DWBdMz5LiJfNF3SqAmW8Y+IXklUoVFpl7ZPygWpp
         Ep+JnkhXYX3D5rQsS417Sjy9wj2srQY1cFX87sjy5LhejeUByyp5Axv2Y+zv9qea0VAl
         pSnqMnbRyybz9tvbpoN0o4YUQhqW4XZ6RTf1GVHPUQIcalIk7YuCU1Dl9zZE4eHgEb32
         A7pWOBTpq5uvbZL9DtUFGCJU/iz2PLD54VoRofKjfoHP2zsGrmQLIVb3xT8bS3t1xw/W
         UrVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773701978; x=1774306778; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q4cJcFtf4hpm0T0e+VviEvUx2ruLtbnKyeEs5ldKrcs=;
        b=DMh6LtIzSVg4b4oelvmsNsDfbzbWWsMFFLbjMmv/YlM02GhO16UEdWQZg6lkAWRPiY
         e1b0KmY3hHsxDAB3vmpZRocTb7NTd5tHB/ikcd4xsxBL5ldcfp1KOJcM0VpyFU2AHvh4
         4uAdbzOZDE8uME31qR4W+uzm6Lwmwy2dZvyHFo2Rvt0dl5/tGGx2rGVR0o33Shwynwvr
         usSOa+82hpfddhkC5h1VRXC3VG8AwpLJ6dprpIWAojy9ZSikFkE8q9NMDEUo9lluWdWH
         bYJ5XaoPqjjoP33My/z3yFOUMrxZ9H5m7N826oNInydhwQo/asZ6I6F/C8NerdVOsS7o
         L/qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773701978; x=1774306778;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q4cJcFtf4hpm0T0e+VviEvUx2ruLtbnKyeEs5ldKrcs=;
        b=a1Ol8kJp8GAocwVXi6yRB2N+mOGqyFYZvdQ34Kjm5k+qvLdfPL8fcLsgKxQ0Zpt267
         SbsWixL5k7wYvo1IFJPlw7Qu57t4CDv7eNUFACgOkVnL82jLmQi1o7fWa0kl7TKvkBtk
         MWYX4CGsXnwhnciwZ1Y04euuy3zsIVHqt4Ev9gkVzSAk86qrZOzLjz/n4NbqibNsZ6JN
         ngezCTQLlrTRbIshvQWJv3kI/Qvc/kh+MtAXT+cgtQ7F9fJ/SwsN5uznslBiqCDNiw5i
         1i7AYr9MPv5bJlCgPPdIMJJUKQqw0s3WwlisZGfHrF+VB7/jv7HLSE5NutV3GOcKn51A
         AiyA==
X-Forwarded-Encrypted: i=1; AJvYcCXQcbkZyn9eycXVbfcuZKW8MPTYXyz+myKUA/gQkXUDy/OsIE0dY7aHp7ekB1nMTto450SW74X2XTE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyI5IDd9bdwwbq3kK/2HfDE/ypw72jJ7Iy7meFCCJFDnaIexyi5
	TyhowrN7TbhJyPorc+65ZjMQMMK06HB2FjrEum4Gq+q/0EUOT9ks7vpGJyuBSgiYlW8qIKmdwNT
	zJDu+z52w+JA8rbwkd5L3cq3gFJFRMWJdhxnNwUuM
X-Gm-Gg: ATEYQzx/vk6yCyMF3VUMniURMQ37/BaShqXwVxx0ukcjzGZ2gcDhwy5O9sXh8cyilPp
	ZrnpdbShgRveqnLkncEVOE252czYU9Vy8OSWGhgvc+ULTmVotfOusQ44BdmChgKA/ge7uBw/Sgt
	522Y4Ft3qlwBEgS/vqfCw8jnXXVtzuxAgN2am66cxqWAErjaE8RbBNU4xFcNASbnfaFOk4r7gKI
	4uDt5DOcfMBYKLltWl0p/e80di5WY+jpgIAO13xWcaN1iZ7cC/9zCpJ9LelKqrRakcIj4eBGRsE
	dS/I2tZRo4fr/vH+
X-Received: by 2002:ac8:5e12:0:b0:4f3:54eb:f26e with SMTP id
 d75a77b69052e-5099ac78738mr2798501cf.1.1773701977490; Mon, 16 Mar 2026
 15:59:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1773346620.git.ljs@kernel.org> <c5bb61cf789df1ecb32facc29df9749987c7ddfc.1773346620.git.ljs@kernel.org>
 <CAJuCfpGd702=Xop3X5Aop9rrScdiAOQEEooTu1gcJqR9pmO5GA@mail.gmail.com> <6a0e73a5-519e-49ca-9f76-2f6cc5a1577c@lucifer.local>
In-Reply-To: <6a0e73a5-519e-49ca-9f76-2f6cc5a1577c@lucifer.local>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 16 Mar 2026 15:59:26 -0700
X-Gm-Features: AaiRm5118TD3MF16DHCGoLHkzYMnffHjhVhwrz0uUgfCnERLy0ui_OLbleubf-w
Message-ID: <CAJuCfpEjTw1nQik_HWXHg2su2DwzPrn5NPGpeAVPrjJK0tOSkg@mail.gmail.com>
Subject: Re: [PATCH 02/15] mm: add documentation for the mmap_prepare file
 operation callback
To: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
	Clemens Ladisch <clemens@ladisch.de>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "K . Y . Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Bodo Stroesser <bostroesser@gmail.com>, 
	"Martin K . Petersen" <martin.petersen@oracle.com>, David Howells <dhowells@redhat.com>, 
	Marc Dionne <marc.dionne@auristor.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, David Hildenbrand <david@kernel.org>, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, Jann Horn <jannh@google.com>, 
	Pedro Falcato <pfalcato@suse.de>, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org, 
	linux-staging@lists.linux.dev, linux-scsi@vger.kernel.org, 
	target-devel@vger.kernel.org, linux-afs@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	Ryan Roberts <ryan.roberts@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 16, 2026 at 12:17=E2=80=AFPM Lorenzo Stoakes (Oracle)
<ljs@kernel.org> wrote:
>
> On Sun, Mar 15, 2026 at 04:23:14PM -0700, Suren Baghdasaryan wrote:
> > On Thu, Mar 12, 2026 at 1:27=E2=80=AFPM Lorenzo Stoakes (Oracle) <ljs@k=
ernel.org> wrote:
> > >
> > > This documentation makes it easier for a driver/file system implement=
er to
> > > correctly use this callback.
> > >
> > > It covers the fundamentals, whilst intentionally leaving the less lov=
ely
> > > possible actions one might take undocumented (for instance - the
> > > success_hook, error_hook fields in mmap_action).
> > >
> > > The document also covers the new VMA flags implementation which is th=
e only
> > > one which will work correctly with mmap_prepare.
> > >
> > > Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
> > > ---
> > >  Documentation/filesystems/mmap_prepare.rst | 131 +++++++++++++++++++=
++
> > >  1 file changed, 131 insertions(+)
> > >  create mode 100644 Documentation/filesystems/mmap_prepare.rst
> > >
> > > diff --git a/Documentation/filesystems/mmap_prepare.rst b/Documentati=
on/filesystems/mmap_prepare.rst
> > > new file mode 100644
> > > index 000000000000..76908200f3a1
> > > --- /dev/null
> > > +++ b/Documentation/filesystems/mmap_prepare.rst
> > > @@ -0,0 +1,131 @@
> > > +.. SPDX-License-Identifier: GPL-2.0
> > > +
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> > > +mmap_prepare callback HOWTO
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> > > +
> > > +Introduction
> > > +############
> > > +
> > > +The `struct file->f_op->mmap()` callback has been deprecated as it i=
s both a
> > > +stability and security risk, and doesn't always permit the merging o=
f adjacent
> > > +mappings resulting in unnecessary memory fragmentation.
> > > +
> > > +It has been replaced with the `file->f_op->mmap_prepare()` callback =
which solves
> > > +these problems.
> > > +
> > > +## How To Use
> > > +
> > > +In your driver's `struct file_operations` struct, specify an `mmap_p=
repare`
> > > +callback rather than an `mmap` one, e.g. for ext4:
> > > +
> > > +
> > > +.. code-block:: C
> > > +
> > > +    const struct file_operations ext4_file_operations =3D {
> > > +        ...
> > > +        .mmap_prepare    =3D ext4_file_mmap_prepare,
> > > +    };
> > > +
> > > +This has a signature of `int (*mmap_prepare)(struct vm_area_desc *)`=
.
> > > +
> > > +Examining the `struct vm_area_desc` type:
> > > +
> > > +.. code-block:: C
> > > +
> > > +    struct vm_area_desc {
> > > +        /* Immutable state. */
> > > +        const struct mm_struct *const mm;
> > > +        struct file *const file; /* May vary from vm_file in stacked=
 callers. */
> > > +        unsigned long start;
> > > +        unsigned long end;
> > > +
> > > +        /* Mutable fields. Populated with initial state. */
> > > +        pgoff_t pgoff;
> > > +        struct file *vm_file;
> > > +        vma_flags_t vma_flags;
> > > +        pgprot_t page_prot;
> > > +
> > > +        /* Write-only fields. */
> > > +        const struct vm_operations_struct *vm_ops;
> > > +        void *private_data;
> > > +
> > > +        /* Take further action? */
> > > +        struct mmap_action action;
> >
> > So, action still belongs to /* Write-only fields. */ section? This is
> > nitpicky, but it might be better to have this as:
> >
> >         /* Write-only fields. */
> >         const struct vm_operations_struct *vm_ops;
> >         void *private_data;
> >         struct mmap_action action; /* Take further action? */
>
> Absolutely not. This field is not to be written to by the user.
>
> We sadly have to allow hugetlb to do some hacks, but these are things we =
don't
> want to point out.

Ack.

>
> Users should use mmap_action_xxx() functions.
>
> >
> > > +    };
> > > +
> > > +This is straightforward - you have all the fields you need to set up=
 the
> > > +mapping, and you can update the mutable and writable fields, for ins=
tance:
> > > +
> > > +.. code-block:: Cw
> > > +
> > > +    static int ext4_file_mmap_prepare(struct vm_area_desc *desc)
> > > +    {
> > > +        int ret;
> > > +        struct file *file =3D desc->file;
> > > +        struct inode *inode =3D file->f_mapping->host;
> > > +
> > > +        ...
> > > +
> > > +        file_accessed(file);
> > > +        if (IS_DAX(file_inode(file))) {
> > > +            desc->vm_ops =3D &ext4_dax_vm_ops;
> > > +            vma_desc_set_flags(desc, VMA_HUGEPAGE_BIT);
> > > +        } else {
> > > +            desc->vm_ops =3D &ext4_file_vm_ops;
> > > +        }
> > > +        return 0;
> > > +    }
> > > +
> > > +Importantly, you no longer have to dance around with reference count=
s or locks
> > > +when updating these fields - __you can simply go ahead and change th=
em__.
> > > +
> > > +Everything is taken care of by the mapping code.
> > > +
> > > +VMA Flags
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +
> > > +Along with `mmap_prepare`, VMA flags have undergone an overhaul. Whe=
re before
> > > +you would invoke one of `vm_flags_init()`, `vm_flags_reset()`, `vm_f=
lags_set()`,
> > > +`vm_flags_clear()`, and `vm_flags_mod()` to modify flags (and to hav=
e the
> > > +locking done correctly for you, this is no longer necessary.
> > > +
> > > +Also, the legacy approach of specifying VMA flags via `VM_READ`, `VM=
_WRITE`,
> > > +etc. - i.e. using a `VM_xxx` macro has changed too.
> > > +
> > > +When implementing `mmap_prepare()`, reference flags by their bit num=
ber, defined
> > > +as a `VMA_xxx_BIT` macro, e.g. `VMA_READ_BIT`, `VMA_WRITE_BIT` etc.,=
 and use one
> > > +of (where `desc` is a pointer to `struct vma_area_desc`):
> > > +
> > > +* `vma_desc_test_flags(desc, ...)` - Specify a comma-separated list =
of flags you
> > > +  wish to test for (whether _any_ are set), e.g. - `vma_desc_test_fl=
ags(desc,
> > > +  VMA_WRITE_BIT, VMA_MAYWRITE_BIT)` - returns `true` if either are s=
et,
> > > +  otherwise `false`.
> > > +* `vma_desc_set_flags(desc, ...)` - Update the VMA descriptor flags =
to set
> > > +  additional flags specified by a comma-separated list,
> > > +  e.g. - `vma_desc_set_flags(desc, VMA_PFNMAP_BIT, VMA_IO_BIT)`.
> > > +* `vma_desc_clear_flags(desc, ...)` - Update the VMA descriptor flag=
s to clear
> > > +  flags specified by a comma-separated list, e.g. - `vma_desc_clear_=
flags(desc,
> > > +  VMA_WRITE_BIT, VMA_MAYWRITE_BIT)`.
> > > +
> > > +Actions
> > > +=3D=3D=3D=3D=3D=3D=3D
> > > +
> > > +You can now very easily have actions be performed upon a mapping onc=
e set up by
> > > +utilising simple helper functions invoked upon the `struct vm_area_d=
esc`
> > > +pointer. These are:
> > > +
> > > +* `mmap_action_remap()` - Remaps a range consisting only of PFNs for=
 a specific
> > > +  range starting a virtual address and PFN number of a set size.
> > > +
> > > +* `mmap_action_remap_full()` - Same as `mmap_action_remap()`, only r=
emaps the
> > > +  entire mapping from `start_pfn` onward.
> > > +
> > > +* `mmap_action_ioremap()` - Same as `mmap_action_remap()`, only perf=
orms an I/O
> > > +  remap.
> > > +
> > > +* `mmap_action_ioremap_full()` - Same as `mmap_action_ioremap()`, on=
ly remaps
> > > +  the entire mapping from `start_pfn` onward.
> > > +
> > > +**NOTE:** The 'action' field should never normally be manipulated di=
rectly,
> > > +rather you ought to use one of these helpers.
> >
> > I'm guessing the start and size parameters passed to
> > mmap_action_remap() and such are restricted by vm_area_desc.start
> > vm_area_desc.end. If so, should we document those restrictions and
> > enforce them in the code?
>
> I mean it's the same restrictions as all of the functions already apply i=
f you
> were to use them with a VMA descriptor.
>
> I think implicitly a remap will fail if you try it out of the VMA range a=
t the
> point of applying the change.
>
> But it might be worth adding range_in_vma_desc() checks at prepare time, =
will
> see if I can do that for the respin.
>
> I think it's pretty obvious that you shouldn't be trying to remap totally
> unrelated memory, so I'm not sure that's at a level of granularity that's=
 suited
> to this document though.

I just saw you already have WARN_ON_ONCE() inside mmap_action_remap()
to check for these limits, so codewise I think we are already good.

For documentation I'll rely on your judgement whether to mention this or no=
t.

>
> >
> > > +    struct vm_area_desc {
> > > +        /* Immutable state. */
> > > +        const struct mm_struct *const mm;
> > > +        struct file *const file; /* May vary from vm_file in stacked=
 callers. */
> > > +        unsigned long start;
> > > +        unsigned long end;
> >
> >
> > > --
> > > 2.53.0
> > >
