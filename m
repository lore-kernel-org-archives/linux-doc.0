Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2AE280A51
	for <linux-doc@vger.kernel.org>; Fri,  3 Apr 2026 16:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775234566; cv=pass; b=H7iFTtYMtDyjm47eULpVz9Vn1vg0i96VYA2N6fZrijMQfdQjZSlmk/jXG8sgQWH7sPE/gW7Yaem/HGawtx4Cp7q3KybmTyIlvVNj2oWp3e+YG6zkKWk2C0YWaTAQKD4F4X5yLL/O9WKC37nFs0PMT65ZOmsDoYroyCX4iS/YYVI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775234566; c=relaxed/simple;
	bh=qGU9Zxnzj7IbyFxskAzMgqpZJCRoHLKeXshL3Lo8O2Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jqe6B8lPelqd4VdkjmHJc+ex3naD4tlIfJKrHiwAlRGOr5pOEHarnwKCUlHYXQbWGulxMkWUvsEsJm+naiu9ewDmjTsN999mFCLsv6NoJ5S2/54dQkEsAnWx43KAe+PFuAf9UWNJbrsZxtDRdvtn9TQhAfmNC5tHthdrZm/D2Os=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20251104.gappssmtp.com header.i=@brainfault-org.20251104.gappssmtp.com header.b=DZDOcZI6; arc=pass smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20251104.gappssmtp.com header.i=@brainfault-org.20251104.gappssmtp.com header.b="DZDOcZI6"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6836ab45d84so34286eaf.0
        for <linux-doc@vger.kernel.org>; Fri, 03 Apr 2026 09:42:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775234563; cv=none;
        d=google.com; s=arc-20240605;
        b=PI65Xh4RyGITa8IUrFbE4B/ayyX4CA+q/ATKfLabJUrjXZQgAakDfsmS6h5ThDy0nO
         LDWQu9aypOiN0zUtAasaemQOy22JH4ucMj99K2wyNgFUOL+mdMp6yFl4xp+2wjtoKZFs
         tmqMDZoLVzh5ZYsm25AZ0L+nnDX+wSMPyFdilJZablIF14JHlfVPTKyXcaD0j7Yx9bMX
         1C23AGIuAiddoDpmRP8Fz/m9RiEjSs0TNRZQJ4Hi3JhY1WY/16/3M64rGMyigNE8N0KT
         u2W3e2MDG8hhht/o3GA20JPC6brx909PkTXOx9BnVZZjbV646iSadahJzMLCbjRxjNDK
         Jfqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=auZTnywYVktBT/CjhCUIdzd5mrQJL3jt4L8n/dbsyLw=;
        fh=7aHhKPqKHiAAQpjsa10TLzIdnfOnD0SEkODSwwbrxV4=;
        b=kqsd8h7+xCfA+Mo8lpBMQEQfWFmrZfy4nXtmdwpWC5bkATIMoI34RV6LVIY3aIp8z8
         NrbVYKhf3tioEITZXfZobMTsivq/4txZvd+a2PBLOBNfsOC+y9uSmX/09QVqhsxvEWAm
         3WSLq5lFlDIANTG3zeNhD0sxbC3EiJujnA/0qToXnLfhDPr2N646Z9dxsdecnN9B/MEl
         pTMxoXfkccNsJdeul+p4LJX3MokY2UIt2u5l4i0GDo2R4bR6yqtfLFQdFzQNQMNUo7G0
         N5XfhWnpvcmZ9l5fK9gYGz+BFL0rTWd7w/o166HFL56Ul2azqYAxlpCnuorC0wBPoqKz
         b8mQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1775234563; x=1775839363; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=auZTnywYVktBT/CjhCUIdzd5mrQJL3jt4L8n/dbsyLw=;
        b=DZDOcZI6UKl03G5B/oUaab2SDROdBPqJfl5aJiy50iA2VZ18B9mN0E/iF66YvJMKiu
         YAGfnegNPC3Ke6pM9exi2MHncB66fClQeRThnllhwxGqM9e8hiiZpZk8NVIHegKw2vDl
         nWWImL1fnC7QbB3HEETOXq+XLu0cF2nFz+ltsFLOX1dizhDxagX0Ff/ED/N02x6wuRLu
         cL4Jzh+eeiBPLWLAAqv7XhCTLIxMNvhrxHJGtqJPKy9ML7Qwc/WfwdSGjEVxGs55D6hC
         EkplN8cuJ3RUoZ7ckwGSPK+P9TICyXQ0dafgVykXKqqsSzYLWYkkhBT8j7O3V6u5tO8d
         6uMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775234563; x=1775839363;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=auZTnywYVktBT/CjhCUIdzd5mrQJL3jt4L8n/dbsyLw=;
        b=i8rUPZstG9YezfBIqlAqbcSpf8KuLqHQnujGJaePuTU6hhTXFLsOlfDPlG94sRvDCQ
         BC2nvoe+Wm6mFkrXr2CviWDAY7AR48KKwfxIsamz7X6WnwGNXLj0oAFnqbprySmXa5I/
         jo8W1bd5bdtNQfu5XHPjr/5iwSkZC4kpk3Pt5+O94RA6jbDB4EnQcGw0uOMTjUiTrn84
         xnKPiRsBbCVVe/3ft5oWAHhsaL97tmF0iMb98BTFysrMEIIBE78l7UwmAJGqPsKXJTUx
         zboQyVOa7TznnNkeuSh8331VhhL+zNuMRgJmUyNGXlysIy811hzK/XkLbqJmDS+Y4iTH
         Gvcw==
X-Forwarded-Encrypted: i=1; AJvYcCXrOOHpOKy0jjy4DtJ2V0PIEatHQTQVDeEc+VRsZW2ymvqB577AjQUUYMuk5zz78xTnyf5J7lL9mHE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/DqV8WaQN9TuWgx8HbonJGrKnO67tib8Y6jbMzukhfeg804KS
	y4FxpoeScQhzwoO01dWKsJu4udmaTPGSFYDuUaLHoyMxf6HBrP/SxIcTJ7fXCKMLQ3hhRn+3mPi
	4xB2o5NPLkKjHlJJel5LUxhbYl/MbkfxwRpuSpIzgoA==
X-Gm-Gg: ATEYQzxtsHKW8mWNhEORWpkTx4KrlAmgjC72Sv2+TOL+pV3fZfBbALbRLbihrKVo6jV
	RovVv9kplDUBft/hB7ZKbgi792W9PvmniQWytKBgbuIcY78bWFux8ZXHWtmAepZoWCG5yALL/Tf
	qJqMeF7S7oKY/vCt6dUGmsh1UoiHpbGNB4j5f+OQ1SQyyzpiIy7FQxNm6hAyWCG5YOfyfISl5Eq
	Ued7OdpZoJtigDTGMkgExxPdBjhNTANLJtlsrRRctIItC3fc7MN0Cxf+kI/VaVA3EXYY9aRqURV
	0BRQjk7+nV6KDeEk8tBNAv6/3NjKQDGaNQoo44s5BRh71v9SovAqK9TqWg34XGD6kxb7Lp2MVk7
	IUUGCC+Jj11aWE+YtWZhxXemUSg==
X-Received: by 2002:a05:6820:2215:b0:67e:42ca:bf1 with SMTP id
 006d021491bc7-6821fe62163mr1788720eaf.35.1775234562721; Fri, 03 Apr 2026
 09:42:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260403153019.9916-1-fangyu.yu@linux.alibaba.com> <20260403153019.9916-4-fangyu.yu@linux.alibaba.com>
In-Reply-To: <20260403153019.9916-4-fangyu.yu@linux.alibaba.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 3 Apr 2026 22:12:31 +0530
X-Gm-Features: AQROBzCuQ5MlY1qXpbAGUgE7OvJH7RKCeYopTbo-0zq1mBL8wwRCkjds0LobFsM
Message-ID: <CAAhSdy30Eg1GvnyfJyqABLEyP9_rV3Zb=Ts5TAxWWnv0frWRYA@mail.gmail.com>
Subject: Re: [PATCH v8 3/3] RISC-V: KVM: Reuse KVM_CAP_VM_GPA_BITS to select HGATP.MODE
To: fangyu.yu@linux.alibaba.com
Cc: pbonzini@redhat.com, corbet@lwn.net, atish.patra@linux.dev, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	skhan@linuxfoundation.org, guoren@kernel.org, radim.krcmar@oss.qualcomm.com, 
	andrew.jones@oss.qualcomm.com, linux-doc@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 3, 2026 at 9:00=E2=80=AFPM <fangyu.yu@linux.alibaba.com> wrote:
>
> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
>
> Reuse KVM_CAP_VM_GPA_BITS to advertise and select the effective
> G-stage GPA width for a VM.
>
> KVM_CHECK_EXTENSION(KVM_CAP_VM_GPA_BITS) returns the effective GPA
> bits for a VM, KVM_ENABLE_CAP(KVM_CAP_VM_GPA_BITS) allows userspace
> to downsize the effective GPA width by selecting a smaller G-stage
> page table format:
>   - gpa_bits <=3D 41 selects Sv39x4 (pgd_levels=3D3)
>   - gpa_bits <=3D 50 selects Sv48x4 (pgd_levels=3D4)
>   - gpa_bits <=3D 59 selects Sv57x4 (pgd_levels=3D5)
>
> Reject the request with -EINVAL for unsupported values and with -EBUSY
> if vCPUs have been created or any memslot is populated.
>
> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
> Reviewed-by: Guo Ren <guoren@kernel.org>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Thanks,
Anup

> ---
>  arch/riscv/kvm/vm.c | 44 ++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 42 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
> index fb7c4e07961f..a9f083feeb76 100644
> --- a/arch/riscv/kvm/vm.c
> +++ b/arch/riscv/kvm/vm.c
> @@ -214,12 +214,52 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, l=
ong ext)
>
>  int kvm_vm_ioctl_enable_cap(struct kvm *kvm, struct kvm_enable_cap *cap)
>  {
> +       if (cap->flags)
> +               return -EINVAL;
> +
>         switch (cap->cap) {
>         case KVM_CAP_RISCV_MP_STATE_RESET:
> -               if (cap->flags)
> -                       return -EINVAL;
>                 kvm->arch.mp_state_reset =3D true;
>                 return 0;
> +       case KVM_CAP_VM_GPA_BITS: {
> +               unsigned long gpa_bits =3D cap->args[0];
> +               unsigned long new_levels;
> +               int r =3D 0;
> +
> +               /* Decide target pgd levels from requested gpa_bits */
> +#ifdef CONFIG_64BIT
> +               if (gpa_bits <=3D 41)
> +                       new_levels =3D 3;        /* Sv39x4 */
> +               else if (gpa_bits <=3D 50)
> +                       new_levels =3D 4;        /* Sv48x4 */
> +               else if (gpa_bits <=3D 59)
> +                       new_levels =3D 5;        /* Sv57x4 */
> +               else
> +                       return -EINVAL;
> +#else
> +               /* 32-bit: only Sv32x4*/
> +               if (gpa_bits <=3D 34)
> +                       new_levels =3D 2;
> +               else
> +                       return -EINVAL;
> +#endif
> +               if (new_levels > kvm_riscv_gstage_max_pgd_levels)
> +                       return -EINVAL;
> +
> +               /* Follow KVM's lock ordering: kvm->lock -> kvm->slots_lo=
ck. */
> +               mutex_lock(&kvm->lock);
> +               mutex_lock(&kvm->slots_lock);
> +
> +               if (kvm->created_vcpus || !kvm_are_all_memslots_empty(kvm=
))
> +                       r =3D -EBUSY;
> +               else
> +                       kvm->arch.pgd_levels =3D new_levels;
> +
> +               mutex_unlock(&kvm->slots_lock);
> +               mutex_unlock(&kvm->lock);
> +
> +               return r;
> +       }
>         default:
>                 return -EINVAL;
>         }
> --
> 2.50.1
>
