Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949B122A1D5
	for <linux-doc@vger.kernel.org>; Tue,  6 Jan 2026 21:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767734369; cv=pass; b=YivURZgBYdtyZBKMHf6yzzO1V15qiK/XDZ8pORc5bJ/Re4S0rgageg4uJBVxSHRGurdB3zxjoFMghf67jyupkUrbjsJ9v6BWUMGEcLdXX/2y11xrRZtRzh1qYMug5XlmosKFBtd00zjfAqusSjVlXjWtBSoXqOAAsky0woYZjPo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767734369; c=relaxed/simple;
	bh=sNK+qQwDfUndLOKto7ahkG+BQnpGyBQcb9WTb7JdGTU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TrYEFSyXsG3zy+KgWGGRT4USft+Vqm8GHYprdNBkYghZ7rlC6VTsKBo/yEezqHLLnte7SUjoNgMCsiwwBd+1woicdc20plAF/PeuyBX3jj4s3cH9YyjWto9txZ4B+1dzZ4y5g9b2WGVgoJ6Bo8NNSIungtxDJD3+VWw44yYlNRQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0KiiTd4v; arc=pass smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0KiiTd4v"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-121b14efcddso575c88.1
        for <linux-doc@vger.kernel.org>; Tue, 06 Jan 2026 13:19:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767734367; cv=none;
        d=google.com; s=arc-20240605;
        b=Wc5GZCLzmAFVcu8etp8CHneyynZXidcJi+SdAxbirZ5ahHuMzmmqg/fv0bhAk5x1m3
         CDvilOotqKR8/olvRWHQcvN5AHN9xfZJD6104yJbPCv6fBqCZANfdFk1d5JHZUaE94cV
         o6jqr+BPsDAQm6ifqDNfzdO4HJEzLVYTwTBXOe9xf3Ora42MX/sOQJT67hY+8Cc5RKNf
         iKBebrvJL/W/PvQ4+N4TA61UDUji/8hYf+w3RZCeKkzz2Ex2jzdwc5fdo0+W/aLqllyO
         1S/qPCWXOguQLmYGH+7L7b8BdI+/aRtMS+E/xAqnSIfQ9Kc1fl70vjC9Uf58eXvzSz+s
         xLLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v0WDLL1FeM2LN8bxMsxZQjW0E/VVI2Vol2qU0rnzeCI=;
        fh=ibiR4w5HdhTDJ/0cWriILX1uNDIF73kSRrSEsTtBWrA=;
        b=EslROQHRP/e9UEvq+AstyYyZ2PPvFBoSaU6nMYppIbulbD5BFfUvBQ3mwzTGkoGTGZ
         blKxG5pJ1JtOAkvjLmXRMAEPIJScz8svNS8OlrMtSBvJTv+dQhAxEzDFJ5iiO8KHuuDC
         RtJBlON/MCjrvfyMUaIb1q1MWQuM53vKlR3BLEocJS42lb50P8Kqk/Ke95orwNBbrT4f
         GUDa23GabxriI9d52+eTP597EAGNMjy4WSqsFeVIUwOVw0fCIgO5b0SnuZtWZEO/PjMo
         zgf+ZJ097yJQIXGbqu71GWTXCIuUjoi21lJB1RecYeQlu+SCPmPBtW7QkZdKe68B/JD3
         nFdQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767734367; x=1768339167; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v0WDLL1FeM2LN8bxMsxZQjW0E/VVI2Vol2qU0rnzeCI=;
        b=0KiiTd4vvvsElIIk6AUDGagZPMANwxN78LhELK8HYl5hB3Rbqr+rsZUGCBK3r4yrtp
         MaYc+M3mWajsk/OxVaMRvxH0HqkMXFG7bgp7bwAiyo8x+QoGuqgdFmlwKBKfZuplTcIe
         mlpinWB4XYnzZhG0Q0sJ9piI0nTpBOKlpSDlQbZApv0xt4wN/cEtEhnvjXzud9E7zr21
         ORSTSgnU+w5JoJ7Zj/HI3pmFVklb6OmfgymzEqq6DcHbzYeUO2vSpm+lTeaxE+swynFT
         mHYV0bzjsYqyQu+R33z0ZSwOugX/+DoG06JgIVS+O1MWRjxqNIGQTvG9vKQ4Oohla/yN
         ftHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767734367; x=1768339167;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v0WDLL1FeM2LN8bxMsxZQjW0E/VVI2Vol2qU0rnzeCI=;
        b=iZu+V6zHkkukHCXDNw7HWuu10ujmQRNpmKZKHlv+hblafqURflbzLIJyea6AMP57fM
         mrqwJONzEzh2IQR8ohYcVlLObpAjE3vPCJxrNveHGHheQUROprtvl0KI9E4znGIlJT+K
         CrIRX+xjqAqrNz8tz7G5bnN0h1eVUXa963p6CCUdpleX+sFu0ziFjw6mFwyhg/H10oIW
         1PALSnvaYt0rBXHdJApI8KThsKlbrqXvIQdZ7VO4zDG8rm6Oj82T0Frs3cVZg0NgTFs8
         QUHb0UVRF7Ri5e6DxdJKYCKbHBKBrUkgjjpDTpFsaxyPF0G7obuhcvoiiQxiElUUJgmJ
         x8NQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyCVlSiA680ozFWPGFUzkHnXNyX9daueU7ExMwgKzUfSSgPEe3HCR7hOiCTgEz5NbVCPoLyw0Xczw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjNIImt1mKHhorWzruKr5wWlybLegZXnwfPwY+WqTgV0jUHfxO
	4Ft62td86TmONUpLEX00O1BYu5Iav9txQW1Ld6vDbQXuCnW60KQl7a2wtFSxfnpGq7TeX0V/8tW
	OZd8pmlrJYZODiOpmO7UiM/UjFq1DvJ0ntc4slKjn
X-Gm-Gg: AY/fxX6FpeQpbA1ESc36dYENqITXGdOlYzXJMnpPC1Re21U1X6vhyJ2mRX6NZpyIhz0
	e8nxOs/KELgJP3z6w2/MWsted1zMmZkNJ0VTDH+xariMMKANZlkVLJeyaTu4/MD5EWEsppZzR3t
	VU54LqNDUfSijdmiEycig3QJh0rtq8ROVlCDCmYpEVO27qMwehMSVouWMXyEHGbgrijsMKEvWtL
	mXkXc6GX77Qz0CaFF4msbVPkRM/jOzXdSQmkVeutN4BmcGEgAwN1gNRJXkDLR7oMcSjUTe5oxYe
	KZl8r+osnLoUSwxUILeWkms/FG5nX5mmTg==
X-Received: by 2002:a05:7022:2204:b0:11a:4c75:a45b with SMTP id
 a92af1059eb24-121f8690149mr27061c88.10.1767734366229; Tue, 06 Jan 2026
 13:19:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260106162200.2223655-1-smostafa@google.com> <20260106162200.2223655-5-smostafa@google.com>
In-Reply-To: <20260106162200.2223655-5-smostafa@google.com>
From: Samiullah Khawaja <skhawaja@google.com>
Date: Tue, 6 Jan 2026 13:19:13 -0800
X-Gm-Features: AQt7F2oijAP3GChcEgGLCyF9ausjTQAQE9RZQidHFJzJm2N1jZ-pPamc_b3fK2A
Message-ID: <CAAywjhQ=b504kj7j0sBR4tShkeFcgEZw5nY-SvQDdZoaEEP00g@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] iommu: debug-pagealloc: Check mapped/unmapped
 kernel memory
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
> Now, as the page_ext holds count of IOMMU mappings, we can use it to
> assert that any page allocated/freed is indeed not in the IOMMU.
>
> The sanitizer doesn=E2=80=99t protect against mapping/unmapping during th=
is
> period. However, that=E2=80=99s less harmful as the page is not used by t=
he
> kernel.
>
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  drivers/iommu/iommu-debug-pagealloc.c | 23 +++++++++++++++++++++++
>  include/linux/iommu-debug-pagealloc.h | 14 ++++++++++++++
>  include/linux/mm.h                    |  5 +++++
>  3 files changed, 42 insertions(+)
>
> diff --git a/drivers/iommu/iommu-debug-pagealloc.c b/drivers/iommu/iommu-=
debug-pagealloc.c
> index 86ccb310a4a8..5353417e64f9 100644
> --- a/drivers/iommu/iommu-debug-pagealloc.c
> +++ b/drivers/iommu/iommu-debug-pagealloc.c
> @@ -9,6 +9,7 @@
>  #include <linux/iommu-debug-pagealloc.h>
>  #include <linux/kernel.h>
>  #include <linux/page_ext.h>
> +#include <linux/page_owner.h>
>
>  #include "iommu-priv.h"
>
> @@ -73,6 +74,28 @@ static size_t iommu_debug_page_size(struct iommu_domai=
n *domain)
>         return 1UL << __ffs(domain->pgsize_bitmap);
>  }
>
> +static bool iommu_debug_page_count(const struct page *page)
> +{
> +       unsigned int ref;
> +       struct page_ext *page_ext =3D page_ext_get(page);
> +       struct iommu_debug_metadata *d =3D get_iommu_data(page_ext);
> +
> +       ref =3D atomic_read(&d->ref);
> +       page_ext_put(page_ext);
> +       return ref !=3D 0;
> +}
> +
> +void __iommu_debug_check_unmapped(const struct page *page, int numpages)
> +{
> +       while (numpages--) {
> +               if (WARN_ON(iommu_debug_page_count(page))) {
> +                       pr_warn("iommu: Detected page leak!\n");
> +                       dump_page_owner(page);
> +               }
> +               page++;
> +       }
> +}
> +
>  void __iommu_debug_map(struct iommu_domain *domain, phys_addr_t phys, si=
ze_t size)
>  {
>         size_t off, end;
> diff --git a/include/linux/iommu-debug-pagealloc.h b/include/linux/iommu-=
debug-pagealloc.h
> index a439d6815ca1..46c3c1f70150 100644
> --- a/include/linux/iommu-debug-pagealloc.h
> +++ b/include/linux/iommu-debug-pagealloc.h
> @@ -13,6 +13,20 @@ DECLARE_STATIC_KEY_FALSE(iommu_debug_initialized);
>
>  extern struct page_ext_operations page_iommu_debug_ops;
>
> +void __iommu_debug_check_unmapped(const struct page *page, int numpages)=
;
> +
> +static inline void iommu_debug_check_unmapped(const struct page *page, i=
nt numpages)
> +{
> +       if (static_branch_unlikely(&iommu_debug_initialized))
> +               __iommu_debug_check_unmapped(page, numpages);
> +}
> +
> +#else
> +static inline void iommu_debug_check_unmapped(const struct page *page,
> +                                             int numpages)
> +{
> +}
> +
>  #endif /* CONFIG_IOMMU_DEBUG_PAGEALLOC */
>
>  #endif /* __LINUX_IOMMU_DEBUG_PAGEALLOC_H */
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 6f959d8ca4b4..32205d2a24b2 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -36,6 +36,7 @@
>  #include <linux/rcuwait.h>
>  #include <linux/bitmap.h>
>  #include <linux/bitops.h>
> +#include <linux/iommu-debug-pagealloc.h>
>
>  struct mempolicy;
>  struct anon_vma;
> @@ -4133,12 +4134,16 @@ extern void __kernel_map_pages(struct page *page,=
 int numpages, int enable);
>  #ifdef CONFIG_DEBUG_PAGEALLOC
>  static inline void debug_pagealloc_map_pages(struct page *page, int nump=
ages)
>  {
> +       iommu_debug_check_unmapped(page, numpages);
> +
>         if (debug_pagealloc_enabled_static())
>                 __kernel_map_pages(page, numpages, 1);
>  }
>
>  static inline void debug_pagealloc_unmap_pages(struct page *page, int nu=
mpages)
>  {
> +       iommu_debug_check_unmapped(page, numpages);
> +
>         if (debug_pagealloc_enabled_static())
>                 __kernel_map_pages(page, numpages, 0);
>  }
> --
> 2.52.0.351.gbe84eed79e-goog
>
>

Reviewed-by: Samiullah Khawaja <skhawaja@google.com>
