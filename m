Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448E8373C10
	for <linux-doc@vger.kernel.org>; Tue,  7 Apr 2026 03:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775531320; cv=pass; b=NLLvfpndU9xgFUkqXqIdXe5UWk+BZA5ftWfXe7qSk8F4xLcQDnDkUvBnp6jDqn/BqJYNUl4DS0DnZITKC9t4hU2BRItFO3kkE2CS3K0Aqopo6Lv4x4uCjIpZgbhBJ3MUkW1mPDtXQS1LaL+/puCr7SMdewbDrzxoJQVfq9YxXDo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775531320; c=relaxed/simple;
	bh=k52uxGJG3jRTUKdJZJj0k217ALr5NF1LnUBSdh34lh0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=myDb2oDUbydzMC7jB0sKIWWhgHuAqHqrxeINuUx6iHtCn47Ia37VU7oKIsMQKOdFhEu1ew6Vk2QF+vy7F5XrfcdaLmHIptyjnFNc4ehvo59CcsweJXlJk7jsPoCXP4rLVxLffZe3sAgCBUrSFx6Ec17bAdro0EDJD29090YBMPs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gkdqWtke; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gkdqWtke"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-66baa7fdfd3so28684a12.1
        for <linux-doc@vger.kernel.org>; Mon, 06 Apr 2026 20:08:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775531317; cv=none;
        d=google.com; s=arc-20240605;
        b=cBNcVnHEscCYccepBv6CJB56aNCpVW+GcdiJr7LGppf1X9KdSqFOIs+VBQbG9+ImA9
         hvz8CeRIhHTkvvyCQFOimksLKNSFAiOFVQqDh/ctUZJFIHRGqQfsOofoSqgKAE1VMa3s
         4ATi918HALH+cePBj2Xl+DQa7k1Vv3OZzn1kZQgcQ1AspPNH0+6wM3uaParlc6rnHrSz
         vZUJEfDg+RCp0hty3Oid9btRz9TSofAea+cXlxMVjqP4XGGMw+wXarOAe/szG7O/J1Lt
         7j3zp6rffiEvI1BhrMArvDX15SH+k9b1br58grGZfJdoG1Mnt/C/XrzZZzAsVQ8lQngQ
         NIkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Os2DnFhuf2hlJiSlOQD5vo78MAgCiDjrBPYSDLDhp6o=;
        fh=Z2yoqA3w05u1IIyKKlDnRUQuRYq546x8cCqoSK2SVD0=;
        b=QeB3OjbQ718vgRJyLUTSS6jR1kzkWRr2kWUOzCTs3KCtazvM1vOCoHyp91DyPSp6Q9
         Oir1xezcopsnzjVz/6fbLzVInsV78Z2nwqbY/lVsyzqyRNrly1SOLUZKHMP+DoR9MAUy
         njPm1NI/cBTN9IO1inyilUGMg3nNASW8uTb0Nma8cbl5ql0vEQHUC+AcMLOnwx12e0yC
         XFV8lMjqHK8cpzUtdxsWFx1Bbcu5LIlmKs9kZ7QV21gote/Km7Nz0QhlBLdOM3Qx3cPi
         6wJ1HnRiVqHfVGxpwZZyCQtvfFv11NQAV+uqzpYFuCquEAsgDnStxBlvbT0Ocd8qprFT
         zo2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775531317; x=1776136117; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Os2DnFhuf2hlJiSlOQD5vo78MAgCiDjrBPYSDLDhp6o=;
        b=gkdqWtkeZupAx8Wfx1zdXj7Twpm3QiWAKkmFepsNiMS0sIpSVZTFd0MUuPYvjQ1alQ
         Uoty1iuKRPTCuYaURxQaIHjxXFfiretka8cU20deZoWcZ2XnkjlMXxA7hFTnVKa/XX9Y
         j8fEIPwfjXLjDSPWLALa3FDt4bf1KsxprgBIi6ALxRda0b5oJEPUg62Qnl+i/pUwl87W
         pWVC7vMc7/21ShYHhjw3LVESGgmmsEiKjs2fMyaZMtkJ6lNg1YrO6jtdI79PLA6ix7MQ
         DNf8CLjo7uFya9yi7vv5M18uqS8FQceRg3QiSpoMeSCSK/nC8qmjwGWrXDQpDbTufgRi
         75Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775531317; x=1776136117;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Os2DnFhuf2hlJiSlOQD5vo78MAgCiDjrBPYSDLDhp6o=;
        b=b7RG4+vwZ023N5ihA5DmQ6eXax2nTRh/4EHLBqDXk/6sGy9rtBKJ/nWCC5bDxE1Dxl
         VtijOXNq74Vx/7gZ8eLsRB1WvMNUSFgzx4IkJ7/E2Tod9dBqY0YM80sNrgPeCQzJ7QBa
         X3j2ZwkkY/H2XFpbW5aS/MalqbVG2Bw99Xxzckrw8FEN4GygE3W4btq1rd1iupt8bsDB
         eSxSswHAb5QkNOVC+BhHcGRVwEnGk6kQtTvhUKbekTGf16iax/8xDU8rsga0q7c1+EhU
         fya2tPyjzVTcoYHsivTq4wsooCe8RJPkfB092e5I7xgDYNlK7h5sO2dBILVN4t72Gx0c
         80ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdJlejFXkqYoNYKza0/6fyvWy2zfoaPMNai6+mF2gqrkxUz6phvugi1uWasA6iirjY3sC7eH0LZdc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHTq/WhR5t8coaiqqr0Y+YShk9Se6N2LF2MUlHhHmA7J+Rq/Uh
	hfMAQLi0ePZy592PtlCTDBnyJKL4KeVXGRxJuUl80wcWEp3erLuX0V89i7luPMx9Ity4n8xIrg5
	OVoIoQ7W6jQpQ5Q6QSTGTC6Fb9m7QhDlwi2r/Sw6D
X-Gm-Gg: AeBDietq/GTA7hWSkavMee/H2wHS2Wc4C7uvlA4ILZqhDnPkoVaFV+sbJVJM46GWqCd
	qgRMEedyoSYSxvMdofec15RHHSo4HWBzU0TcWgOnf4AfufgtLk47rbCuycWHRXYW+Mp7QrpaGSb
	QJctxaKwHusKid17CQTzNlM6+oCop3GEquHbxNIw2hfb4VTBcr/8AWM050h1Mej2Y/1XLFKuVIf
	Yl55nA98cVIwZl6Kuq6n+OP/AaOseovEpKdHFDqGvhdpB5r4KW134fn9rixbRjYSVbt1/du1UXX
	TNio/o06YCSxpym85Q==
X-Received: by 2002:aa7:d44a:0:b0:66b:860f:3799 with SMTP id
 4fb4d7f45d1cf-66e43f30587mr117520a12.9.1775531317160; Mon, 06 Apr 2026
 20:08:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327234023.2659476-1-jmattson@google.com> <20260327234023.2659476-9-jmattson@google.com>
 <adRGLPrmBpX-3DdX@google.com>
In-Reply-To: <adRGLPrmBpX-3DdX@google.com>
From: Jim Mattson <jmattson@google.com>
Date: Mon, 6 Apr 2026 20:08:24 -0700
X-Gm-Features: AQROBzC8X9Gxsb_fQZyGU7iYS90MtfxxpD0EqXLCCJdCUeZKGIMxWSh5vBrbGnc
Message-ID: <CALMp9eQsd0fRuDE_R57Mn6-N6jCtbmoPAh7Y7CBdMEZJaNSUGQ@mail.gmail.com>
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

On Mon, Apr 6, 2026 at 4:47=E2=80=AFPM Sean Christopherson <seanjc@google.c=
om> wrote:
>
> On Fri, Mar 27, 2026, Jim Mattson wrote:
> > @@ -1918,6 +1921,7 @@ static int svm_set_nested_state(struct kvm_vcpu *=
vcpu,
> >       struct vmcb_save_area_cached save_cached;
> >       struct vmcb_ctrl_area_cached ctl_cached;
> >       unsigned long cr0;
> > +     bool use_separate_l2_pat;
>
> Land this above "cr0" to preserve the inverted fir tree.
>
> >       int ret;
> >
> >       BUILD_BUG_ON(sizeof(struct vmcb_control_area) + sizeof(struct vmc=
b_save_area) >
> > @@ -1993,6 +1997,18 @@ static int svm_set_nested_state(struct kvm_vcpu =
*vcpu,
> >           !nested_vmcb_check_save(vcpu, &save_cached, false))
> >               goto out_free;
> >
> > +     /*
> > +      * Validate gPAT when the shared PAT quirk is disabled (i.e. L2
> > +      * has its own gPAT). This is done separately from the
> > +      * vmcb_save_area_cached validation above, because gPAT is L2
> > +      * state, but the vmcb_save_area_cached is populated with L1 stat=
e.
> > +      */
> > +     use_separate_l2_pat =3D
> > +             (ctl_cached.misc_ctl & SVM_MISC_ENABLE_NP) &&
> > +             !kvm_check_has_quirk(vcpu->kvm,
> > +                                  KVM_X86_QUIRK_NESTED_SVM_SHARED_PAT)=
;
>
> I vote for either:
>
>         use_separate_l2_pat =3D (ctl_cached.misc_ctl & SVM_MISC_ENABLE_NP=
) &&
>                               !kvm_check_has_quirk(vcpu->kvm,
>                                                    KVM_X86_QUIRK_NESTED_S=
VM_SHARED_PAT);
>
LOL! Aren't you the one who keeps complaining that my indentation
doesn't line up? Are you schizophrenic?

> or
>
>         use_separate_l2_pat =3D (ctl_cached.misc_ctl & SVM_MISC_ENABLE_NP=
);
>         if (kvm_check_has_quirk(vcpu->kvm, KVM_X86_QUIRK_NESTED_SVM_SHARE=
D_PAT))
>                 use_separate_l2_pat =3D false;

Wow. I really have no idea how to predict what you're going to want
the code to look like. How is this better than the original?!?

>
> > +     if (use_separate_l2_pat && !kvm_pat_valid(kvm_state->hdr.svm.gpat=
))
> > +             goto out_free;
> >
> >       /*
> >        * All checks done, we can enter guest mode. Userspace provides
> > @@ -2017,6 +2033,10 @@ static int svm_set_nested_state(struct kvm_vcpu =
*vcpu,
> >       nested_copy_vmcb_control_to_cache(svm, ctl);
> >
> >       svm_switch_vmcb(svm, &svm->nested.vmcb02);
> > +
> > +     if (use_separate_l2_pat)
> > +             vmcb_set_gpat(svm->vmcb, kvm_state->hdr.svm.gpat);
> > +
> >       nested_vmcb02_prepare_control(svm);
> >
> >       /*
> > --
> > 2.53.0.1018.g2bb0e51243-goog
> >
