Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103EA1F8AC8
	for <linux-doc@vger.kernel.org>; Tue, 23 Dec 2025 18:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766513378; cv=none; b=ZYFQytmCwrDx3Y/8D5E6YdiCnsSvlKmOXxzafjujNCQWUDCvXJeHhZ5qDKMvixYGGJcFdbuLJZPpPYGHpSrOBYX+XG3cEGesieUGVT+7X1waVzO4/UR6xGh7L4IkkGXMiE80imFOaG66gjUMDvRe0UHJBOeIrKg+wZARVMmO5rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766513378; c=relaxed/simple;
	bh=A4upxFkx04EUaehF33mZCT/280IXUIJrRsjTWGrMZgs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pAZbYuwa6p+UfxDZxUoPFa5Psm/r19KCruhPGRYwjyEh4o2gTdixWL+plXxEn7ZEparXn0TXBQjbEdTIznuUQ69HoZC6T+bp+EUVzYZZ3hP+njJjdUqMwk9aq2biTkYIiJ1vlx3Xk6EM4Bc+pIjr+DvA0lWLAvGrAUQXN3L3yMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=FIXQyAq8; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="FIXQyAq8"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-64d1ef53cf3so3796692a12.0
        for <linux-doc@vger.kernel.org>; Tue, 23 Dec 2025 10:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1766513375; x=1767118175; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y0mvoCbuMd4eC9vUuRIk+xJnlqy18MydCTDV6Wj6wlQ=;
        b=FIXQyAq842CWSmPtMjfhEgDqsqKlJ5CDTSKhAlMin6gyrveQps6UpyLn97F9BHXaqA
         Wcwas1ylWRr5YmmWwaEi9CACLFpgDFQkxZ+mxaNgUdpPvlahJXtUMrHuLY+XmaSaxRIu
         k6nWHjp6dMdu15h19dN/4lOUG2CgR+t37CYAc/F806H5NfQfCK/TtrTE5W85NJUx27jn
         K+KIk7UxpgmxztRi4mWbTPjFNsN+AcqEHa19g2Ldy5gHLydzRjG++r/751gRued0PCYU
         ou+MLWYHaGfgS2Va1CLMnpU0J129Rsdn7XJrIYGD7rUFspkKDtFRz+Z3rbkHVzfa1BxP
         HuqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766513375; x=1767118175;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y0mvoCbuMd4eC9vUuRIk+xJnlqy18MydCTDV6Wj6wlQ=;
        b=qZspMtEPV9pbhcrlRAss9e39slZL/W9IsDfnOVXVLYwlbE97KXb3L7ueroXe4U9yy4
         KCM12R5DN3VPIqKoV/n7dtkvZlS/eMg1SU+Q6HNRPVZG5f+/DhyjSeEJ6N5PMtbpHrXg
         nNwAzpsIcE4JWaa19C1mBMrcJtpKnfIZE3B6+5K2AMxhCviOgpn0RPV+Bnqb7b4Hho5A
         YxvJBY+rBhvqLaNjxHe6TFW7qqZE3+ktYkEzvPLyNr7ghy0KW2/uVuv+53uPkeiYgWcQ
         FJzg2ctPyN5NwMH3y4HpviCV9T2Y8jE3gzIR8Y6t3wjZjD7koY3CY1dJxthYUcaIsfC/
         Zj7w==
X-Forwarded-Encrypted: i=1; AJvYcCXDv1ZtqIqDN1uTS/46yNhl2cQb93zM5qPiRB75MWgVusxrwzfRq1sEj4t1gqhGupTxwCEGYFKVSYY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNzIygRJTs87Qc7N1iWlZqUohNRb0DM6EUV81rcnpmyuIFjRwQ
	1aHN0bog0jaStBsbjmF90LUYxgiy+Wa25rBbPYz/zLtE7M5ZCj/yZwF+Xl4RbFLn8jv4aNCqJOz
	6sQ3sRe0Ll9hC6qnp+Pzf8F++UrOGT/hM+GqoZ0z2iw==
X-Gm-Gg: AY/fxX7+HDWsuBPHTNBJhpQZT1mUPltix8r3S6YK97ZjmJsfZeoQKddkB6S1HWhXQpE
	Jbh85Sdd5jgku8mlqNvJI1Q2ybPQdi/0Xl5uRlQ7+4g6WQz+LX0qMvrmpsJ0bA8rwDDZoRVzMVj
	Ks3pk/I4ZY1Z5VpWpdL4OYU4ky6ebgfvjfBnxAKNWNT8soaUfkAZAoX9ezkseyP9qAwb8ihx1//
	dk2X0rupo9xUzUxQg4O61AamfbhHJu69dRBCXHsAC/IQmEEkJXlU6EfkvSJb30/pRdExd/ymgIK
	Vh0/DJUI77ucmFVmL6w3eRrmbA==
X-Google-Smtp-Source: AGHT+IHHyUf0R+vHniFfbEYJMvb3fpH/MlbN/XPxv0Z5WmJczLbpPFoRGmWoDzSU9Fg1wq7iuKESJj2bcABIf0GuBCY=
X-Received: by 2002:a05:6402:535b:20b0:64c:62f7:1ac4 with SMTP id
 4fb4d7f45d1cf-64c62f71cb9mr9764002a12.32.1766513375289; Tue, 23 Dec 2025
 10:09:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251206230222.853493-1-pratyush@kernel.org> <20251206230222.853493-4-pratyush@kernel.org>
In-Reply-To: <20251206230222.853493-4-pratyush@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Tue, 23 Dec 2025 13:08:59 -0500
X-Gm-Features: AQt7F2pUw5VhwuozKnCUEq4zB5jjvJjDYSUWusyCg9tH-jAG1cRM1Slm6WUoNhs
Message-ID: <CA+CK2bApV4A-hCO3eHX7-1QdjDX=FpnrVHfa8TQBt_1JStY-BA@mail.gmail.com>
Subject: Re: [RFC PATCH 03/10] liveupdate: do early initialization before
 hugepages are allocated
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Muchun Song <muchun.song@linux.dev>, 
	Oscar Salvador <osalvador@suse.de>, Alexander Graf <graf@amazon.com>, David Matlack <dmatlack@google.com>, 
	David Rientjes <rientjes@google.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Samiullah Khawaja <skhawaja@google.com>, Vipin Sharma <vipinsh@google.com>, 
	Zhu Yanjun <yanjun.zhu@linux.dev>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-doc@vger.kernel.org, kexec@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 6, 2025 at 6:03=E2=80=AFPM Pratyush Yadav <pratyush@kernel.org>=
 wrote:
>
> To support hugepage preservation using LUO, the hugetlb subsystem needs
> to get liveupdate data when it allocates the hugepages to find out how
> many pages are coming from live update.
>
> Move early LUO init from early_initcall to mm_core_init(). This is where
> gigantic hugepages are allocated on ARM64. On x86, they are allocated in
> setup_arch(), so have a call there as well. Keep track of whether the
> function was already called to avoid double-init.
>
> liveupdate_early_init() only gets the KHO subtree and validates the data
> to ensure it is valid and understood. These are read-only operations and
> do not need much from the system, so it is safe to call early in boot.
>
> Signed-off-by: Pratyush Yadav <pratyush@kernel.org>
> ---
>  arch/x86/kernel/setup.c          |  7 +++++++
>  include/linux/liveupdate.h       |  6 ++++++
>  kernel/liveupdate/luo_core.c     | 30 ++++++++++++++++++++++++++----
>  kernel/liveupdate/luo_internal.h |  2 ++
>  mm/mm_init.c                     |  7 +++++++
>  5 files changed, 48 insertions(+), 4 deletions(-)
>
> diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
> index 9bf00287c408..e2ec779afc2c 100644
> --- a/arch/x86/kernel/setup.c
> +++ b/arch/x86/kernel/setup.c
> @@ -26,6 +26,7 @@
>  #include <linux/tboot.h>
>  #include <linux/usb/xhci-dbgp.h>
>  #include <linux/vmalloc.h>
> +#include <linux/liveupdate.h>
>
>  #include <uapi/linux/mount.h>
>
> @@ -1216,6 +1217,12 @@ void __init setup_arch(char **cmdline_p)
>
>         kho_memory_init();
>
> +       /*
> +        * Hugepages might be preserved from a liveupdate. Make sure it i=
s
> +        * initialized so hugetlb can query its state.
> +        */
> +       liveupdate_early_init();
> +
>         if (boot_cpu_has(X86_FEATURE_GBPAGES)) {
>                 hugetlb_cma_reserve(PUD_SHIFT - PAGE_SHIFT);
>                 hugetlb_bootmem_alloc();
> diff --git a/include/linux/liveupdate.h b/include/linux/liveupdate.h
> index ed81e7b31a9f..78e8c529e4e7 100644
> --- a/include/linux/liveupdate.h
> +++ b/include/linux/liveupdate.h
> @@ -214,6 +214,8 @@ struct liveupdate_flb {
>
>  #ifdef CONFIG_LIVEUPDATE
>
> +void __init liveupdate_early_init(void);
> +
>  /* Return true if live update orchestrator is enabled */
>  bool liveupdate_enabled(void);
>
> @@ -233,6 +235,10 @@ int liveupdate_flb_get_outgoing(struct liveupdate_fl=
b *flb, void **objp);
>
>  #else /* CONFIG_LIVEUPDATE */
>
> +static inline void liveupdate_early_init(void)
> +{
> +}
> +
>  static inline bool liveupdate_enabled(void)
>  {
>         return false;
> diff --git a/kernel/liveupdate/luo_core.c b/kernel/liveupdate/luo_core.c
> index 7a9ef16b37d8..2c740ecad8e6 100644
> --- a/kernel/liveupdate/luo_core.c
> +++ b/kernel/liveupdate/luo_core.c
> @@ -69,6 +69,13 @@ static struct {
>         u64 liveupdate_num;
>  } luo_global;
>
> +static bool __luo_early_initialized __initdata;
> +
> +bool __init luo_early_initialized(void)
> +{
> +       return __luo_early_initialized;
> +}

I think the above is not needed, both the global variable, and a new functi=
on.

> +
>  static int __init early_liveupdate_param(char *buf)
>  {
>         return kstrtobool(buf, &luo_global.enabled);
> @@ -133,20 +140,35 @@ static int __init luo_early_startup(void)
>         return err;
>  }
>
> -static int __init liveupdate_early_init(void)
> +/*
> + * This should only be called after KHO FDT is known. It gets the LUO su=
btree
> + * and does initial validation, making early boot read-only access possi=
ble.
> + */
> +void __init liveupdate_early_init(void)
>  {
>         int err;
>
> +       /*
> +        * HugeTLB needs LUO to be initialized early in boot, before giga=
ntic
> +        * hugepages are allocated. On x86, that happens in setup_arch(),=
 but on
> +        * ARM64 (and other architectures) that happens in mm_core_init()=
.
> +        *
> +        * Since the code in mm_core_init() is shared between all archite=
ctures,
> +        * this can lead to the init being called twice. Skip if initiali=
zation
> +        * was already done.
> +        */
> +       if (__luo_early_initialized)
> +               return;
> +
> +       __luo_early_initialized =3D true;

Please, make __luo_early_initialized static local.

> +
>         err =3D luo_early_startup();
>         if (err) {
>                 luo_global.enabled =3D false;
>                 luo_restore_fail("The incoming tree failed to initialize =
properly [%pe], disabling live update\n",
>                                  ERR_PTR(err));
>         }
> -
> -       return err;
>  }
> -early_initcall(liveupdate_early_init);
>
>  /* Called during boot to create outgoing LUO fdt tree */
>  static int __init luo_fdt_setup(void)
> diff --git a/kernel/liveupdate/luo_internal.h b/kernel/liveupdate/luo_int=
ernal.h
> index 6115d6a4054d..171c54af7b38 100644
> --- a/kernel/liveupdate/luo_internal.h
> +++ b/kernel/liveupdate/luo_internal.h
> @@ -114,6 +114,8 @@ int __init luo_flb_setup_outgoing(void *fdt);
>  int __init luo_flb_setup_incoming(void *fdt);
>  void luo_flb_serialize(void);
>
> +bool __init luo_early_initialized(void);
> +
>  #ifdef CONFIG_LIVEUPDATE_TEST
>  void liveupdate_test_register(struct liveupdate_file_handler *fh);
>  void liveupdate_test_unregister(struct liveupdate_file_handler *fh);
> diff --git a/mm/mm_init.c b/mm/mm_init.c
> index 93cec06c1c8a..9a5b06a93622 100644
> --- a/mm/mm_init.c
> +++ b/mm/mm_init.c
> @@ -31,6 +31,7 @@
>  #include <linux/execmem.h>
>  #include <linux/vmstat.h>
>  #include <linux/kexec_handover.h>
> +#include <linux/liveupdate.h>
>  #include <linux/hugetlb.h>
>  #include "internal.h"
>  #include "slab.h"
> @@ -2681,6 +2682,12 @@ void __init mm_core_init(void)
>         arch_mm_preinit();
>
>         kho_memory_init();
> +       /*
> +        * Hugepages might be preserved from a liveupdate. Make sure it i=
s
> +        * initialized so hugetlb can query its state.
> +        */
> +       liveupdate_early_init();
> +
>         hugetlb_bootmem_alloc();
>
>         /* Initializations relying on SMP setup */
> --
> 2.43.0
>
