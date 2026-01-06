Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E361C29B200
	for <linux-doc@vger.kernel.org>; Tue,  6 Jan 2026 04:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767675405; cv=none; b=MI5MWP8NNlVZwKe0DjfowPikLd0Fe1Us37TJCmapV1a9WN59DwhLbMqdb9ZfLosHzAzqVPR8OSnXIG6x/3ldannl+KQNkWHmxDozT1FmMrKj7Hsm7hKrsBXx5B0ylT7Sfw33X86Q46KhIhLGrnWIiaWnWgVbHc8xpFqWbGCf/Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767675405; c=relaxed/simple;
	bh=fbOChfkZbXOq4bWAzF7RfS77y5AjBtfElT9+lVK8jhg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EbgTmnOqszihfJkzjTKJkvxMpcj5HesSJ94BnWW8lX/Yite7ZwkUbT/8GPrIJl/VWxfQrVhlb02K0PxSjVtSs/OI6xcFkat7QhC8+/pgQRcfXN2EU6Vw/taoEJnmjv6rjeHgc5foRLhN1u8AfuPcabmTJTesOl/eWnC8wqmutXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b=AdxepRR3; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b="AdxepRR3"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-4557e6303a5so226713b6e.3
        for <linux-doc@vger.kernel.org>; Mon, 05 Jan 2026 20:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1767675401; x=1768280201; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WA+vnv3FR+Z4SF0lY1aYTXYOVt37m8c4DjPEA2hxbj8=;
        b=AdxepRR32ZRfNXuAeeUizo+CnwLitQ7zhXMGkWNX+ePYeR8Edb8n82yNZ0WtZmeyVn
         RjGoMQ5RFebtp9D2clL1nAiKpmFEKNTAN3ui5gMmE0rD1LPLpiE+RLtRQH3jMzLAtVoM
         fq8D4n7rM4Xj4pp4q6ZMji5Lw9yxCMk2R66PmNkxDKxUd5v6jV6U8uG9wtzY24vCk8ZF
         Wn/Ntf3/VIShSc2WA6rOrmkZMmyJb4M73uaCM/KJbdRp2ap1VP4tKRc94YjTLJVGbp4N
         j8R2wNdf42iuSkEuZAAGMlAQNr0F4ulHSiRscM8Qk9fVMd7VWslEpFA8Msf1eTODs3Ex
         uqDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767675401; x=1768280201;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WA+vnv3FR+Z4SF0lY1aYTXYOVt37m8c4DjPEA2hxbj8=;
        b=Hx7+bnkPm679/hI+qAjV+veaK9M5PtY0oLb5UB/5UcQAILdqlpXzDPivoSAommssot
         3vAikiApHNhkZWe6jjDOvNHb6gpB9XKKhR+Tt/NOYKH7X1ozNtiVTvrothUlwpc6DIXf
         7wQUzoAjSKpzyjG2gyKCytBcOrntGLgF+ZTlj8JrhiiRrOMXxCjLKMcMEz48ZRmxy3Mk
         oat7gKphVFI0oehoDKEwGJgJlyzW3qXlMQGK4SgJ51UQE7FCmHiGYNb8o50KsJ6cVA7/
         lGwj9MFxL+WBOZbgfhoVY4W6wNLRRvMOGOOMUWSpD0jgcVdeKo4ITuG8LqNN0F20YPNZ
         O1SQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6wyWjl2mX7YR78mDBNE0tiI2IG4PJyGTpL8AZD3DC6Ysu7DOz3jhKNl8AaiE9ze9ECc/ODYgjxwc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqZKV3bcvN0I+ZueY6I4A1CHV8STgBZjB0BRaEIqMawrJDZHtC
	vzXpBhAPcrLkVdjAcS42bic9LhEzzBL6izHWZkSEmI3kCx/YOwNE9wutXptAgmwsemMNI4zy84F
	qeCpnqhuXW3M8aX2jUFRIaa0kATAJNsRVKcdJ5Ms49A==
X-Gm-Gg: AY/fxX7JTcPevoRl1LsV8AuJeTD88RaI4TlJpCg0JZCdyVKj0PV0bb5UnyXK4TyA2yo
	ZGbFsa94C7H4qATVPHwAfQxmlEdDLAVdx02ugpaNh9P1ABZqBtgMpQeIH1mxM33hQ5917F9rZN4
	MHvzZB5gt86rMcCfcEY67PcNbofFKFXQ0gMPdUaqp5XHTthtIRry1pMVN0WzzE3trb198aO+gfD
	d8U5T2V+qFus+eYR8Ctql4QKd0VZP7eNyK9L3xwtufQLfST3h9LgbgNvpW/fKfvixyK1vmTL+PU
	VKyqhcAFKF/CTegK3UXKOXK6QIw2Xw+uwJAui1okG6Y3hxBuNIXOHXIlsQ==
X-Google-Smtp-Source: AGHT+IFYFZIDuKpjkDS72Ef6JCpoBzzGRuIzZj1eYSMd9ZLPsEbeYPPSGa4zpnzJp7w6utOo445xI/OFNWfh52Uwiq4=
X-Received: by 2002:a05:6820:f006:b0:65d:a21:d1f9 with SMTP id
 006d021491bc7-65f4799cc06mr1525576eaf.5.1767675400701; Mon, 05 Jan 2026
 20:56:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251020042457.30915-1-luxu.kernel@bytedance.com> <20251020042457.30915-5-luxu.kernel@bytedance.com>
In-Reply-To: <20251020042457.30915-5-luxu.kernel@bytedance.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 6 Jan 2026 10:26:29 +0530
X-Gm-Features: AQt7F2pAUL7KOytVD0mr7jwpoQ61NGCRNrXweF7HHu0OAcu7_RUK7gg5_B9FCMI
Message-ID: <CAAhSdy3btmd-G_335XjJ6O_+WFNyrq5wWYSEtEQHUeP1yKmLog@mail.gmail.com>
Subject: Re: [PATCH v4 09/10] RISC-V: KVM: Allow Zalasr extensions for Guest/VM
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: corbet@lwn.net, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, will@kernel.org, peterz@infradead.org, 
	boqun.feng@gmail.com, mark.rutland@arm.com, atish.patra@linux.dev, 
	pbonzini@redhat.com, shuah@kernel.org, parri.andrea@gmail.com, 
	ajones@ventanamicro.com, brs@rivosinc.com, guoren@kernel.org, 
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	apw@canonical.com, joe@perches.com, lukas.bulwahn@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 20, 2025 at 9:55=E2=80=AFAM Xu Lu <luxu.kernel@bytedance.com> w=
rote:
>
> Extend the KVM ISA extension ONE_REG interface to allow KVM user space
> to detect and enable Zalasr extensions for Guest/VM.
>
> Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Queued this patch for Linux-6.20

Thanks,
Anup

> ---
>  arch/riscv/include/uapi/asm/kvm.h | 1 +
>  arch/riscv/kvm/vcpu_onereg.c      | 2 ++
>  2 files changed, 3 insertions(+)
>
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/=
asm/kvm.h
> index ef27d4289da11..4fbc32ef888fa 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -185,6 +185,7 @@ enum KVM_RISCV_ISA_EXT_ID {
>         KVM_RISCV_ISA_EXT_ZICCRSE,
>         KVM_RISCV_ISA_EXT_ZAAMO,
>         KVM_RISCV_ISA_EXT_ZALRSC,
> +       KVM_RISCV_ISA_EXT_ZALASR,
>         KVM_RISCV_ISA_EXT_MAX,
>  };
>
> diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
> index cce6a38ea54f2..6ae5f9859f25b 100644
> --- a/arch/riscv/kvm/vcpu_onereg.c
> +++ b/arch/riscv/kvm/vcpu_onereg.c
> @@ -50,6 +50,7 @@ static const unsigned long kvm_isa_ext_arr[] =3D {
>         KVM_ISA_EXT_ARR(ZAAMO),
>         KVM_ISA_EXT_ARR(ZABHA),
>         KVM_ISA_EXT_ARR(ZACAS),
> +       KVM_ISA_EXT_ARR(ZALASR),
>         KVM_ISA_EXT_ARR(ZALRSC),
>         KVM_ISA_EXT_ARR(ZAWRS),
>         KVM_ISA_EXT_ARR(ZBA),
> @@ -184,6 +185,7 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsign=
ed long ext)
>         case KVM_RISCV_ISA_EXT_ZAAMO:
>         case KVM_RISCV_ISA_EXT_ZABHA:
>         case KVM_RISCV_ISA_EXT_ZACAS:
> +       case KVM_RISCV_ISA_EXT_ZALASR:
>         case KVM_RISCV_ISA_EXT_ZALRSC:
>         case KVM_RISCV_ISA_EXT_ZAWRS:
>         case KVM_RISCV_ISA_EXT_ZBA:
> --
> 2.20.1
>
