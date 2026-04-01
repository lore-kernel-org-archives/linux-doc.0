Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14B02EBB8D
	for <linux-doc@vger.kernel.org>; Wed,  1 Apr 2026 16:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775059403; cv=pass; b=rFMLrz3qYkHzwIEghjHr0ChzXdiOk0N7kDc0NDa0ZT5ZC9MwjsaTG1h6x9d1cfB4UTDX+qPHJtxCyMewMsHD98frEnXPs3RdN5WzjMsgYINSbQCqDPa7ZJiGWJItCQKGPyPsLvRePiSIwamU0zVjp3YIYHFmqprGuxmJYadJs5w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775059403; c=relaxed/simple;
	bh=mbM3KRdOEwkdUCznnLGvGPclc/aEJCqs3l4Vg6JLXGk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dFowr8jH4AG/lepCVshKb/DRl/XYEkJUymK6QpBed68iY7ooqhtHaD2pxW71SNIrtCdVTPBp/B/Fm28bkSDxIMyjLjte4dFvc5wQdchNNBfy8+HKNAUxQxx1tIBO7k09eXF8bUdCGRKFOiEAJXG28tAJpWtGyhK8C6waobA70XQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b=qMaRzddn; arc=pass smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b="qMaRzddn"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7d7f09aa39fso8652865a34.0
        for <linux-doc@vger.kernel.org>; Wed, 01 Apr 2026 09:03:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775059401; cv=none;
        d=google.com; s=arc-20240605;
        b=Zeyxup6zYAzs2Ll0oqnnEPrO5eevXdivePaJgNkh5/NV9HqJLvBClVBh0NquRpyRRb
         s95aM39YpsoqW866/06vZ5y++UgZDRCxjb0MIVPsckSYMWTD9RK7hag8Bb7BOeGlx0oD
         Jqrv6N7YlpTlmL8BMyGTJbCZZeGagYGyRZZcMwM2zCFsZs+CNIazNWWzvbc50pjSSku/
         dAMcimmLaEBB4Td/JvlrzpjeNYcO4bIZpWN8JavZo7/WbIdk2MFDHxElDmjgNlKMXDyy
         O8aeQ2w6XCYovah+uhcoxlHHrYsUjka1ClAnyUosHscO28MKVxRI9aFxJrJB8QkMDSxM
         PnKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Y6679k5FpZWkhzoFpnRhGVhgdQOTZFUspiwvpaGrRWs=;
        fh=kXAxuEqZAk0yK3v9oHr2RtbBG18xGIspL97J5TbhG3k=;
        b=QQBatPP/r0nzxqOVNrhZ7bCmYLX8IDxlJldKup15ln3feTuWfP7XWE/XHq7Mk+3jjZ
         v3Xs/au34Sy7Z2WrkBJBV3ftlV1PAK7GPk96QOwibLVXV8oQILd2yZ06QqGWgQYGmRnJ
         EZqSJ9a/z6w9W4FUsZY4rxQRgVR0aJGI5T3vUV1YpVPXVbnVAvA1fpygShwYMFuNiLcI
         vwqpb7QRQM4Mi26N2rK5MGbTYrGY0WUP9Kf6ucOqota75JECxz6JuZir8Ob1VR7Wv634
         mxbnNyt2p3wluMvB3AnBxkaHzVOOtP3GiNMJMbBL9ja71KVtQGLZBJI+HrMzG/EUYx+R
         gWmA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1775059401; x=1775664201; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y6679k5FpZWkhzoFpnRhGVhgdQOTZFUspiwvpaGrRWs=;
        b=qMaRzddneZg4KABsuMVw33p5k9L/bKayYAi0TShK/p3CMonG9KBIjmzLsZf6zO3/zB
         RykBYN5ZJp79JnAB0kVNZZu1SH36jAn1N16RXqewgK6sFEkjs9Q9lhlhHvoplJu6V01L
         R7JwZOJ1fkNa1J2kiFVWky3gQQC705PQz3FemfsEMQOsRca+4zTaQS2DbyRXYKslZx6G
         NWY/KZrSupjCR1t1daDyeGEF4iub+KYlKPli2QdTyWGg1PNGlflP8r6yQuelCaV2YZOr
         kNi0HUIVNsri7IrLHcKn7PLEoa6pWCIvfUVXozsl/4Am+YRjnIljxz3kqqgut3OlkDHE
         A1WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775059401; x=1775664201;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y6679k5FpZWkhzoFpnRhGVhgdQOTZFUspiwvpaGrRWs=;
        b=pz77M85fDDXNJ4zkcSmWftr6j0pZ4m+LBVzSrZqQcPTVNplDrQMl8hxaaS95kyn1xe
         B99z0uq210cNgBLOKD8xh7igEBkbRz8GtkLNbl+pjNLlIq0B0a80ibZ5SD1Q+f9xtRm5
         i5rx8BZP0p2ATiKmGHMKipkmNiILhWFX6KJtnSVLYscsHD9QWchqRufVmeHzIwbi3URY
         lOnvqDUys4gtf4Hdnva0IcsKwxNobHSuBZW21hYIczJw8WEjmmH4Tykmr+jGP3r7saDc
         k+qO37GP82Q2FX5rtMZTN4JSqP47h3m7Eqc0pXycbYyXoqmQlss9UWRWaLcoLgjHsYal
         FXPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUU4A2OTKCbV5+OMfN7GHYTzgNTVhjIIdEvSH8W/duDM3rN6V4UUvvB7v3kBSEQbdAnjrtauNmJvB4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXrYA5XOj3ZicwHHu8Wh/o0bIQWPq8MqwhDjHe4cOv6VALwRuJ
	INYqyv1cCUBQd3p7cCubFAP7LYcZ3n4cJDZFBu/QBib+W3k8drPXkw+yxJJSFaermT6iTozm10f
	8EI5eAlNLLhs4ebcxxQNoLIdjM0RSTjrJYLyjTg5uJQ==
X-Gm-Gg: ATEYQzyMLN+tmaHVzYWwLWz9xHBWwVZRyCP0re7fYcdG6kmiNzbuABlVatrjqoTt+Jq
	3ydgyOG6Z/EfuHhXjiKJHIfJp7h2piszOb1XNmHwVi3EZPJ/v6XJJ+JewXjsQqUYWU/SZUAX4xu
	EWsTNJ2a0Y55zV9TzcaDNKvqaABogoW8e2ux7lSXEVaFNaAFR+pa5Eqa+n3EGrUzWMtzH6DaSj0
	mr2Js61scKC+6moEzEfwymJRgUXPiAhqc1dwzMPry3pTSnnrKrxwD022+PnjnkgQBU0ONPlocbe
	GXv7cUCkTf9yJ/c/F2+nJH2GqeoyPDdQRhJ3v9Lv9hDVpgRMcx0wZadZvIhi+82eAvpvXQePpKJ
	aK/JplJe6FKXVTi1EWsx+mxx23g==
X-Received: by 2002:a05:6820:1c93:b0:67e:1b8b:862c with SMTP id
 006d021491bc7-680a2679265mr21887eaf.0.1775059400448; Wed, 01 Apr 2026
 09:03:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260330122601.22140-1-fangyu.yu@linux.alibaba.com> <20260330122601.22140-3-fangyu.yu@linux.alibaba.com>
In-Reply-To: <20260330122601.22140-3-fangyu.yu@linux.alibaba.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 1 Apr 2026 21:33:09 +0530
X-Gm-Features: AQROBzBz6gVYqpB_gsnLxPPXEaaDdC4_ZJnZ_sb8SZfsx2vHypJpEdwwBwdfK7M
Message-ID: <CAAhSdy3qEOaow1YApEL3KiXPL6dGXu917HZGDB3Lw2VWWjAdTQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/4] RISC-V: KVM: Cache gstage pgd_levels in struct kvm_gstage
To: fangyu.yu@linux.alibaba.com
Cc: pbonzini@redhat.com, corbet@lwn.net, atish.patra@linux.dev, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	skhan@linuxfoundation.org, guoren@kernel.org, radim.krcmar@oss.qualcomm.com, 
	andrew.jones@oss.qualcomm.com, linux-doc@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2026 at 5:56=E2=80=AFPM <fangyu.yu@linux.alibaba.com> wrote=
:
>
> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
>
> Gstage page-table helpers frequently chase gstage->kvm->arch to
> fetch pgd_levels. This adds noise and repeats the same dereference
> chain in hot paths.
>
> Add pgd_levels to struct kvm_gstage and initialize it from kvm->arch
> when setting up a gstage instance. Introduce kvm_riscv_gstage_init()
> to centralize initialization and switch gstage code to use
> gstage->pgd_levels.
>
> Suggested-by: Anup Patel <anup@brainfault.org>
> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Thanks,
Anup

> ---
>  arch/riscv/include/asm/kvm_gstage.h | 10 ++++++
>  arch/riscv/kvm/gstage.c             | 10 +++---
>  arch/riscv/kvm/mmu.c                | 50 ++++++-----------------------
>  3 files changed, 25 insertions(+), 45 deletions(-)
>
> diff --git a/arch/riscv/include/asm/kvm_gstage.h b/arch/riscv/include/asm=
/kvm_gstage.h
> index 5aa58d1f692a..70d9d483365e 100644
> --- a/arch/riscv/include/asm/kvm_gstage.h
> +++ b/arch/riscv/include/asm/kvm_gstage.h
> @@ -15,6 +15,7 @@ struct kvm_gstage {
>  #define KVM_GSTAGE_FLAGS_LOCAL         BIT(0)
>         unsigned long vmid;
>         pgd_t *pgd;
> +       unsigned long pgd_levels;
>  };
>
>  struct kvm_gstage_mapping {
> @@ -92,4 +93,13 @@ static inline unsigned long kvm_riscv_gstage_mode(unsi=
gned long pgd_levels)
>         }
>  }
>
> +static inline void kvm_riscv_gstage_init(struct kvm_gstage *gstage, stru=
ct kvm *kvm)
> +{
> +       gstage->kvm =3D kvm;
> +       gstage->flags =3D 0;
> +       gstage->vmid =3D READ_ONCE(kvm->arch.vmid.vmid);
> +       gstage->pgd =3D kvm->arch.pgd;
> +       gstage->pgd_levels =3D kvm->arch.pgd_levels;
> +}
> +
>  #endif
> diff --git a/arch/riscv/kvm/gstage.c b/arch/riscv/kvm/gstage.c
> index 4beb9322fe76..7c4c34bc191b 100644
> --- a/arch/riscv/kvm/gstage.c
> +++ b/arch/riscv/kvm/gstage.c
> @@ -26,7 +26,7 @@ static inline unsigned long gstage_pte_index(struct kvm=
_gstage *gstage,
>         unsigned long mask;
>         unsigned long shift =3D HGATP_PAGE_SHIFT + (kvm_riscv_gstage_inde=
x_bits * level);
>
> -       if (level =3D=3D gstage->kvm->arch.pgd_levels - 1)
> +       if (level =3D=3D gstage->pgd_levels - 1)
>                 mask =3D (PTRS_PER_PTE * (1UL << kvm_riscv_gstage_pgd_xbi=
ts)) - 1;
>         else
>                 mask =3D PTRS_PER_PTE - 1;
> @@ -45,7 +45,7 @@ static int gstage_page_size_to_level(struct kvm_gstage =
*gstage, unsigned long pa
>         u32 i;
>         unsigned long psz =3D 1UL << 12;
>
> -       for (i =3D 0; i < gstage->kvm->arch.pgd_levels; i++) {
> +       for (i =3D 0; i < gstage->pgd_levels; i++) {
>                 if (page_size =3D=3D (psz << (i * kvm_riscv_gstage_index_=
bits))) {
>                         *out_level =3D i;
>                         return 0;
> @@ -58,7 +58,7 @@ static int gstage_page_size_to_level(struct kvm_gstage =
*gstage, unsigned long pa
>  static int gstage_level_to_page_order(struct kvm_gstage *gstage, u32 lev=
el,
>                                       unsigned long *out_pgorder)
>  {
> -       if (gstage->kvm->arch.pgd_levels < level)
> +       if (gstage->pgd_levels < level)
>                 return -EINVAL;
>
>         *out_pgorder =3D 12 + (level * kvm_riscv_gstage_index_bits);
> @@ -83,7 +83,7 @@ bool kvm_riscv_gstage_get_leaf(struct kvm_gstage *gstag=
e, gpa_t addr,
>                                pte_t **ptepp, u32 *ptep_level)
>  {
>         pte_t *ptep;
> -       u32 current_level =3D gstage->kvm->arch.pgd_levels - 1;
> +       u32 current_level =3D gstage->pgd_levels - 1;
>
>         *ptep_level =3D current_level;
>         ptep =3D (pte_t *)gstage->pgd;
> @@ -127,7 +127,7 @@ int kvm_riscv_gstage_set_pte(struct kvm_gstage *gstag=
e,
>                              struct kvm_mmu_memory_cache *pcache,
>                              const struct kvm_gstage_mapping *map)
>  {
> -       u32 current_level =3D gstage->kvm->arch.pgd_levels - 1;
> +       u32 current_level =3D gstage->pgd_levels - 1;
>         pte_t *next_ptep =3D (pte_t *)gstage->pgd;
>         pte_t *ptep =3D &next_ptep[gstage_pte_index(gstage, map->addr, cu=
rrent_level)];
>
> diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> index fbcdd75cb9af..2d3def024270 100644
> --- a/arch/riscv/kvm/mmu.c
> +++ b/arch/riscv/kvm/mmu.c
> @@ -24,10 +24,7 @@ static void mmu_wp_memory_region(struct kvm *kvm, int =
slot)
>         phys_addr_t end =3D (memslot->base_gfn + memslot->npages) << PAGE=
_SHIFT;
>         struct kvm_gstage gstage;
>
> -       gstage.kvm =3D kvm;
> -       gstage.flags =3D 0;
> -       gstage.vmid =3D READ_ONCE(kvm->arch.vmid.vmid);
> -       gstage.pgd =3D kvm->arch.pgd;
> +       kvm_riscv_gstage_init(&gstage, kvm);
>
>         spin_lock(&kvm->mmu_lock);
>         kvm_riscv_gstage_wp_range(&gstage, start, end);
> @@ -49,10 +46,7 @@ int kvm_riscv_mmu_ioremap(struct kvm *kvm, gpa_t gpa, =
phys_addr_t hpa,
>         struct kvm_gstage_mapping map;
>         struct kvm_gstage gstage;
>
> -       gstage.kvm =3D kvm;
> -       gstage.flags =3D 0;
> -       gstage.vmid =3D READ_ONCE(kvm->arch.vmid.vmid);
> -       gstage.pgd =3D kvm->arch.pgd;
> +       kvm_riscv_gstage_init(&gstage, kvm);
>
>         end =3D (gpa + size + PAGE_SIZE - 1) & PAGE_MASK;
>         pfn =3D __phys_to_pfn(hpa);
> @@ -89,10 +83,7 @@ void kvm_riscv_mmu_iounmap(struct kvm *kvm, gpa_t gpa,=
 unsigned long size)
>  {
>         struct kvm_gstage gstage;
>
> -       gstage.kvm =3D kvm;
> -       gstage.flags =3D 0;
> -       gstage.vmid =3D READ_ONCE(kvm->arch.vmid.vmid);
> -       gstage.pgd =3D kvm->arch.pgd;
> +       kvm_riscv_gstage_init(&gstage, kvm);
>
>         spin_lock(&kvm->mmu_lock);
>         kvm_riscv_gstage_unmap_range(&gstage, gpa, size, false);
> @@ -109,10 +100,7 @@ void kvm_arch_mmu_enable_log_dirty_pt_masked(struct =
kvm *kvm,
>         phys_addr_t end =3D (base_gfn + __fls(mask) + 1) << PAGE_SHIFT;
>         struct kvm_gstage gstage;
>
> -       gstage.kvm =3D kvm;
> -       gstage.flags =3D 0;
> -       gstage.vmid =3D READ_ONCE(kvm->arch.vmid.vmid);
> -       gstage.pgd =3D kvm->arch.pgd;
> +       kvm_riscv_gstage_init(&gstage, kvm);
>
>         kvm_riscv_gstage_wp_range(&gstage, start, end);
>  }
> @@ -141,10 +129,7 @@ void kvm_arch_flush_shadow_memslot(struct kvm *kvm,
>         phys_addr_t size =3D slot->npages << PAGE_SHIFT;
>         struct kvm_gstage gstage;
>
> -       gstage.kvm =3D kvm;
> -       gstage.flags =3D 0;
> -       gstage.vmid =3D READ_ONCE(kvm->arch.vmid.vmid);
> -       gstage.pgd =3D kvm->arch.pgd;
> +       kvm_riscv_gstage_init(&gstage, kvm);
>
>         spin_lock(&kvm->mmu_lock);
>         kvm_riscv_gstage_unmap_range(&gstage, gpa, size, false);
> @@ -250,10 +235,7 @@ bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm=
_gfn_range *range)
>         if (!kvm->arch.pgd)
>                 return false;
>
> -       gstage.kvm =3D kvm;
> -       gstage.flags =3D 0;
> -       gstage.vmid =3D READ_ONCE(kvm->arch.vmid.vmid);
> -       gstage.pgd =3D kvm->arch.pgd;
> +       kvm_riscv_gstage_init(&gstage, kvm);
>         mmu_locked =3D spin_trylock(&kvm->mmu_lock);
>         kvm_riscv_gstage_unmap_range(&gstage, range->start << PAGE_SHIFT,
>                                      (range->end - range->start) << PAGE_=
SHIFT,
> @@ -275,10 +257,7 @@ bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_ran=
ge *range)
>
>         WARN_ON(size !=3D PAGE_SIZE && size !=3D PMD_SIZE && size !=3D PU=
D_SIZE);
>
> -       gstage.kvm =3D kvm;
> -       gstage.flags =3D 0;
> -       gstage.vmid =3D READ_ONCE(kvm->arch.vmid.vmid);
> -       gstage.pgd =3D kvm->arch.pgd;
> +       kvm_riscv_gstage_init(&gstage, kvm);
>         if (!kvm_riscv_gstage_get_leaf(&gstage, range->start << PAGE_SHIF=
T,
>                                        &ptep, &ptep_level))
>                 return false;
> @@ -298,10 +277,7 @@ bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gf=
n_range *range)
>
>         WARN_ON(size !=3D PAGE_SIZE && size !=3D PMD_SIZE && size !=3D PU=
D_SIZE);
>
> -       gstage.kvm =3D kvm;
> -       gstage.flags =3D 0;
> -       gstage.vmid =3D READ_ONCE(kvm->arch.vmid.vmid);
> -       gstage.pgd =3D kvm->arch.pgd;
> +       kvm_riscv_gstage_init(&gstage, kvm);
>         if (!kvm_riscv_gstage_get_leaf(&gstage, range->start << PAGE_SHIF=
T,
>                                        &ptep, &ptep_level))
>                 return false;
> @@ -463,10 +439,7 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct =
kvm_memory_slot *memslot,
>         struct kvm_gstage gstage;
>         struct page *page;
>
> -       gstage.kvm =3D kvm;
> -       gstage.flags =3D 0;
> -       gstage.vmid =3D READ_ONCE(kvm->arch.vmid.vmid);
> -       gstage.pgd =3D kvm->arch.pgd;
> +       kvm_riscv_gstage_init(&gstage, kvm);
>
>         /* Setup initial state of output mapping */
>         memset(out_map, 0, sizeof(*out_map));
> @@ -587,10 +560,7 @@ void kvm_riscv_mmu_free_pgd(struct kvm *kvm)
>
>         spin_lock(&kvm->mmu_lock);
>         if (kvm->arch.pgd) {
> -               gstage.kvm =3D kvm;
> -               gstage.flags =3D 0;
> -               gstage.vmid =3D READ_ONCE(kvm->arch.vmid.vmid);
> -               gstage.pgd =3D kvm->arch.pgd;
> +               kvm_riscv_gstage_init(&gstage, kvm);
>                 kvm_riscv_gstage_unmap_range(&gstage, 0UL,
>                         kvm_riscv_gstage_gpa_size(kvm->arch.pgd_levels), =
false);
>                 pgd =3D READ_ONCE(kvm->arch.pgd);
> --
> 2.50.1
>
