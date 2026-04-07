Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5759333CEA8
	for <linux-doc@vger.kernel.org>; Tue,  7 Apr 2026 17:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775581232; cv=none; b=IODFHRT3DZD1ki4nhw2Kd8uKOcAIuXk5BTC5f9FixC5SqigMCBIvmB+lf16YEpbI12MoY2hxWBkYex8HA1zIFvANIMgKogBIn69mZwwcujmA6be1j+Cu2WWxj1bpi5qA+Qpx+9//sDygw6Bz8PJ1HbzsmHxX+UcDwgleRKCzkKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775581232; c=relaxed/simple;
	bh=JjSdknm0S3YYBOu9U1pjaX4G5IiGL313LgGv/lJR65I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=o0DWTaZVZ8lUf6gcE3bzmkrT2BOyVmcAJSa0VvXNysn6yEvlTIrEMqNFDaMrKN9qU9+ylRhyNbAQP0BJGAUePLKFJi75nmyEsV9D57yY++DyFC85UBqzVF9qh0iYNRoMQv930uzxfezEKtYJcIxsTOgzE1Sd6gCWjr2z2HBufR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tM/jPvHo; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tM/jPvHo"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2b0bf2b3879so138891675ad.1
        for <linux-doc@vger.kernel.org>; Tue, 07 Apr 2026 10:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775581230; x=1776186030; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EzLNJzXI8gpsV/hueQ4RCy5wIqqrzS2Y7L8EbLV9C3I=;
        b=tM/jPvHoKQRAtsQ0Axp7DSx5fQUUUmwntP1G5f/5WcyqCYEiQnbQkm+SrBTlr5T4Cn
         iiqrEa8hY7Sntvv6EkbNPNhEkaBNRcGkU3chDMDlSzfLP10ZI3H4aCP1eGCBTUwBzYuz
         puWRuEwg1E3gK59KB/U8611D8q1d1faU1G9vlFBwFgxHXE/qXOH7yI4Ti76lrW2Aaw2w
         2ZRWwl5/MT2Rtrki/mSEGwreRgHDtxkN0IvOqsEC7eoXxN8+pJsK97P7BM7kRCqqBYhJ
         AnMgu07V9T93u0t0OcYME6rdULgLehTgtGuwG4KuoEObWhVlIfm5ED6g36bVjUjNRKxC
         aoyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775581230; x=1776186030;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EzLNJzXI8gpsV/hueQ4RCy5wIqqrzS2Y7L8EbLV9C3I=;
        b=PLhIsXfZMpxLvsZmes6f/Uh5F2NQPY3ids69BTAyj3XBAf7wTcaCYatw3V0eEExSPu
         Ng5Z7SZodRH0Bpis+EtjmiVee+elKfaMFVDSs5g8FP/D2BA4oS3WSSv2bGXVWIlMHnmk
         OYtyNHOEYDSueVFlEjA/n5EdFTsVA9MGebJmMlG8ma2LRX7cZmmaDSvvsFPiCBgFhhi6
         SaM8NUGrBjFyIX5kl2JRUneh/eWAdf5zsdwJXtWsoOY5BAOQ+QKANTZLVPdxOpHMmyMW
         u2Qq0pYoBKrbH6gc7HH/SumMiGzRHd791DHi5mye2R88ogOMfRez5vc0dRzjQH+mMmz/
         ckPA==
X-Forwarded-Encrypted: i=1; AJvYcCWZjBhHW0l8e651n46s4cDC2rpYmvtFvBTBqEJZkOVDdexXOu9IuIY4ZOhSr6WyWEmis7Tvkp+m+EU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5I7JgzRldxewX7FDPK+Dee0uzNOyHbGiUyIfErW/HFkXfUcK7
	iFpKVmuoxoHj/gvvTkRP3WIYUaA5oxlhu7XHRzJhUfEZvUTLlz4gtVHWcralnPPypUDvXPh1TDe
	QV8X+gQ==
X-Received: from plbkq14.prod.google.com ([2002:a17:903:284e:b0:2b0:4da9:9b30])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:3586:b0:2b0:b325:748a
 with SMTP id d9443c01a7336-2b281705e9fmr189157025ad.22.1775581229412; Tue, 07
 Apr 2026 10:00:29 -0700 (PDT)
Date: Tue, 7 Apr 2026 10:00:27 -0700
In-Reply-To: <CALMp9eQR_ZivpcARLyvDK3w+frpwU8bj2Z+ZvA_fLdCtTq3Vhg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260327234023.2659476-1-jmattson@google.com> <20260327234023.2659476-2-jmattson@google.com>
 <adRBZuqNlBozaDrK@google.com> <CALMp9eQR_ZivpcARLyvDK3w+frpwU8bj2Z+ZvA_fLdCtTq3Vhg@mail.gmail.com>
Message-ID: <adU4Kwtus2C53U3E@google.com>
Subject: Re: [PATCH v7 1/9] KVM: x86: Define KVM_X86_QUIRK_NESTED_SVM_SHARED_PAT
From: Sean Christopherson <seanjc@google.com>
To: Jim Mattson <jmattson@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Yosry Ahmed <yosry@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 07, 2026, Jim Mattson wrote:
> On Mon, Apr 6, 2026 at 4:27=E2=80=AFPM Sean Christopherson <seanjc@google=
.com> wrote:
> >
> > On Fri, Mar 27, 2026, Jim Mattson wrote:
> > > diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
> > > index ff1e4b4dc998..74014110b550 100644
> > > --- a/arch/x86/kvm/svm/svm.h
> > > +++ b/arch/x86/kvm/svm/svm.h
> > > @@ -616,6 +616,17 @@ static inline bool nested_npt_enabled(struct vcp=
u_svm *svm)
> > >       return svm->nested.ctl.misc_ctl & SVM_MISC_ENABLE_NP;
> > >  }
> > >
> > > +static inline bool l2_has_separate_pat(struct vcpu_svm *svm)
> >
> > Take @vcpu instead of @svm.  All of the callers have a "vcpu", but not =
all have
> > a local "svm".  That will shorten the quirk check far enough to let it =
poke out.
>=20
> What is the actual line length limit?

There's a "medium-firm" limit at 80 and a "mostly-hard" limit at 100.  100 =
isn't
a true hard limit to allow for things like pre-formatted strings, and cases=
 where
the only way to stay under 100 chars would (arguably) yield less readable c=
ode
overall, e.g. msr-index.h deliberately has this

#define MSR_CORE_PERF_GLOBAL_OVF_CTRL_TRACE_TOPA_PMI		(1ULL << MSR_CORE_PER=
F_GLOBAL_OVF_CTRL_TRACE_TOPA_PMI_BIT)

and not

#define MSR_CORE_PERF_GLOBAL_OVF_CTRL_TRACE_TOPA_PMI \
	(1ULL << MSR_CORE_PERF_GLOBAL_OVF_CTRL_TRACE_TOPA_PMI_BIT)

> > > +{
> > > +     /*
> > > +      * If KVM_X86_QUIRK_NESTED_SVM_SHARED_PAT is disabled while a v=
CPU
> > > +      * is running, the L2 IA32_PAT semantics for that vCPU are unde=
fined.
> > > +      */
> > > +     return nested_npt_enabled(svm) &&
> > > +             !kvm_check_has_quirk(svm->vcpu.kvm,
> > > +                                  KVM_X86_QUIRK_NESTED_SVM_SHARED_PA=
T);
> >
> > Align indentation.  With the @svm =3D> @vcpu change, this becomes:
> >
> >         return nested_npt_enabled(to_svm(vcpu)) &&
> >                !kvm_check_has_quirk(vcpu->kvm, KVM_X86_QUIRK_NESTED_SVM=
_SHARED_PAT);
>=20
> You wouldn't happen to know the Emacs configuration for the alignment
> you like, would you? I asked Gemini, but it lied to me.

Heh, no.  Any time I unintentionally end up in Emacs, I have to do a search=
 just
to figure out how to save and exit :-)
