Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99A61BD035
	for <linux-doc@vger.kernel.org>; Mon, 16 Mar 2026 00:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773621835; cv=pass; b=hT1rQ01FcjyjYGedIa3fW6IlT94H4nDAGIN+0ublK86s50UToeZU2lBYjEvUBMemNKA4i+jLA8MBj8AAw5ZLnvD2c5a6SgG967U6+E00bqELXhpGzdqO0dTryg1Y8nU0G8ACUb13cdNkDARy09cgMNfO8Ua0zWEdczCFjK3Oy3A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773621835; c=relaxed/simple;
	bh=7LEG6GSfAF3VAhLmKNS+zMMoXAkVfIwRn9mYIfi1rWQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WbmMh/oi7ZaP/zthQiMRzkSY3AsZNBwrdnHQ0T1vlaTTlwqVxyg13uUQnb8xLD7fDG3FrJJEOcvBmrqYs/HLYskeJbLece2XQ+iHOCzh8Evj6VjtxsxLIOuU1rL4ktQESDMtQkDEMf2YQoOBxgDSGwDtadldg/ezXjEfs75f6E0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bISgmRPH; arc=pass smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bISgmRPH"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-509069a7a7fso778321cf.0
        for <linux-doc@vger.kernel.org>; Sun, 15 Mar 2026 17:43:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773621834; cv=none;
        d=google.com; s=arc-20240605;
        b=YWpiCF0nwgt/7ecOqSLE67Ei/v3RpqCdhtbg4vzBcUVCCH+Tlh+W6E6QJ1X9gb0LM7
         Z8MH1v90CzlaWWJGEdHWyIov+BliBNHlGnbKtIEh/gwxuoOEb49csJPtrdskHCwqnsbP
         UCLe/2l2mABk8d9urxW45swZANH6DxaiDlry4CD1tV4n/he0lPkPZ/VllpdCBqkWpZX6
         8dk132NO0GA/dZXE8xq+hAfgliQB5Z06iP7KNIiKVSEh/RdD/wDiqy9YqXM68U0mkS+Z
         KHkoAaJHR6ZGHXrKzXJgTqu4SIBmTlqHmGhCAfvhr5uGa4cN4X9HWdyFJCeTNL8O3NOE
         UC/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=B4iLbVdU6UwNcjWJZqb9n6er3BcFb6HsfZvwCgpauBo=;
        fh=xXWpBybrlGLgmDKWNZR5Pl8tBRSrel0VTm/Eibo+THE=;
        b=BBnqzWla9ETxqN9OsabCMTsOYJ5foGCmuDWBPG0Q+Purj2sZ1GVyrOoQTS8sIGWjjG
         6oL/SQM63LOBJp8Y+8NQCsLl/0GrMju/MmixJkRXbalDoaTXasUa9sxJYeU2apzEURzj
         pfp1y18abeQ7nil/JS5TFS1coa3fQWLlJHljApZEtm/Ku0DGJNs8aJRKGXHqFXjFj/h7
         suFdyphePdJ/aeIiXmKh5paxA6F8mrF3c3WBJ/Ja6uFNhVHXTsg8VgyypkdrZS6kKeU3
         pC76U4jJaQPVkgoMrFni9dCqjUUgEcy0O2OYOkD6yvQ3igubRJgWu/dRPPcHFX1n1kOV
         x6+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773621834; x=1774226634; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B4iLbVdU6UwNcjWJZqb9n6er3BcFb6HsfZvwCgpauBo=;
        b=bISgmRPHe1Sfdsvy6ngj1NvbPI5bCE4DfMr53m6zdg7zHA/OxjYsVgkGZ6mmp9AdYR
         gnlYG3eKj1cbFgEJrKs+y/ifQndl/7jdxcksA6ZyDvnvB0ptVSOL8mI5/wNl5TIIZCQr
         kkIn9S+93uEe7phvawobD7GXH8YDsDCrjsu6ubRO4YfCD0Vq17bZ1QDCx9UWyEOT6ab3
         i6sJcQSr8KI0VyUFZPfQC0VVAEssE2QJMPIBwT5CuK2BGhScJ4zFMWcGrbXmwoovk9Ab
         OhOnUEFAKyjD4ZV8Q4+5RXTrS8X7c61GaFvLviA+kMeb2dBiEpQdhPK2U4kVqS/79xXF
         NsLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773621834; x=1774226634;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B4iLbVdU6UwNcjWJZqb9n6er3BcFb6HsfZvwCgpauBo=;
        b=ftaYNl9PeVE/qff4uUqEXqdWIBz3/v77nIztY+EYjE1BBdv2spe4M5i26bKsG0W90R
         Vf1oYkTLSZ+liKQwQhW2Z2MV8AQvLTt2ughqRbhiuuLr+MlHoKnDFWOUlzSvaFAweiYH
         UU0of4PWxJqCoFdhyA0B6DoArQ6728oK87+4x0tLXNWn0Ehx8orUMXRfE5tOKbHUjipM
         91Qhp3LfBihAS04nDSHZwo0o/TWg6krydLx0nBGF9vEXGYMTHu0BpV2Hb+n8Fg3kDCEo
         8rQlc9QjXXiGZBN3622WsjFdzcfkyW+g/VJFxfYrNTnyNo1nJJch8ScyF6IscxqWnerD
         t5OA==
X-Forwarded-Encrypted: i=1; AJvYcCV5YBrdnXSz/RZi5WpaGb8s44I8ibsyDMhs/CpFts9Uy9SqHH8mLoKNiNc+s6HWqMxNaKKTDdFt4HI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhhQkl2fby6Ho0xCz7Q0TVqBjqG/PfCvJGCK2BP+r9b7SZmbLc
	RXbzBS0KYm8+jDNHQ0PPUvOYuJyeuieCbuELw7Sf/96PtBUrrgDRkMr6My+F0e8oHQt+0Fq96Sc
	NQLAv8J9qVFe1E65bo2koFLUHShBo2WaxR0j8knYH
X-Gm-Gg: ATEYQzwHlwD5lr1j9nsqtdkpBF67yDEQwXAxhPlJjdBSIPFTwiNHx6NnoU1xZn91qr4
	UkD+jtlEvvpeVcdD2wtfwxqcQQ/ACb/9UBgw839nQFMQTr6aA8xCqg69hqMarK3B04Bi+qkb4mq
	Lf5sZWJfHTXloPozPS5TFyjOXSAzXijgBe0YD1yMDXCRRNHaxzX5TvhjBSTm9r+98p/FJo5A2LP
	XMB3eJ5m43Idw9KQh93muq0GP2gdRckb38qDyShwMyJ2lAXOMgllc9tShJ1LzFCpOP4CefNM2vE
	eJbU1A==
X-Received: by 2002:ac8:590e:0:b0:503:4bc:c925 with SMTP id
 d75a77b69052e-5096aa2ae2cmr17578141cf.13.1773621833001; Sun, 15 Mar 2026
 17:43:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1773346620.git.ljs@kernel.org> <52a7b9a003ea51521ab3c0baf30337a7800a3af7.1773346620.git.ljs@kernel.org>
In-Reply-To: <52a7b9a003ea51521ab3c0baf30337a7800a3af7.1773346620.git.ljs@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sun, 15 Mar 2026 17:43:41 -0700
X-Gm-Features: AaiRm51H9IsCynzRpnxAc6_DrzYXD9cjd8fR558hmylwDQfMj5FrJzUnU5dorNw
Message-ID: <CAJuCfpHVN66abFrJgorXKBsjv7Ut=CP-E4NpLMC4SW613tJwtw@mail.gmail.com>
Subject: Re: [PATCH 03/15] mm: document vm_operations_struct->open the same as close()
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
> Describe when the operation is invoked and the context in which it is
> invoked, matching the description already added for vm_op->close().
>
> While we're here, update all outdated references to an 'area' field for
> VMAs to the more consistent 'vma'.
>
> Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
> ---
>  include/linux/mm.h | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
>
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index cc5960a84382..12a0b4c63736 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -748,15 +748,20 @@ struct vm_uffd_ops;
>   * to the functions called when a no-page or a wp-page exception occurs.
>   */
>  struct vm_operations_struct {
> -       void (*open)(struct vm_area_struct * area);
> +       /**
> +        * @open: Called when a VMA is remapped or split. Not called upon=
 first
> +        * mapping a VMA.

It's also called from dup_mmap() which is part of forking.

> +        * Context: User context.  May sleep.  Caller holds mmap_lock.
> +        */
> +       void (*open)(struct vm_area_struct *vma);
>         /**
>          * @close: Called when the VMA is being removed from the MM.
>          * Context: User context.  May sleep.  Caller holds mmap_lock.
>          */
> -       void (*close)(struct vm_area_struct * area);
> +       void (*close)(struct vm_area_struct *vma);
>         /* Called any time before splitting to check if it's allowed */
> -       int (*may_split)(struct vm_area_struct *area, unsigned long addr)=
;
> -       int (*mremap)(struct vm_area_struct *area);
> +       int (*may_split)(struct vm_area_struct *vma, unsigned long addr);
> +       int (*mremap)(struct vm_area_struct *vma);
>         /*
>          * Called by mprotect() to make driver-specific permission
>          * checks before mprotect() is finalised.   The VMA must not
> @@ -768,7 +773,7 @@ struct vm_operations_struct {
>         vm_fault_t (*huge_fault)(struct vm_fault *vmf, unsigned int order=
);
>         vm_fault_t (*map_pages)(struct vm_fault *vmf,
>                         pgoff_t start_pgoff, pgoff_t end_pgoff);
> -       unsigned long (*pagesize)(struct vm_area_struct * area);
> +       unsigned long (*pagesize)(struct vm_area_struct *vma);
>
>         /* notification that a previously read-only page is about to beco=
me
>          * writable, if an error is returned it will cause a SIGBUS */
> --
> 2.53.0
>
