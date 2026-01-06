Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4501A2D8DC4
	for <linux-doc@vger.kernel.org>; Tue,  6 Jan 2026 21:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767734289; cv=pass; b=WOgOmE378RCtH4JdbuTaZ51qxTGgspqfPtyROpbU3LysdLwG++caUKCktLADgsF+zUJvazTkZNa1WSLwqUrITsEju0IY/Sj9g4osKNUQFhGvfoN1yjJE6iYIugQv/QWU4Zz/rUtvWm4bpC8V3Nme0Blgdse4H2sbE0Zngt+pl3A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767734289; c=relaxed/simple;
	bh=kMIkUWBlWm7enz1u486qiHHr+t+9Ar5m0amjgXvmaCM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C3EHXaESW/XMsfWKdKJsVzZc38Sq/vH9dJ4DDYCC4X0opwZyhRXJVxs/DLG8D0clFwOx6iqSdVOrPBEuCtidYLW7qF4uRMM1mJ42Mr35snuitM6cojcQ6kW/QGCHIrqVKn4EA1xrQpvp8AjlgHo6BOIbTTFZvcMYsRQP6Q41wQ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DtpXvdr4; arc=pass smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DtpXvdr4"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-121adc0f1e5so1955c88.0
        for <linux-doc@vger.kernel.org>; Tue, 06 Jan 2026 13:18:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767734286; cv=none;
        d=google.com; s=arc-20240605;
        b=CLfUSZEkGduXZQ93UZ5QuQwmHtnXCbqLZVjy4cKESw4hG41VbmtrHNB8X0B6J8HQHL
         gwzKNG58ZyFv0fQc47Nc6WPiORYkgE4W4OUsKz4NrFWapmn4mAN8Jx+tSJ/NfkoFsZ22
         CpJldymaXnf/UU9VrdwN+OX6iNCWT2LlxaWGaa1MNtUmsncqZ/aII/3avZmy2Hz21dJz
         +bY/nFuFqSRd9P1bxeh+yAZQGf9hFBLFm9YxLetYVwj4hRTmQ71lwDrhecAzGr+Kh8Nq
         QAiFJ9p/U7Ys+jClF6vuwaYjvLHcIo5/aVhp4EoGh/K3eSiLNTlStzKlEbKTm+wgUJnr
         P09w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Xs4wYR5ihtYfkrcnwnzlMK7Ux63wyubPNcFx3ioLljA=;
        fh=c6Wa2OXCu30MeqtdsQ5VefMVe3okog2PyV7zAsGlzdQ=;
        b=e3SNdeF8OVyfdsSO/UqkpmvWsA+PBUIfWCvut3RhRgYy4Oq6VV1f/416ZYe5V+3SA1
         A4kihilC7b75TS3UEdv68bS711vTKGbnYDrOnhWg4Ih9SrzVRSncWbw99wM0FhilxKlF
         NqyeCi2T7VpHk3yyv3WJxb81D9hU1cuRUQVZiRSGS2nrk03YZH7kxVSPGkoKP9C63i/3
         v812EoIzMIOZkbVjREuYsK3c0tYylobS6LzxzMP10yTl5JwEDizx+NYml9lMl+wyNw1k
         QVKOz0gGpjgRmDetSrieUiryCUaLjm97HrlazfTKgB2kg5+QtfB/q/4GmMlZW2jFmgH3
         uc/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767734286; x=1768339086; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xs4wYR5ihtYfkrcnwnzlMK7Ux63wyubPNcFx3ioLljA=;
        b=DtpXvdr4CgaZ3+zH/utMiFh7Au+Bcc3H0k7lztKO5iy8LWhqHwAAmqhupiGSek+LyL
         zVA4E0O6L6F3b7QWKHeTFn+jETBqa00govQkyXCLI7LbzsBQGYj8QLWLBNtaC6hsjFAZ
         3IqkTuBnthD/gW4cXHhYxuuS+/65c/RxU61WgMY+Vz3FBqbK+n86YFjplM5WN/Jw958d
         Qn6BKIj+psDxhxgctk1r/ZWeOxqaTnD3FLCHqLppnCuDwZ3PjIri+BZ8Q97ZZU+g5HZ8
         FAX2lzpL989ALEXGoUzloQ6PWyqYd+IfN76AYZfhqDfbAnGUI1B4rOWbLLsw1mn59VHA
         ojfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767734286; x=1768339086;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xs4wYR5ihtYfkrcnwnzlMK7Ux63wyubPNcFx3ioLljA=;
        b=PmV8jQjDXT3DOzbebnMw7VQ0V6zXybO5Uj7L+E2Qm/l7Te4c5FLhhT77lLjn2SlWEV
         9qJq3j5rIqRQRiCBjGCmLVAHQLnONSMw6htMIpT0ocUgdBOvViOjGelkfKHmxfmj+/NZ
         6iKtzl23gJATcyr0ThkPcw+MrI/eLoqAZsEr3PSoCyQUrma50IXnlRk65HGMIuT2DtZw
         l2rUPtNzcAuE7y9u0dibrRJLpk0XjyWARn71GPdSBM2wUpi5Vfx/TVEbPwDY9jPx96KK
         oCE+Blss1OzrPgKizsCzRnl9kiQ8JIzkct2T//SJdyq3P0A/kd9ZNOhSAwMHiDbCcMvg
         FYKA==
X-Forwarded-Encrypted: i=1; AJvYcCX1KQ9iU+KaYOn6fsek0NjfrxoPhSjlOKcBVZd9ZqKJhfcppj7BKNL8oBT/sJnSPsOBN7E39pIDcx8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/vfE5QPZOYP0y8Q4IS/4Kz2F8qK7tIwwPOY2fnFQE2aK/kHAg
	O5icL0HRHjWLW8hAF6F9maMAUPjIEJ4u5pjoIP5q35h4Tpq2oQu4T9VkMB2foV6H3YUFWuLR9uk
	y1FY/p5INLDSh/6g/d9cETnYEngv/O43jkWu4u0s/
X-Gm-Gg: AY/fxX6+gFtGwMan9oTzkJytm6wEvr1r4Usa+VLKtog4Y6HiZR/XzjdH3FcLAsCChPS
	k4ihRtO+m2+MspT4fGkHvjo2wQD6m1l4iaFYMgOj32cxOizqo7i9syzySn8BE7qoyc/cbpDCR5B
	75ko+4duhf9n0Fd8DIAceGoQxnLbd3J+p0LUSzA2kMX00U1iWYwAxOC+a5Doo5XZMJZcqTzprhD
	x3fmWuIXnCXOBVdUP0jX96ePnKtZdopJFXFmddOfROAFnzYpV6dWpdKqeY5T6LlKWno43Gn5wXB
	oGouj2SlMCEMdvra43CpYcU=
X-Received: by 2002:a05:7022:11d:b0:119:e56b:c1d5 with SMTP id
 a92af1059eb24-121f85a2c84mr37453c88.0.1767734285772; Tue, 06 Jan 2026
 13:18:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260106162200.2223655-1-smostafa@google.com> <20260106162200.2223655-3-smostafa@google.com>
In-Reply-To: <20260106162200.2223655-3-smostafa@google.com>
From: Samiullah Khawaja <skhawaja@google.com>
Date: Tue, 6 Jan 2026 13:17:53 -0800
X-Gm-Features: AQt7F2qCrnBg0kXhETMA1MP9KFpVtvxrt0SQO0tr_xkvmJ_R9qPTToDvVX-GwBE
Message-ID: <CAAywjhQ-anM-+nPS=GXpuSf5abCAySA40iuYU-Bgh00hiqbfow@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] iommu: Add calls for IOMMU_DEBUG_PAGEALLOC
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
> Add calls for the new iommu debug config IOMMU_DEBUG_PAGEALLOC:
> - iommu_debug_init: Enable the debug mode if configured by the user.
> - iommu_debug_map: Track iommu pages mapped, using physical address.
> - iommu_debug_unmap_begin: Track start of iommu unmap operation, with
>   IOVA and size.
> - iommu_debug_unmap_end: Track the end of unmap operation, passing the
>   actual unmapped size versus the tracked one at unmap_begin.
>
> We have to do the unmap_begin/end as once pages are unmapped we lose
> the information of the physical address.
> This is racy, but the API is racy by construction as it uses refcounts
> and doesn't attempt to lock/synchronize with the IOMMU API as that will
> be costly, meaning that possibility of false negative exists.
>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  drivers/iommu/iommu-debug-pagealloc.c | 28 +++++++++++++
>  drivers/iommu/iommu-priv.h            | 58 +++++++++++++++++++++++++++
>  drivers/iommu/iommu.c                 | 11 ++++-
>  include/linux/iommu-debug-pagealloc.h |  1 +
>  4 files changed, 96 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/iommu/iommu-debug-pagealloc.c b/drivers/iommu/iommu-=
debug-pagealloc.c
> index 4022e9af7f27..1d343421da98 100644
> --- a/drivers/iommu/iommu-debug-pagealloc.c
> +++ b/drivers/iommu/iommu-debug-pagealloc.c
> @@ -5,11 +5,15 @@
>   * IOMMU API debug page alloc sanitizer
>   */
>  #include <linux/atomic.h>
> +#include <linux/iommu.h>
>  #include <linux/iommu-debug-pagealloc.h>
>  #include <linux/kernel.h>
>  #include <linux/page_ext.h>
>
> +#include "iommu-priv.h"
> +
>  static bool needed;
> +DEFINE_STATIC_KEY_FALSE(iommu_debug_initialized);
>
>  struct iommu_debug_metadata {
>         atomic_t ref;
> @@ -25,6 +29,30 @@ struct page_ext_operations page_iommu_debug_ops =3D {
>         .need =3D need_iommu_debug,
>  };
>
> +void __iommu_debug_map(struct iommu_domain *domain, phys_addr_t phys, si=
ze_t size)
> +{
> +}
> +
> +void __iommu_debug_unmap_begin(struct iommu_domain *domain,
> +                              unsigned long iova, size_t size)
> +{
> +}
> +
> +void __iommu_debug_unmap_end(struct iommu_domain *domain,
> +                            unsigned long iova, size_t size,
> +                            size_t unmapped)
> +{
> +}
> +
> +void iommu_debug_init(void)
> +{
> +       if (!needed)
> +               return;
> +
> +       pr_info("iommu: Debugging page allocations, expect overhead or di=
sable iommu.debug_pagealloc");
> +       static_branch_enable(&iommu_debug_initialized);
> +}
> +
>  static int __init iommu_debug_pagealloc(char *str)
>  {
>         return kstrtobool(str, &needed);
> diff --git a/drivers/iommu/iommu-priv.h b/drivers/iommu/iommu-priv.h
> index c95394cd03a7..aaffad5854fc 100644
> --- a/drivers/iommu/iommu-priv.h
> +++ b/drivers/iommu/iommu-priv.h
> @@ -5,6 +5,7 @@
>  #define __LINUX_IOMMU_PRIV_H
>
>  #include <linux/iommu.h>
> +#include <linux/iommu-debug-pagealloc.h>
>  #include <linux/msi.h>
>
>  static inline const struct iommu_ops *dev_iommu_ops(struct device *dev)
> @@ -65,4 +66,61 @@ static inline int iommufd_sw_msi(struct iommu_domain *=
domain,
>  int iommu_replace_device_pasid(struct iommu_domain *domain,
>                                struct device *dev, ioasid_t pasid,
>                                struct iommu_attach_handle *handle);
> +
> +#ifdef CONFIG_IOMMU_DEBUG_PAGEALLOC
> +
> +void __iommu_debug_map(struct iommu_domain *domain, phys_addr_t phys,
> +                      size_t size);
> +void __iommu_debug_unmap_begin(struct iommu_domain *domain,
> +                              unsigned long iova, size_t size);
> +void __iommu_debug_unmap_end(struct iommu_domain *domain,
> +                            unsigned long iova, size_t size, size_t unma=
pped);
> +
> +static inline void iommu_debug_map(struct iommu_domain *domain,
> +                                  phys_addr_t phys, size_t size)
> +{
> +       if (static_branch_unlikely(&iommu_debug_initialized))
> +               __iommu_debug_map(domain, phys, size);
> +}
> +
> +static inline void iommu_debug_unmap_begin(struct iommu_domain *domain,
> +                                          unsigned long iova, size_t siz=
e)
> +{
> +       if (static_branch_unlikely(&iommu_debug_initialized))
> +               __iommu_debug_unmap_begin(domain, iova, size);
> +}
> +
> +static inline void iommu_debug_unmap_end(struct iommu_domain *domain,
> +                                        unsigned long iova, size_t size,
> +                                        size_t unmapped)
> +{
> +       if (static_branch_unlikely(&iommu_debug_initialized))
> +               __iommu_debug_unmap_end(domain, iova, size, unmapped);
> +}
> +
> +void iommu_debug_init(void);
> +
> +#else
> +static inline void iommu_debug_map(struct iommu_domain *domain,
> +                                  phys_addr_t phys, size_t size)
> +{
> +}
> +
> +static inline void iommu_debug_unmap_begin(struct iommu_domain *domain,
> +                                          unsigned long iova, size_t siz=
e)
> +{
> +}
> +
> +static inline void iommu_debug_unmap_end(struct iommu_domain *domain,
> +                                        unsigned long iova, size_t size,
> +                                        size_t unmapped)
> +{
> +}
> +
> +static inline void iommu_debug_init(void)
> +{
> +}
> +
> +#endif /* CONFIG_IOMMU_DEBUG_PAGEALLOC */
> +
>  #endif /* __LINUX_IOMMU_PRIV_H */
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index 2ca990dfbb88..01b062575519 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -232,6 +232,8 @@ static int __init iommu_subsys_init(void)
>         if (!nb)
>                 return -ENOMEM;
>
> +       iommu_debug_init();
> +
>         for (int i =3D 0; i < ARRAY_SIZE(iommu_buses); i++) {
>                 nb[i].notifier_call =3D iommu_bus_notifier;
>                 bus_register_notifier(iommu_buses[i], &nb[i]);
> @@ -2562,10 +2564,12 @@ int iommu_map_nosync(struct iommu_domain *domain,=
 unsigned long iova,
>         }
>
>         /* unroll mapping in case something went wrong */
> -       if (ret)
> +       if (ret) {
>                 iommu_unmap(domain, orig_iova, orig_size - size);
> -       else
> +       } else {
>                 trace_map(orig_iova, orig_paddr, orig_size);
> +               iommu_debug_map(domain, orig_paddr, orig_size);
> +       }
>
>         return ret;
>  }
> @@ -2627,6 +2631,8 @@ static size_t __iommu_unmap(struct iommu_domain *do=
main,
>
>         pr_debug("unmap this: iova 0x%lx size 0x%zx\n", iova, size);
>
> +       iommu_debug_unmap_begin(domain, iova, size);
> +
>         /*
>          * Keep iterating until we either unmap 'size' bytes (or more)
>          * or we hit an area that isn't mapped.
> @@ -2647,6 +2653,7 @@ static size_t __iommu_unmap(struct iommu_domain *do=
main,
>         }
>
>         trace_unmap(orig_iova, size, unmapped);
> +       iommu_debug_unmap_end(domain, orig_iova, size, unmapped);
>         return unmapped;
>  }
>
> diff --git a/include/linux/iommu-debug-pagealloc.h b/include/linux/iommu-=
debug-pagealloc.h
> index 83e64d70bf6c..a439d6815ca1 100644
> --- a/include/linux/iommu-debug-pagealloc.h
> +++ b/include/linux/iommu-debug-pagealloc.h
> @@ -9,6 +9,7 @@
>  #define __LINUX_IOMMU_DEBUG_PAGEALLOC_H
>
>  #ifdef CONFIG_IOMMU_DEBUG_PAGEALLOC
> +DECLARE_STATIC_KEY_FALSE(iommu_debug_initialized);
>
>  extern struct page_ext_operations page_iommu_debug_ops;
>
> --
> 2.52.0.351.gbe84eed79e-goog
>
>

Reviewed-by: Samiullah Khawaja <skhawaja@google.com>
