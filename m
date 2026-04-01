Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F435391E4D
	for <linux-doc@vger.kernel.org>; Wed,  1 Apr 2026 16:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775059562; cv=pass; b=qqRPqZtrtvNjBgzTOso7t6DOapyFApYG0HVZOKA1CK6j9o/HbQzQiAmbTcHDUM7ThFwVVtheYIiznzoqoxs4a8sAjNw0d6NclacFyc+L4+GHlyxJPHCWblN1Z1kYjwZ3OEUVeutC0jEEM3c6/Fssdf7VADbUVSXWbRmFekhSuNQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775059562; c=relaxed/simple;
	bh=vDEr12M9PgzwCflKiVXqB+gPHmI7O1NfvjvgGy/ZKC4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nGXC4+WW3MnXTi5GpcGH+sf1oNZAPUHy8xatIS/3LTWBuW/tn5CwnY08nH5+PCB7IkRNm/+3wkF/Bjr39nAZFAWhU6ihL2DXp02/X04c+gbwRqePKvUO0DsGu7OEOWxTs2bY50eXKuW0M1vjIAp7lXc6lsS1Apuxypa56s1l0XI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b=2UmXWEZJ; arc=pass smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b="2UmXWEZJ"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-679b072ed3aso3822958eaf.1
        for <linux-doc@vger.kernel.org>; Wed, 01 Apr 2026 09:06:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775059560; cv=none;
        d=google.com; s=arc-20240605;
        b=jBusdqKlhaTa7f/xNCih3L5VhYEhR7wCszZITHToUDhjuiT5p23szkT1Hf0Q3dhWCX
         zkYzrro2nFZMgVd4l5b8bwJkRB3j0G3nZTYM/Mrn6Q0NOxF0QtgxzARRCA9dAdCW0SMs
         pzVkRGDIPqAjMUE30+ZJRF6UcvP6kCuDOZM7D+/NfP9nqjfDrsSUsYPQeDutgGiqVNce
         alZsEat7jLap0u2QaZS1cI6N/6CrUfde2tcc3u5UJZOisZ0BAX7a7PkbAOLPR9BmKVQI
         mGCGGRnF6jOSVwIdAU/WyJeMIEX8Qhk94XJ6Lh/tNsitcg/TwcW5MoipQCUDGKeOFSsA
         Pw6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2K4NyhHCMd8zoqLYq9nB5V2Ysiwf1MV0VYCls+gbenU=;
        fh=0UQeqHL3u//Ui1jAcB7bBNEWkI3SsjuUZoVgvS3HxjA=;
        b=itq1uXF2Zv3cx6XGdOBztM4n92hyNhNUw8942BAyiFnTbINrC7+XmSCgPRR5SBu0jU
         LL2LX8rFssV40PJVAD/+9msG1s8cTCHxbz591CrhgBSPR4MQ+mmOJS9gE9sichPkgTEH
         js7vIB/zTcjbUjsd+L2RdXxD0fa+PhYxP8YV4U3byjG2I4TxSq/0DYMrbIZnYkrOnH9u
         bDarNj2SpMrPE+DVzwaqUDKFsE0IJwaoio6s3l/TCdGAiMi93tJL6cW3OI6BzOCRGIAB
         JXRCKZ4cvaaU0WedEKSuftAGyL3UEe64kN8w/Zp6T+YgoRGCQNfXWGjyT4IqaCPJ02Rz
         vYYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1775059560; x=1775664360; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2K4NyhHCMd8zoqLYq9nB5V2Ysiwf1MV0VYCls+gbenU=;
        b=2UmXWEZJQAieOb2YCEOHpZqRXUf6cDUmAzxN7YYZuGyUdA9vTuHIp9Kmpshrg4ZkwV
         gj6R2B3RKB40GQl6WYgeYts9OKbvcQmXeuH/NnV0uhgeM1SXheZ6Bl4yvARiazUjG8cg
         z0guXopDReZ6f+FSaCSdDCcpAxHqLgjaGgiaZXDJcr0pZw4TyXDimRn5mzInsBTT+m9U
         10+nEloLjFxLQYgQYt0dWmd8BX6VazmvW1t/HM7o6goqqkNqvVzXDBj9r10RnL+en1eS
         e3hnNkKg8CJF7XB4I/rkA2Js2aSGvE8/uy8JM2tY4aUaNrzb8fZmDHEWbZmhCcOpvjIp
         z/YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775059560; x=1775664360;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2K4NyhHCMd8zoqLYq9nB5V2Ysiwf1MV0VYCls+gbenU=;
        b=F5UPa99lN1zyhUxfWmTWCyzKsCsjhWwUQREkMDWSs5/fQbzflc1iHCmMcVX7yGxWTX
         SOaMX6METS1EDwQVB3QRCCTpSou8cj7WVMZ63QJ1RRh6r2gagHgudeKWKDRymxbNp7Lm
         y3byr53LB3cK2ITlKhPQm+Fc6NVIqnEN8h+cRG05eZy4UslH/58zXyeh+4/EZp4XJtfI
         9/FN+S9h83JMoJGm8Z0odwKRRTm/On5PsWZ6CNzH8FY77a0El0BgcUEZsw223h/jtgR3
         a9laPhpYgZvn6XUsCYVHj+D5qb2geE1INFpKmnk30Xjvnh65bWZZACz+mKeavzc8dDMK
         Chtw==
X-Forwarded-Encrypted: i=1; AJvYcCXgyOvoGqeZZ3zS+sH9vij3mGCsPd11UBTxiZeANEI00MUxr/EP+fAOaLs8OT5prJbbZngGzVGE6Ck=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzGiCz1zfVZsMfgwbwCFY3Ch5Lh2Q0f27DTb5vej7JPIG/Legl
	yn/SxQaJOejQSfLl49RoSGx+w7OfgN+Dph6IJHUyUEcSvEGtce59CU9yQCrK4z1VE6gXr9Kz3A8
	xBr1U4zjU+7DZjimrVtDBXRDy9O/Z4RPVnTo10bU6Dg==
X-Gm-Gg: ATEYQzyWw/u+OnUafIQomYLQfjS1qJH6DiQGj0F3NzFKYPkvZe6IqorKH+5lngroGLN
	ogoUSw02LkqlPUt/97JWUVf9g2NWCjMCGOYyR0lKobz2UC1Tc0MIbi6ivVFcYRKT8wd91TAWcwG
	mWDR9qkFSlytqLOMzfenKgOdfSfnp7lLdn1AonzxwiQbbZy49pKOUTAnvGRycN7cRIEKUZFewnu
	p18iky80gUuzM4MqTz6JGcwb4NMPBLnB8GfPAzwqFd2X0dG03cko6U97s8kKAztV1+zSlkBnAzJ
	n8DJaUhbF8CBy3THFxCrVDEPCIcCGBmg+zUzpfUUgkvEfiK0R3OWEYY04gzarfOdCJJJEpMQsko
	MxqEw/T/ZXhhjCGB5SIo9k3f/5g==
X-Received: by 2002:a05:6820:20e:b0:67e:160c:36b2 with SMTP id
 006d021491bc7-67fabc4777emr2159558eaf.28.1775059560252; Wed, 01 Apr 2026
 09:06:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260330122601.22140-1-fangyu.yu@linux.alibaba.com> <20260330122601.22140-4-fangyu.yu@linux.alibaba.com>
In-Reply-To: <20260330122601.22140-4-fangyu.yu@linux.alibaba.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 1 Apr 2026 21:35:48 +0530
X-Gm-Features: AQROBzDM7bVlUhSWF6Q8E65n0DpGAN3y24N8aEA-TFGvi-8F5L0Cn7-ZT4MJS6I
Message-ID: <CAAhSdy0ri8sWZn0CsCpfSgNqXw5gEesfKxcKqc56azVOrqz86w@mail.gmail.com>
Subject: Re: [PATCH v6 3/4] RISC-V: KVM: Detect and expose supported HGATP
 G-stage modes
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
> Extend kvm_riscv_gstage_mode_detect() to probe all HGATP.MODE values
> supported by the host and record them in a bitmask. Keep tracking the
> maximum supported G-stage page table level for existing internal users.
>
> Also provide lightweight helpers to retrieve the supported-mode bitmask
> and validate a requested HGATP.MODE against it.
>
> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
> ---
>  arch/riscv/include/asm/kvm_gstage.h | 11 ++++++++
>  arch/riscv/kvm/gstage.c             | 43 +++++++++++++++--------------
>  2 files changed, 34 insertions(+), 20 deletions(-)
>
> diff --git a/arch/riscv/include/asm/kvm_gstage.h b/arch/riscv/include/asm=
/kvm_gstage.h
> index 70d9d483365e..bbf8f45c6563 100644
> --- a/arch/riscv/include/asm/kvm_gstage.h
> +++ b/arch/riscv/include/asm/kvm_gstage.h
> @@ -31,6 +31,7 @@ struct kvm_gstage_mapping {
>  #endif
>
>  extern unsigned long kvm_riscv_gstage_max_pgd_levels;
> +extern u32 kvm_riscv_gstage_supported_mode_mask;
>
>  #define kvm_riscv_gstage_pgd_xbits     2
>  #define kvm_riscv_gstage_pgd_size      (1UL << (HGATP_PAGE_SHIFT + kvm_r=
iscv_gstage_pgd_xbits))
> @@ -102,4 +103,14 @@ static inline void kvm_riscv_gstage_init(struct kvm_=
gstage *gstage, struct kvm *
>         gstage->pgd_levels =3D kvm->arch.pgd_levels;
>  }
>
> +static inline u32 kvm_riscv_get_hgatp_mode_mask(void)
> +{
> +       return kvm_riscv_gstage_supported_mode_mask;
> +}
> +
> +static inline bool kvm_riscv_hgatp_mode_is_valid(unsigned long mode)
> +{
> +       return kvm_riscv_gstage_supported_mode_mask & BIT(mode);
> +}
> +
>  #endif
> diff --git a/arch/riscv/kvm/gstage.c b/arch/riscv/kvm/gstage.c
> index 7c4c34bc191b..459041255c14 100644
> --- a/arch/riscv/kvm/gstage.c
> +++ b/arch/riscv/kvm/gstage.c
> @@ -16,6 +16,8 @@ unsigned long kvm_riscv_gstage_max_pgd_levels __ro_afte=
r_init =3D 3;
>  #else
>  unsigned long kvm_riscv_gstage_max_pgd_levels __ro_after_init =3D 2;
>  #endif
> +/* Bitmask of supported HGATP.MODE encodings (BIT(HGATP_MODE_*)). */
> +u32 kvm_riscv_gstage_supported_mode_mask __ro_after_init;
>
>  #define gstage_pte_leaf(__ptep)        \
>         (pte_val(*(__ptep)) & (_PAGE_READ | _PAGE_WRITE | _PAGE_EXEC))
> @@ -315,42 +317,43 @@ void kvm_riscv_gstage_wp_range(struct kvm_gstage *g=
stage, gpa_t start, gpa_t end
>         }
>  }
>
> +static bool __init kvm_riscv_hgatp_mode_supported(unsigned long mode)
> +{
> +       csr_write(CSR_HGATP, mode << HGATP_MODE_SHIFT);
> +       return ((csr_read(CSR_HGATP) >> HGATP_MODE_SHIFT) =3D=3D mode);
> +}
> +
>  void __init kvm_riscv_gstage_mode_detect(void)
>  {
> +       kvm_riscv_gstage_supported_mode_mask =3D 0;
> +       kvm_riscv_gstage_max_pgd_levels =3D 0;
> +
>  #ifdef CONFIG_64BIT
> -       /* Try Sv57x4 G-stage mode */
> -       csr_write(CSR_HGATP, HGATP_MODE_SV57X4 << HGATP_MODE_SHIFT);
> -       if ((csr_read(CSR_HGATP) >> HGATP_MODE_SHIFT) =3D=3D HGATP_MODE_S=
V57X4) {
> -               kvm_riscv_gstage_max_pgd_levels =3D 5;
> -               goto done;
> +       /* Try Sv39x4 G-stage mode */
> +       if (kvm_riscv_hgatp_mode_supported(HGATP_MODE_SV39X4)) {
> +               kvm_riscv_gstage_supported_mode_mask |=3D BIT(HGATP_MODE_=
SV39X4);
> +               kvm_riscv_gstage_max_pgd_levels =3D 3;
>         }
>
>         /* Try Sv48x4 G-stage mode */
> -       csr_write(CSR_HGATP, HGATP_MODE_SV48X4 << HGATP_MODE_SHIFT);
> -       if ((csr_read(CSR_HGATP) >> HGATP_MODE_SHIFT) =3D=3D HGATP_MODE_S=
V48X4) {
> +       if (kvm_riscv_hgatp_mode_supported(HGATP_MODE_SV48X4)) {
> +               kvm_riscv_gstage_supported_mode_mask |=3D BIT(HGATP_MODE_=
SV48X4);
>                 kvm_riscv_gstage_max_pgd_levels =3D 4;
> -               goto done;

Keep the original approach until then NACK to this series.

Regards,
Anup

>         }
>
> -       /* Try Sv39x4 G-stage mode */
> -       csr_write(CSR_HGATP, HGATP_MODE_SV39X4 << HGATP_MODE_SHIFT);
> -       if ((csr_read(CSR_HGATP) >> HGATP_MODE_SHIFT) =3D=3D HGATP_MODE_S=
V39X4) {
> -               kvm_riscv_gstage_max_pgd_levels =3D 3;
> -               goto done;
> +       /* Try Sv57x4 G-stage mode */
> +       if (kvm_riscv_hgatp_mode_supported(HGATP_MODE_SV57X4)) {
> +               kvm_riscv_gstage_supported_mode_mask |=3D BIT(HGATP_MODE_=
SV57X4);
> +               kvm_riscv_gstage_max_pgd_levels =3D 5;
>         }
>  #else /* CONFIG_32BIT */
>         /* Try Sv32x4 G-stage mode */
> -       csr_write(CSR_HGATP, HGATP_MODE_SV32X4 << HGATP_MODE_SHIFT);
> -       if ((csr_read(CSR_HGATP) >> HGATP_MODE_SHIFT) =3D=3D HGATP_MODE_S=
V32X4) {
> +       if (kvm_riscv_hgatp_mode_supported(HGATP_MODE_SV32X4)) {
> +               kvm_riscv_gstage_supported_mode_mask |=3D BIT(HGATP_MODE_=
SV32X4);
>                 kvm_riscv_gstage_max_pgd_levels =3D 2;
> -               goto done;
>         }
>  #endif
>
> -       /* KVM depends on !HGATP_MODE_OFF */
> -       kvm_riscv_gstage_max_pgd_levels =3D 0;
> -
> -done:
>         csr_write(CSR_HGATP, 0);
>         kvm_riscv_local_hfence_gvma_all();
>  }
> --
> 2.50.1
>
