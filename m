Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E7115FA91
	for <linux-doc@vger.kernel.org>; Thu, 18 Apr 2024 13:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713446517; cv=none; b=NMt1V+9yrWpHCqH5UodF1b4zK4dbijxn7dQSnb+PEYEYN8XNUO8CmRDdvKSZ/Q26x5+o9cfoLBLeb3H3bExiAEfpw5bqVFwKC+ZD+HJlWZQW9UzzdP/1ec4FyPhuUQwPQZ78/vDJEziv7ozCcFRGHC3MG1RyxDsbS+7K+g8jndU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713446517; c=relaxed/simple;
	bh=IyiFSVactuT3EqeiswOvJ3nQb+Z8wWWbXb7zgKRPAb8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JU8WGyN6JCLPjAwAbgpPKoXgu9X7sCuavauvp/DhwXfTCRuAuLP7SqZOmrvdtJDscgR5IJ8dS5ScaKAOGDWufIl0FpeT3qrZIMWvIA9oorNjgwqHyt/Einy9c2rEHeZigVkl1j+v5w3rHfKAEt33FoHI0O1La2PR+/DZ9FtHI18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b=0QmWqPqv; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b="0QmWqPqv"
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-36b2ecd7b76so6046525ab.1
        for <linux-doc@vger.kernel.org>; Thu, 18 Apr 2024 06:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1713446514; x=1714051314; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XoKv/RvImu/DvMyByUVz7vVdzNGU4YtRJIIOcys5EGM=;
        b=0QmWqPqv4ZBk7s5ifqNl0zFk1mqVQtNs2Xj61pqJ64Zu+ioRk6YCPjWV+fTZA8+59u
         cG009/hcw+TbDYVlRYb0VYLwWeif74OIEGtWv4UncLNRY4Bs+6OCz6wd+Hqx/wOah2qA
         Sv2io15IpR9e/RZYpTPBsgMLnzzpEJdHWdE2bYrQElgQybw08473LQVjNlD6cWaeq7Yj
         EPywCNPb39kuvLQ2q5A6zTvtJNsc9cQWXN075/YG57eV7GmClB3Wie0uY4njoYNnG1aL
         ZAQvyb+8TtjtEUXvpksE2eeAzs43CTzwY4ECSb/rEEa/ljLr5JEFBp9xu9vMuEhjPYIg
         zWSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713446514; x=1714051314;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XoKv/RvImu/DvMyByUVz7vVdzNGU4YtRJIIOcys5EGM=;
        b=Dhc4isQXlJeAKCm7n7yQ3ZYsP5/qWOaWQxqQ8nMwF8yxm1CGsD5YBa7erbCOc7rJD2
         5URcr7cCUrjPUHM5WTybOinwzGtjYvprvhDE8FhzUGmfVgd2A1y6Zyn/szly7SDIR/MK
         k3vs1hEcNwpRte0r7VdtvJ3zf4sN5HkHX6mXOaIUgIo7k+YT75UIuYGMoFnEKe/lUezy
         OD7RZZG7bH5yRlnY3TMeuoYpXEdbP/dABMR94YzHojeistPMVYnkf/N1149OKlfuxCeo
         D0LqBu5cQuhOVCHZl93RHdnsDw6sU+aeb30bb7sys6efACLZ2/nx9XSGIyr7PrPA1mKi
         V2PQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOjLaBtSHODkK+Uv2ZlaY3NTz5aMixf9CFBUkx6avjSpyAA+vXgNh11D0NNfKL1ecwUibnvbgc90Z4eAylcMNCAULpeo0oDcJV
X-Gm-Message-State: AOJu0YzQCKlah5/ILSrFeD7t2KI6/eErpQWnH+RyjLdkqsJpLOt0I49C
	yqiCC/zysvgTkHeeyuKvHx4jjc6EaBAu8qRh7ipI6cXuBceP2QtaDE0rcTQFvsqIb3QP45gl4a0
	RNNVahhbuw4aqkIJA4f9YYDDMz+nDgSE+bNW73Q==
X-Google-Smtp-Source: AGHT+IEApINqgeOPDHJLzzONqjKCkFgNoR1r7odlJyA+5mEx0EiPGBX8zhfWadQ1GLIFdXLBTz+rTCuaedf0Dv5uyZs=
X-Received: by 2002:a05:6e02:1688:b0:36a:3c40:3e34 with SMTP id
 f8-20020a056e02168800b0036a3c403e34mr3335042ila.1.1713446514294; Thu, 18 Apr
 2024 06:21:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240418124300.1387978-1-cleger@rivosinc.com> <20240418124300.1387978-13-cleger@rivosinc.com>
In-Reply-To: <20240418124300.1387978-13-cleger@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 18 Apr 2024 18:51:42 +0530
Message-ID: <CAAhSdy1VTn_etwfYa-pYM-1hFFK02aBvynHJA7JVsOZvSdDx6w@mail.gmail.com>
Subject: Re: [PATCH v2 12/12] KVM: riscv: selftests: Add Zcmop extension to
 get-reg-list test
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Shuah Khan <shuah@kernel.org>, 
	Atish Patra <atishp@atishpatra.org>, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 18, 2024 at 6:14=E2=80=AFPM Cl=C3=A9ment L=C3=A9ger <cleger@riv=
osinc.com> wrote:
>
> The KVM RISC-V allows Zcmop extension for Guest/VM so add this
> extension to get-reg-list test.
>
> Signed-off-by: Cl=C3=A9ment L=C3=A9ger <cleger@rivosinc.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>
Acked-by: Anup Patel <anup@brainfault.org>

Thanks,
Anup

> ---
>  tools/testing/selftests/kvm/riscv/get-reg-list.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/tes=
ting/selftests/kvm/riscv/get-reg-list.c
> index 61cad4514197..9604c8ece787 100644
> --- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
> +++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> @@ -59,6 +59,7 @@ bool filter_reg(__u64 reg)
>         case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV=
_ISA_EXT_ZCB:
>         case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV=
_ISA_EXT_ZCD:
>         case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV=
_ISA_EXT_ZCF:
> +       case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV=
_ISA_EXT_ZCMOP:
>         case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV=
_ISA_EXT_ZFA:
>         case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV=
_ISA_EXT_ZFH:
>         case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV=
_ISA_EXT_ZFHMIN:
> @@ -429,6 +430,7 @@ static const char *isa_ext_single_id_to_str(__u64 reg=
_off)
>                 KVM_ISA_EXT_ARR(ZCB),
>                 KVM_ISA_EXT_ARR(ZCD),
>                 KVM_ISA_EXT_ARR(ZCF),
> +               KVM_ISA_EXT_ARR(ZCMOP),
>                 KVM_ISA_EXT_ARR(ZFA),
>                 KVM_ISA_EXT_ARR(ZFH),
>                 KVM_ISA_EXT_ARR(ZFHMIN),
> @@ -957,6 +959,7 @@ KVM_ISA_EXT_SIMPLE_CONFIG(zca, ZCA),
>  KVM_ISA_EXT_SIMPLE_CONFIG(zcb, ZCB),
>  KVM_ISA_EXT_SIMPLE_CONFIG(zcd, ZCD),
>  KVM_ISA_EXT_SIMPLE_CONFIG(zcf, ZCF),
> +KVM_ISA_EXT_SIMPLE_CONFIG(zcmop, ZCMOP);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zfa, ZFA);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zfh, ZFH);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zfhmin, ZFHMIN);
> @@ -1017,6 +1020,7 @@ struct vcpu_reg_list *vcpu_configs[] =3D {
>         &config_zcb,
>         &config_zcd,
>         &config_zcf,
> +       &config_zcmop,
>         &config_zfa,
>         &config_zfh,
>         &config_zfhmin,
> --
> 2.43.0
>
