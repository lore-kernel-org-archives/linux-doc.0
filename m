Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35C5346E72
	for <linux-doc@vger.kernel.org>; Fri,  3 Apr 2026 08:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775203876; cv=pass; b=e317adyuUV19IF90rKv8/HcHaznL22cswRtu77GQwJccACnGyX/+/CIKqqUsqWMe79EoHhJWfkjcSdeiJrWeAhpHaGJ7CDKuWKWN2eSAocpv0gH93K4a4/bJx7dLmf9b/rd/mY4xKotWO5wK/UWl8PWXajhj9I+UGdD7n++pe4Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775203876; c=relaxed/simple;
	bh=jjT8Eqk9/A1dLd1SGkmbc4rZo4by3JCeuKdtmVbjXGg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HFTYZM/slsllBzk40SnngzLkXsN6mYVtXd9wLjcJnMvNhABuMi2W7mNsSpmbKm4pvuUoHqj16Zs1MD/cLK19iPFIQ3X/W43n+sFPujbWkqP80gUGW8QuenjKQMi0lc5sXucgqWNq/J8Z4yBCeFKC392oFPJIZ4p23Lu+B7bdED4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20251104.gappssmtp.com header.i=@brainfault-org.20251104.gappssmtp.com header.b=G/NboVRa; arc=pass smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20251104.gappssmtp.com header.i=@brainfault-org.20251104.gappssmtp.com header.b="G/NboVRa"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-67c250805ccso638074eaf.1
        for <linux-doc@vger.kernel.org>; Fri, 03 Apr 2026 01:11:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775203873; cv=none;
        d=google.com; s=arc-20240605;
        b=D7qaFmM266pLZHE392vO3LSH73QYRtTU12LNWPcfaLz4jC0tPt+uh8zPYJaAec5+8p
         VqVTnSc3Vemw/oz2orvd4n1YOCj+oxc7ezhC68RGpBZ69d+V/KOz5hi2D21jYqbtSd6F
         XAOqfHypKf9jZ0U/BW85HGXPHMkrX5Rjbnbj1TToAQ4puVNjqXAFq/+mcJp1BEtr5wO/
         gSe9WdZoEb5YA7Z6I1VqVkV1zMeTi/IQxyqFTbYdf4IRdMXZuXjG3J1io7cDDl88yr/y
         R1FjL5Lhn1MP0YOJtJL5grIlowGU9N/lZp7tKSz5lxzNU1+7Ik8MIG56+0rjDdmDCofJ
         LBNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HRjWOMqK4PAlflmzYTeO4Htqmd6bJQ/bjreqx+Xjlfo=;
        fh=X8HNPWkod0Ymcg9kUyh5WMD5ynU6HO5jCxoDYXIV7Zc=;
        b=Kx36SpiIDyA2DCj+e42uNrlF46y4HjOw2CURUqMzKXiYQu1X+XbJzn/qEdBZGshlqA
         pWblSI8pstf6shwyxpK+sqc9MAlgmH9/na/YwHOvKlhs0D1+Dl+PYkAhTFd1YViXIpSK
         t1Xv1egnQ3t6mBN873aWre5m9Lkaq/+vXuhKHQ3Lam5AhL7pQx8wWmdYwAZUj5apgNCA
         rblpnfyiTjn4i1+u6Rfc2JGSF4cy7INJ09a+4STBnIbtZDd7e1R40DLsMGycjpg8ukNL
         EA7y0VOoEqe5ZGpls1EMZkDaeOgCFOdADsfEMMF+r1D7+6J3EzakoVUphnDrj5QUNcfL
         ijvA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1775203873; x=1775808673; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HRjWOMqK4PAlflmzYTeO4Htqmd6bJQ/bjreqx+Xjlfo=;
        b=G/NboVRayJfPt/WGwRmdVp9+2XOqSjo0Gn/N6HIkK3iVQdRxBj9uRJwlbr1ue6m0j8
         8+Ot0aKtYiAeHB0RC0odBTEq5UfGTpRB3c+p+/fTPeq2K13Owsi6u5rIWY07I8esDtQa
         rq/qhjU5Ph1qmIWB0RzxJKpAC+63dtu/1/fnJ92RQsuAtSjDw0tffCmKuzOQhm93ZqH2
         Ph/6uikSXcYpSFzuKiL/QVjsCndpbeCjsgOywbHkHJDJuSwXXCFFUR7zxzriB7CaZhJB
         ghbqRYUKwCGitflXCB7knCbCuO8MZDT8anvPvK2JY+6jJH3TfBiL7ZODLAPNd1uEefmx
         3CWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775203873; x=1775808673;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HRjWOMqK4PAlflmzYTeO4Htqmd6bJQ/bjreqx+Xjlfo=;
        b=rzsjZbiX7g5MsHJDUQypIdbY/fGQae4XayYgoW5O6IIUkAWsjoBnhq35krEZGR39rU
         7c72qk7gbt2SpCEI+XMxdj1bhfBCmwtikbFYgidabogsdEezIu3sPws5jPUL5QfLk++Q
         NVi3qNADTqnjfkZN3+h1FAWygE25qvdKYvaQccBGGJ9sLNeKo3/LZX1dZAP+OfxAQqOh
         vCnR8XGhvQ6TvOLAjXNJI3Y5AWS3Svq9ByiIipt/k5FitK/uWhG0d6txfxQ9uYtcGCw5
         PZvVKfRLjNb3WMMeDo2NKx0ca/VPHxxHv8b4tMWGTIZzZM+EbD8EEwKNrZ0Oy3yc+C9N
         KjWg==
X-Forwarded-Encrypted: i=1; AJvYcCWo2RrcxGkV2yeBNj8g3FZh0/s9c88aKARHG9FwCPwgoriJflhK96mN8oQU8eZvRPXbFKwZHMNzwvU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOWRsN2nPZf9YUSsjgjnlAfSMldRKeJfWWlEA2C4Ygc16k7TtL
	8N0hKqQEGeWx5I5deUlabaiuP5U9xJ41+UAC5dZIW0svn0trhsWI8uZTaxVlXikjInqCSnVBMBC
	610muhD3xzdbAaYAB1j0UVw3k6nHEUTU0hmUHyIDqbA==
X-Gm-Gg: ATEYQzypsAGVlK/IOcJtHPtk+rBQGmTHztmuvbEuVhztAHSuTnDItynJO/9wFrfiVda
	CvxOsh8nWoxGO8yeJsY9iCln9hW3ufkICabCAI7XuV7A22Ex1nCbAehlEuaI7B2XFY0bnR52PvI
	KgObqxKJ2xi5Qg+THr62hbLcbU58RyCLkrh2e2H1xmV1xUCjXOvu7cJR5GgSbcqwyop/dy1NoEH
	lyywa+5udtgV3QIhMzOpWWKRfaOMMF9uyIYxMPA5+kS1u7xmtGtUuZgxeWJ5XbkmJSJ/wY6M+iv
	FtnbCy4/um6b2Ffwi4BRaqoPXM7EpgL+rkBBI9mEoCdUscwIJCXGQOz/iMY7apA3jlgPVJ+yzoq
	8OnqK0SpjhlLItWlB7zGINzSHDQ==
X-Received: by 2002:a05:6820:1b0e:b0:67c:1fc7:daa6 with SMTP id
 006d021491bc7-6821d23811emr1112989eaf.10.1775203873468; Fri, 03 Apr 2026
 01:11:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAAhSdy2CibJNXJYxCvyofXC3CUpCT5KdricNt2aViRSYCOWrrA@mail.gmail.com>
 <20260403070719.64284-1-fangyu.yu@linux.alibaba.com>
In-Reply-To: <20260403070719.64284-1-fangyu.yu@linux.alibaba.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 3 Apr 2026 13:41:02 +0530
X-Gm-Features: AQROBzAD30X1MIqnPsVPFD2GQtGyaDXu1bXGTiOYV05dRH1-FhidSwuL0L0jieE
Message-ID: <CAAhSdy08ZDHdXZJ0R6CpxGoKbMQ9c+FZrU0vW=iN6gq6A8BTBQ@mail.gmail.com>
Subject: Re: Re: Re: Re: [PATCH v7 4/4] RISC-V: KVM: add KVM_CAP_RISCV_SET_HGATP_MODE
To: fangyu.yu@linux.alibaba.com
Cc: alex@ghiti.fr, andrew.jones@oss.qualcomm.com, aou@eecs.berkeley.edu, 
	atish.patra@linux.dev, corbet@lwn.net, guoren@kernel.org, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	palmer@dabbelt.com, pbonzini@redhat.com, pjw@kernel.org, 
	radim.krcmar@oss.qualcomm.com, skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 3, 2026 at 12:37=E2=80=AFPM <fangyu.yu@linux.alibaba.com> wrote=
:
>
> >>
> >> >>On Thu, Apr 2, 2026 at 6:53=E2=80=AFPM <fangyu.yu@linux.alibaba.com>=
 wrote:
> >> >>>
> >> >>> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> >> >>>
> >> >>> Add a VM capability that allows userspace to select the G-stage pa=
ge table
> >> >>> format by setting HGATP.MODE on a per-VM basis.
> >> >>>
> >> >>> Userspace enables the capability via KVM_ENABLE_CAP, passing the r=
equested
> >> >>> HGATP.MODE in args[0]. The request is rejected with -EINVAL if the=
 mode is
> >> >>> not supported by the host, and with -EBUSY if the VM has already b=
een
> >> >>> committed (e.g. vCPUs have been created or any memslot is populate=
d).
> >> >>>
> >> >>> KVM_CHECK_EXTENSION(KVM_CAP_RISCV_SET_HGATP_MODE) returns a bitmas=
k of the
> >> >>> HGATP.MODE formats supported by the host.
> >> >>>
> >> >>> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> >> >>> Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
> >> >>> Reviewed-by: Guo Ren <guoren@kernel.org>
> >> >>> ---
> >> >>>  Documentation/virt/kvm/api.rst | 27 +++++++++++++++++++++++++++
> >> >>>  arch/riscv/kvm/vm.c            | 18 ++++++++++++++++--
> >> >>>  include/uapi/linux/kvm.h       |  1 +
> >> >>>  3 files changed, 44 insertions(+), 2 deletions(-)
> >> >>>
> >> >>> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/k=
vm/api.rst
> >> >>> index 032516783e96..9d7f6958fa81 100644
> >> >>> --- a/Documentation/virt/kvm/api.rst
> >> >>> +++ b/Documentation/virt/kvm/api.rst
> >> >>> @@ -8902,6 +8902,33 @@ helpful if user space wants to emulate inst=
ructions which are not
> >> >>>  This capability can be enabled dynamically even if VCPUs were alr=
eady
> >> >>>  created and are running.
> >> >>>
> >> >>> +7.47 KVM_CAP_RISCV_SET_HGATP_MODE
> >> >>> +---------------------------------
> >> >>> +
> >> >>> +:Architectures: riscv
> >> >>> +:Type: VM
> >> >>> +:Parameters: args[0] contains the requested HGATP mode
> >> >>> +:Returns:
> >> >>> +  - 0 on success.
> >> >>> +  - -EINVAL if args[0] is outside the range of HGATP modes suppor=
ted by the
> >> >>> +    hardware.
> >> >>> +  - -EBUSY if vCPUs have already been created for the VM, if the =
VM has any
> >> >>> +    non-empty memslots.
> >> >>> +
> >> >>> +This capability allows userspace to explicitly select the HGATP m=
ode for
> >> >>> +the VM. The selected mode must be supported by both KVM and hardw=
are. This
> >> >>> +capability must be enabled before creating any vCPUs or memslots.
> >> >>> +
> >> >>> +If this capability is not enabled, KVM will select the default HG=
ATP mode
> >> >>> +automatically. The default is the highest HGATP.MODE value suppor=
ted by
> >> >>> +hardware.
> >> >>> +
> >> >>> +``KVM_CHECK_EXTENSION(KVM_CAP_RISCV_SET_HGATP_MODE)`` returns a b=
itmask of
> >> >>> +HGATP.MODE values supported by the host. A return value of 0 indi=
cates that
> >> >>> +the capability is not supported. Supported-mode bitmask use HGATP=
.MODE
> >> >>> +encodings as defined by the RISC-V privileged specification, such=
 as Sv39x4
> >> >>> +corresponds to HGATP.MODE=3D8, so userspace should test bitmask &=
 BIT(8).
> >> >>> +
> >> >>>  8. Other capabilities.
> >> >>>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> >> >>>
> >> >>> diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
> >> >>> index 4d82a886102c..5e82a3ad3ad0 100644
> >> >>> --- a/arch/riscv/kvm/vm.c
> >> >>> +++ b/arch/riscv/kvm/vm.c
> >> >>> @@ -201,6 +201,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *k=
vm, long ext)
> >> >>>         case KVM_CAP_VM_GPA_BITS:
> >> >>>                 r =3D kvm_riscv_gstage_gpa_bits(kvm->arch.pgd_leve=
ls);
> >> >>>                 break;
> >> >>> +       case KVM_CAP_RISCV_SET_HGATP_MODE:
> >> >>> +               r =3D kvm_riscv_get_hgatp_mode_mask();
> >> >>> +               break;
> >> >>
> >> >>Introducing a new RISC-V capability looks a bit complex.
> >> >>Instead of KVM_CAP_RISCV_SET_HGATP_MODE, we can
> >> >>simply re-use KVM_CAP_VM_GPA_BITS.
> >> >>
> >> >>The kvm_vm_ioctl_check_extension() for KVM_CAP_VM_GPA_BITS
> >> >>return number of GPA bits which in-directly implies the underlying
> >> >>hgatp.MODE. As we know, if it return 59 bits GPA then it means
> >> >>Sv57x4 is the selected hgatp.MODE and Sv48x4 and Sv39x4 modes
> >> >>are also supported as-per RISC-V privileged specification.
> >> >>
> >> >>The kvm_vm_ioctl_enable_cap() for KVM_CAP_VM_GPA_BITS
> >> >>will take the desired number of GPA bits and downsize the selected
> >> >>hgatp.MODE. For example, if user-space ask GPA bits <=3D 50 and
> >> >>GPA bits > 41 then we select Sv48x4. If user-space ask GPA
> >> >>bits <=3D 41 then we select Sv39x4. If user-space ask GPA bits <=3D =
59
> >> >>and GPA bits > 50 then we select Sv57x4.
> >> >>
> >> >
> >> >Thanks, that makes sense.
> >> >
> >> >In v8 I=E2=80=99ll drop KVM_CAP_RISCV_SET_HGATP_MODE and re-use KVM_C=
AP_VM_GPA_BITS
> >> >for both discovery and selection.
> >> >
> >>
> >> Hi Anup,
> >>
> >> While working on the respin reusing KVM_CAP_VM_GPA_BITS, I realized
> >> a potential ambiguity in CHECK_EXTENSION semantics and wanted to confi=
rm the
> >> intended ABI before posting v8.
> >>
> >> One concern about the semantics: today KVM_CHECK_EXTENSION(KVM_CAP_VM_=
GPA_BITS)
> >> on a VM fd may be interpreted as =E2=80=9Cthe GPA bits for this VM=E2=
=80=9D (or at least what
> >> this VM can use). If we also use KVM_ENABLE_CAP(KVM_CAP_VM_GPA_BITS) t=
o downsize
> >> the selected HGATP.MODE for a particular VM (e.g. to Sv48x4 =3D> 50 bi=
ts), then a
> >> subsequent CHECK_EXTENSION(KVM_CAP_VM_GPA_BITS) on the same VM fd woul=
d return 50.
> >> Userspace might then assume 50 is the maximum supported by that VM/hos=
t and lose
> >> the information that the host actually supports 59 (Sv57x4).
> >
> >I think there is no violation of the semantics because we are providing
> >a way to allow KVM user space change "the GPA bits for this VM=E2=80=9D
> >using KVM_ENABLE_CAP(KVM_CAP_VM_GPA_BITS) so subsequent
> >CHECK_EXTENSION(KVM_CAP_VM_GPA_BITS) must return
> >effective number of GPA bits visible to the VM.
>
> Thanks, agreed.
>
> >The only additional constraint I would enforce is that the
> >KVM_ENABLE_CAP(KVM_CAP_VM_GPA_BITS) must
> >return -EBUSY if any of the Guest VCPUs have
> >ran_atleast_once set.
> >
>
> In my current implementation I already return -EBUSY if kvm->created_vcpu=
s
> is non-zero, i.e. the GPA bits can only be changed before any vCPU is cre=
ated.

Checking kvm->created_vcpus is perfectly fine so no need to change this.

Regards,
Anup

>
> Thanks,
> Fangyu
>
> >Regards,
> >Anup
> >
> >>
> >> Thanks,
> >> Fangyu
> >>
> >> >Thanks,
> >> >Fangyu
> >> >
> >> >>>         default:
> >> >>>                 r =3D 0;
> >> >>>                 break;
> >> >>> @@ -211,12 +214,23 @@ int kvm_vm_ioctl_check_extension(struct kvm =
*kvm, long ext)
> >> >>>
> >> >>>  int kvm_vm_ioctl_enable_cap(struct kvm *kvm, struct kvm_enable_ca=
p *cap)
> >> >>>  {
> >> >>> +       if (cap->flags)
> >> >>> +               return -EINVAL;
> >> >>> +
> >> >>>         switch (cap->cap) {
> >> >>>         case KVM_CAP_RISCV_MP_STATE_RESET:
> >> >>> -               if (cap->flags)
> >> >>> -                       return -EINVAL;
> >> >>>                 kvm->arch.mp_state_reset =3D true;
> >> >>>                 return 0;
> >> >>> +       case KVM_CAP_RISCV_SET_HGATP_MODE:
> >> >>> +               if (!kvm_riscv_hgatp_mode_is_valid(cap->args[0]))
> >> >>> +                       return -EINVAL;
> >> >>> +
> >> >>> +               if (kvm->created_vcpus || !kvm_are_all_memslots_em=
pty(kvm))
> >> >>> +                       return -EBUSY;
> >> >>> +#ifdef CONFIG_64BIT
> >> >>> +               kvm->arch.pgd_levels =3D 3 + cap->args[0] - HGATP_=
MODE_SV39X4;
> >> >>> +#endif
> >> >>> +               return 0;
> >> >>>         default:
> >> >>>                 return -EINVAL;
> >> >>>         }
> >> >>> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> >> >>> index 80364d4dbebb..a74a80fd4046 100644
> >> >>> --- a/include/uapi/linux/kvm.h
> >> >>> +++ b/include/uapi/linux/kvm.h
> >> >>> @@ -989,6 +989,7 @@ struct kvm_enable_cap {
> >> >>>  #define KVM_CAP_ARM_SEA_TO_USER 245
> >> >>>  #define KVM_CAP_S390_USER_OPEREXEC 246
> >> >>>  #define KVM_CAP_S390_KEYOP 247
> >> >>> +#define KVM_CAP_RISCV_SET_HGATP_MODE 248
> >> >>>
> >> >>>  struct kvm_irq_routing_irqchip {
> >> >>>         __u32 irqchip;
> >> >>> --
> >> >>> 2.50.1
> >> >>>
> >> >>
> >> >>Regards,
> >> >>Anup
> >
