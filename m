Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCA82F747F
	for <linux-doc@vger.kernel.org>; Tue,  6 Jan 2026 21:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767734327; cv=pass; b=snriQWrmQFPNai46If4y4RILxXpHeaTQDHQmAcPYTnjJ0rGMFPRpkJDxs8TuI4JnoCF8duZv4Ma15aG2EWrw5jik+TSo6qSnwIBHuoMe7d7EixY3OKuYwq/rVIvfGvOMBFNo3oV+a6aBlhoTyWff/ypC1JNV+RsMk68qefobSgk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767734327; c=relaxed/simple;
	bh=2eZu3wNs8iUx1piAwoxHcZPkglWSOYzLI0WFbNjPqu8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PZdjkIFrZXpfC28M/y4xJ1X7UlBKUP1zejfiNIZri1zT6nVsEwSp0+56d1Q3r03tc6gsUnJau06UMeZfpElsf0GUT/0AwN1APOSDge8ru/gBXGl83A7WT2xXKqyo1lWNGZcbc7XSLJq2ZOBWT/ZywS+gBC3mfb89JxguAzdohm4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ABNdh8xV; arc=pass smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ABNdh8xV"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-11f42e9977fso462c88.1
        for <linux-doc@vger.kernel.org>; Tue, 06 Jan 2026 13:18:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767734325; cv=none;
        d=google.com; s=arc-20240605;
        b=bs0FsyafkxPYU3Qs2Q+tJeNh6xlMfBgKdEiFwRwHD7x4CSbBafuZmjdJqODRhB78ra
         PjiV1on58SlezZ3xGiXHSoc3/ziuQpvZ1PXvKeKkRgcQrbH4BB1lV+jXV3oYOfCoCrsx
         fJUhCscrroI3wHdrhLhe9NW79ClYsKNKVws6E6XfLvudA3+orfujxzHq5ePP3fI/rHH8
         Yo8EQZCLS3UEzztakSh6izJzNs0JFUKERqO81Cpxl3Zl+JwWCq8Z5CVUpEq8AE0KpfVx
         xWb6Hcj2cSyMtSFn8Wq1LiLO0QAjapJNjUQpBFqillNK1ojTU89v4PQg/o2lpg0WNuUg
         OBRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VGVuujQe5nx9sEZAaa25hNtXumT1G+7mUeDPEY80VTs=;
        fh=GdV7L/54TS1lQS5g71Afp/CxMPIF5PVA5/fqw68d6cY=;
        b=Qvf4aaDYMmqmRKPsioWHkw3LoqozMyBpzLYrO+0j64r/CYa9DhzduivhLIRPAiGomH
         naWekGa415F+00f46SUyyJIubPcJv3PNAKWUUaKEU3HpaewdQn4DW7RS+z4OQxmn3+K7
         s+Odx4vr+MEklsoDOauEoffylM/73JQEOnHMjcaweWpKL0ae12PYpizywTJmFtfkMfYJ
         qw4wnZReLTLuV797n2qiP3x0ZHXtjX7hfOvPhcv+AB8eIbs6Yro0xtd5TvSxf1D2HukM
         +ea8NoxHhbir4kxFaHotMkfR3ZDOOFKG5UlEnDP9VJWU4jyeqMZxgN3QoEpuINCjSncc
         +x6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767734325; x=1768339125; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VGVuujQe5nx9sEZAaa25hNtXumT1G+7mUeDPEY80VTs=;
        b=ABNdh8xVHloZq5S0eKw0iNY3QcIV6fb9gkPtrQDEVXQyXwJLPiCXDGzSKx2PLyj//D
         f/58FXvy5IDts7BpERu62GBUOweVguC130LOAibDErtu2AsCN/7RvUAlp70SO2VXGqBL
         DGXb4weiDnTgFh8tMY31v6prpxITqrUSG4Ggq7KSdE3vby6y5HwMLwKYmY40I6bBO2MI
         ACfe8JNKfL3YdIABKLGdgTFdPg+7mFJ0Z5XoQK93FnmGpUqt3tALvU46qvMPuEoFzxHm
         zpMYCLEJEc+g8ZJpaoq1pnebp+5bBOzdv937HfTOYfCdpKKyfflJu2pTSKqv2giduvAv
         w4qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767734325; x=1768339125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VGVuujQe5nx9sEZAaa25hNtXumT1G+7mUeDPEY80VTs=;
        b=b0PpTJCWLn+kMvfRKTt/aUerG3lgW0UMNiJxywLAEOpty4hZRlrB99LK50usbD7AxA
         bhw1ljiBQ9ra8JAy8XWdhUpobWIpdLcA7vly5sCbgaa5MLIAxofAAmbsjnfPf3Mxoln9
         hp/qW5Y6pmovmnUDs2t3Kha6+H6Y8W4klXmzBIzG21qfoqxu3rwyXzSKyd1bz+YCc+AH
         cNTZ6zj25KVetr6XHcPEkn6FmpzRoXzVwFL1LETu9pTP4gXPZKjyby9H/D//SavM76mA
         IrTB3mrVTjw7HvQ9mocC1KksDAP5o+NYHENhRv+xambK7MLE+HRT2D9MJwUiEs8yB1AQ
         Tu6A==
X-Forwarded-Encrypted: i=1; AJvYcCVYeUUIc1lTzxXooeCdM6wWi56zY8kNmZ9UMC3gEhOWo10g7DYdkiFDpxD+0f41DuQVCtg82TIbV78=@vger.kernel.org
X-Gm-Message-State: AOJu0YwA7dN16xqMSWU71laqvfAt+sn+FI4OFKJ47SFFLmjHxHTkYZcy
	8Ia0JmZOR7E8Nt8HRKyiirbMzF6C8yQfLRQ/WWYAHd4mwlT8AAJBYlSRPt36FrClb6gy763ymcx
	hLEEEPnak4lpUbgf0417nzoknYqxijWYO/at8hCCV
X-Gm-Gg: AY/fxX6i5Dn5jeRnp6GFW0uJMu5MMPdtuwG7mXhnlOuwuK09orQn5msMcSNjSI113dZ
	4Tsqog+16wqrvl040AbiXSL8H7cJFVeU9ubaN1362eHYTA+Seu8N6lmNNeuL1JHsBg74CcSg6PE
	F4YfaPC+Ua1xZCrziiWTctvQgSw1ch1OV6113xSqPzOEuNZWwVal7qcWlvikOslYjRwGJimG+kZ
	I/VjFlLgtfuH0CvNE5JyVFPzb+pKUvXis6vpq+tAm5XVTCDCbFg1e2pqkLDYzrIjhXlg9co+3fM
	uT3CQDKNFnh9YUFxhAS3dpI=
X-Received: by 2002:a05:7022:49a:b0:11f:25fe:952f with SMTP id
 a92af1059eb24-121f8640d66mr27564c88.8.1767734324206; Tue, 06 Jan 2026
 13:18:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260106162200.2223655-1-smostafa@google.com> <20260106162200.2223655-4-smostafa@google.com>
In-Reply-To: <20260106162200.2223655-4-smostafa@google.com>
From: Samiullah Khawaja <skhawaja@google.com>
Date: Tue, 6 Jan 2026 13:18:29 -0800
X-Gm-Features: AQt7F2o1wSEXREnLHU0_pBEPtmmqdHD2M-tusioq9HwIDAwG5VqNr9DDjNwqNyE
Message-ID: <CAAywjhRceyE7WRaFY+Kyy=hGbMjzT9MJDC=+Y4kbXwvOxuDRSA@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] iommu: debug-pagealloc: Track IOMMU pages
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-mm@kvack.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, corbet@lwn.net, joro@8bytes.org, will@kernel.org, 
	robin.murphy@arm.com, akpm@linux-foundation.org, vbabka@suse.cz, 
	surenb@google.com, mhocko@suse.com, jackmanb@google.com, hannes@cmpxchg.org, 
	ziy@nvidia.com, david@redhat.com, lorenzo.stoakes@oracle.com, 
	Liam.Howlett@oracle.com, rppt@kernel.org, xiaqinxin@huawei.com, 
	baolu.lu@linux.intel.com, rdunlap@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 6, 2026 at 8:22=E2=80=AFAM Mostafa Saleh <smostafa@google.com> =
wrote:
>
> Using the new calls, use an atomic refcount to track how many times
> a page is mapped in any of the IOMMUs.
>
> For unmap we need to use iova_to_phys() to get the physical address
> of the pages.
>
> We use the smallest supported page size as the granularity of tracking
> per domain.
> This is important as it is possible to map pages and unmap them with
> larger sizes (as in map_sg()) cases.
>
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  drivers/iommu/iommu-debug-pagealloc.c | 91 +++++++++++++++++++++++++++
>  1 file changed, 91 insertions(+)
>
> diff --git a/drivers/iommu/iommu-debug-pagealloc.c b/drivers/iommu/iommu-=
debug-pagealloc.c
> index 1d343421da98..86ccb310a4a8 100644
> --- a/drivers/iommu/iommu-debug-pagealloc.c
> +++ b/drivers/iommu/iommu-debug-pagealloc.c
> @@ -29,19 +29,110 @@ struct page_ext_operations page_iommu_debug_ops =3D =
{
>         .need =3D need_iommu_debug,
>  };
>
> +static struct page_ext *get_iommu_page_ext(phys_addr_t phys)
> +{
> +       struct page *page =3D phys_to_page(phys);
> +       struct page_ext *page_ext =3D page_ext_get(page);
> +
> +       return page_ext;
> +}
> +
> +static struct iommu_debug_metadata *get_iommu_data(struct page_ext *page=
_ext)
> +{
> +       return page_ext_data(page_ext, &page_iommu_debug_ops);
> +}
> +
> +static void iommu_debug_inc_page(phys_addr_t phys)
> +{
> +       struct page_ext *page_ext =3D get_iommu_page_ext(phys);
> +       struct iommu_debug_metadata *d =3D get_iommu_data(page_ext);
> +
> +       WARN_ON(atomic_inc_return_relaxed(&d->ref) <=3D 0);
> +       page_ext_put(page_ext);
> +}
> +
> +static void iommu_debug_dec_page(phys_addr_t phys)
> +{
> +       struct page_ext *page_ext =3D get_iommu_page_ext(phys);
> +       struct iommu_debug_metadata *d =3D get_iommu_data(page_ext);
> +
> +       WARN_ON(atomic_dec_return_relaxed(&d->ref) < 0);
> +       page_ext_put(page_ext);
> +}
> +
> +/*
> + * IOMMU page size doesn't have to match the CPU page size. So, we use
> + * the smallest IOMMU page size to refcount the pages in the vmemmap.
> + * That is important as both map and unmap has to use the same page size
> + * to update the refcount to avoid double counting the same page.
> + * And as we can't know from iommu_unmap() what was the original page si=
ze
> + * used for map, we just use the minimum supported one for both.
> + */
> +static size_t iommu_debug_page_size(struct iommu_domain *domain)
> +{
> +       return 1UL << __ffs(domain->pgsize_bitmap);
> +}
> +
>  void __iommu_debug_map(struct iommu_domain *domain, phys_addr_t phys, si=
ze_t size)
>  {
> +       size_t off, end;
> +       size_t page_size =3D iommu_debug_page_size(domain);
> +
> +       if (WARN_ON(!phys || check_add_overflow(phys, size, &end)))
> +               return;
> +
> +       for (off =3D 0 ; off < size ; off +=3D page_size) {
> +               if (!pfn_valid(__phys_to_pfn(phys + off)))
> +                       continue;
> +               iommu_debug_inc_page(phys + off);
> +       }
> +}
> +
> +static void __iommu_debug_update_iova(struct iommu_domain *domain,
> +                                     unsigned long iova, size_t size, bo=
ol inc)
> +{
> +       size_t off, end;
> +       size_t page_size =3D iommu_debug_page_size(domain);
> +
> +       if (WARN_ON(check_add_overflow(iova, size, &end)))
> +               return;
> +
> +       for (off =3D 0 ; off < size ; off +=3D page_size) {
> +               phys_addr_t phys =3D iommu_iova_to_phys(domain, iova + of=
f);
> +
> +               if (!phys || !pfn_valid(__phys_to_pfn(phys)))
> +                       continue;
> +
> +               if (inc)
> +                       iommu_debug_inc_page(phys);
> +               else
> +                       iommu_debug_dec_page(phys);
> +       }
>  }
>
>  void __iommu_debug_unmap_begin(struct iommu_domain *domain,
>                                unsigned long iova, size_t size)
>  {
> +       __iommu_debug_update_iova(domain, iova, size, false);
>  }
>
>  void __iommu_debug_unmap_end(struct iommu_domain *domain,
>                              unsigned long iova, size_t size,
>                              size_t unmapped)
>  {
> +       if (unmapped =3D=3D size)
> +               return;
> +
> +       /*
> +        * If unmap failed, re-increment the refcount, but if it unmapped
> +        * larger size, decrement the extra part.
> +        */
> +       if (unmapped < size)
> +               __iommu_debug_update_iova(domain, iova + unmapped,
> +                                         size - unmapped, true);
> +       else
> +               __iommu_debug_update_iova(domain, iova + size,
> +                                         unmapped - size, false);
>  }
>
>  void iommu_debug_init(void)
> --
> 2.52.0.351.gbe84eed79e-goog
>
>

Reviewed-by: Samiullah Khawaja <skhawaja@google.com>
