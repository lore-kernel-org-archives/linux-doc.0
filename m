Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E961B4257
	for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 04:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773721850; cv=pass; b=oIfQ9El34FJKm6mtG1/Y71LBT4FIWjss62T59NjDXhDanKgYFMozqfh4fILqcJISquh1w3DXLJcYQMY4bUwjw/+a6lHnkpGbm4QdopOr6FuGKp3Zncp7GA+PUdtDHEvTBZc1gpfdMsdXTzA98WXHUQFU+xGaO7XB2sV1PHRm198=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773721850; c=relaxed/simple;
	bh=+qEdsUsTBQ5PdU99AN+GVBCS7vF9AHbvt2iuwIsGSck=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ai96EJPOmM4KMKahOZ0eKCVSG69BznNVaACGqozJr3JphXKepnkc9Q7SpjgkdHEm+Yz3SZwJwmAMqMxk5bwq9G6oh/vwNFCCcPzcQFv9U3h1yIWU0/zeLzG9wvhr3heAk1EAmmWZBtOeJUcbog/bthjcNhFMKbGkCr/HtCCvBuA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dcHz9jWS; arc=pass smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dcHz9jWS"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-5091ed02c54so192561cf.1
        for <linux-doc@vger.kernel.org>; Mon, 16 Mar 2026 21:30:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773721848; cv=none;
        d=google.com; s=arc-20240605;
        b=QU3AViuyvALglowww28g5bmVJzsQ8/mecDX1VJg07lA3/3bL41bP4XZPaN0r56WQes
         MBGAryIoS5A9vF+vXgGSKWCi3dDUxQbAfg72Cev3N1qIs6qTE4OZWGHuX/W4NUZhanzb
         BLKdb7+gW/DHHyqFvIeV0c3B1kT95VpE94BQaG7YRwG7gVbBrZA9P/5UAHK3sGFR7KD9
         pCJhWhsULjjWL19hKFlcLFxLvWY+noI4VLIuUkrI7qgBnEIOWwM/bD0XckrUvh+ILtXQ
         Vyt2AcJT5ferGBxhYfy0qU5viszgmzs95fRsuCe6V/olk7MR9xSYSku9S8RGBfk7Cra/
         fcGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pFQPhmx+ISxO6Fn3xc13MwW50zT+1NZPXlLC27SUdek=;
        fh=bSb2h3DkKH8FNmuqYvk1T3Pu2ZzQkz6MAD2mv5aSGbY=;
        b=BXnoOukUFp2OW3+H0LgZ/tFnSH6iOpdzzSszngy+UZjpiBWVecXqxDLPY9MTBcSucu
         8T3KamZTQ/nGM+49EslgaR3pd771Q9N2M20Ic9KDTPYGcHVBIYJ/Bk6l8YrX6JymL0K5
         UMaZSqFYwf+wYfAED1Q/TLsiXi1VGf/kLppVk628e2HLunFTfc/thnbePUZqoXAFAMyR
         C2kKl9UG17XWeDHlgFuh3cMHQfztTN5HCcqOSWnvsM3Tm5Lh0y862hL6myJVRRlE4dEq
         SbKFGK2K9EsNBx69wqpOdNGgEFg/h9CynB/b1iDjJcpJdEcJP7X6HMvq5Qp1O9srioKt
         xhMA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773721848; x=1774326648; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pFQPhmx+ISxO6Fn3xc13MwW50zT+1NZPXlLC27SUdek=;
        b=dcHz9jWSigF+3BARnPnbKteLX4VaADjtLsdaMyhGyNJV6JIimRYsLO4x7EbK9BzBKm
         mEBNOo5L0VUPl/dip+HXrZAa92QHbbWUxIR33fHYlLzQokFDwQJjBzeRf/caR0pjg2Mo
         34+rdKlPO1pqvYIaUSk19WaF9PSBtDSVR0MEozQlDzToqkl/jokmLSbZZk4UFJtqHEmi
         kXCC+DmS5SZkg30BADq3NkbtYVryfdZAaKXoYS6JLFIzqMyrVPWUXccsrILfv3Xl/Xkd
         r80MwV7t7nyhZxw2K0hrEcQ6qFdzAhEIEtys7scmuZDaSQSy0hx5l9Sk892/mMBb7UNJ
         O8MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773721848; x=1774326648;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pFQPhmx+ISxO6Fn3xc13MwW50zT+1NZPXlLC27SUdek=;
        b=aCmqMAUJ0dxOnMpc8TmRIagrWcInsE6Pl/cgX0Dh2IvugnyyduQgxLyvVlCIH/mUfn
         PkmQcg/r5yecTLZQ6FgkG9g9ASgOFOQbg158C/aoQ/WhcamF2hpM3OXw6sJ8X1fi02Pf
         Ho0VaMsNUsjAQR0lytfBiRdu/HVMAUEuAKgr+8g65AMZ+SNiivZfpg8vPczlhjxQ4EXU
         ykUud/JZRyRGyNqKcez261MzteXpTa6xWgpvnY6K9qA0My9SXoOLWsAEG3XRYN5H30YF
         H4LIv8afqA3gekwXGplWaqrGIOZ6ogMxuxNOx8e1+hamoHXF1/T5+xNK3fVaH66HzJqS
         Mstw==
X-Forwarded-Encrypted: i=1; AJvYcCUIGWYAqXS1MO4DGmLIzE2KK7mcz2hFcAfI6C3dsuKELwq6TEfFr1Az+6tdxrKzgGP7nb/YHFJMlm4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4DMfnGjXQQTshqEoLYuF4WuAXmkqNWPaHCY7S02Hknl5LlA3V
	79bhhau48x+B7qDHYgg5MNLwj61lFcsfou9PlZ+xm3nVEVA4bEvzOF8xrtx7M2svXhZymw/EK6P
	N4iQFKyruDSPY5Nr5M9ge7SpTxGk6rMb2YiHUIlro
X-Gm-Gg: ATEYQzwNd7fnlaCIU/ObRD5pJjpbkVgZ4Q6cKuHTEkX06zip7/Ie8loVqpOcA89W7/p
	adx29vdxK7okqTpIzK2RHGpObWVkqh22YjzR+A4+jhfnBVNcGSMDXIJL3sfJd6mV+evQw4Xh9a/
	4ixni87wagNKD0Vn7vXWbAcl0CiLVeJayiIajc+vl/2tRLQ+/dJoy9/1BAQlBORMJ09ihh2+1p/
	vArtUnd9qWJ/WRgrHqEbpbbdFIi9Q4EQj46TYcUGy87p9oi+yhdnGIsQe2gZaCYUghTogHwwEPb
	YsPjFQ==
X-Received: by 2002:a05:622a:1b92:b0:509:1eca:6d24 with SMTP id
 d75a77b69052e-50998c190femr8741161cf.2.1773721847648; Mon, 16 Mar 2026
 21:30:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1773695307.git.ljs@kernel.org> <77fbdae93f250fa1551f3052fc9034739795ff20.1773695307.git.ljs@kernel.org>
In-Reply-To: <77fbdae93f250fa1551f3052fc9034739795ff20.1773695307.git.ljs@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 16 Mar 2026 21:30:36 -0700
X-Gm-Features: AaiRm50ZCLTl3QDNivnPnY48qRQMsgXcmE9SOEgt_D7vDyjlZ8af9f8bQZf6tcw
Message-ID: <CAJuCfpFdKjix2fEdZ7iSrd_nk4-5e7EUNAoCEgUc5snKzq-3Cg@mail.gmail.com>
Subject: Re: [PATCH v2 07/16] misc: open-dice: replace deprecated mmap hook
 with mmap_prepare
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

On Mon, Mar 16, 2026 at 2:13=E2=80=AFPM Lorenzo Stoakes (Oracle) <ljs@kerne=
l.org> wrote:
>
> The f_op->mmap interface is deprecated, so update driver to use its
> successor, mmap_prepare.
>
> The driver previously used vm_iomap_memory(), so this change replaces it
> with its mmap_prepare equivalent, mmap_action_simple_ioremap().
>
> Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>

Reviewed-by: Suren Baghdasaryan <surenb@google.com>

> ---
>  drivers/misc/open-dice.c | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/misc/open-dice.c b/drivers/misc/open-dice.c
> index 24c29e0f00ef..45060fb4ea27 100644
> --- a/drivers/misc/open-dice.c
> +++ b/drivers/misc/open-dice.c
> @@ -86,29 +86,32 @@ static ssize_t open_dice_write(struct file *filp, con=
st char __user *ptr,
>  /*
>   * Creates a mapping of the reserved memory region in user address space=
.
>   */
> -static int open_dice_mmap(struct file *filp, struct vm_area_struct *vma)
> +static int open_dice_mmap_prepare(struct vm_area_desc *desc)
>  {
> +       struct file *filp =3D desc->file;
>         struct open_dice_drvdata *drvdata =3D to_open_dice_drvdata(filp);
>
> -       if (vma->vm_flags & VM_MAYSHARE) {
> +       if (vma_desc_test(desc, VMA_MAYSHARE_BIT)) {
>                 /* Do not allow userspace to modify the underlying data. =
*/
> -               if (vma->vm_flags & VM_WRITE)
> +               if (vma_desc_test(desc, VMA_WRITE_BIT))
>                         return -EPERM;
>                 /* Ensure userspace cannot acquire VM_WRITE later. */
> -               vm_flags_clear(vma, VM_MAYWRITE);
> +               vma_desc_clear_flags(desc, VMA_MAYWRITE_BIT);
>         }
>
>         /* Create write-combine mapping so all clients observe a wipe. */
> -       vma->vm_page_prot =3D pgprot_writecombine(vma->vm_page_prot);
> -       vm_flags_set(vma, VM_DONTCOPY | VM_DONTDUMP);
> -       return vm_iomap_memory(vma, drvdata->rmem->base, drvdata->rmem->s=
ize);
> +       desc->page_prot =3D pgprot_writecombine(desc->page_prot);
> +       vma_desc_set_flags(desc, VMA_DONTCOPY_BIT, VMA_DONTDUMP_BIT);
> +       mmap_action_simple_ioremap(desc, drvdata->rmem->base,
> +                                  drvdata->rmem->size);
> +       return 0;
>  }
>
>  static const struct file_operations open_dice_fops =3D {
>         .owner =3D THIS_MODULE,
>         .read =3D open_dice_read,
>         .write =3D open_dice_write,
> -       .mmap =3D open_dice_mmap,
> +       .mmap_prepare =3D open_dice_mmap_prepare,
>  };
>
>  static int __init open_dice_probe(struct platform_device *pdev)
> --
> 2.53.0
>
