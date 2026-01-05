Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6A233506C
	for <linux-doc@vger.kernel.org>; Mon,  5 Jan 2026 09:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767603993; cv=none; b=uHEJHRRwO5ilHiIM+hgz9/4VVRzCUYzK7n5nvp0xriWsGEg/e7l5BM0KBFd4lJUOjYKYT4kV7ClATDmrpBCQme2esiS2WhaA1AN7zCKoQArhG9fn8X6ONT0jHZqhP+EC4JA1O3XdDdRqjact++91jtufOJu2lDw2YlyDrSjJp9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767603993; c=relaxed/simple;
	bh=MLxZuPSMtRL816eTodfHWi9P1buz0/azYjgJOrc0bYY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Eo77kX9cFXDlfx7vHdBPWT2bMg8BNiWlTd149F8ikL8a2RWnyvdfDIPDGNMtHSGA1r9Ky22ij+xus7977yHXNVLSPCWHkyn5wO3oq98mCM+opUVWfRKtStXDQ2hxRhibPvSuM4mHD642xDwqgD8PZzXgjjB4BXahQA3v73NroOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b=mcs1xwLw; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b="mcs1xwLw"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-3fe9d6179efso945403fac.1
        for <linux-doc@vger.kernel.org>; Mon, 05 Jan 2026 01:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1767603982; x=1768208782; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rx0r6U43GKweZQq7AZ8Mrd0bllWyzHYWweaavwJCSZc=;
        b=mcs1xwLwhsIyjQKWusMeSRxxBCfEfEKeH1GSy7vdEfmI3S+TLkluEZA/5AWeiY7mJB
         ob/xJH1Gc2zqulIBljXRl/6RVJ2Q+b1ZXUx/t6Hcrzs6Uf970Hj8y6O5op3742Tu/qC0
         w0suuMcVDL3vztkZv5ZY+tlxiIR5EqHGTEGwiX7e3oQFVWxSYCpJqI2a7ym/dgE44Iyh
         ZwN7/pBp3O3+TT9TZ5hVoodyzVYC9erSguz4o2ThxkwWJ//ReRqGAWX7odYILmUYDo+l
         ipHtQDBVicszpBZfYdUDnQp5EPOE6Ux52iioAnz5z8HZXegXtk68/pBy3uvPNC3BHTf1
         Wc+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767603982; x=1768208782;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rx0r6U43GKweZQq7AZ8Mrd0bllWyzHYWweaavwJCSZc=;
        b=Xsl6FjvEGU3yR19Z1L9QEpxPP5hcDjXtXAKeG9u/hR9wZMNbmgQj99eZHRI2JaBylm
         QLuXzCesYlK6R76DUCspsZSTL7QraRLqoWqF7FKtOYIlccbrqVjMOgN3sKZP+kfljy7w
         /MKlftprFzNNVPjfYJpI3g8b8Jd5oEYKBtj7Tqe6rZh88/F3hnHX7Fh0A6AV18DQlw3G
         oqxeglakRGIH14F3Xm7CyvuFfQyJn6znzPrgrnoOTc1YT0F7lEwMtba2GOBtcW0ilVBS
         FQR/lhofx5n6mjMmQj0ylaGo36VfNwMTGOUYfF3wLkFMg+0j4XtYGpybM3KWGtl8KJUU
         /v/w==
X-Forwarded-Encrypted: i=1; AJvYcCWASK8uZ51A9+qiEOlxYObnc+NJD/gQsxEn+J8OtXCeRdABXBI4x+YgRqMqEKlAozOq36bZKGxRGWg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz47niMBJvVbdTaIW68Ns6JkcpOsYGCbgd5OKMva1lTWyEd0EGC
	/KoXv/OgPgq/5wEG6UFnSqcdWkaJF+TtyrKt8mBCoAIVinrCn9LAwUwIIzheVa2Kqh84RrsDcF+
	vmBqDkQ2ODjXeuST2vt5ksZSQVzmkZmOM5NNxKGE1vA==
X-Gm-Gg: AY/fxX41Ts6hX4WSoQrG2aa4YRzU4Gub/IyT+/Q0sbh1FZWzDs751+RChUNO0iO3vYk
	Zue4XIfUU5D3gfK1++Myms2xqiBoaW/SSvlVEajVEF9P5ERl7hC9/yCPN6fUDLAXh2h2Bj4TA9H
	ukdTVqH2n/xXKDogFfc3MW8UR6uZFGTEuXw97NWA64QX0jmbQiq/E4B6KDn6kYpyCdbCWC3erSi
	v9aHSOdg2usmxAjqnFyz8n4BTtp+0b1XLJenFRz59DWfvZavjpoEdG8eVKDoSnHUgYY2fg+sTLN
	DvpgENl8CGo0TgYg/U1ax7amcRknJ8D9Qss109ZFX0a4o1ZN42mNEgU/uw==
X-Google-Smtp-Source: AGHT+IEmhIQ5RKOo2b6b7OL5O1/QlwNjLPOmq/Ngn48EMDTkEYgit3hHMFtHAFIg6wOswhZTAnGu6/YK4U65b6YmqR4=
X-Received: by 2002:a05:6820:a245:b0:65b:295f:ee08 with SMTP id
 006d021491bc7-65f2684a98emr2359335eaf.10.1767603982348; Mon, 05 Jan 2026
 01:06:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250826162939.1494021-1-pincheng.plct@isrc.iscas.ac.cn> <20250826162939.1494021-6-pincheng.plct@isrc.iscas.ac.cn>
In-Reply-To: <20250826162939.1494021-6-pincheng.plct@isrc.iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 5 Jan 2026 14:36:11 +0530
X-Gm-Features: AQt7F2o7aUCslFOKh9Z8QzWPpfr1ehdXhDGDtgLd_0uBy1pmifoh4VGOHYQoZdM
Message-ID: <CAAhSdy3OXBexhB_csqJasQoQJ8QnsE=q7dHXgWtyig28eJGL3g@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] KVM: riscv: selftests: add Zilsd and Zclsd
 extension to get-reg-list test
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
> The KVM RISC-V allows Zilsd and Zclsd extensions for Guest/VM so add
> this extension to get-reg-list test.
>
> Signed-off-by: Pincheng Wang <pincheng.plct@isrc.iscas.ac.cn>
> ---
>  tools/testing/selftests/kvm/riscv/get-reg-list.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/tes=
ting/selftests/kvm/riscv/get-reg-list.c
> index a0b7dabb5040..477bd386265f 100644
> --- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
> +++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> @@ -78,7 +78,9 @@ bool filter_reg(__u64 reg)
>         case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV=
_ISA_EXT_ZCB:
>         case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV=
_ISA_EXT_ZCD:
>         case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV=
_ISA_EXT_ZCF:
> +       case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV=
_ISA_EXT_ZCLSD:
>         case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV=
_ISA_EXT_ZCMOP:
> +       case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV=
_ISA_EXT_ZILSD:

KVM_RISCV_ISA_EXT_ZILSD case must be inserted in alphabetical order.

>         case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV=
_ISA_EXT_ZFA:
>         case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV=
_ISA_EXT_ZFH:
>         case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV=
_ISA_EXT_ZFHMIN:
> @@ -530,7 +532,9 @@ static const char *isa_ext_single_id_to_str(__u64 reg=
_off)
>                 KVM_ISA_EXT_ARR(ZCB),
>                 KVM_ISA_EXT_ARR(ZCD),
>                 KVM_ISA_EXT_ARR(ZCF),
> +               KVM_ISA_EXT_ARR(ZCLSD),
>                 KVM_ISA_EXT_ARR(ZCMOP),
> +               KVM_ISA_EXT_ARR(ZILSD),
>                 KVM_ISA_EXT_ARR(ZFA),
>                 KVM_ISA_EXT_ARR(ZFH),
>                 KVM_ISA_EXT_ARR(ZFHMIN),

KVM_ISA_EXT_ARR(ZILSD) must be inserted in alphabetical order.

> @@ -1199,7 +1203,9 @@ struct vcpu_reg_list *vcpu_configs[] =3D {
>         &config_zcb,
>         &config_zcd,
>         &config_zcf,
> +       &config_zclsd,
>         &config_zcmop,
> +       &config_zclsd,

Both config_zclsd and config_zclsd must be defined before
vcpu_configs[] using KVM_ISA_EXT_SIMPLE_CONFIG().

Also, config_zilsd is not added in alphabetical order.

>         &config_zfa,
>         &config_zfh,
>         &config_zfhmin,
> --
> 2.39.5
>

I have taken care of the above comments at the time of merging.

Reviewed-by: Anup Patel <anup@brainfault.org>

Queued this patch for Linux-6.20

Thanks,
Anup
