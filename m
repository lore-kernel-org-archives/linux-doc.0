Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC54829BDAD
	for <linux-doc@vger.kernel.org>; Sun, 15 Mar 2026 23:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773617008; cv=pass; b=d60yqHBhjOG0p11LWinudVes5uhFPRYG42PWdFIDlabU2Up3aJ2EX6RNH42yFxiTYazzRdr2uAvAxareEQhAawtvnmqb9rn+MkOBfbaP88C5DlYoZ2a4azzrquFAS/9iIV6EmZ5jXX1B6GmUEZq4VsFmZcwjqL3sfKUk2wj/rZg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773617008; c=relaxed/simple;
	bh=PVq272pwfUPXpFbMSUn68cn48r3pF+BdTgdFJu/GdP0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sZZaEecmGPu6UFPDpgK+H2Bulq/O0HPHGjPZVqjtNJMi0keISnlhUGEL+5LGQQrILgCNEn0Aw+MBjjEkmtATI3AAUDpQf4B6cVz2jIlijvLx/wjuxqzZGZIU7vj/Qxu1uJ8ESh1jMAMGIQ5pJ536BFskRxSneAiNfx/IrS2Vf8w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=suNZAZzv; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="suNZAZzv"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-5091ed02c54so710881cf.1
        for <linux-doc@vger.kernel.org>; Sun, 15 Mar 2026 16:23:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773617006; cv=none;
        d=google.com; s=arc-20240605;
        b=UkF77rcxXEp39ReT4fwFwA9AzI+L6mpFTU/J3me8J1JD3lwHANKlk8CpaRLD8ArP9T
         flAlCW41q9aBEEMhXbmpNJ1C/c2qhSTk1RrzKHAp9OUUOcNI3EBloKMTSHF/65Ao9HJY
         t/iWJpG82gA2KWqeAR3YoUPULZ/su8aSZzWmbtqx6Ckb0omLYKwL2dWxKHtNDvdVgiqB
         KASoYHBxKZH1zzpbyWamYKrN0w3j9NwJhYrC4RWjvUunvL8gY20/Cb8rwZOPnNzMLGi+
         V1g9FukQJMzQ3sxAbedwZXdwUBaz9yEb8LRbvOXzTGqNT+xMrlNpXV500HMRCAfaUTnT
         jTmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OT8Iw6M557aLYwHQwbfjFt5SgiwLxQR3GJ4aDtnOQyU=;
        fh=eUZd+PK6f0v9cL4ZRoPdSQvBUb4xKpbc71M2y53tzj4=;
        b=GNzrUdEje687E6F9h3a/SF9Z4BSiu4LCznc0wwJfOEZtKLiNRGQQRbGqVMiNHILxkH
         dE9RWCa5YdVSB6/rIZ9f1h58v3VqBOcVNNR4OHOYt+nNxT66n5ok9/4KXA5owERfqw3f
         bDmxzv+OxIdy5sl6n9FxxuRb7ze3TDgf6D8kjILhBwLD9mPieRTHDen9ERMCYYJgOYpm
         8S39UIPrFo9pIgDbeRjN6tQWx22aKjgqyxcAuhggT2cpNxfY3G37tjapP805+lO5L1qF
         256781FkaOnTpAxLFDLmj7TF+hlLSFkRbVcaAgkGvvlKjgrIN6gfzu+eopiX7SvXiX6a
         zObg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773617006; x=1774221806; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OT8Iw6M557aLYwHQwbfjFt5SgiwLxQR3GJ4aDtnOQyU=;
        b=suNZAZzv3pGLa1X9bIl3qgW3SWhV99HMVIguTsB5ag2+7n6ZDXcYwFBsMru5tqwCpT
         srZ+9UTzcdx4RbYNm2rkE4QYzV4l60ea581qRU+pVTJd4s3tlF83pC72jHeEM+uAcF6J
         TLkD8psnAriT1UHr627hduaiKoCspj3yV+gSrwblu/xQw6LU7cg5wQDhNjja7wCqy3Km
         5IOYd7z9QjnZly79b30RyZao/vOn+qgd4efaOYti6pP+9N9ub2b5QfupeEVZOHujFgrp
         FjB4RBo2i/M6a66OS1ifQrAClFznFwn06Sj+OQgeUa7/Ip5riBz7EOJsqon+2ds4rV7P
         P84A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773617006; x=1774221806;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OT8Iw6M557aLYwHQwbfjFt5SgiwLxQR3GJ4aDtnOQyU=;
        b=OgwMZYj/golwdYyRXNsNSTe3NTNEQslUL8cPW0c95kXLsJEbqJ3BIcx7QuyZx0EGuu
         Z5f4be7VZxa1p8dVgu/y8cADMzoQ52lThMnY5VIKxnHK1J1bNEVwN55+BbnE7jtsW1hk
         ohPSAMEuaZPd8A6cmmJmIsBqt0N7/tXJqiAJ8b7ZYX6QCe5oXdxuKOQb3CdNLVLiwSrh
         ZqnEnRra4E+lg18OZevgZgxUqBUV9GEcRSoMvE7lv80KspHbW1xM/Jp9Jr64/mAgx6X1
         fdz6qn/rvcH8UDba30UybBmNfpGx95CmGWb/Pa3Qr4gOiaLeABv99gCylYThU2iPgk1i
         dKlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxTLyfELoxIYpeNJX2UW2wXo+6mnf61CKex817YPmJQpcVJ/fF6rD6Y3QSSPJYFhpK0F5gnwpSpvY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxitpnuAkFbt3np81zbLOeZOazBRY9z+MdkNXpWZiBOXfBbLXCp
	ulQtp3zvITbvuvvDDIR03IAoWDD4FmeEu+f/mQwpuRNfT01hY3cNIydfjbOMeQIwkFEfrYBEUKk
	M8nUdkIdzQUM+ozIEMZhWLMalTrLkruNam0vFHeGd
X-Gm-Gg: ATEYQzzOCH4owcj871Hr+G40LIXaxg7FzYVSXICwXR6Mvy36NRWCH3Hdo8k1wQUDX7A
	JD089yYGnuJ4KH9GXSCZhOMoI23dsqoNy30hXxJ4KK8uUdDuAfpk95KF7mGKLYQb9KA4e9aKIHi
	P8ALd1ihUw2ZewNcTuidQCZQCYTyej8GUoHFfSk47WC7ItOw9mYsN+RfawR+AKCLi6LUuaD+pTd
	nYRdW5YkrnsdFzDk07bW/jHT6GrErh91gpDgchKs7veLO0NjNC0iMWl+ygzTXGcSIjcEQSLYdGX
	PiNNG2lsTQVXie+6
X-Received: by 2002:a05:622a:1822:b0:509:1d4b:f86f with SMTP id
 d75a77b69052e-509694fc2a0mr18649221cf.14.1773617005021; Sun, 15 Mar 2026
 16:23:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1773346620.git.ljs@kernel.org> <c5bb61cf789df1ecb32facc29df9749987c7ddfc.1773346620.git.ljs@kernel.org>
In-Reply-To: <c5bb61cf789df1ecb32facc29df9749987c7ddfc.1773346620.git.ljs@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sun, 15 Mar 2026 16:23:14 -0700
X-Gm-Features: AaiRm50msQxab5MfkpLsIIibDHC-kfdIQCyqr3kXogsNup53_Z_U3j15wVPbEHM
Message-ID: <CAJuCfpGd702=Xop3X5Aop9rrScdiAOQEEooTu1gcJqR9pmO5GA@mail.gmail.com>
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

On Thu, Mar 12, 2026 at 1:27=E2=80=AFPM Lorenzo Stoakes (Oracle) <ljs@kerne=
l.org> wrote:
>
> This documentation makes it easier for a driver/file system implementer t=
o
> correctly use this callback.
>
> It covers the fundamentals, whilst intentionally leaving the less lovely
> possible actions one might take undocumented (for instance - the
> success_hook, error_hook fields in mmap_action).
>
> The document also covers the new VMA flags implementation which is the on=
ly
> one which will work correctly with mmap_prepare.
>
> Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
> ---
>  Documentation/filesystems/mmap_prepare.rst | 131 +++++++++++++++++++++
>  1 file changed, 131 insertions(+)
>  create mode 100644 Documentation/filesystems/mmap_prepare.rst
>
> diff --git a/Documentation/filesystems/mmap_prepare.rst b/Documentation/f=
ilesystems/mmap_prepare.rst
> new file mode 100644
> index 000000000000..76908200f3a1
> --- /dev/null
> +++ b/Documentation/filesystems/mmap_prepare.rst
> @@ -0,0 +1,131 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> +mmap_prepare callback HOWTO
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> +
> +Introduction
> +############
> +
> +The `struct file->f_op->mmap()` callback has been deprecated as it is bo=
th a
> +stability and security risk, and doesn't always permit the merging of ad=
jacent
> +mappings resulting in unnecessary memory fragmentation.
> +
> +It has been replaced with the `file->f_op->mmap_prepare()` callback whic=
h solves
> +these problems.
> +
> +## How To Use
> +
> +In your driver's `struct file_operations` struct, specify an `mmap_prepa=
re`
> +callback rather than an `mmap` one, e.g. for ext4:
> +
> +
> +.. code-block:: C
> +
> +    const struct file_operations ext4_file_operations =3D {
> +        ...
> +        .mmap_prepare    =3D ext4_file_mmap_prepare,
> +    };
> +
> +This has a signature of `int (*mmap_prepare)(struct vm_area_desc *)`.
> +
> +Examining the `struct vm_area_desc` type:
> +
> +.. code-block:: C
> +
> +    struct vm_area_desc {
> +        /* Immutable state. */
> +        const struct mm_struct *const mm;
> +        struct file *const file; /* May vary from vm_file in stacked cal=
lers. */
> +        unsigned long start;
> +        unsigned long end;
> +
> +        /* Mutable fields. Populated with initial state. */
> +        pgoff_t pgoff;
> +        struct file *vm_file;
> +        vma_flags_t vma_flags;
> +        pgprot_t page_prot;
> +
> +        /* Write-only fields. */
> +        const struct vm_operations_struct *vm_ops;
> +        void *private_data;
> +
> +        /* Take further action? */
> +        struct mmap_action action;

So, action still belongs to /* Write-only fields. */ section? This is
nitpicky, but it might be better to have this as:

        /* Write-only fields. */
        const struct vm_operations_struct *vm_ops;
        void *private_data;
        struct mmap_action action; /* Take further action? */

> +    };
> +
> +This is straightforward - you have all the fields you need to set up the
> +mapping, and you can update the mutable and writable fields, for instanc=
e:
> +
> +.. code-block:: Cw
> +
> +    static int ext4_file_mmap_prepare(struct vm_area_desc *desc)
> +    {
> +        int ret;
> +        struct file *file =3D desc->file;
> +        struct inode *inode =3D file->f_mapping->host;
> +
> +        ...
> +
> +        file_accessed(file);
> +        if (IS_DAX(file_inode(file))) {
> +            desc->vm_ops =3D &ext4_dax_vm_ops;
> +            vma_desc_set_flags(desc, VMA_HUGEPAGE_BIT);
> +        } else {
> +            desc->vm_ops =3D &ext4_file_vm_ops;
> +        }
> +        return 0;
> +    }
> +
> +Importantly, you no longer have to dance around with reference counts or=
 locks
> +when updating these fields - __you can simply go ahead and change them__=
.
> +
> +Everything is taken care of by the mapping code.
> +
> +VMA Flags
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Along with `mmap_prepare`, VMA flags have undergone an overhaul. Where b=
efore
> +you would invoke one of `vm_flags_init()`, `vm_flags_reset()`, `vm_flags=
_set()`,
> +`vm_flags_clear()`, and `vm_flags_mod()` to modify flags (and to have th=
e
> +locking done correctly for you, this is no longer necessary.
> +
> +Also, the legacy approach of specifying VMA flags via `VM_READ`, `VM_WRI=
TE`,
> +etc. - i.e. using a `VM_xxx` macro has changed too.
> +
> +When implementing `mmap_prepare()`, reference flags by their bit number,=
 defined
> +as a `VMA_xxx_BIT` macro, e.g. `VMA_READ_BIT`, `VMA_WRITE_BIT` etc., and=
 use one
> +of (where `desc` is a pointer to `struct vma_area_desc`):
> +
> +* `vma_desc_test_flags(desc, ...)` - Specify a comma-separated list of f=
lags you
> +  wish to test for (whether _any_ are set), e.g. - `vma_desc_test_flags(=
desc,
> +  VMA_WRITE_BIT, VMA_MAYWRITE_BIT)` - returns `true` if either are set,
> +  otherwise `false`.
> +* `vma_desc_set_flags(desc, ...)` - Update the VMA descriptor flags to s=
et
> +  additional flags specified by a comma-separated list,
> +  e.g. - `vma_desc_set_flags(desc, VMA_PFNMAP_BIT, VMA_IO_BIT)`.
> +* `vma_desc_clear_flags(desc, ...)` - Update the VMA descriptor flags to=
 clear
> +  flags specified by a comma-separated list, e.g. - `vma_desc_clear_flag=
s(desc,
> +  VMA_WRITE_BIT, VMA_MAYWRITE_BIT)`.
> +
> +Actions
> +=3D=3D=3D=3D=3D=3D=3D
> +
> +You can now very easily have actions be performed upon a mapping once se=
t up by
> +utilising simple helper functions invoked upon the `struct vm_area_desc`
> +pointer. These are:
> +
> +* `mmap_action_remap()` - Remaps a range consisting only of PFNs for a s=
pecific
> +  range starting a virtual address and PFN number of a set size.
> +
> +* `mmap_action_remap_full()` - Same as `mmap_action_remap()`, only remap=
s the
> +  entire mapping from `start_pfn` onward.
> +
> +* `mmap_action_ioremap()` - Same as `mmap_action_remap()`, only performs=
 an I/O
> +  remap.
> +
> +* `mmap_action_ioremap_full()` - Same as `mmap_action_ioremap()`, only r=
emaps
> +  the entire mapping from `start_pfn` onward.
> +
> +**NOTE:** The 'action' field should never normally be manipulated direct=
ly,
> +rather you ought to use one of these helpers.

I'm guessing the start and size parameters passed to
mmap_action_remap() and such are restricted by vm_area_desc.start
vm_area_desc.end. If so, should we document those restrictions and
enforce them in the code?

> +    struct vm_area_desc {
> +        /* Immutable state. */
> +        const struct mm_struct *const mm;
> +        struct file *const file; /* May vary from vm_file in stacked cal=
lers. */
> +        unsigned long start;
> +        unsigned long end;


> --
> 2.53.0
>
