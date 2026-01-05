Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3297330335
	for <linux-doc@vger.kernel.org>; Mon,  5 Jan 2026 09:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767603743; cv=none; b=McLtvGxtNpkgVAxySQ5MhzLAbnwbFYO8dtFDotQw76NNsevHsSif6OQq2Jw+Xyw6vZ4IK6R2waUQfHElmYwQ28GUzFhwDQ90Rbul52CFAgSTj8A0UxpN2DE6GYWRqkDe2qNAgJxOZZVdhZYrz8+pDfNZ3mhHGF3Bz1JQOwJbbsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767603743; c=relaxed/simple;
	bh=FTgD2tLboygPZIMnpvGYADMJjZOBhXUngyQl92DfTPw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dDHVeNFpVXBnLlHzXnA5sprL4Ou8VY6CWTSYPXuTkMNDmU7xqydiNPXcc4yup8pwWWkAw4kUms9hod6OyaPFfbK1ZY/nhnbZV2ei8Xm6dtFEzUSDCMAuL9d8HVEknDRo/9FzxMw6dswbx+ZrZ1GjBRs4RB/eykyvMWdCBS54AmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b=q9FU/VLl; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b="q9FU/VLl"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-459ac606f0bso4517496b6e.0
        for <linux-doc@vger.kernel.org>; Mon, 05 Jan 2026 01:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1767603738; x=1768208538; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qLgzGv5fLc8fsHoh6HgxliKmTiWU9X2CeR3QczQ/WzU=;
        b=q9FU/VLlM3Fs9Y0IvnL2TiyBVm40QnOS8EsXR61JY92ivxpJgHGgz+rTImfoXbOHv6
         x86gsaBD8qIGfWVODjEfgdE7seEve7mAyJ1qEPB5bM6u2T0Gl/CxyCjqYM3Spi+UL1Sj
         C/txL3nfckNMdLzrE5jHSUgCf+by11ebuTfW0Pl5TKANhcWhUXmo9Jl82RGWqwmf+/HV
         zqwSAbSuTb7JaBMjIn/IV7Qmxt2IbrVcS3Bwmhlioz/N86gp1ogFGwFKCyvstZvRfKeT
         AGoEde0oKvSToJcTPJSNdP1gWf+DSZedc6boWbeUQzs7n0+mFUZFjRvmr7JKZwmNUve0
         u0iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767603738; x=1768208538;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qLgzGv5fLc8fsHoh6HgxliKmTiWU9X2CeR3QczQ/WzU=;
        b=QROGAaotjakCzJZLD+9bmypacsX3s720WyluQdbGyKBPy8+5J/uPVGza4bjuRO9kML
         5tegOtrfgrsN+7HOgc2UtcCeqm5IAUdncrvNvMZxxLGLBRNEkrF1MMxnrtryhIXXnUFS
         7ks8eQh0EKsTWl/nyfmqSlDJ9emYFvfAPQbeQUM3GMbp/82GDY1sBp0FeJ78f30yNaak
         zXcChBszUOcvFuGGsv8B5VyomObwtsNWJzziDje+T+4hEPj3LRA2GDgEAp3I2otgn8i0
         R1gM3sLx4Vt4dVfhIUalijid+7NivJo14q1i5aVaps+rVY+cyBQ0VPQWRmbaR7aK8gDb
         Oe+A==
X-Forwarded-Encrypted: i=1; AJvYcCWC5Gax4e3ePO8HRWI5pg/jMzFW/0Iq5qddwF8VM3PeLPW3pFy/rNduUXjgOkT/qD0FCt3fJPs9YSY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsfAXnRjXSIGExPmSB2gdVtvGozmxtnAef7sz9RPcfQkVi9g/d
	mBxgktNbsDJuJvIVdFXP8DCrqcomPq5s3aeSGdcyD5lj0o5xbgQkRMv0UXkF9uaUkuZMS9baAeH
	r0IcNRwg+H9s//hpPUwSZxufxsyl2/xnvk5ZysAAMfA==
X-Gm-Gg: AY/fxX6YirUsV3tmtw8Vw5IaTlnXGgGymzcg9ealQDb/pDRLWqfgrb2DBtb4CZG+lBi
	Dl+TT7YUoKIem0jv9Qi3csfBLV3YbRq2sVLwZBLtkZzvEIN5Skz6HOEecOt8lMxEeTrVyB1206e
	PDeVqZWCFOP43NXd960u9B3lD1w7Hf6M3lYf99LhZ/DRLm2zwWoCdqNnVORunauIV1/ueQecbtP
	Rt2QyaK2Ndw/WYhrQZsiznYkGRfXuYUvULxsVpPXeqx4JTNheWzlJPQ25hYOaE3Qn4lfhIMCO+2
	MQIJrKq5JApyvP/5v3GWYcx9Y6i9JaSQA3ScUwNYRXqo3qL6fAVuY0sz9g==
X-Google-Smtp-Source: AGHT+IG/2dbYVAi+kE9jQKrV+b5ME2O9/wDR8akXLsA6MOvPGexAzyR6yiQetXOblpapVeFT7WzjD3+LEnqxI7rG0V0=
X-Received: by 2002:a4a:b285:0:b0:659:9a49:9023 with SMTP id
 006d021491bc7-65d0eafe372mr16492285eaf.80.1767603737633; Mon, 05 Jan 2026
 01:02:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250826162939.1494021-1-pincheng.plct@isrc.iscas.ac.cn> <20250826162939.1494021-5-pincheng.plct@isrc.iscas.ac.cn>
In-Reply-To: <20250826162939.1494021-5-pincheng.plct@isrc.iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 5 Jan 2026 14:32:06 +0530
X-Gm-Features: AQt7F2r7JOD0nswZYt1d_1RpOAVlRLQ2tRHmfthI7w40klc16h1ihmE0AFTutIc
Message-ID: <CAAhSdy1B155WWM8=FA=fvmpVHgVzXke5WjQRnv63RLyLbdpDFw@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] riscv: KVM: allow Zilsd and Zclsd extensions for Guest/VM
To: Pincheng Wang <pincheng.plct@isrc.iscas.ac.cn>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	pbonzini@redhat.com, shuah@kernel.org, cyan.yang@sifive.com, 
	cleger@rivosinc.com, charlie@rivosinc.com, cuiyunhui@bytedance.com, 
	samuel.holland@sifive.com, namcao@linutronix.de, jesse@rivosinc.com, 
	inochiama@gmail.com, yongxuan.wang@sifive.com, ajones@ventanamicro.com, 
	parri.andrea@gmail.com, mikisabate@gmail.com, yikming2222@gmail.com, 
	thomas.weissschuh@linutronix.de, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	devicetree@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 26, 2025 at 10:00=E2=80=AFPM Pincheng Wang
<pincheng.plct@isrc.iscas.ac.cn> wrote:
>
> Extend the KVM ISA extension ONE_REG interface to allow KVM user space
> to detect and enable Zilsd and Zclsd extensions for Guest/VM.
>
> Signed-off-by: Pincheng Wang <pincheng.plct@isrc.iscas.ac.cn>
> ---
>  arch/riscv/include/uapi/asm/kvm.h | 2 ++
>  arch/riscv/kvm/vcpu_onereg.c      | 2 ++
>  2 files changed, 4 insertions(+)
>
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/=
asm/kvm.h
> index 5f59fd226cc5..beb7ce06dce8 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -174,6 +174,8 @@ enum KVM_RISCV_ISA_EXT_ID {
>         KVM_RISCV_ISA_EXT_ZCD,
>         KVM_RISCV_ISA_EXT_ZCF,
>         KVM_RISCV_ISA_EXT_ZCMOP,
> +       KVM_RISCV_ISA_EXT_ZCLSD,
> +       KVM_RISCV_ISA_EXT_ZILSD,
>         KVM_RISCV_ISA_EXT_ZAWRS,
>         KVM_RISCV_ISA_EXT_SMNPM,
>         KVM_RISCV_ISA_EXT_SSNPM,

The KVM_RISCV_ISA_EXT_ZCLSD and KVM_RISCV_ISA_EXT_ZILSD
MUST BE inserted at the end of enum to maintain backward compatibility
in the UAPI header.

> diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
> index 2e1b646f0d61..8219769fc4a1 100644
> --- a/arch/riscv/kvm/vcpu_onereg.c
> +++ b/arch/riscv/kvm/vcpu_onereg.c
> @@ -64,6 +64,7 @@ static const unsigned long kvm_isa_ext_arr[] =3D {
>         KVM_ISA_EXT_ARR(ZCD),
>         KVM_ISA_EXT_ARR(ZCF),
>         KVM_ISA_EXT_ARR(ZCMOP),
> +       KVM_ISA_EXT_ARR(ZCLSD),
>         KVM_ISA_EXT_ARR(ZFA),
>         KVM_ISA_EXT_ARR(ZFH),
>         KVM_ISA_EXT_ARR(ZFHMIN),
> @@ -78,6 +79,7 @@ static const unsigned long kvm_isa_ext_arr[] =3D {
>         KVM_ISA_EXT_ARR(ZIHINTPAUSE),
>         KVM_ISA_EXT_ARR(ZIHPM),
>         KVM_ISA_EXT_ARR(ZIMOP),
> +       KVM_ISA_EXT_ARR(ZILSD),
>         KVM_ISA_EXT_ARR(ZKND),
>         KVM_ISA_EXT_ARR(ZKNE),
>         KVM_ISA_EXT_ARR(ZKNH),

Both ZCLSD and ZILSD must be inserted in alphabetical order
in the kvm_isa_ext_arr[] array.

I have taken care of the above comments at the time of merging.

Reviewed-by: Anup Patel <anup@brainfault.org>

Queued this patch for Linux-6.20

Thanks,
Anup
