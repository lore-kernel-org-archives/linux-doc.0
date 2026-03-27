Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9FF3D9040
	for <linux-doc@vger.kernel.org>; Fri, 27 Mar 2026 09:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774602037; cv=pass; b=lbkcppn0cAlSlFuoBQ2/xN2rDi+eQ3WKbTGoCr6UHM+uOWx5dwJ6G16cdUl6Mr9Fw0P6p1i9Bx4EwZIjuIzvjw7amoCqaqxRXS2Jug0W+In+JhP4u9jNC4jLbh7Gc2pa7OOaeScPz9NLS6qoSwgxZsE9nmOZTwGrOSKeLckcI7E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774602037; c=relaxed/simple;
	bh=PQErMo2tH3t2XnWR73yPMCnulOQrwgjmdWJIjwxRxuo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gac2XXfcJalhlPFN0a5EsKrboikUBrgKyhVoI6bQjsZ2DXfzolMNFfKsNEkz0RMG/xf2H6rj0s8fFBUir16OuyoVWbdvfjCFNuGpIOc7ejuEG0yvYPtNOtm8VRc8++Itrdwod5gxi4KyzQshltZOzr04syG4t0dim4dk4/d5udw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b=rC5XyFvB; arc=pass smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b="rC5XyFvB"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-67bad873c3eso1208665eaf.3
        for <linux-doc@vger.kernel.org>; Fri, 27 Mar 2026 02:00:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774602035; cv=none;
        d=google.com; s=arc-20240605;
        b=YDwHX5dCkRw2wqfGd6ivOUvxyisbf4qbCKpI19uKvp0re3I67mVhFq0Um/bo+cDyJD
         7nqMYU4bU9O8OLdsXtXmDJpUxJ2WG0fq13/8OzNLEn/pgL5iBmggTdknUCLCcvJ0LkS7
         hgi8WPxYEqf6mjCApPIh5YpSKe/lDCkSKqh1ZN2sF4GItcqabyOUPZoGAyJl0J6S/+2P
         xD+6i471jW9xxvdX+XA6lPIxCuHg4JA2uXDFA/WpBXFqkklQHKLl3TaWP6XZNKkiCTaP
         X8MEsaem4EtCq/FEAC+c2+69hF7UzrQMHnJmsPA8jRlnDwf/D1PjD3eY7CL8Hj/ElPMi
         U6uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8iPzBqHCfL3LcH+hQY6MvdDgBGLsYlEG1twB6MOAX5Q=;
        fh=B8Chp11eg6esydVPs0r2JbDdJlECvkfCkOz1Mw507E8=;
        b=SOhM+qZw25oYikEef+lb/aR2PwY+tU6fjtOyuHA3Y2PpYmb7WITf049dbmVGap0kBh
         qmeCthGoozphAzxen3P+A7D9A1Q+VlQyJ63k8LRuvc/PTZkfNn+FzGB87+INHsud/ntS
         RSD407HeINKI7FhqM3krCowYmCZgzoKP4/Wt0f678fTeTCFmQPpiTsit7FCzTivHEMcW
         gpGQfoy6vfCjORE6yFMbP5lqc4kG0h/D1/JQ6vGY/dg/qa8Z1rFPii2lN2TbCaY8mxSP
         y9LHJxui5D3GCyggyrd6SOXN03BxCwxpNkRNRsObBrctOaFd8WRmmSMmB4nsSFDXgBl3
         Fb6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1774602034; x=1775206834; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8iPzBqHCfL3LcH+hQY6MvdDgBGLsYlEG1twB6MOAX5Q=;
        b=rC5XyFvB6halYYr2Xc6y0mSKd8qgatl/uzNfA3fYLvJXk5Houtq/J6zhw2W97OZfKj
         JMRRSHYTLth0kvb811stxtCKLtfLaapjrPO87uCPMRycT+Fxn41RK+R+uUsRgyLZ6f5i
         fqE8a+L+XfhzMc/lf4ZbCo3xPo1IHAowu4vYOcab1u5hwqfqII3J7MNuvYL4oYZ/3ipS
         ooDoPgdQ1l+RRsJ/FI6RnyJIxVmu2eEAKd2eeRS3cotIUeEOSerNTqrHv9nD1ZDB8iPk
         jghRPOz5ePdM09WoFu/xtcNbBURdiuUin1hVrb6S3vHfmCX/hE5W3U0/R+n02whiMce2
         iHOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774602035; x=1775206835;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8iPzBqHCfL3LcH+hQY6MvdDgBGLsYlEG1twB6MOAX5Q=;
        b=DZ5wA5I4wzXCbgQMFUCTsQ/zRo8GCjkCmzBSubTvCMj0CrJQRTlkQRrKWNFixo/WQt
         iF/CtuE/eHThlQPNO11Owm9wWyhg3p1A83Dp6s6CGzZdvQg1XudsqW8yuetIMxlSZL/l
         sGEJZmx2ezirY9uu8sSdCOLb6LtSe8qTYFkxzkj9Zss34v3Li8MdsLb8lqmG2V6YRvO8
         OPHLKM+ojI1MqOyaqZGXYrqeOGV9DdALW8xyef+c75AoaY1gBkEFlucRQOnoBVH712iJ
         LUa2kydR7WMJpGk0Af4rdG3vv9+fWEhuHsSDzNEIoDjvCIRL7SxTfLLURlvXMBsK3wI4
         lm7g==
X-Forwarded-Encrypted: i=1; AJvYcCVuSfmysUxIKtnM0PMBIEef62b/iinQegFnXavs3KO2ah22e0e7COeQV6zzXHm/QGTLP8t18xlKpAE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3qvrTLA3i9okCie7neUnGF9/vRtNOrQgEYUQ4ZtO4gEAfKmTu
	XlpGmxHQZH1DBU0x/VkLsTsHvAdC9t28ADasKtcL65qcg74qtRqN8y3ynva3qE8FrLT302LMvax
	MLD1DOP5qJuoAUtg47jst3egoI/2LBH8DTWCuA3I8ww==
X-Gm-Gg: ATEYQzzZUjEEzRgIoi1b1n4VyQdh33wu6oMPa63Hp4R5nY6ihfvoqpLxX4vySOAfgGi
	cRo2xq23TPSl5Ozi6vLdOu7YO2YChLV8tzFbkwEUvDimmQIkTL5HM30+zv1n9hbWByvsfuwwu7A
	NMXS2USEtz+CeDvbv2blabC83alZSAhOSy015PkxM1XiT6MhRFU3nsb1f1LHlbiskbWUL8KpcpW
	ZmBYIIpdoLY++pnH0qnJUWjGkSdedi2CbjxQw1mF5nyLwP+/K/u3VRs1deSsSdj68tKLWaISYmi
	NHmC/lDVKdOVYuq/xsQU3anPZTLLZs/3YOeiPk0o8Pfi2mljG63ilFA1XPmBHkewAoI1WxnmXAR
	U1pFk/jebnIOA+8lDPyzqZtbT7A==
X-Received: by 2002:a05:6820:2294:b0:67c:2ad5:2b39 with SMTP id
 006d021491bc7-67e18641ffdmr874008eaf.23.1774602034585; Fri, 27 Mar 2026
 02:00:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAAhSdy2uMY+-9W34G3QJ3m9XWg2dq_PeNB_9j9B3viZaRg=SUQ@mail.gmail.com>
 <20260327015555.79223-1-fangyu.yu@linux.alibaba.com>
In-Reply-To: <20260327015555.79223-1-fangyu.yu@linux.alibaba.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 27 Mar 2026 14:30:21 +0530
X-Gm-Features: AQROBzB6k39KBSA1bOcm2FYN_Hf1EsV9UtH0iPUVwF6t7ZS-vmzIB0bn1mfZeas
Message-ID: <CAAhSdy1-OPSaigBarUGmNWfcDBqjine+Hm+Urdinv1nLooQMNA@mail.gmail.com>
Subject: Re: Re: [PATCH v5 2/3] RISC-V: KVM: Detect and expose supported HGATP
 G-stage modes
To: fangyu.yu@linux.alibaba.com
Cc: alex@ghiti.fr, andrew.jones@oss.qualcomm.com, aou@eecs.berkeley.edu, 
	atish.patra@linux.dev, corbet@lwn.net, guoren@kernel.org, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	palmer@dabbelt.com, pbonzini@redhat.com, pjw@kernel.org, 
	radim.krcmar@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 27, 2026 at 7:26=E2=80=AFAM <fangyu.yu@linux.alibaba.com> wrote=
:
>
> >> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> >>
> >> Extend kvm_riscv_gstage_mode_detect() to probe all HGATP.MODE values
> >> supported by the host and record them in a bitmask. Keep tracking the
> >> maximum supported G-stage page table level for existing internal users=
.
> >>
> >> Also provide lightweight helpers to retrieve the supported-mode bitmas=
k
> >> and validate a requested HGATP.MODE against it.
> >>
> >> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> >> ---
> >>  arch/riscv/include/asm/kvm_gstage.h | 11 ++++++++
> >>  arch/riscv/kvm/gstage.c             | 43 +++++++++++++++-------------=
-
> >>  2 files changed, 34 insertions(+), 20 deletions(-)
> >>
> >> diff --git a/arch/riscv/include/asm/kvm_gstage.h b/arch/riscv/include/=
asm/kvm_gstage.h
> >> index b12605fbca44..76c37b5dc02d 100644
> >> --- a/arch/riscv/include/asm/kvm_gstage.h
> >> +++ b/arch/riscv/include/asm/kvm_gstage.h
> >> @@ -30,6 +30,7 @@ struct kvm_gstage_mapping {
> >>  #endif
> >>
> >>  extern unsigned long kvm_riscv_gstage_max_pgd_levels;
> >> +extern u32 kvm_riscv_gstage_mode_mask;
> >
> >s/u32/unsigned long/
> >s/kvm_riscv_gstage_mode_mask/kvm_riscv_gstage_supported_mode_mask/
> >
>
> Ack, will switch the type to unsigned long and rename it to
> kvm_riscv_gstage_supported_mode_mask in the next revision.
>
> >>
> >>  #define kvm_riscv_gstage_pgd_xbits     2
> >>  #define kvm_riscv_gstage_pgd_size      (1UL << (HGATP_PAGE_SHIFT + kv=
m_riscv_gstage_pgd_xbits))
> >> @@ -75,4 +76,14 @@ void kvm_riscv_gstage_wp_range(struct kvm_gstage *g=
stage, gpa_t start, gpa_t end
> >>
> >>  void kvm_riscv_gstage_mode_detect(void);
> >>
> >> +static inline u32 kvm_riscv_get_hgatp_mode_mask(void)
> >> +{
> >> +       return kvm_riscv_gstage_mode_mask;
> >> +}
> >> +
> >> +static inline bool kvm_riscv_hgatp_mode_is_valid(unsigned long mode)
> >> +{
> >> +       return kvm_riscv_gstage_mode_mask & BIT(mode);
> >> +}
> >> +
> >>  #endif
> >> diff --git a/arch/riscv/kvm/gstage.c b/arch/riscv/kvm/gstage.c
> >> index 2d0045f502d1..328d4138f162 100644
> >> --- a/arch/riscv/kvm/gstage.c
> >> +++ b/arch/riscv/kvm/gstage.c
> >> @@ -16,6 +16,8 @@ unsigned long kvm_riscv_gstage_max_pgd_levels __ro_a=
fter_init =3D 3;
> >>  #else
> >>  unsigned long kvm_riscv_gstage_max_pgd_levels __ro_after_init =3D 2;
> >>  #endif
> >> +/* Bitmask of supported HGATP.MODE encodings (BIT(HGATP_MODE_*)). */
> >> +u32 kvm_riscv_gstage_mode_mask __ro_after_init;
> >>
> >>  #define gstage_pte_leaf(__ptep)        \
> >>         (pte_val(*(__ptep)) & (_PAGE_READ | _PAGE_WRITE | _PAGE_EXEC))
> >> @@ -315,42 +317,43 @@ void kvm_riscv_gstage_wp_range(struct kvm_gstage=
 *gstage, gpa_t start, gpa_t end
> >>         }
> >>  }
> >>
> >> +static bool __init kvm_riscv_hgatp_mode_supported(unsigned long mode)
> >> +{
> >> +       csr_write(CSR_HGATP, mode << HGATP_MODE_SHIFT);
> >> +       return ((csr_read(CSR_HGATP) >> HGATP_MODE_SHIFT) =3D=3D mode)=
;
> >> +}
> >> +
> >>  void __init kvm_riscv_gstage_mode_detect(void)
> >>  {
> >> +       kvm_riscv_gstage_mode_mask =3D 0;
> >> +       kvm_riscv_gstage_max_pgd_levels =3D 0;
> >> +
> >>  #ifdef CONFIG_64BIT
> >> -       /* Try Sv57x4 G-stage mode */
> >> -       csr_write(CSR_HGATP, HGATP_MODE_SV57X4 << HGATP_MODE_SHIFT);
> >> -       if ((csr_read(CSR_HGATP) >> HGATP_MODE_SHIFT) =3D=3D HGATP_MOD=
E_SV57X4) {
> >> -               kvm_riscv_gstage_max_pgd_levels =3D 5;
> >> -               goto done;
> >> +       /* Try Sv39x4 G-stage mode */
> >> +       if (kvm_riscv_hgatp_mode_supported(HGATP_MODE_SV39X4)) {
> >> +               kvm_riscv_gstage_mode_mask |=3D BIT(HGATP_MODE_SV39X4)=
;
> >> +               kvm_riscv_gstage_max_pgd_levels =3D 3;
> >>         }
> >>
> >>         /* Try Sv48x4 G-stage mode */
> >> -       csr_write(CSR_HGATP, HGATP_MODE_SV48X4 << HGATP_MODE_SHIFT);
> >> -       if ((csr_read(CSR_HGATP) >> HGATP_MODE_SHIFT) =3D=3D HGATP_MOD=
E_SV48X4) {
> >> +       if (kvm_riscv_hgatp_mode_supported(HGATP_MODE_SV48X4)) {
> >> +               kvm_riscv_gstage_mode_mask |=3D BIT(HGATP_MODE_SV48X4)=
;
> >>                 kvm_riscv_gstage_max_pgd_levels =3D 4;
> >> -               goto done;
> >>         }
> >>
> >> -       /* Try Sv39x4 G-stage mode */
> >> -       csr_write(CSR_HGATP, HGATP_MODE_SV39X4 << HGATP_MODE_SHIFT);
> >> -       if ((csr_read(CSR_HGATP) >> HGATP_MODE_SHIFT) =3D=3D HGATP_MOD=
E_SV39X4) {
> >> -               kvm_riscv_gstage_max_pgd_levels =3D 3;
> >> -               goto done;
> >> +       /* Try Sv57x4 G-stage mode */
> >> +       if (kvm_riscv_hgatp_mode_supported(HGATP_MODE_SV57X4)) {
> >> +               kvm_riscv_gstage_mode_mask |=3D BIT(HGATP_MODE_SV57X4)=
;
> >> +               kvm_riscv_gstage_max_pgd_levels =3D 5;
> >>         }
> >>  #else /* CONFIG_32BIT */
> >>         /* Try Sv32x4 G-stage mode */
> >> -       csr_write(CSR_HGATP, HGATP_MODE_SV32X4 << HGATP_MODE_SHIFT);
> >> -       if ((csr_read(CSR_HGATP) >> HGATP_MODE_SHIFT) =3D=3D HGATP_MOD=
E_SV32X4) {
> >> +       if (kvm_riscv_hgatp_mode_supported(HGATP_MODE_SV32X4)) {
> >> +               kvm_riscv_gstage_mode_mask |=3D BIT(HGATP_MODE_SV32X4)=
;
> >>                 kvm_riscv_gstage_max_pgd_levels =3D 2;
> >> -               goto done;
> >>         }
> >>  #endif
> >>
> >> -       /* KVM depends on !HGATP_MODE_OFF */
> >> -       kvm_riscv_gstage_max_pgd_levels =3D 0;
> >> -
> >> -done:
> >
> >Here are some statements from RISC-V privilege specification:
> >"Implementations that support Sv48 must also support Sv39."
> >"Implementations that support Sv57 must also support Sv48."
> >"The conversion of an Sv32x4, Sv39x4, Sv48x4, or Sv57x4 guest physical
> >address is accomplished with the
> >same algorithm used for Sv32, Sv39, Sv48, or Sv57, as presented in
> >Section 12.3.2, except that:"
> >"hgatp substitutes for the usual satp;"
> >
> >Based on above it is a waste to try each and every mode.
> >For example: if mode Sv48x4 is supported then Sv39x4 is also supported.
> >
>
> Radmi and I discussed this topic before; please refer to the following li=
nk:
> https://lore.kernel.org/linux-riscv/20260131061238.52708-1-fangyu.yu@linu=
x.alibaba.com/

Privilege spec mandates Sv48 and Sv39 when Sv57 is supported
so the current approach is not based on any assumption.

Regards,
Anup
