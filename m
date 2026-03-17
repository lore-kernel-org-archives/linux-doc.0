Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A801A31ED81
	for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 04:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773722013; cv=pass; b=Gk0z8x8/kZ9brxK5ttecW8J8clHqk/Lys2mfVkXSMG7nFpyPDOv0ppYkAwKFyXe2M7qjxyaLGvCpB88evdYeZVrNT61lbJB9BC0rBnLs9mJMSpl5SZ7dapFdO1S1LPN8JUiqu9419fwaVu6boDZRqjS9uuilwZPK2UrH4dpPgx4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773722013; c=relaxed/simple;
	bh=tiOslg2ijiNLvUEule9D7TB3nKCRsqgcCv7YiVviGdo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sVspszNDwkJFW9tg2cGBeKMaUVCnte6lCQuQRHh3JUULPeENzsSqF5thg2waSUlcd6+1G8opp5a2xLrpOGgC3pEGgE8Om1ydNKqokLoPXdtQWrkEDWf0mZioJzz5D4VOP4fkHxonCZPnF53Zp3NzpG0dlqiatJsGJXAlieISmbA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XOHBHWty; arc=pass smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XOHBHWty"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-509069a7a7fso343061cf.0
        for <linux-doc@vger.kernel.org>; Mon, 16 Mar 2026 21:33:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773722011; cv=none;
        d=google.com; s=arc-20240605;
        b=NpjzqyrWuJg3Q3Ol5QeseWAD+VJZQgOLcipEFyq1SipvcdBBbhN4WtAOWLkfeT9eGf
         8ZNVDra2MIrydgdc0qLoLN9Ijnd56rAUJH29XOAHFz2hPQauFwQe5sGfkinoSUnfVKCl
         ZsySBU/XAie1qWr0lB8pUqaNmM+8wsYxCmAdVTD0EfysrJy+C2DcSNFUrAMjfJ9RTNDI
         zJEP4Drjy8ZbBBSRo4JjppGZ5oV0mei/gOAyOG+7bpJ2PnO6CMxk5oofq0N6jwho7eiD
         gtvFOFqhT2Vvth4Lw0AX0OM3uBy/MWbdpw1kTzyOoSwolgBifcbB3E/hLjSrPdB9S3Y7
         i/Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/NEZIoIL+p9WYNIWM8eip/yr8eeRSa2d7nrT0z5B5yM=;
        fh=NKmnNIqmIdyp/LjP++eOrTzaw8dL3AUpOsRNHnBR030=;
        b=lCOtw39OjN8lgkOjJR4zx2hJSKE333yX+uJcdcz18a/ECTCcc23z4MNy6Y/1NmXwLR
         zD72GEGX5bpzHVpzi4d82k3m7hZ66hpU4zXnGkPcVQ27tOz7sK1BHYpoTWylsr91C0oJ
         FBu2ONm3Xzpue+kQOhDZjiUfR2eAuQPncQkQBQhYt/InGwut/ACYtheJ5KsF/li/TYTA
         MqzcV7hj1UREf5qpVjQCvMaaWT/WSBr3Z5FRF+Bj3LXPuOOFoNDPDsKCde8BbUZGF6er
         hkzQ7MbjN5h12fwnd6C1fxtkry2Up0+IfX24Z0UsbeZdSdWtUCbm+b2ixgQ/bNLsbMmv
         W0uA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773722011; x=1774326811; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/NEZIoIL+p9WYNIWM8eip/yr8eeRSa2d7nrT0z5B5yM=;
        b=XOHBHWtyrlsh7Yoa4vNnjb6T9UyuOpn+BAQwM6/uhn8ej309RDdBFaM0vYPVNGoxBD
         fZ4VRrRF0P1oXYGRPa1P6vXDW4hEkqYusYkSgtFEpwEaBMZSkbBuOzVEGkYjLbJnG0ce
         QU79t/gmXkvF21hP+Hh0ZK69g3kK819Gvg5zCvpU2oo0xApP7o57C/wEJJ0VBa6Bacey
         wjarTwWHd65HU/pv9GZujDxU1zzk1io+Q5IMCyzum2RA6KkJ9FSc0WAExQYW1SjbtbTt
         34LW/Y1yWWNLOSsBOPPxDUV5NcywSZ15RzaSRhQvYN6v7clysze7Sd3FTfZBv4btjwv1
         gjlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773722011; x=1774326811;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/NEZIoIL+p9WYNIWM8eip/yr8eeRSa2d7nrT0z5B5yM=;
        b=YfuA1OnNsZlrlGM507LiDLhFRlvBR5lpNd5bMrC5ZHjVOw1fVMhVX2J6zrDIRlgDFD
         phE6ZG0fPtFqYj0s9lBn9v2AbOoSAMmhIKUMNsPqxPyOPs8o/Q2JQhpHwWb3meUemU9l
         aHdz4i8KXhqx5S22UIvU4ry38LLNXoVgIV8eXP+ST659nOWsJc+H1zUT7+GMlTnd2W0X
         H/M4vjljyhiM5DeM2SvI3Kb/kc787szOepKx3Kcui9tlwu6m8P7hAwblcAch7ddudZ5o
         3TagebpUpm1HtdFPfpx3G1hfdEfh8YMCVGXaj4qlehDcWYAL/nW5ReNjQpo1Kp42dP5V
         uM7A==
X-Forwarded-Encrypted: i=1; AJvYcCX39YVBAY7XE5HCXBKNCtmHpEyi9MivFs5Ms8CDsnM2aVFp9weZuJujRk7Ajt71N5NvxhKXmUU5hhU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpwKqS0BuFzHFMVxdLWJkNKK7DXptjD1u9IW8XdS9Ob7lk1iLP
	LStlgMB4evQROR3jL0XVbU5ClfXL+F0ul2V1MhhZh1seg2KGTh8k2GnZ1bKr8wAD3LIZiia+sHr
	4G/gjWZkwnYAa5pAKq7C+4ZV2ZZ7deNHDXk2e3TIe
X-Gm-Gg: ATEYQzyh8JFfgYq9d2DmutJnClJm1Lw99Hbl0OIvcMiAZt3rkcn8LBis/miSBAgtW21
	krtmrXJH7ufVyhjDDmsg5Oz6C6kC6evguSHIxZOFlJ/EXGvzjJeQpHGsGKyjNeaT+ssCO2DA1dS
	ybAOdWtCccgiHmH+EKiQs2QR5vHTfC5RMK3RlMvzdSLKdTfnNfMWuQb4Ka0BeDQ51t/vfqdJLpN
	8BAZAUmTV4KJOdrgLOsStH+1TJHkttrKz3q330kYhHdS4LchuWi5uqch3kJIdeJaXskMynQTkc7
	9ZQ2BQ==
X-Received: by 2002:ac8:5844:0:b0:509:cd7:aa18 with SMTP id
 d75a77b69052e-50998d3b42cmr9273521cf.10.1773722010151; Mon, 16 Mar 2026
 21:33:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1773695307.git.ljs@kernel.org> <a8debbca3fc7b765937e6b5b76bd9002c66b225b.1773695307.git.ljs@kernel.org>
In-Reply-To: <a8debbca3fc7b765937e6b5b76bd9002c66b225b.1773695307.git.ljs@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 16 Mar 2026 21:33:19 -0700
X-Gm-Features: AaiRm50Qx7Mej7rYBXyqChXz1IjfagNMkbSFlVwOhEN7Z-gN2V6TQSUIzNbqMWk
Message-ID: <CAJuCfpHBfD0zO60tPCEeNXSRJSoDi5Azs0LzutpYFEBW2z6JJw@mail.gmail.com>
Subject: Re: [PATCH v2 08/16] hpet: replace deprecated mmap hook with mmap_prepare
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

On Mon, Mar 16, 2026 at 2:14=E2=80=AFPM Lorenzo Stoakes (Oracle) <ljs@kerne=
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
>  drivers/char/hpet.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/char/hpet.c b/drivers/char/hpet.c
> index 60dd09a56f50..8f128cc40147 100644
> --- a/drivers/char/hpet.c
> +++ b/drivers/char/hpet.c
> @@ -354,8 +354,9 @@ static __init int hpet_mmap_enable(char *str)
>  }
>  __setup("hpet_mmap=3D", hpet_mmap_enable);
>
> -static int hpet_mmap(struct file *file, struct vm_area_struct *vma)
> +static int hpet_mmap_prepare(struct vm_area_desc *desc)
>  {
> +       struct file *file =3D desc->file;
>         struct hpet_dev *devp;
>         unsigned long addr;
>
> @@ -368,11 +369,12 @@ static int hpet_mmap(struct file *file, struct vm_a=
rea_struct *vma)
>         if (addr & (PAGE_SIZE - 1))
>                 return -ENOSYS;
>
> -       vma->vm_page_prot =3D pgprot_noncached(vma->vm_page_prot);
> -       return vm_iomap_memory(vma, addr, PAGE_SIZE);
> +       desc->page_prot =3D pgprot_noncached(desc->page_prot);
> +       mmap_action_simple_ioremap(desc, addr, PAGE_SIZE);
> +       return 0;
>  }
>  #else
> -static int hpet_mmap(struct file *file, struct vm_area_struct *vma)
> +static int hpet_mmap_prepare(struct vm_area_desc *desc)
>  {
>         return -ENOSYS;
>  }
> @@ -710,7 +712,7 @@ static const struct file_operations hpet_fops =3D {
>         .open =3D hpet_open,
>         .release =3D hpet_release,
>         .fasync =3D hpet_fasync,
> -       .mmap =3D hpet_mmap,
> +       .mmap_prepare =3D hpet_mmap_prepare,
>  };
>
>  static int hpet_is_known(struct hpet_data *hdp)
> --
> 2.53.0
>
