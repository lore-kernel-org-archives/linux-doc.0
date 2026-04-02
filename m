Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADB2393DF1
	for <linux-doc@vger.kernel.org>; Thu,  2 Apr 2026 14:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775141435; cv=pass; b=V6kG1/CbG3ySZSrROdBLP4TvLmUv46OCV59V/88ok5uzaYgLef4K30a2PxSRxgGqbnowKpme7f+TIN50Te0MKxjz44DWDZLW5POaEX9dLLBM3Gj5zBIs5VIdW4rrsZ2ZFisQ2yIrPIRS827tjs9FOEWa02mcLxHa9sNbX7neiw4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775141435; c=relaxed/simple;
	bh=8Myx6mMWS4mnOBzsC4ZdHhnonsc0lkeJ63Qli8FVnr0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hvakmVhXkt9jeAEdTxO6lJ9uLhmEeJ+1A2toqiwztTRF8Sqnvib/g4YSFcCyZTkGD8+uZw47Q+EJ3IHXklH/bhBM3sbegl/12W6O2ejk94XOH2U7ve3XNLomxqX/nzO1hTH+L+Q3oqaDcw27JVmGUyEVZV5mi4VEDzmkUuGHdqg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b=a1Cp7oTs; arc=pass smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b="a1Cp7oTs"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7d9d929e27aso859019a34.2
        for <linux-doc@vger.kernel.org>; Thu, 02 Apr 2026 07:50:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775141433; cv=none;
        d=google.com; s=arc-20240605;
        b=C+KVDyYu+juk97dxU0Ta2HhMP6o0ausjEdxTKaDwIxOYyCp/NXUnfPcPhT+vWE4hpr
         VIVB9IKuWxupxTNGC9IQFdq+3qOZ05hLLnaIYnTAod0tyacewHJL6dkQDiIe+bc5LQ1G
         V9mZQaMQwH2HiCfwLHiViDbdND+oWuxN+EGxkqIpbKX4PU1zdKkg3fk0Bz9LT9LFwGgy
         H0Ty6AeUQjWuOeWsb7Pt88PPCsH6me5Aw9YwYdjSja3GP7xiAQD/BNFoEeigPs5ztcu1
         IJoQQMqqXg8z6qDyshMmifuobcKFhWwn1al67M6IgccI65+7nAjDj7JN4YOuc56KoJoc
         cdbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=za6pvBAfLHdL3QlDjUc6Bu/xHQp9xLt2WtsbUx+6jAc=;
        fh=zZboT2pECiBZRVqcouRuvI4E+g53q+vvaIV6P/giET8=;
        b=fRP7l/47lwZPJbEXDkhrGBt2L9CzjXNVctSJ2H3e3OpiHXV0pl9BG20RKR4p6hEqfW
         Y2FS/XMJ0ynW2iYWmce3JiUeatygeSmSxrt41PvxcZmtr7jqK395ru+5wmu7iRza+g5e
         1kBGbu43vkH9ayP9WbRIM0AGllAbcNR6cHfj95X6pwhc0yO3umkz+/3j86XnQylYiiRf
         EnA3SUU42knZA//mq19uQ4LzfBAOESnwlVz7EcZHB/b+2dbPcOZ4Ht27Jt246n17uWfW
         IFduPSahY2VKySycLu/RIVAaT1tParC/8hGVTUaejklF141SveQueYHtYAcYpYry4BkY
         x0cQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1775141433; x=1775746233; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=za6pvBAfLHdL3QlDjUc6Bu/xHQp9xLt2WtsbUx+6jAc=;
        b=a1Cp7oTsyPtsN2i4AYi/NVPWKGZC/XFcU5Et3jnTjwmoZHLNMIRDk5ZdwWkfEWi/OM
         XsTtKN8+DLes8eFig3tO0NKTol/8bqWpOCb6kzchZmkYcKH3w6HN7UtPkaVrGk7jc+Ms
         Bd+Yj8UA8uv2raBZMxIDwm6DnQE0kSelYvyzsgzPgrVAapDMB+idl55VdxE4wjwbF5H3
         6dziXd9NwBW5FpRMsU9jrIJIebU8du1TN7uQcJfB81C+ochjhM+sxZgSh3+C52g49/l2
         9Ik0FDFtEMyRemXG8LvX/HihA/+rCh+tbIMvS/v5l28XHCeKDAgnV+WwBMJqjn+KDPSX
         K2Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775141433; x=1775746233;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=za6pvBAfLHdL3QlDjUc6Bu/xHQp9xLt2WtsbUx+6jAc=;
        b=Vv03xwqZrNCpR6usZ9suV0qSq2ZXx7dvyXJjWKjn6BXmJ5uVSLMRZGQ9BsjtB6Vymd
         xcJRvAjzbED0ECwP+8Q4/0wTYs+0iZdAyfkxMrsVVq6n/ceotOyAUUA4pNr+tB64VHF8
         soKCj6+7AL1JkYhcB+xBYODWG1+w4e7t76oyOHHGaPK4zlYqKl6WatDboj8WGsFHvjSo
         7Ny7iTNDfCSFLSvfE5c6UuV6cnjBvLPc3yggB1xKvKNoOz7ospc+RvDg4dVCt50HO3By
         aq9q0d4RbsAmossW3mwv0MqIFbJ/GK5cbQOybj+LSJGU9cDOwbM5sky0beRMv7Yr+s+J
         vQ3Q==
X-Forwarded-Encrypted: i=1; AJvYcCU/sEUxsjIKPjEymv2Oad7kq4zHLcRh9eEDNyMGFK93cDqBhF++RlPKiK+5rrVydeMkStn+jtgH+aY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxV1R+kAFHLiHeswsXWJdBn663juoxxHspFrg+xhoE+HJpoo+Kh
	RJ8uRxCURVG62qZwK5fY/jvzX/Uzt2X/oTIHevw7A2rUAL9go9m37RJLgUuBYdnLEzVrq/GiFgS
	0fyU64N61+UrDqLYIHVBhICyMLqGh3TtZObcoJNhhhw==
X-Gm-Gg: ATEYQzxa+Wh65s2Z1cBb7s5eYSo1aK+C7w9mQgwn7MbiMQ8OJl4KtS22rmyw+K1IORF
	eP7siA2pZ0rqE9zgOmSArOgPauaZWJwRpC8aT5JEXVd9JZxqu0yIjm5pGa8IU3Kk3raD2S9bLMg
	GhJbJ/dqUBRtAzZllFphwojWu9NE7PqCKd7tRDmU81mZ1HQKG3523T7sUshOOT5gVXCYephCLrR
	yRNT40yn5aw5H3Z9XMOfpvQ02QuSFunSdBSOf+rji9h3YixeQoad9x3ScGp/nIVriuc7DsyE5zx
	V+PMI7TkTugdrssaAQRZgcBmWdsqUuTTzhOkRsRAYTAdkUv//jn9i5qNJ1smwCPOcwgW7bTT5dC
	jQF6zLi6u0V0vMTmmPC5G3fwKNw==
X-Received: by 2002:a05:6820:f02d:b0:67c:2d5e:e9dd with SMTP id
 006d021491bc7-680a7a68576mr2046653eaf.41.1775141432576; Thu, 02 Apr 2026
 07:50:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260402132303.6252-1-fangyu.yu@linux.alibaba.com> <20260402132303.6252-5-fangyu.yu@linux.alibaba.com>
In-Reply-To: <20260402132303.6252-5-fangyu.yu@linux.alibaba.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 2 Apr 2026 20:20:21 +0530
X-Gm-Features: AQROBzDsAUAZSEerDJEeGwby7bjL0ghYgE-l4zOLT0yiweIOZblDgrBFsbDEbI0
Message-ID: <CAAhSdy1dXxdF0pb_r+hS+rdZ21VVxezwaZ=MCMmDD+vRCyRUdA@mail.gmail.com>
Subject: Re: [PATCH v7 4/4] RISC-V: KVM: add KVM_CAP_RISCV_SET_HGATP_MODE
To: fangyu.yu@linux.alibaba.com
Cc: pbonzini@redhat.com, corbet@lwn.net, atish.patra@linux.dev, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	skhan@linuxfoundation.org, guoren@kernel.org, radim.krcmar@oss.qualcomm.com, 
	andrew.jones@oss.qualcomm.com, linux-doc@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 2, 2026 at 6:53=E2=80=AFPM <fangyu.yu@linux.alibaba.com> wrote:
>
> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
>
> Add a VM capability that allows userspace to select the G-stage page tabl=
e
> format by setting HGATP.MODE on a per-VM basis.
>
> Userspace enables the capability via KVM_ENABLE_CAP, passing the requeste=
d
> HGATP.MODE in args[0]. The request is rejected with -EINVAL if the mode i=
s
> not supported by the host, and with -EBUSY if the VM has already been
> committed (e.g. vCPUs have been created or any memslot is populated).
>
> KVM_CHECK_EXTENSION(KVM_CAP_RISCV_SET_HGATP_MODE) returns a bitmask of th=
e
> HGATP.MODE formats supported by the host.
>
> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
> Reviewed-by: Guo Ren <guoren@kernel.org>
> ---
>  Documentation/virt/kvm/api.rst | 27 +++++++++++++++++++++++++++
>  arch/riscv/kvm/vm.c            | 18 ++++++++++++++++--
>  include/uapi/linux/kvm.h       |  1 +
>  3 files changed, 44 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.=
rst
> index 032516783e96..9d7f6958fa81 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -8902,6 +8902,33 @@ helpful if user space wants to emulate instruction=
s which are not
>  This capability can be enabled dynamically even if VCPUs were already
>  created and are running.
>
> +7.47 KVM_CAP_RISCV_SET_HGATP_MODE
> +---------------------------------
> +
> +:Architectures: riscv
> +:Type: VM
> +:Parameters: args[0] contains the requested HGATP mode
> +:Returns:
> +  - 0 on success.
> +  - -EINVAL if args[0] is outside the range of HGATP modes supported by =
the
> +    hardware.
> +  - -EBUSY if vCPUs have already been created for the VM, if the VM has =
any
> +    non-empty memslots.
> +
> +This capability allows userspace to explicitly select the HGATP mode for
> +the VM. The selected mode must be supported by both KVM and hardware. Th=
is
> +capability must be enabled before creating any vCPUs or memslots.
> +
> +If this capability is not enabled, KVM will select the default HGATP mod=
e
> +automatically. The default is the highest HGATP.MODE value supported by
> +hardware.
> +
> +``KVM_CHECK_EXTENSION(KVM_CAP_RISCV_SET_HGATP_MODE)`` returns a bitmask =
of
> +HGATP.MODE values supported by the host. A return value of 0 indicates t=
hat
> +the capability is not supported. Supported-mode bitmask use HGATP.MODE
> +encodings as defined by the RISC-V privileged specification, such as Sv3=
9x4
> +corresponds to HGATP.MODE=3D8, so userspace should test bitmask & BIT(8)=
.
> +
>  8. Other capabilities.
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
> index 4d82a886102c..5e82a3ad3ad0 100644
> --- a/arch/riscv/kvm/vm.c
> +++ b/arch/riscv/kvm/vm.c
> @@ -201,6 +201,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, lon=
g ext)
>         case KVM_CAP_VM_GPA_BITS:
>                 r =3D kvm_riscv_gstage_gpa_bits(kvm->arch.pgd_levels);
>                 break;
> +       case KVM_CAP_RISCV_SET_HGATP_MODE:
> +               r =3D kvm_riscv_get_hgatp_mode_mask();
> +               break;

Introducing a new RISC-V capability looks a bit complex.
Instead of KVM_CAP_RISCV_SET_HGATP_MODE, we can
simply re-use KVM_CAP_VM_GPA_BITS.

The kvm_vm_ioctl_check_extension() for KVM_CAP_VM_GPA_BITS
return number of GPA bits which in-directly implies the underlying
hgatp.MODE. As we know, if it return 59 bits GPA then it means
Sv57x4 is the selected hgatp.MODE and Sv48x4 and Sv39x4 modes
are also supported as-per RISC-V privileged specification.

The kvm_vm_ioctl_enable_cap() for KVM_CAP_VM_GPA_BITS
will take the desired number of GPA bits and downsize the selected
hgatp.MODE. For example, if user-space ask GPA bits <=3D 50 and
GPA bits > 41 then we select Sv48x4. If user-space ask GPA
bits <=3D 41 then we select Sv39x4. If user-space ask GPA bits <=3D 59
and GPA bits > 50 then we select Sv57x4.

>         default:
>                 r =3D 0;
>                 break;
> @@ -211,12 +214,23 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, l=
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
> +       case KVM_CAP_RISCV_SET_HGATP_MODE:
> +               if (!kvm_riscv_hgatp_mode_is_valid(cap->args[0]))
> +                       return -EINVAL;
> +
> +               if (kvm->created_vcpus || !kvm_are_all_memslots_empty(kvm=
))
> +                       return -EBUSY;
> +#ifdef CONFIG_64BIT
> +               kvm->arch.pgd_levels =3D 3 + cap->args[0] - HGATP_MODE_SV=
39X4;
> +#endif
> +               return 0;
>         default:
>                 return -EINVAL;
>         }
> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> index 80364d4dbebb..a74a80fd4046 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -989,6 +989,7 @@ struct kvm_enable_cap {
>  #define KVM_CAP_ARM_SEA_TO_USER 245
>  #define KVM_CAP_S390_USER_OPEREXEC 246
>  #define KVM_CAP_S390_KEYOP 247
> +#define KVM_CAP_RISCV_SET_HGATP_MODE 248
>
>  struct kvm_irq_routing_irqchip {
>         __u32 irqchip;
> --
> 2.50.1
>

Regards,
Anup
