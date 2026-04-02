Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA2637A498
	for <linux-doc@vger.kernel.org>; Thu,  2 Apr 2026 19:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775158811; cv=pass; b=dmD3VeASG+wtCeXjjWQIvXe25ErnCVDDmkZEobGxnxXIO8QPIbA4qCQG/YjCkP4eYjm4f1+ftfFCynL9S8z91v0OwiJyERwU+jcScrA021fxvO8N5YD7ffY0aZzfB6zkzhTNpW9dutzoxd/nZdvaBT28He0v0Kn9aYyudtsiRzM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775158811; c=relaxed/simple;
	bh=US2V7kzwHw+XpVhDyUggsFAHRpyi5Z5kvJJ43HbFkRM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fsnAwuu3f9bT+xHs9fXxFrTtTdKpAOONjG/B/e58HiJN1dAlOnYylktXMUr6uGvI/iaNcYpEM6y+vvTk5nz+pn1/EGpvmwFUAaAz65qgcLpXr+J2kSXu/SD44Vcb1EULRrqnsyUrdMCDdh6G4ukuda+4pgg0mfXAdVQg8SlBOmY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Z+Wc1N8g; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Z+Wc1N8g"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-66b0dc690bcso367a12.1
        for <linux-doc@vger.kernel.org>; Thu, 02 Apr 2026 12:40:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775158809; cv=none;
        d=google.com; s=arc-20240605;
        b=BQImZcyyhUE66Hxlf7D053geexvrRxXuIuezPHMp4nUXvVGtQmpgNIF4VDDDxoTOa+
         yJVlzli5uPkLSEEc62NO+8EsNU7KbNPxWYFYVqQyLqpp5PCxGiGoc2pECl5OYbc871w8
         TOKCr1DvHdL//3zHQyr6CTi2FcitTOhWEWC4xZgKtCM8EO0UP3ldDarh2hHqAv5BoYcn
         EQB7bk/CXBnkzrSIZuzIgZvm86Vry6gZuIr9RV3E9m2fM03gAoTfvZ6KsYJX33/q2/9W
         E6HrzLbBJJ0TsoAKqIZlukYY9AZXEe4Fw5CwBDQaYVOYCCgXsLNke0EsNEYGxr0pY9tu
         AqtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J0DvflLdp3i7a17ynT3a78GmDFDn7qbQSpDZ8abq9cA=;
        fh=VqPOzNusxFWmrK1LIL/btiYtBJK8EpJheYVb1nStcMM=;
        b=KQVmQsTcUG2QKsU5zWf5CYromOsmEh/yvQyfJryUhZmmu7TM695fXg4iUpaR0Kb20c
         UYu+MNIoYBTf+Tn/nJctoR/abhEK+aL1300wD1YUGaVwZfq4LLSup/nojCgGS52/7Rbe
         KfM0HgOLEvOrtMr5E9LHUg/UtNZFMmLCHRtLZBXYPsH3oUfJ8grnARZQmouyWbFiNg/A
         PbpLF9CiUZC/ntep6M6brmokk5raDhbNEgf4tyQcC142AO+7CC0pm+Lvap7X4nDS2nFa
         8IRt88a3Oja9lkBlPnsyk/J/m5eZC6zaq71xV+arXyOmDu2+6mil9ShUblKqRwlwd1GP
         ++2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775158809; x=1775763609; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J0DvflLdp3i7a17ynT3a78GmDFDn7qbQSpDZ8abq9cA=;
        b=Z+Wc1N8gFdHRRaTj4eCm1Vdd+8m71jgh+a/eRMZKAkXD05ZWd+1ezgQ4peeqABToHi
         p3hn1BF/wNmKvy0/Ho9Vtmx10Yjna4fouN4cxibja4dMIpVm/lARlT59/RvdAWG9OOxJ
         v9uONRDeERj3QVAi5frZwvpNdkTLO5YM/MXcbdU0YWdcVlp0ka3P1uZwFlxa5clsoViG
         kdSEi00rAX2QWbXX+xg8FDQ88TQYTOzktjH4LOJBqty87GKGF01jRyphDX7rlOOo2MKV
         ym1EHGKXjC1XOditNR23aN/rA3Dpj4b8WErLS4SugPUxYh0ilgtow/l12XpAV2luuSfO
         iX+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775158809; x=1775763609;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J0DvflLdp3i7a17ynT3a78GmDFDn7qbQSpDZ8abq9cA=;
        b=Y1s0Pnsjf5IuvmS97ki2tycIRyX9G0kYWaRWzdTByS5EVHrgC9Z+HERyvn0gP8KlhF
         v3C+n6BR17d37DA0IeVL8+FCid0yr61FoESZLIAAvt7SNkg8Wn3blhCvh1AZ/8S3zETC
         EDz2oiWvZ21GdkB1raTz/UbQe7FKasA5koDqQd7EC+eQ+Dgr1AV6HSW+9nQqEXwbbQaJ
         OtsniwVJAOULc5KE74S1KvZyi1fuRzNwYXkxHc+ikwoj7TiNDu2oRO0Nd8qcrLbrzTtk
         lvG1hzuSVVZ88w2vVEAXqJcFxtfQT1GBw802SW5VOl6tDERVEfHizz7kPMgBkBiaaHPe
         8SJg==
X-Forwarded-Encrypted: i=1; AJvYcCX3DvaQGg0YC5D6eDvU9dcTUemKYV0/Z/Ax2coCsHActQpyJuW+fCoYhuZQS8Ct1/zy04xg/IcbuyA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQHrJj6xDz5wOH1FRnuaq/IEQTzFAWcskxeyR0mRM8m2Eq/U6z
	9qyF0wQS0fpAO6eS3azrU3uy/B0I7oqSKRq1J7kRa5OTyNOxYknjS0eo0e5BzKgPthuvf7QFcpD
	9NfjQ5YHivT56uf0kls2oTk0WDR8LlxOwwXmlSny6
X-Gm-Gg: AeBDieuojgDRIYnMJtaijtcioFeaqsOQaQttKd0Pw57pS/N4xV9ieC7pDJQihjDEOip
	hWOrgawW+opG1wIPB8OdQ0SLSFk4wlWmr78jxa/yRsO/A38EpuAxuX6BwC9wBqs93yvMCH4lWBn
	UGUjrgASIhqgqpZztWVdG9fXB2d3HPcNgfA+FKGxr09LL88LWQ+SfcsGcJvrmD2deXP1HJlEwAy
	ZeD0v0Zz+DGpKUnD5nLjKimU59XEaaJ8qSIH7mDYGA4q6S71e969r6r3JqaptAPtJkDVtOwGx17
	i/wNvfg=
X-Received: by 2002:a05:6402:4588:b0:66b:9469:a0f1 with SMTP id
 4fb4d7f45d1cf-66e41481095mr1730a12.14.1775158808171; Thu, 02 Apr 2026
 12:40:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327234023.2659476-2-jmattson@google.com> <202603301501.N2sdlIQ9-lkp@intel.com>
In-Reply-To: <202603301501.N2sdlIQ9-lkp@intel.com>
From: Jim Mattson <jmattson@google.com>
Date: Thu, 2 Apr 2026 12:39:54 -0700
X-Gm-Features: AQROBzAy_EbHuWlN5wT5_Opuw5NUyxR9m0jIc3ZzushJ6pVsut7GdsF_uvQSOn8
Message-ID: <CALMp9eSO6gz4R0f1S=E-sA3YE8KE0uJ30otcGsMV1NS3ujUcNA@mail.gmail.com>
Subject: Re: [PATCH v7 1/9] KVM: x86: Define KVM_X86_QUIRK_NESTED_SVM_SHARED_PAT
To: kernel test robot <lkp@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Sean Christopherson <seanjc@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Yosry Ahmed <yosry@kernel.org>, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2026 at 12:50=E2=80=AFAM kernel test robot <lkp@intel.com> =
wrote:
>
> Hi Jim,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on 3d6cdcc8883b5726513d245eef0e91cabfc397f7]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Jim-Mattson/KVM-x8=
6-Define-KVM_X86_QUIRK_NESTED_SVM_SHARED_PAT/20260328-110805
> base:   3d6cdcc8883b5726513d245eef0e91cabfc397f7
> patch link:    https://lore.kernel.org/r/20260327234023.2659476-2-jmattso=
n%40google.com
> patch subject: [PATCH v7 1/9] KVM: x86: Define KVM_X86_QUIRK_NESTED_SVM_S=
HARED_PAT
> config: x86_64-randconfig-016-20260330 (https://download.01.org/0day-ci/a=
rchive/20260330/202603301501.N2sdlIQ9-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260330/202603301501.N2sdlIQ9-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603301501.N2sdlIQ9-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    In file included from arch/x86/kvm/svm/svm_onhyperv.c:11:
>    arch/x86/kvm/svm/svm.h: In function 'l2_has_separate_pat':
> >> arch/x86/kvm/svm/svm.h:626:18: error: implicit declaration of function=
 'kvm_check_has_quirk'; did you mean 'kvm_check_request'? [-Wimplicit-funct=
ion-declaration]
>      626 |                 !kvm_check_has_quirk(svm->vcpu.kvm,
>          |                  ^~~~~~~~~~~~~~~~~~~
>          |                  kvm_check_request
>    In file included from arch/x86/kvm/svm/svm_ops.h:7,
>                     from arch/x86/kvm/svm/svm_onhyperv.c:12:
>    arch/x86/kvm/x86.h: At top level:
> >> arch/x86/kvm/x86.h:429:20: error: conflicting types for 'kvm_check_has=
_quirk'; have 'bool(struct kvm *, u64)' {aka '_Bool(struct kvm *, long long=
 unsigned int)'}
>      429 | static inline bool kvm_check_has_quirk(struct kvm *kvm, u64 qu=
irk)
>          |                    ^~~~~~~~~~~~~~~~~~~
>    arch/x86/kvm/svm/svm.h:626:18: note: previous implicit declaration of =
'kvm_check_has_quirk' with type 'int()'
>      626 |                 !kvm_check_has_quirk(svm->vcpu.kvm,
>          |                  ^~~~~~~~~~~~~~~~~~~
> --

It looks like svm.h should include x86.h.

Sean: Do you want me to send a new series?
