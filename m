Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F3F3CE4BF
	for <linux-doc@vger.kernel.org>; Tue,  7 Apr 2026 15:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775576890; cv=pass; b=irac5mdSBqLbJ0ItMtGWI+bwY2SFyBXasVsILpf3mR3s5lREQiUY6YFmy+r7FTA+dV3Kv7gv4e/RALyiaEaJ6MAu/FALStA8jQZmpdPTR2SXXyX7YWpR9SpQChtRCtOc0ncQY/PCCtQWap2JE/63q5oY74GH+orOLs2ntrWCo/s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775576890; c=relaxed/simple;
	bh=T2uG1PHZ2DZKJc4V1Fkt5QBNKproLnPf5esVaJ56cdU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i0hdoynVAQ50wR8PjAObBe9+N23f5ey0CLpb5SoqkEbSiiYcFA5qzTB/qT0ndKKx/VMyZcoFmucAZIyToZU3/LYvr0QmGpu2gU/ymw/QU/mhQ26f0CNL1mXDnQHkxYgBmA1hKaycIk8hyVedQVi2S5VRZWrOYXF3bPbNv/y9498=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GZEhTf10; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GZEhTf10"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-66bb7118c96so40865a12.0
        for <linux-doc@vger.kernel.org>; Tue, 07 Apr 2026 08:47:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775576862; cv=none;
        d=google.com; s=arc-20240605;
        b=LyfK3bMlP/I219xfYGIGxsXo5RD7amLl2QTfUHre+lYIVsvMpqJEFAIj9G8lvyBPd5
         2ZCMV+3nFIBT05oYSDVlvjjp5bZYejmfqdCFK0We/6hVNsi0MqZvGWzRcX802ZneIGL4
         Kaph+A2olsGti7DMoq8ByCjHcmVQLxacf6s+a9V8sckA4M9la+iF1TwJjoFAS077OAVK
         0u61JBm9fJgo+JQjaYz0dAmKoZqP+8UjZmX4kb5pcQHrOmEfQCAlqOj8gKZfm1o4h5SG
         vmMwbvD1JBr12zXgiQ2Wp5r1q0KS1qQbUxxS9yC0BlEa+ii3xk2UGZxX0+5vNGpM+9yG
         DM7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OW0PL7Trk5Nbi8kfx4y+iqIlG6zAN+Q5XpqbwQzl6Ao=;
        fh=qcwjfnUhXCh2SyC/wIC0NuMGygDu50Tj0CR5otibJ7Y=;
        b=K6F6d+YtHJPps7KzutGnO0AlC15TgVOWd72NrWlpzp+EgThymbnLpdhJt3Bx6tVdVm
         of5tgR6N/AX3LShH7gL5XZ0GHBJW3pyeYtVXsbnAGHkACm03HnGYDr9SJOeoWSGMr/L1
         DYnQE1a94eMZRnEDg+X7/15VTHKhUx6rJHYhenRAHghTkCG1oXL1UKaVUh3w5YfRb/1T
         4BvRUZ7cuaSpDK/3m+QBBFTERqcuFyjM8f+HccoRQEeyH/kJqvmD+ORhPjVnNnBKCE1k
         gdMba3sExzKy67tKC9/4/ohroiC1RbCSZdx4Al0ZvI66Zaj0PTwLN/SsokSLynlD/lEh
         7vCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775576862; x=1776181662; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OW0PL7Trk5Nbi8kfx4y+iqIlG6zAN+Q5XpqbwQzl6Ao=;
        b=GZEhTf10cluMSMlPZxugEczYelJ8qkSlDVDCxhNasE8hHjXOUVNPL7lr5C9XgmpuIF
         i/Ma+TUcfxVoOVZAKFwcpOm1EeL1oFIOCMAVbG9bQcTMNhiLOYcmvV/s8qUOzkcA7kE5
         P6VTNiAQIqpr3Sz6hNDzJMe8dd0dhnTViQaBx4hlW3R72NOaYjIJvHnKCX8SbjJpTYIK
         IxoOQlk2tAL+7Ohq74mMuXtjXKFq2zNRMMgaqmliF59TztI8mWEE/0lvNeUDAwrtehpU
         XdyHuXghUlaAonzG9NpjlX9JPAHLp77O0fIglV7ZfBZfivJIE9NiWjWcZs63/cXKIMea
         9LTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775576862; x=1776181662;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OW0PL7Trk5Nbi8kfx4y+iqIlG6zAN+Q5XpqbwQzl6Ao=;
        b=Z4bP1No3J8uEflGfTlmPX1jiEAtmsF7vaVtspA7mD5HK2aLJ9d3f6ZuKXefhK1fjz/
         kr1Tyso4XWGDjlYoV2PPO2hzsmJvn+kRZHPt1RRnUZeo9riUKA21KHtMAViPqpMMUKZU
         DdYGlNx4ZjwnhjgFKxdyy5V7Jcnl096ToMEtaOMy4yv1BRgj+gm8FATLzRVml6f5ouPZ
         Me2KkutLdsuF2qSMXhjMJbvFajtyHMfDxKmgc0/9oapXgf3iBoHVd+cy6x12jxxLWHqn
         5k8bbH75oW/CfWyLLMAHQ9NXTSUhNR6bCp+fh3tsEyOvkCx48HYz58VgzF2SrWHjgrCs
         7kfw==
X-Forwarded-Encrypted: i=1; AJvYcCWntc4FxLIAQXdBe4+9MFKn27o04BerTNQKz4nJwQPXmMc5mcT0PyCWJjUzxUKeLwin0LjA56k9J3g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeeE0YJAt1DdftMxLBV/Q9g3n8GElBv2J3TOGE8cE1De0aqdG0
	LwrFyJEdvPvTF++hguHrvCpc2CjoKr3Xidyq9Cj/zOs1ZLRdaxdUqwQMxp3qfTUq2/A9q3yDUk+
	DdarbEX7DNrTdkP7qUIU7LSmjk3SJD3ymp9ehctO1
X-Gm-Gg: AeBDieuBSDSGoPeL25ivDWdZawX7d+OtPDiyGIBw3rquX1M1+Z70txLfBwEzrhnMQBB
	qVBXT3Atv0whEHLDrBqYBVbA6nwzU5UU/3DM5LK8YXBSjKwnb9I4bD9PiTPXTtD4tSiBuhboBA0
	+RiW1etN5lDecn9HytQFpBXie6hJVyEsShjNzaWp9pwaJovMEnU4vQebiREZI4lTyxVOy8tyNry
	3lGYvjXWIfshLBpwXmbKM5DpquBDIZir0ueTgyCN3zlcaAc4exGUECepWC0PRgx/knDFyohBzEL
	UKUwKCw=
X-Received: by 2002:aa7:d1c5:0:b0:66b:99df:42e2 with SMTP id
 4fb4d7f45d1cf-66e4136b6admr159703a12.10.1775576861215; Tue, 07 Apr 2026
 08:47:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327234023.2659476-1-jmattson@google.com> <20260327234023.2659476-9-jmattson@google.com>
 <adRGLPrmBpX-3DdX@google.com> <CALMp9eQsd0fRuDE_R57Mn6-N6jCtbmoPAh7Y7CBdMEZJaNSUGQ@mail.gmail.com>
 <adURPZJEDs50NPkB@google.com>
In-Reply-To: <adURPZJEDs50NPkB@google.com>
From: Jim Mattson <jmattson@google.com>
Date: Tue, 7 Apr 2026 08:47:28 -0700
X-Gm-Features: AQROBzB9-2Y6jBk2OjVBHpaQ7SDFWjJWA4zzLhVGVcrjOpWk0jyI179MFPhotc8
Message-ID: <CALMp9eSysKOVGF_xakbT59tVsgER6oEYpJuK9=hQutjY=ZpM-A@mail.gmail.com>
Subject: Re: [PATCH v7 8/9] KVM: x86: nSVM: Save/restore gPAT with KVM_{GET,SET}_NESTED_STATE
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Yosry Ahmed <yosry@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 7, 2026 at 7:14=E2=80=AFAM Sean Christopherson <seanjc@google.c=
om> wrote:
>
> On Mon, Apr 06, 2026, Jim Mattson wrote:
> > On Mon, Apr 6, 2026 at 4:47=E2=80=AFPM Sean Christopherson <seanjc@goog=
le.com> wrote:
> > >
> > > On Fri, Mar 27, 2026, Jim Mattson wrote:
> > > > @@ -1918,6 +1921,7 @@ static int svm_set_nested_state(struct kvm_vc=
pu *vcpu,
> > > >       struct vmcb_save_area_cached save_cached;
> > > >       struct vmcb_ctrl_area_cached ctl_cached;
> > > >       unsigned long cr0;
> > > > +     bool use_separate_l2_pat;
> > >
> > > Land this above "cr0" to preserve the inverted fir tree.
> > >
> > > >       int ret;
> > > >
> > > >       BUILD_BUG_ON(sizeof(struct vmcb_control_area) + sizeof(struct=
 vmcb_save_area) >
> > > > @@ -1993,6 +1997,18 @@ static int svm_set_nested_state(struct kvm_v=
cpu *vcpu,
> > > >           !nested_vmcb_check_save(vcpu, &save_cached, false))
> > > >               goto out_free;
> > > >
> > > > +     /*
> > > > +      * Validate gPAT when the shared PAT quirk is disabled (i.e. =
L2
> > > > +      * has its own gPAT). This is done separately from the
> > > > +      * vmcb_save_area_cached validation above, because gPAT is L2
> > > > +      * state, but the vmcb_save_area_cached is populated with L1 =
state.
> > > > +      */
> > > > +     use_separate_l2_pat =3D
> > > > +             (ctl_cached.misc_ctl & SVM_MISC_ENABLE_NP) &&
> > > > +             !kvm_check_has_quirk(vcpu->kvm,
> > > > +                                  KVM_X86_QUIRK_NESTED_SVM_SHARED_=
PAT);
> > >
> > > I vote for either:
> > >
> > >         use_separate_l2_pat =3D (ctl_cached.misc_ctl & SVM_MISC_ENABL=
E_NP) &&
> > >                               !kvm_check_has_quirk(vcpu->kvm,
> > >                                                    KVM_X86_QUIRK_NEST=
ED_SVM_SHARED_PAT);
> > >
> > LOL! Aren't you the one who keeps complaining that my indentation
> > doesn't line up? Are you schizophrenic?
>
> Huh?  That is aligned.  Perhaps it's whitespace damaged by your MUA?

Indeed. It was.

> > > or
> > >
> > >         use_separate_l2_pat =3D (ctl_cached.misc_ctl & SVM_MISC_ENABL=
E_NP);
> > >         if (kvm_check_has_quirk(vcpu->kvm, KVM_X86_QUIRK_NESTED_SVM_S=
HARED_PAT))
> > >                 use_separate_l2_pat =3D false;
> >
> > Wow. I really have no idea how to predict what you're going to want
> > the code to look like. How is this better than the original?!?
>
> It doesn't immediately wrap after the "=3D".  Similar to my view on wrapp=
ing before
> function names[*], I find wrapping immediately after an assignment operat=
or to be
> unnecessarily difficult to read as it doesn't provide any context for sin=
gle-line
> searches.

That's actually a good argument to *never* wrap a line. If a line is
broken at all, the interesting context might follow the line break.

> I'm pretty darn consistent in my dislike for that style: I count 26 insta=
nces in
> arch/x86/kvm that match "\s=3D\n", and only two of those carry my SoB or =
R-b.  I
> simply missed the wrap in kvm_vcpu_apicv_activated() that was added by co=
mmit
> 896046474f8d ("KVM: x86: Introduce kvm_x86_call() to simplify static call=
s of
> kvm_x86_ops"), and I'll give myself a pass for commit 8764ed55c970 ("KVM:=
 x86:
> Whitelist port 0x7e for pre-incrementing %rip") as that predates treating
> checkpatch's 80 char limit as a soft limit.

Might I suggest that you should provide a tool=E2=80=94something like
checkpatch.pl=E2=80=94that flags style violations?
