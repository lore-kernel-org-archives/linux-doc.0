Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49003D47C6
	for <linux-doc@vger.kernel.org>; Fri,  3 Apr 2026 20:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775247573; cv=pass; b=tRJFvy5Sm0K8BajDi3winrJ6mFbjfkip5lnMMZdqrrdEjukGLD2XPgoMHotOz7BUnlKKna4HEDfRiZtk3cqTFgYtoPr6D6b1UWcxn+/kgS9co0prWOD4QRiC1Sy9UorG6FkBLVs2xsum8WGhr0UamDwL3hRTAE4UWDPTUkNjAQY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775247573; c=relaxed/simple;
	bh=aWs+wbzB0GD25tebd4FwDmf5Dg3ElXT3opxb3THYiXw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sVm9Dms+xcLSVW5hsYokYNHV21DBop7ASoJ4uLzj7kfho7HfKY+NsDhXFQ3H3tf0mylgw6WOhw9jGeJh/EebWCSIoyuFa01/PZloAhsh7kOG15dTZw5mQKDeJxz/iPbF6GBdxPyw30/dLujFv8Idm4tVlZjmZv5lMDnQUfAYgBM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lMITC7ng; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lMITC7ng"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-66baa7fdfd3so10430a12.1
        for <linux-doc@vger.kernel.org>; Fri, 03 Apr 2026 13:19:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775247570; cv=none;
        d=google.com; s=arc-20240605;
        b=ZkpzgHzHr+BkpAnMQV4NqXr/2ZU7aM3iHctt2lXlO2xBwcGJPsreuMSeR4GugaO1m1
         PUS/3klSETEPY3975fB13P9CSYYjIYG04AMOLiV+MRY90x7/CVLal3RR156AYdSXzM0p
         ezhPRya71+Ku7EoP/cK03tedHL54iUyRre/Ey32HsdVEIDPDN1GA3VwDmgXSVfuKbsVP
         dcB7C+MPaILDEfGvGrP0+Z8WoEg1QPY6RTnceeNAbqryD1ow4gTgyqSlCGXKlp2xX1hk
         aVXTh7N7FkQzo3UVytNYwHkanwhVqQGMhfkTy6LlvKxy1TLyLA7AmY2kK8qXJr760AWh
         u+nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9idyuVEhOac6q8zDvEM+VotLSRRsMcPfEh8o3j5eQSY=;
        fh=OuPeuhM4I5pFjjxUpYfO4UiZDkUuquBH6XinbA/LeT8=;
        b=M3qiapvJZ69De9t4enLECv7idCT6uDReVyuCWSszUYnOOCfgjs1xkhyljShBQthAhb
         gxNWBImOm6SRp/KaVMRpqmJGRNK+3KVZJGyQQFj0legP3TS9hGCcT5LdDm6qmD04yEpR
         UsqqjS+JeX7bnhT8AuvfSo2FWTr/xoXQkq/1cCxD6toatvW6+lKbj2REB35T1+fST8jC
         cAqpx1acuVA2CAKaFNuJVsKKBpthCyTvMrbngnAmLm/gR8IsWg6iNEtFJxUa9qag54Ij
         wmQiOiJ4igs9GQcJsPaNE8NReFIx2XzXAOpK3s48L3sVN+tguvaGrAX2YQ8gYsnHvV59
         J3LQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775247570; x=1775852370; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9idyuVEhOac6q8zDvEM+VotLSRRsMcPfEh8o3j5eQSY=;
        b=lMITC7ngnCxJn7Eoyngp9Eu7a6i11eeqAZgeB/czbkMFntTjkZE9q170y4WUBaN7gq
         7kssQ5e1DV4WdyFB8KfpYhMLOkDt6XeWzwmY6N0gZ9UUmbM5OfL+bdb9JKEnTZilQD4J
         o1bsb/cYoQ/tfXybIMPETAvO3PFBnOtJ9hZ0qlPvOrn/1LMjGhjfFgSc/gHtoHbVSbYX
         XPuWj3zXeTseCbQFGd6If+9VEporzDotAqlzDpFH0x/rYN7Q/KbbHhUZn2CFNp/+3o3z
         81a9Po8PsTgBoiPwZGC9yv5VtOZBN/mIuicvNRDSYJ7aaqYTVzIbLvedrfiTPSt/V5j+
         vfKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775247570; x=1775852370;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9idyuVEhOac6q8zDvEM+VotLSRRsMcPfEh8o3j5eQSY=;
        b=MrU3cldNJE2YdTQF3NdTJXXJpgeKJ4YhpttgMOcsPM1AZqfqWvZjEs6z5rLFaVOXap
         jkNmeGgdg49z3dODlT/8wnaYvHse+o83xZ1G5D8Rn41CS9YchPEp9ZLlYAiXVrhCIExd
         oFBEg44WChRpAFhe+SnYpcYedR8eto5Ybxk6vl+1T7ViyX5xvDJp4J+6SeYDbbiKGGvQ
         ckJ6R04kRwu8x7cG+XR3tQFysmVNlEWLqYk0KTboGhgxLla0AeYVCgQzw1k2ybIw37DU
         0XUQ7zjQa/zAKMSWSK79Q2pZiL9MSsYUlKu+FRb/cH6yEMiyoea1LagSmr80ClO+yM1x
         71cQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsr9w26Sc+mj7lqyPEFY09pE7euCT3pJfeXX2Ajn+ErNY1mHOhoIXFltiB89K+PYzYqy8NHePjdyQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyICwWHPr8S/ITI/upyoOtvkyyxujKGan4O/WpiMMwHmCdrcDNa
	OeioWeGaRiTWBI43JsYn5NO/GlCCVYYmqXnH7RkK/LiqRBvu1TZ5c2Acvk8hrGMp9mWbAHRtT0P
	X0f/gS6z9F4Iz72TTah+ngjPI/dSRRAhz4AtBvp4E
X-Gm-Gg: AeBDiet5zaL2c183QZ3PkxP0WI78ge+D10Cl0IfHmGiciF7ar7F9vJsRyhDxluHCmZw
	SYd7bK3JgWc7Ro2mrKRHtYULm1VrSXauB3WF/z0lYsWqi6vlBFb+vnbfeDb7Le6A0msVFpw5bIE
	cX6b8qDtKmkO7480sk6whYddYCFqgoBeaBofDThmzFaGsuGXzzq6zxaRQ98HuwzO0zztTrK7p8h
	enm+pqGnaloD8leH52Z7VZqchZZvkRKt6VlnG3+Uedmpl4tMH2HnfK8UOgh981NSFiKZRTVVhWO
	MYp/WY0=
X-Received: by 2002:a05:6402:20d5:10b0:660:efc9:900a with SMTP id
 4fb4d7f45d1cf-66e432e10demr28487a12.10.1775247569545; Fri, 03 Apr 2026
 13:19:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260402-vmscape-bhb-v9-0-94d16bc29774@linux.intel.com>
 <20260402-vmscape-bhb-v9-2-94d16bc29774@linux.intel.com> <CALMp9eSLVvr00mJ0J2f2_SPeCW-VS58kxMcxHgUW6etML+_+QA@mail.gmail.com>
 <20260403185236.sjgetnkha3o3a4d3@desk>
In-Reply-To: <20260403185236.sjgetnkha3o3a4d3@desk>
From: Jim Mattson <jmattson@google.com>
Date: Fri, 3 Apr 2026 13:19:17 -0700
X-Gm-Features: AQROBzBN2T9-HOthaRcY0Ldmz0x4J6ZHvMaPV916MYhPQfL9BOlln2WWIsxXzW8
Message-ID: <CALMp9eSPkMpKQELTnsaj6=gXD+EyE0n2_p93n4maDc93bPFe+w@mail.gmail.com>
Subject: Re: [PATCH v9 02/10] x86/bhi: Make clear_bhb_loop() effective on
 newer CPUs
To: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Cc: x86@kernel.org, Jon Kohler <jon@nutanix.com>, Nikolay Borisov <nik.borisov@suse.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Josh Poimboeuf <jpoimboe@kernel.org>, David Kaplan <david.kaplan@amd.com>, 
	Sean Christopherson <seanjc@google.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Peter Zijlstra <peterz@infradead.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, KP Singh <kpsingh@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, David Laight <david.laight.linux@gmail.com>, 
	Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	David Ahern <dsahern@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Asit Mallick <asit.k.mallick@intel.com>, Tao Zhang <tao1.zhang@intel.com>, bpf@vger.kernel.org, 
	netdev@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 3, 2026 at 11:52=E2=80=AFAM Pawan Gupta
<pawan.kumar.gupta@linux.intel.com> wrote:
>
> On Fri, Apr 03, 2026 at 11:10:08AM -0700, Jim Mattson wrote:
> > On Thu, Apr 2, 2026 at 5:32=E2=80=AFPM Pawan Gupta
> > <pawan.kumar.gupta@linux.intel.com> wrote:
> > >
> > > As a mitigation for BHI, clear_bhb_loop() executes branches that over=
write
> > > the Branch History Buffer (BHB). On Alder Lake and newer parts this
> > > sequence is not sufficient because it doesn't clear enough entries. T=
his
> > > was not an issue because these CPUs use the BHI_DIS_S hardware mitiga=
tion
> > > in the kernel.
> > >
> > > Now with VMSCAPE (BHI variant) it is also required to isolate branch
> > > history between guests and userspace. Since BHI_DIS_S only protects t=
he
> > > kernel, the newer CPUs also use IBPB.
> > >
> > > A cheaper alternative to the current IBPB mitigation is clear_bhb_loo=
p().
> > > But it currently does not clear enough BHB entries to be effective on=
 newer
> > > CPUs with larger BHB. At boot, dynamically set the loop count of
> > > clear_bhb_loop() such that it is effective on newer CPUs too. Use the
> > > X86_FEATURE_BHI_CTRL feature flag to select the appropriate loop coun=
t.
> > >
> > > Suggested-by: Dave Hansen <dave.hansen@linux.intel.com>
> > > Signed-off-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
> > > ---
> > >  arch/x86/entry/entry_64.S            |  8 +++++---
> > >  arch/x86/include/asm/nospec-branch.h |  2 ++
> > >  arch/x86/kernel/cpu/bugs.c           | 13 +++++++++++++
> > >  3 files changed, 20 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/arch/x86/entry/entry_64.S b/arch/x86/entry/entry_64.S
> > > index 3a180a36ca0e..bbd4b1c7ec04 100644
> > > --- a/arch/x86/entry/entry_64.S
> > > +++ b/arch/x86/entry/entry_64.S
> > > @@ -1536,7 +1536,9 @@ SYM_FUNC_START(clear_bhb_loop)
> > >         ANNOTATE_NOENDBR
> > >         push    %rbp
> > >         mov     %rsp, %rbp
> > > -       movl    $5, %ecx
> > > +
> > > +       movzbl    bhb_seq_outer_loop(%rip), %ecx
> > > +
> > >         ANNOTATE_INTRA_FUNCTION_CALL
> > >         call    1f
> > >         jmp     5f
> > > @@ -1556,8 +1558,8 @@ SYM_FUNC_START(clear_bhb_loop)
> > >          * This should be ideally be: .skip 32 - (.Lret2 - 2f), 0xcc
> > >          * but some Clang versions (e.g. 18) don't like this.
> > >          */
> > > -       .skip 32 - 18, 0xcc
> > > -2:     movl    $5, %eax
> > > +       .skip 32 - 20, 0xcc
> > > +2:     movzbl  bhb_seq_inner_loop(%rip), %eax
> > >  3:     jmp     4f
> > >         nop
> > >  4:     sub     $1, %eax
> > > diff --git a/arch/x86/include/asm/nospec-branch.h b/arch/x86/include/=
asm/nospec-branch.h
> > > index 70b377fcbc1c..87b83ae7c97f 100644
> > > --- a/arch/x86/include/asm/nospec-branch.h
> > > +++ b/arch/x86/include/asm/nospec-branch.h
> > > @@ -548,6 +548,8 @@ DECLARE_PER_CPU(u64, x86_spec_ctrl_current);
> > >  extern void update_spec_ctrl_cond(u64 val);
> > >  extern u64 spec_ctrl_current(void);
> > >
> > > +extern u8 bhb_seq_inner_loop, bhb_seq_outer_loop;
> > > +
> > >  /*
> > >   * With retpoline, we must use IBRS to restrict branch prediction
> > >   * before calling into firmware.
> > > diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
> > > index 83f51cab0b1e..2cb4a96247d8 100644
> > > --- a/arch/x86/kernel/cpu/bugs.c
> > > +++ b/arch/x86/kernel/cpu/bugs.c
> > > @@ -2047,6 +2047,10 @@ enum bhi_mitigations {
> > >  static enum bhi_mitigations bhi_mitigation __ro_after_init =3D
> > >         IS_ENABLED(CONFIG_MITIGATION_SPECTRE_BHI) ? BHI_MITIGATION_AU=
TO : BHI_MITIGATION_OFF;
> > >
> > > +/* Default to short BHB sequence values */
> > > +u8 bhb_seq_outer_loop __ro_after_init =3D 5;
> > > +u8 bhb_seq_inner_loop __ro_after_init =3D 5;
> > > +
> > >  static int __init spectre_bhi_parse_cmdline(char *str)
> > >  {
> > >         if (!str)
> > > @@ -3242,6 +3246,15 @@ void __init cpu_select_mitigations(void)
> > >                 x86_spec_ctrl_base &=3D ~SPEC_CTRL_MITIGATIONS_MASK;
> > >         }
> > >
> > > +       /*
> > > +        * Switch to long BHB clear sequence on newer CPUs (with BHI_=
CTRL
> > > +        * support), see Intel's BHI guidance.
> > > +        */
> > > +       if (cpu_feature_enabled(X86_FEATURE_BHI_CTRL)) {
> > > +               bhb_seq_outer_loop =3D 12;
> > > +               bhb_seq_inner_loop =3D 7;
> > > +       }
> > > +
> >
> > How does this work for VMs in a heterogeneous migration pool that
> > spans the Alder Lake boundary? They can't advertise BHI_CTRL, because
> > it isn't available on all hosts in the migration pool, but they need
> > the long sequence when running on Alder Lake or newer.
>
> As we discussed elsewhere, support for migration pool is much more
> involved. It should be dealt in a separate QEMU/KVM focused series.
>
> A quickfix could be adding support for spectre_bhi=3Dlong that guests in =
a
> migration pool can use?

The simplest solution is to add "|
cpu_feature_enabled(X86_FEATURE_HYPERVISOR)" to the condition above.
If that is unacceptable for the performance of pre-Alder Lake
migration pools, you could define a CPUID or MSR bit that says
explicitly, "long BHB flush sequence needed," rather than trying to
intuit that property from the presence of BHI_CTRL. Like
IA32_ARCH_CAPABILITIES.SKIP_L1DFL_VMENTRY, the bit would only be set
by a hypervisor.

I am still skeptical of the need for MSR_VIRTUAL_ENUMERATION and
friends, unless there is a major guest OS out there that relies on
them.
