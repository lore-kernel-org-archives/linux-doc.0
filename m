Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B6D2459CD
	for <linux-doc@vger.kernel.org>; Thu, 12 Jun 2025 13:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749734808; cv=none; b=neaCL+oIutVP8k9m8RygT325VVlOSpxWQ0XPPDVW80DMiIpkDQHr/RaRHyorYWpJnX6mSYt0VLmEvGIsRgCsBEmzPutgZ+BbcvZltBZ0xkt2INUn5jZvtekkHnj0HS5DA5yI5DYzCDBdaDhPHKeOxdESgl0Rtj1SBVehHEF2U/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749734808; c=relaxed/simple;
	bh=CVQ9VovITFp4al3duc780000P3ZE3EpGg5M4UugODQo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EtimHL/YxQS6+6Fv+ld5Hj8UrNwTVYOaXVu2DSdyrr+Xw40k/Mc4fkkCiOLeDr3GwTPqCOqZsmD1mS+7X8IYTx8TjOqIH0qyuFUl0WH67+OFqvAvTnooJpPX6/YNQ7sm4vr21OlPeIFVriZUA4/gLO9RlrSamiCnG8zdjblFI/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b=Uh9DXPNF; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b="Uh9DXPNF"
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3dc729471e3so3541555ab.1
        for <linux-doc@vger.kernel.org>; Thu, 12 Jun 2025 06:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1749734806; x=1750339606; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2eN3swV8AIIuWWlJ3gYBwChYsvkIrC7SYyJzazn/BSI=;
        b=Uh9DXPNF0rmS4hO/A2moRXrF7EqWLUsG33MFYRgsajNC+EyEIi15DBT6cUAcUeDr/O
         Y8tdbyH4SurOAhZ9aKgO1Sqb3u9Ex091HtfWSLd0mVvWqHAWSQWk3ggvl8CDiiIvXbVs
         SRot/VnAGpn4VMGeJXmjeTZ0jVYuiHX2VPtNolzSRajwi6zsNeCAcVz6nzmySNonBL07
         A8FkhwUzuLrbDmp4cDs1WiQOGYqjYwNyVuD4UvlSA7cXIX7boYEr0vYecdHeFuYe8TYD
         j0vUmpCPgi7C4ypudoQ4bupP6YKcrU7elqQDGfzJ/8kXZcV/20+dP4sw/alXG/LfIZA7
         DUPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734806; x=1750339606;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2eN3swV8AIIuWWlJ3gYBwChYsvkIrC7SYyJzazn/BSI=;
        b=VuFUPQJBhl2dKuba7sFdhyqF2RjaGFLJT1wULgdzevlgsyZJdDnyzn1m2vxHtO/hUH
         R1/hdDqWN/BvOuzjaqF4/UizWYqu5D8LdyrR72z1lJf18ZNufa2QI0f+adzZbpTwpP0y
         v6IpSo6Ahfm3dekLNQYr1Zf/0OdctlR9I226oyvMQoqi0y5dP4jcuijMc6Wc42rU1RD5
         aUavkjARNBUMzHrAZmyzkleaonVZwrFxpl6OlqvbYE6o2Hm7EWiAqSilR+If+/tw4YMS
         akamCBJAAk3cqiiCr9uiS4geGq0a0ul3z3/Xqg7HRmYIlssknkv0xob3J8smfawgRRrF
         BYVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBXm7Is8Cm2A1/pFhIGfYTvuWMVelcS+tA87/ou6shsHeSf9R8L5Ci7EpBIj16ckrdtot+ePigGv4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpOFNdFWWU9TiAdhm+4KZAlmjY4g+4bAi0tjcj2U49eezhP153
	9RtyUFT4YFKx9o+/FXiqEGL9uVjeoUIYDGuu4314YidDFiXTkrVvrcRVELfIyxA6mr3jKclz+pc
	0JaqWuYfAmf1T0eX8pKC4HOf4Xxjr0jJj5gcjkoiTIQ==
X-Gm-Gg: ASbGnctnp1+UxoEKlPf5h+mpzt+z3TjURya4UCCi57Fye50x7uYzpwk9jlzMvGNL6sv
	icWXg69f66mZKE+o4UCq9MjvY0uT2SA+ftUhcnpw8xOUrFDz6lfsCF8ticcff7xFtvnIPHuxh7n
	d2LIFM3yfPREnEVDirrkTxsTcegFDXxZPoUJrtbsd3xcJ1
X-Google-Smtp-Source: AGHT+IG2iBZqXBZpblYqqV1CfizkbcXBVYuUqCYGloOAj0H2lvAJwOXwnS5XNnZkQ46BncD7OmhOhE+Hobvx1RtA1UQ=
X-Received: by 2002:a05:6e02:1807:b0:3dd:8663:d182 with SMTP id
 e9e14a558f8ab-3ddf42c5b4dmr72461125ab.13.1749734805782; Thu, 12 Jun 2025
 06:26:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250523101932.1594077-1-cleger@rivosinc.com> <20250523101932.1594077-15-cleger@rivosinc.com>
In-Reply-To: <20250523101932.1594077-15-cleger@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 12 Jun 2025 18:56:33 +0530
X-Gm-Features: AX0GCFtHBaD1dkadFboJHCaCDko1UoltJB37LuW30sdZ0j57mmaziXXBSUbao7Y
Message-ID: <CAAhSdy1qnRYOh0ka4PeJDf5ybviMrf+bpYaOOka3BXVmwAPSoQ@mail.gmail.com>
Subject: Re: [PATCH v8 14/14] RISC-V: KVM: add support for SBI_FWFT_MISALIGNED_DELEG
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Samuel Holland <samuel.holland@sifive.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Deepak Gupta <debug@rivosinc.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Atish Patra <atishp@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 23, 2025 at 3:53=E2=80=AFPM Cl=C3=A9ment L=C3=A9ger <cleger@riv=
osinc.com> wrote:
>
> SBI_FWFT_MISALIGNED_DELEG needs hedeleg to be modified to delegate
> misaligned load/store exceptions. Save and restore it during CPU
> load/put.
>
> Signed-off-by: Cl=C3=A9ment L=C3=A9ger <cleger@rivosinc.com>
> Reviewed-by: Deepak Gupta <debug@rivosinc.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>

Queued this patch for Linux-6.17

Thanks,
Anup

> ---
>  arch/riscv/kvm/vcpu_sbi_fwft.c | 41 ++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>
> diff --git a/arch/riscv/kvm/vcpu_sbi_fwft.c b/arch/riscv/kvm/vcpu_sbi_fwf=
t.c
> index b0f66c7bf010..6770c043bbcb 100644
> --- a/arch/riscv/kvm/vcpu_sbi_fwft.c
> +++ b/arch/riscv/kvm/vcpu_sbi_fwft.c
> @@ -14,6 +14,8 @@
>  #include <asm/kvm_vcpu_sbi.h>
>  #include <asm/kvm_vcpu_sbi_fwft.h>
>
> +#define MIS_DELEG (BIT_ULL(EXC_LOAD_MISALIGNED) | BIT_ULL(EXC_STORE_MISA=
LIGNED))
> +
>  struct kvm_sbi_fwft_feature {
>         /**
>          * @id: Feature ID
> @@ -68,7 +70,46 @@ static bool kvm_fwft_is_defined_feature(enum sbi_fwft_=
feature_t feature)
>         return false;
>  }
>
> +static bool kvm_sbi_fwft_misaligned_delegation_supported(struct kvm_vcpu=
 *vcpu)
> +{
> +       return misaligned_traps_can_delegate();
> +}
> +
> +static long kvm_sbi_fwft_set_misaligned_delegation(struct kvm_vcpu *vcpu=
,
> +                                       struct kvm_sbi_fwft_config *conf,
> +                                       unsigned long value)
> +{
> +       struct kvm_vcpu_config *cfg =3D &vcpu->arch.cfg;
> +
> +       if (value =3D=3D 1) {
> +               cfg->hedeleg |=3D MIS_DELEG;
> +               csr_set(CSR_HEDELEG, MIS_DELEG);
> +       } else if (value =3D=3D 0) {
> +               cfg->hedeleg &=3D ~MIS_DELEG;
> +               csr_clear(CSR_HEDELEG, MIS_DELEG);
> +       } else {
> +               return SBI_ERR_INVALID_PARAM;
> +       }
> +
> +       return SBI_SUCCESS;
> +}
> +
> +static long kvm_sbi_fwft_get_misaligned_delegation(struct kvm_vcpu *vcpu=
,
> +                                       struct kvm_sbi_fwft_config *conf,
> +                                       unsigned long *value)
> +{
> +       *value =3D (csr_read(CSR_HEDELEG) & MIS_DELEG) =3D=3D MIS_DELEG;
> +
> +       return SBI_SUCCESS;
> +}
> +
>  static const struct kvm_sbi_fwft_feature features[] =3D {
> +       {
> +               .id =3D SBI_FWFT_MISALIGNED_EXC_DELEG,
> +               .supported =3D kvm_sbi_fwft_misaligned_delegation_support=
ed,
> +               .set =3D kvm_sbi_fwft_set_misaligned_delegation,
> +               .get =3D kvm_sbi_fwft_get_misaligned_delegation,
> +       },
>  };
>
>  static struct kvm_sbi_fwft_config *
> --
> 2.49.0
>
