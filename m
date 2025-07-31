Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2481DDA32
	for <linux-doc@vger.kernel.org>; Thu, 31 Jul 2025 21:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753995984; cv=none; b=MapzlhNpyuvHc+DJTCkj7+FT8tM226i4Hd0SzQxcgV/DLsGDn2l3zAUpdQSoMhFUARTJjJCE1GVWbTfwrYIVgOgXO2/dOnxdhoBgML7K7oyn9td5okoGEeA+oxecdS2Jtbnv70Lq/OU6CH1QycB6sT0MIv8/Nf6N0VrIA7bQI+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753995984; c=relaxed/simple;
	bh=u97scRes2MGBfyHL/4/UXMUX5BojdNBN6SMyZI+xTbo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fRyIUk+Yr/QVnTuF9Vsxj/IEuXggRXIuInwh93yE6OEnf62aip8kSZkcYKYwiz4wwc4wyLL8GbeLvf3I9JeqrdhmqBMKzXY1+zUy9ikTKQeYlqNrNCuPaeeD32Sx7eg50wkHss2FdBNb/u2Se+dl19y6kIwqsM+KNpbyuO63lYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=e5wJVcIl; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="e5wJVcIl"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-455b63bfa52so15875e9.0
        for <linux-doc@vger.kernel.org>; Thu, 31 Jul 2025 14:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753995980; x=1754600780; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hgWYvBUZsAdFKPaveOzEc3d+WOgwdbiYYocXO60wkYI=;
        b=e5wJVcIlnqyEU9iojPSUpGq0yrpbhIkqeu11w5ZiDC0isxzvwV5lf/7WbVTaaJB1mm
         NWZaUnOuGpD0seumsuC0Y5HXw6jAFx8b5Bj9H1VTxqH0Eh/uqGZGADeAudjVOnBAbFVi
         FNs3S510j9+1HlJ/81l5pFRszZfI2F2IiRj+uaELgwo5cFd+iMAGpKaftXqy34Fr/gOr
         yw3JmKsIH4Sy77ThNg+NvqT9+PY4nPTBbhrxF36KKZ/kdtRB1EvnXRMXH3/1It8kcuex
         gL4tGlbOEYJwEIKBRKGyQrU0FI/tM9TYCSztLyfRyA+NF4g5M2YIlfZtdlGxapqyyB98
         BGuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753995980; x=1754600780;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hgWYvBUZsAdFKPaveOzEc3d+WOgwdbiYYocXO60wkYI=;
        b=QLxGc9zPtgzQeu4TRWZxj6L8ZvI3+3dESHPbq3b7F45WEAK/4qbvtaD3P5dv0LBGMw
         +ajzjP3CoHeUHURlHgn9AJ7WWLeQ3MfsZe9E/YEU4VXbWV4zrfEqtqatYuVrsn4yPolK
         SE+acIxRqQX1s6+qiQw5d1Pz/oEBOPYVgd7g1V49uP+tI9DtENM52cVot8eLVZVSqXQO
         cNy3/3FYrOKTGJ/Do/Xwq4kbgcIiHyCmsi6Ic3MGukXzQr/pFwFgLYUlGex8aPjtBApP
         V1xGYVb+fQ9r9gUYx29wELhiMMqtddaPzRY1E8yY15Tl4GwfTQ2caoYRK2XdZ0hMXWFh
         IaJA==
X-Forwarded-Encrypted: i=1; AJvYcCU9vbpe+37mWP43MXMH42+6GGEXJ20TXX5Uy+az5CtoFSjpEXBWQKkXNsCxBz/N1kbJ6EZYdCV2zpw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4d9iaN9LeGv2LFlI8b4UxEcSfSeu53Mgoa62TW6S6f8WYHnin
	/Jj6Z4zuIxOmnNTMn2YUnx1noGVJIbpoV7sFRUjnRVln4kpyPnfCYhkXRvd0EP10YzYSaPK+x7B
	rvqpKZBza5NTnpiQmKkSI+n3+x/rI7Vq95Lk0AXq2
X-Gm-Gg: ASbGncvv19K7UXFrRdl9jJIJKCIaq8DrBpzjtcm6rzx8GghdNRfbZVeqHoEVrTeswZI
	5KiiU9ni22R5aPmIAIDsZsEtL0+hPtJnfh+7+4OV+5VkdaQCFsrhI15A0LAQUKnjkp37PwkBxjy
	AXCZ/9ZaXzcDEuOJnMHbNKB97RKHg6/6aaPX9p5oqYs2iPX0EI7FWDR48U3tmDJMNE5kIboK4kf
	Nq7KA//g5hnQP4rmmdjIKczPwkCUvTWIvU2Sw==
X-Google-Smtp-Source: AGHT+IFm3eKGXrXl/O/AM6upHGvXxmGw78o++n3la/oaRAWXtoLaY8AnkOKammwFhld3+mfKolmNlEirM7qsdbyTR+8=
X-Received: by 2002:a05:600c:524d:b0:456:e94:466c with SMTP id
 5b1f17b1804b1-458aa0ceb0fmr65675e9.3.1753995979762; Thu, 31 Jul 2025 14:06:19
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250604050902.3944054-1-jiaqiyan@google.com> <20250604050902.3944054-2-jiaqiyan@google.com>
 <aHFohmTb9qR_JG1E@linux.dev> <CACw3F509B=AHhpaTcuH9O851rrDdHh1baC8uRYy7bDa7BSMhgg@mail.gmail.com>
 <aHK-DPufhLy5Dtuk@linux.dev> <CACw3F53TYZ1KFv0Yc-GCyOxn7TF3iYjTNSE8bd3nte=KaCN0UQ@mail.gmail.com>
 <CACw3F50Q_G75wf2rBm-P-NkyyO72i1NKqR9se99QrgipfD62yg@mail.gmail.com> <aIk88sBA2eIEF7w-@linux.dev>
In-Reply-To: <aIk88sBA2eIEF7w-@linux.dev>
From: Jiaqi Yan <jiaqiyan@google.com>
Date: Thu, 31 Jul 2025 14:06:07 -0700
X-Gm-Features: Ac12FXzFKc2B2EcyGnO8u_UvWK78u_LF9_nWfSQdCWk4Auknl3BBza84szmbGVs
Message-ID: <CACw3F504DbPhnN5MyBq4XES-=Te3Z4Xxqfkpifiu1DEgO3tUyg@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] KVM: arm64: VM exit to userspace to handle SEA
To: Oliver Upton <oliver.upton@linux.dev>
Cc: maz@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	pbonzini@redhat.com, corbet@lwn.net, shuah@kernel.org, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, duenwen@google.com, rananta@google.com, 
	jthoughton@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 29, 2025 at 2:28=E2=80=AFPM Oliver Upton <oliver.upton@linux.de=
v> wrote:
>
> On Fri, Jul 25, 2025 at 03:54:10PM -0700, Jiaqi Yan wrote:
> > On Sat, Jul 19, 2025 at 2:24=E2=80=AFPM Jiaqi Yan <jiaqiyan@google.com>=
 wrote:
> > >
> > > On Sat, Jul 12, 2025 at 12:57=E2=80=AFPM Oliver Upton <oliver.upton@l=
inux.dev> wrote:
> > > >
> > > > On Fri, Jul 11, 2025 at 04:59:11PM -0700, Jiaqi Yan wrote:
> > > > > >  - Add some detail about FEAT_RAS where we may still exit to us=
erspace
> > > > > >    for host-controlled memory, as we cannot differentiate betwe=
en a
> > > > > >    stage-1 or stage-2 TTW SEA when taken on the descriptor PA
> > > > >
> > > > > Ah, IIUC, you are saying even if the FSC code tells fault is on T=
TW
> > > > > (esr_fsc_is_secc_ttw or esr_fsc_is_sea_ttw), it can either be gue=
st
> > > > > stage-1's or stage-2's descriptor PA, and we can tell which from
> > > > > which.
> > > > >
> > > > > However, if ESR_ELx_S1PTW is set, we can tell this is a sub-case =
of
> > > > > stage-2 descriptor PA, their usage is for stage-1 PTW but they ar=
e
> > > > > stage-2 memory.
> > > > >
> > > > > Is my current understanding right?
> > > >
> > > > Yep, that's exactly what I'm getting at. As you note, stage-2 abort=
s
> > > > during a stage-1 walk are sufficiently described, but not much else=
.
> > >
> > > Got it, thanks!
> > >
> > > >
> > > > > > +/*
> > > > > > + * Returns true if the SEA should be handled locally within KV=
M if the abort is
> > > > > > + * caused by a kernel memory allocation (e.g. stage-2 table me=
mory).
> > > > > > + */
> > > > > > +static bool host_owns_sea(struct kvm_vcpu *vcpu, u64 esr)
> > > > > > +{
> > > > > > +       /*
> > > > > > +        * Without FEAT_RAS HCR_EL2.TEA is RES0, meaning any ex=
ternal abort
> > > > > > +        * taken from a guest EL to EL2 is due to a host-impose=
d access (e.g.
> > > > > > +        * stage-2 PTW).
> > > > > > +        */
> > > > > > +       if (!cpus_have_final_cap(ARM64_HAS_RAS_EXTN))
> > > > > > +               return true;
> > > > > > +
> > > > > > +       /* KVM owns the VNCR when the vCPU isn't in a nested co=
ntext. */
> > > > > > +       if (is_hyp_ctxt(vcpu) && (esr & ESR_ELx_VNCR))
> > > > > > +               return true;
> > > > > > +
> > > > > > +       /*
> > > > > > +        * Determining if an external abort during a table walk=
 happened at
> > > > > > +        * stage-2 is only possible with S1PTW is set. Otherwis=
e, since KVM
> > > > > > +        * sets HCR_EL2.TEA, SEAs due to a stage-1 walk (i.e. a=
ccessing the PA
> > > > > > +        * of the stage-1 descriptor) can reach here and are re=
ported with a
> > > > > > +        * TTW ESR value.
> > > > > > +        */
> > > > > > +       return esr_fsc_is_sea_ttw(esr) && (esr & ESR_ELx_S1PTW)=
;
> > > > >
> > > > > Should we include esr_fsc_is_secc_ttw? like
> > > > >   (esr_fsc_is_sea_ttw(esr) || esr_fsc_is_secc_ttw(esr)) && (esr &=
 ESR_ELx_S1PTW)
> > > >
> > > > Parity / ECC errors are not permitted if FEAT_RAS is implemented (w=
hich
> > > > is tested for up front).
> > >
> > > Ah, thanks for pointing this out.
> > >
> > > >
> > > > > > +}
> > > > > > +
> > > > > >  int kvm_handle_guest_sea(struct kvm_vcpu *vcpu)
> > > > > >  {
> > > > > > +       u64 esr =3D kvm_vcpu_get_esr(vcpu);
> > > > > > +       struct kvm_run *run =3D vcpu->run;
> > > > > > +       struct kvm *kvm =3D vcpu->kvm;
> > > > > > +       u64 esr_mask =3D ESR_ELx_EC_MASK  |
> > > > > > +                      ESR_ELx_FnV      |
> > > > > > +                      ESR_ELx_EA       |
> > > > > > +                      ESR_ELx_CM       |
> > > > > > +                      ESR_ELx_WNR      |
> > > > > > +                      ESR_ELx_FSC;
> > > > >
> > > > > Do you (and why) exclude ESR_ELx_IL on purpose?
> > > >
> > > > Unintended :)
> > >
> > > Will add into my patch.
> > >
> > > >
> > > > > BTW, if my previous statement about TTW SEA is correct, then I al=
so
> > > > > understand why we need to explicitly exclude ESR_ELx_S1PTW.
> > > >
> > > > Right, we shouldn't be exposing genuine stage-2 external aborts to =
userspace.
> > > >
> > > > > > +       u64 ipa;
> > > > > > +
> > > > > > +
> > > > > >         /*
> > > > > >          * Give APEI the opportunity to claim the abort before =
handling it
> > > > > >          * within KVM. apei_claim_sea() expects to be called wi=
th IRQs
> > > > > > @@ -1824,7 +1864,32 @@ int kvm_handle_guest_sea(struct kvm_vcpu=
 *vcpu)
> > > > > >         if (apei_claim_sea(NULL) =3D=3D 0)
> > > > >
> > > > > I assume kvm should still lockdep_assert_irqs_enabled(), right? T=
hat
> > > > > is, a WARN_ON_ONCE is still useful in case?
> > > >
> > > > Ah, this is diffed against my VNCR prefix which has this context. Y=
es, I
> > > > want to preserve the lockdep assertion.
> > >
> > > Thanks for sharing the patch! Should I wait for you to send and queue
> > > to kvmarm/next and rebase my v3 to it? Or should I insert it into my
> > > v3 patch series with you as the commit author, and Signed-off-by you?
> >
> > Friendly ping for this question, my v3 is ready but want to confirm
> > the best option here.
> >
> > Recently we found even the newer ARM64 platforms used by our org has
> > to rely on KVM to more gracefully handle SEA (lacking support from
> > APEI), so we would really want to work with upstream to lock down the
> > proposed approach/UAPI asap.
>
> Posted the VNCR fix which I plan on taking in 6.17. Feel free to rebase
> your work on top of kvmarm-6.17 or -rc1 when it comes out.

Thanks Oliver! I sent out v3 based on the VNCR fix here on top of the
current kvmarm/next.

>
> https://lore.kernel.org/kvmarm/20250729182342.3281742-1-oliver.upton@linu=
x.dev/
>
> Thanks,
> Oliver
