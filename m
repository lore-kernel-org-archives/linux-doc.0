Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D78E2FB629
	for <linux-doc@vger.kernel.org>; Mon,  8 Dec 2025 20:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765224595; cv=none; b=bfA57AhSwWl0sqTgSKiRum3BP4UZDbtqWuHf9JjPUBMN0ox3Oi3xmXHp9Yot8xcgvFoEIgSNQrNsZ2TMjG2TdkI6Y+ZytnIIRywuqPMwUMcXiRSLMLYhk7wDk/dJWG2slG8+KcBVJF1E3CB1/+pYte/gRJmLiA0krgns6v/xgzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765224595; c=relaxed/simple;
	bh=QZuXQ8i96Q6z9m6pKilLFXWT9PDI1lbYt5cMxmZBut8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FR3Eni15A5VdT7SUR3V1e1NF8BPgdbxdRgC9DRdshySRJGr1RD+4QwF7LnMPwMJIMXrdqv85fbvcFXagrUY1mt+UrVdkI7HVv+dPK0gkAN4wzqyiuMcCAIyL2nqgl3yVSYeUKJnQ4pwozMBZehKl1B2/VdO7cZojmfzu8ogfEPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hi3mhmPp; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hi3mhmPp"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4ee147baf7bso1781cf.1
        for <linux-doc@vger.kernel.org>; Mon, 08 Dec 2025 12:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765224591; x=1765829391; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kHtc/+z90ueo42R+9ZDR9Ppw22giUiqfAKE3wYBFhaI=;
        b=hi3mhmPplayOz+BaNrou927wVGLFWQ87mVT+dzmeNts57Rjqkmm7jarI6r+dUfnwx2
         2OBrHPHma0ZEf7+OY9sNBWSZo2nHTLpzNyXpSO7QHBRQdD67G05NcncUVqCcMhNN2FOp
         nlEf59wa878233kXl3bpkBpvcuX6DcWeo8sTs+uGoAT9ltLskBtD4wEjcsIOQWUjmevE
         D0DuRul9a/ipCJ/A66hz3mNhsICV6jk2nWbb4+I82koqoxqzHSQ+emnoSb2pa3GMh8db
         GyucAwsVp1wKEqX79ZGAQLxw7nma3tAgLM0u91SXWelz51mN10PitUlyC0H23DF1g23W
         xSlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765224591; x=1765829391;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kHtc/+z90ueo42R+9ZDR9Ppw22giUiqfAKE3wYBFhaI=;
        b=LS8vCBaZekbgcrKPdwlKrzA+1/mTbJRQCTdv1iTa8ht3OqBkwXSYkuks/63F9f9BtO
         SwwMz67iAWb6PDIvjYXrLmrhquSWTNvzAHClITa991wOgspHFCnxmi77X2bSupHyO2Uj
         dU54q3tGi3ZbKNG29B1s/Wcwj9M79LvERoIGtNC5F7WheHz6mXV2inseyNe4VyladK0n
         icI08MVJM3imZtGHAzRqtRxoJeAsZgHK65R0DThE2tyq4hwyGqD9gJ7abjOBVyAYc8Io
         7wEsbu5Xm2aLoTOINkqmlNGpLzUKG1lFy99vCJUx9Nousn1iRDv+sU2kzrJi0m1pKb2W
         op/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUKlg/dmw7TpVqxLiA9skDU6/vXv47CjHlXSolmnUv6+OdQkPaFV9f2WfnvxFxBS357IVsdNoyolUE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxX/QMXP0pcywusnT0eiP0jwyHXiC3yiU7M+Hr12aG0N5R9sIyw
	OvYYEvcGyvstUkdRK7ZO99zerIoCFFG3wYKvpcDvgrDPhjPLWkIsZlmWwz0Yt1w7cS2rEwPZcc7
	5694E7lMA4vbCBhWPWKDj0j0NbIuMvkPwXMINQpAj
X-Gm-Gg: ASbGncuW1/xAL7AiRJ3L9E1bOORim3jyoE3v40yZi0lgDf7iq8hRBoo9JUfYlZvjp1l
	pZfvgcRRpOAYDeXNQLJv+3+sEIkAnU0KqbjUzaaL0CC8CCKHDZaMQebHGDalNQ8yUN2P7Bpp2of
	X27zq944QpifhByGdfH9luqBnfRbsdZqSgpTqm9gOqZ3PZ35onThF+Y5xeGItsKqHzMyTTWlFeq
	kvInIVil0SyEEy0QcLSkmiEHg2uOILVrHeEYehGS3Hb/Envorbi3cwO79aAPzZ/4ARc9V7h1FG2
	QMWu
X-Google-Smtp-Source: AGHT+IEpZoR/iQOyoic1B163k5XpJh88inqgJpWY7MOX9hadvYKtYDxWwg4ICG4nBzjKIlyip58I04JqGTDCPmwL53c=
X-Received: by 2002:a05:622a:41:b0:4b7:94d7:8b4c with SMTP id
 d75a77b69052e-4f1a4d2d82dmr2006671cf.0.1765224590828; Mon, 08 Dec 2025
 12:09:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251124200811.2942432-1-smostafa@google.com> <20251124200811.2942432-3-smostafa@google.com>
 <07434771-3233-4c88-b505-ee02da72c905@linux.intel.com> <aSV-Xi5uMJcMtk1b@google.com>
In-Reply-To: <aSV-Xi5uMJcMtk1b@google.com>
From: Mostafa Saleh <smostafa@google.com>
Date: Mon, 8 Dec 2025 20:09:38 +0000
X-Gm-Features: AQt7F2rms2NfQ0fmpo7RMgd6BkOwNRHXqeaRPgLhXlJQKJwBB3kdVgcG7LFHRKY
Message-ID: <CAFgf54qGdWNB=Oa=vbU1hRN2XOxQSESGO6K0CiG4Qizv=T3+Qw@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] drivers/iommu: Add calls for IOMMU_DEBUG_PAGEALLOC
To: Baolu Lu <baolu.lu@linux.intel.com>
Cc: linux-mm@kvack.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, corbet@lwn.net, joro@8bytes.org, will@kernel.org, 
	robin.murphy@arm.com, akpm@linux-foundation.org, vbabka@suse.cz, 
	surenb@google.com, mhocko@suse.com, jackmanb@google.com, hannes@cmpxchg.org, 
	ziy@nvidia.com, david@redhat.com, lorenzo.stoakes@oracle.com, 
	Liam.Howlett@oracle.com, rppt@kernel.org, xiaqinxin@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 25, 2025 at 10:01=E2=80=AFAM Mostafa Saleh <smostafa@google.com=
> wrote:
>
> On Tue, Nov 25, 2025 at 03:35:08PM +0800, Baolu Lu wrote:
> > On 11/25/25 04:08, Mostafa Saleh wrote:
> > > Add calls for the new iommu debug config IOMMU_DEBUG_PAGEALLOC:
> > > - iommu_debug_init: Enable the debug mode if configured by the user.
> > > - iommu_debug_map: Track iommu pages mapped, using physical address.
> > > - iommu_debug_unmap_begin: Track start of iommu unmap operation, with
> > >    IOVA and size.
> > > - iommu_debug_unmap_end: Track the end of unmap operation, passing th=
e
> > >    actual unmapped size versus the tracked one at unmap_begin.
> > >
> > > We have to do the unmap_begin/end as once pages are unmapped we lose
> > > the information of the physical address.
> > > This is racy, but the API is racy by construction as it uses refcount=
s
> > > and doesn't attempt to lock/synchronize with the IOMMU API as that wi=
ll
> > > be costly, meaning that possibility of false negative exists.
> > >
> > > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > > ---
> > >   drivers/iommu/iommu-debug-pagealloc.c | 26 +++++++++++++
> > >   drivers/iommu/iommu.c                 | 12 +++++-
> > >   include/linux/iommu-debug-pagealloc.h | 56 ++++++++++++++++++++++++=
+++
> > >   3 files changed, 92 insertions(+), 2 deletions(-)
> > >
> >
> > Remove "drivers/" from the commit title.
> >
> > $ git log --oneline drivers/iommu/iommu.c
>
> My bad, I will fix it.
>
> >
> > [...]
> > > diff --git a/include/linux/iommu-debug-pagealloc.h b/include/linux/io=
mmu-debug-pagealloc.h
> > > index 83e64d70bf6c..454303ec09c2 100644
> > > --- a/include/linux/iommu-debug-pagealloc.h
> > > +++ b/include/linux/iommu-debug-pagealloc.h
> > > @@ -8,10 +8,66 @@
> > >   #ifndef __LINUX_IOMMU_DEBUG_PAGEALLOC_H
> > >   #define __LINUX_IOMMU_DEBUG_PAGEALLOC_H
> > > +struct iommu_domain;
> > > +
> > >   #ifdef CONFIG_IOMMU_DEBUG_PAGEALLOC
> > > +DECLARE_STATIC_KEY_FALSE(iommu_debug_initialized);
> > > +
> > >   extern struct page_ext_operations page_iommu_debug_ops;
> > > +void __iommu_debug_map(struct iommu_domain *domain, phys_addr_t phys=
,
> > > +                  size_t size);
> > > +void __iommu_debug_unmap_begin(struct iommu_domain *domain,
> > > +                          unsigned long iova, size_t size);
> > > +void __iommu_debug_unmap_end(struct iommu_domain *domain,
> > > +                        unsigned long iova, size_t size, size_t unma=
pped);
> > > +
> > > +static inline void iommu_debug_map(struct iommu_domain *domain,
> > > +                              phys_addr_t phys, size_t size)
> > > +{
> > > +   if (static_branch_unlikely(&iommu_debug_initialized))
> > > +           __iommu_debug_map(domain, phys, size);
> > > +}
> > > +
> > > +static inline void iommu_debug_unmap_begin(struct iommu_domain *doma=
in,
> > > +                                      unsigned long iova, size_t siz=
e)
> > > +{
> > > +   if (static_branch_unlikely(&iommu_debug_initialized))
> > > +           __iommu_debug_unmap_begin(domain, iova, size);
> > > +}
> > > +
> > > +static inline void iommu_debug_unmap_end(struct iommu_domain *domain=
,
> > > +                                    unsigned long iova, size_t size,
> > > +                                    size_t unmapped)
> > > +{
> > > +   if (static_branch_unlikely(&iommu_debug_initialized))
> > > +           __iommu_debug_unmap_end(domain, iova, size, unmapped);
> > > +}
> > > +
> > > +void iommu_debug_init(void);
> > > +
> > > +#else
> > > +static inline void iommu_debug_map(struct iommu_domain *domain,
> > > +                              phys_addr_t phys, size_t size)
> > > +{
> > > +}
> > > +
> > > +static inline void iommu_debug_unmap_begin(struct iommu_domain *doma=
in,
> > > +                                      unsigned long iova, size_t siz=
e)
> > > +{
> > > +}
> > > +
> > > +static inline void iommu_debug_unmap_end(struct iommu_domain *domain=
,
> > > +                                    unsigned long iova, size_t size,
> > > +                                    size_t unmapped)
> > > +{
> > > +}
> > > +
> > > +static inline void iommu_debug_init(void)
> > > +{
> > > +}
> >
> > I suppose that all these should go to drivers/iommu/iommu-priv.h, as
> > they are for use in other files inside the IOMMU subsystem.
>
> It seemed better to have all the feature functions/declarations in one
> isolated file, as it is included outside of the iommu susbsystem also.
> I have no strong opinion, I can keep them in drivers/iommu/iommu-priv.h
> if you think it's better. But then we will have to include also
> "iommu-debug-pagealloc.h" for the static key to avoid including extra
> files to linux/mm.h.
>
> Thanks,
> Mostafa
>

Hi Baolu,

I plan to post a new version soon. So far, I only have the commit
subject rewrites. Do you have any opinion on the header file split or
the unmap size part?

Thanks,
Mostafa

> >
> > > +
> > >   #endif /* CONFIG_IOMMU_DEBUG_PAGEALLOC */
> > >   #endif /* __LINUX_IOMMU_DEBUG_PAGEALLOC_H */
> >
> > Thanks,
> > baolu
