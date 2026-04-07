Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C8D3C457A
	for <linux-doc@vger.kernel.org>; Tue,  7 Apr 2026 16:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775579283; cv=pass; b=fhMoLAENfrvOGt8VKYqggK4XVUb5bz0SoOJMUxAK9MC/GRfBiQ2UZxYBZ7RLbLt+oye1ILYPWC3BtV1jVKTSew0dDHvFAqOgxC7SpJxzTmaZR8cXqfktghqpOE/SK6evMyZvJvrIdud1vY3D88BSPcn84vJKrwLcGuZTWvgXxSo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775579283; c=relaxed/simple;
	bh=mfSDevp9b8hpUHFiMKkR6R4RMAK3vtsH4zOSKGhaxkM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lYWCbJOV96/E2VegsfkfwepRCU5/JNZp86wP4rP4kJy+7aWSN3AdNz3Cu1maoSR4Wsy6aEq/2vPfnVvqMWD0FD7SR92cHgA2z38k4307vnqaPhJiZGktzAckpbw21wj71X5b7uQYodBgLLyfTbGNNN3zX/lU8+7DT1IphvmGvIo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=A4Z06B+W; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="A4Z06B+W"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-66bb7118c96so41580a12.0
        for <linux-doc@vger.kernel.org>; Tue, 07 Apr 2026 09:28:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775579280; cv=none;
        d=google.com; s=arc-20240605;
        b=dntjf8t43iz2YuiMCcP+gQdLnF6DYXs2A3xIJA7jdzbQBXb7LBHk0r1Np2yOd2IzUb
         ROXjV5K561vF2m1IJCcwH0wSs4rnwTiWHIQwL9SQMtYj6RazHGy8F40Te5F5fOieiPvu
         bZcA30uWOhU58yOUcbmDaaKCr6naMyYsj+3KHqrOQQRc8IcN59D+stKPKLx6oDG+wVbj
         5wuQYs7tfArwLZfUgf2SzqHnaXwgJcCtbNGaO+PW612sO5DMy98VOK0zwxytOkDB5h/2
         aI0aMk/W7NPs0h59rlPp7o6BPHdu7p1i7ay95Mcw95zsR+r+F49W/W9bxVYBw9OFzmOz
         0VhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yKg8r1WBmg20sHVEHfmhLlIhIakG5vXzHNYYZRS5Q9E=;
        fh=RaSGRZKz8wM9pMjMHfJlWi96zp0COxkbrzqeYmvrcgs=;
        b=eQ14oLIEraK1/doT/Pdl1jWDtxxzWwPdFNaXqiMcDQhO2DAOfTu3HibcCyn790reGD
         7YAYquCu05sGydy95iadK3gqk+cJQizQ+RZwgP6FQSYvY7B84h/Fq3zyYs8S4//EHD/q
         MUAKrAxtORLHMbrD/AX74zJR9cVNVihAfInkVu6pLT01OyEkEor+jnQFGUoOn6qCBa0s
         rLW8D3xb0mnDAoXiHCltxufuZwRSw4qDDo42bd0vena/7vkTeoV0L35XHO8FmESgYE6u
         yu1LyFUT3iIez14rwCcmWWu53nkBfVQd+zCpr5Fw8nsvv/T3T5ly/cuYCj+d2wdWMMNI
         42sg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775579280; x=1776184080; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yKg8r1WBmg20sHVEHfmhLlIhIakG5vXzHNYYZRS5Q9E=;
        b=A4Z06B+WfljDsz3Y3MnqR5tH92eU8jRlUBHvvr/DQRI4JIPythmJxKvzbCpTaluEcO
         Y0zvpsOIPeNywjQ7ouvyBYKeddXF9vi6gPZvtkav0N6uDf7hf2Q/31HrL2HnKuTdzvTJ
         2O4dqmpJ+zSMjkzAe+a4v7yq2iYxmA5bHqHD/xqLbzu3sWybSOOxjSj/2GfCANSkbvsM
         juv7p9h0l0uBR6A8BN+ViF31zH3LLVtnQaO5DkzvaO0jZAo5iOQ8h5TO1/IG9HBbyJ/q
         118Uk0lpXbpAOsVmmCkhC17GRj+iwSOGQh5CES5bLuOfB/4EB5dOTN8YMoQV+TuCYBY9
         nP8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775579280; x=1776184080;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yKg8r1WBmg20sHVEHfmhLlIhIakG5vXzHNYYZRS5Q9E=;
        b=XebB3ueGmsDlwcyLG8ZvNLPbrfRO46rbr8VUJvX4k22NI596fNMb2Ap7S8XreETHsp
         bbWNGayZ/snVMJ2em0vv4CdLvE9Geckz1Lk6IBgNs4yTK4vzkD/mke+BQj+Df79sGVp3
         W6MxgnX6BsRnYgVW4lrN9CINgsFXICabsLlXwieW1/5AaJz5TwOqKQRFXHNbBObJXn35
         POshB8vEV9Q6qkjI2/H5db4D0zU9CeYzBu7nsydjxdKq39DCTZtGbHh8+QWv2yRD6noM
         4PVpgh+l+mitQO7RjniT9TyNEu1CqDhIQ8YOsoeI7aGB8JRn6KzFK490OHi2X2iXxzBo
         iyWw==
X-Forwarded-Encrypted: i=1; AJvYcCX4168cKbSdwtGpfxYn1DjYMlvSqdGpqJTqmaIQYajjfo2DDrA9ihSXR3XQIkey8FOoVwWFNCipmY4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXJQKLmYFA6XNEMN7akDW0xQgwupKGL0ttI6rqYjh4a9NeV5Za
	MKj4/PgBQlYsago5DZO3Is6rXo8YuH2qubB15O6HC6VGzBL/1GNz/+v083uRu8njmRcnqleZqmL
	1mgg+rbVzUESKn+WfSMIE69iaGTjna0Xf2M1Crrav
X-Gm-Gg: AeBDietj5qMICuzQVhMD1STZs11SQhSu2GiM6JuO4mDE1avaNV0muo9n8llEClN+rpk
	JrqoBXp/SUu9hiXJxHDv+8iBn/2VKndK1K6Li7ZX9oBNnqkUuxDyRkwFlWBl0s7FEDa70sG/9Xq
	aCZP7KVzngHLJR68S0vaA2flbRJlBTofRM3JHKEaK6H9EJGBdakCupWD8JnY8gHx8lR6GvxL4l7
	DdUn4IOkoWXiHvIIVaniB3oocyTi5KG0muR9jKSViianM7RXuR2uF6iySnTuoiLEiWTH4OrZ4fb
	UrHqyAvIcZwsagwyEU325oCiIrDWEdwKJ/g=
X-Received: by 2002:aa7:d14b:0:b0:66b:e078:5934 with SMTP id
 4fb4d7f45d1cf-66e4181ffcamr155534a12.12.1775579279867; Tue, 07 Apr 2026
 09:27:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327234023.2659476-1-jmattson@google.com> <20260327234023.2659476-2-jmattson@google.com>
 <adRBZuqNlBozaDrK@google.com>
In-Reply-To: <adRBZuqNlBozaDrK@google.com>
From: Jim Mattson <jmattson@google.com>
Date: Tue, 7 Apr 2026 09:27:47 -0700
X-Gm-Features: AQROBzDfpgRU66Y-o07i73DU_xVQhhMm8EOnCI-usfps8N1_AZv5hiiifJSUv6Y
Message-ID: <CALMp9eQR_ZivpcARLyvDK3w+frpwU8bj2Z+ZvA_fLdCtTq3Vhg@mail.gmail.com>
Subject: Re: [PATCH v7 1/9] KVM: x86: Define KVM_X86_QUIRK_NESTED_SVM_SHARED_PAT
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

On Mon, Apr 6, 2026 at 4:27=E2=80=AFPM Sean Christopherson <seanjc@google.c=
om> wrote:
>
> On Fri, Mar 27, 2026, Jim Mattson wrote:
> > diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
> > index ff1e4b4dc998..74014110b550 100644
> > --- a/arch/x86/kvm/svm/svm.h
> > +++ b/arch/x86/kvm/svm/svm.h
> > @@ -616,6 +616,17 @@ static inline bool nested_npt_enabled(struct vcpu_=
svm *svm)
> >       return svm->nested.ctl.misc_ctl & SVM_MISC_ENABLE_NP;
> >  }
> >
> > +static inline bool l2_has_separate_pat(struct vcpu_svm *svm)
>
> Take @vcpu instead of @svm.  All of the callers have a "vcpu", but not al=
l have
> a local "svm".  That will shorten the quirk check far enough to let it po=
ke out.

What is the actual line length limit?

> > +{
> > +     /*
> > +      * If KVM_X86_QUIRK_NESTED_SVM_SHARED_PAT is disabled while a vCP=
U
> > +      * is running, the L2 IA32_PAT semantics for that vCPU are undefi=
ned.
> > +      */
> > +     return nested_npt_enabled(svm) &&
> > +             !kvm_check_has_quirk(svm->vcpu.kvm,
> > +                                  KVM_X86_QUIRK_NESTED_SVM_SHARED_PAT)=
;
>
> Align indentation.  With the @svm =3D> @vcpu change, this becomes:
>
>         return nested_npt_enabled(to_svm(vcpu)) &&
>                !kvm_check_has_quirk(vcpu->kvm, KVM_X86_QUIRK_NESTED_SVM_S=
HARED_PAT);

You wouldn't happen to know the Emacs configuration for the alignment
you like, would you? I asked Gemini, but it lied to me.

> > +}
> > +
> >  static inline bool nested_vnmi_enabled(struct vcpu_svm *svm)
> >  {
> >       return guest_cpu_cap_has(&svm->vcpu, X86_FEATURE_VNMI) &&
> > --
> > 2.53.0.1018.g2bb0e51243-goog
> >
