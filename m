Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0E9811F7
	for <linux-doc@vger.kernel.org>; Mon, 15 Apr 2024 14:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713191487; cv=none; b=ixqjH3rt+PxPfgFI29H6WpqdGNYzvq2ohRKL3XDe5tXNWJYAbenBzCuYAAwV3zwtIfrBhrXsCpSvo7TKnlSqQOsaTtN5zTF0vVDutH4heQbQSUJEBPrquO5PO/4L3b2Rv3KvZ5W/BiYyk3NtuFaaL+S4Ngg05OOjBBXhz3TMPKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713191487; c=relaxed/simple;
	bh=ITYC7z7GV55n6mIB+damxcuLZWxyZG3dP037z76+qQ0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=m5AT52DQWA6yqRcVQDBOvCs8YLTNDzWNnvJYvkbTfXeUxIhqqXOR30QUpUN6ITNJGvCYv7U0KVZueooCQDBYHbalmQQAiWjGksBsr5RzQmaf9MAt1wWVzJVMaVv545A2J5OBVwFZ1lWApCRZR0MK/zvsNAO+Sc3fL3ABZpMaIs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2nqzbcM5; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2nqzbcM5"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-5c6245bc7caso2524958a12.3
        for <linux-doc@vger.kernel.org>; Mon, 15 Apr 2024 07:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713191485; x=1713796285; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3c2CdFnxXRBnmzc0kZKqWJbmgAhAN/X9RQGLQm4qlas=;
        b=2nqzbcM57gPI/2TpPx7+PlH9N3yFxN+xAXfTCwAs6JUNLUFbA7l159Gtl2xCMnfWwn
         +DHky1MEgJfU3PBlL3vQWc3bHDV8O4/0XhtTcRr+K3zPJRocI5NNcbeosBc9p5ufgncP
         GPQ7KAehkefVHwbyOti5Wp69be2ZgE0Gvb4VWNgKNE33dDBad/CnP428TEK1B73h1e5t
         X6kg18mymJydA0JWL0gjJis6NAkkbNXkxNF8E3BYRYncfA+dgKUYzbEXO35VB3+9UxrZ
         1xR8bSyADvxZB1Haahx/HrZEeaVrg8Y76p/FGOwUsncIM2ylqHHx3BE5hlV8sKD7Scfr
         DoRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713191485; x=1713796285;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3c2CdFnxXRBnmzc0kZKqWJbmgAhAN/X9RQGLQm4qlas=;
        b=js4XgozwGlsBWt7n/lmngnfjSCMeVFA+c3/7e21APzJWsfL9uK8gXoFbva/38J9oYn
         E58YXcTQIgZFSSHg4FXfDYag21jqNPKybDUluIlh4Wi6ayzH1Bf5ZF2P1A6/B0QMciB4
         rfU2XPYL7NUslLyRUl2F+OEr623yJt540iM+25NyBlD2ZdHXqT704ZtH8oKHtaw4CqSD
         WAnrNGl14duwt3ycjA4G88zj3MnuTHcYrc19KADKaGB86T5G88igspZgv2FnZwQel/ij
         9eYXqXd9sOr2BjQ0dnuCufQu0LN1iA+VMqenlILSMEP/SKCkC0S9tXYS+1sY+uKlzMo1
         LdVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlwqaVN3JYtIYAb1oxj0jOrfYVTtnl626rHwsSFD6dbt9uaWqx+mET8+prWS7Q3eQSf5joo5pCieTsDXrmwwA6h9UpBBh46BJk
X-Gm-Message-State: AOJu0Yw0cVw7iFtt5ZW0ovwA/CA6U4k0apGZWA30/Fm9VTCUAwfKmCXf
	T6UC1RK+nIUhu+EMSKITC8P/SiJ3XW7UsblNt9jM1QrQXHou3jxnMkXRKPvLZXAN3oEw3BlX09P
	qAQ==
X-Google-Smtp-Source: AGHT+IHuch75LMAnc1U2ltEvl5EQtMTtzEb/8rE4LBdYCN+wg04KdOcX1kaXCFsKcUY8MvFdl8nCoh4Cvw4=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a63:ec02:0:b0:5dc:bc92:23c4 with SMTP id
 j2-20020a63ec02000000b005dcbc9223c4mr27975pgh.12.1713191484874; Mon, 15 Apr
 2024 07:31:24 -0700 (PDT)
Date: Mon, 15 Apr 2024 07:31:23 -0700
In-Reply-To: <CAMuHMdWD+UKZAkiUQUJOeRkOoyT4cH1o8=Gu465=K-Ub7O4y9A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240409175108.1512861-1-seanjc@google.com> <20240409175108.1512861-2-seanjc@google.com>
 <20240413115324.53303a68@canb.auug.org.au> <87edb9d33r.fsf@mail.lhotse>
 <87bk6dd2l4.fsf@mail.lhotse> <CAMuHMdWD+UKZAkiUQUJOeRkOoyT4cH1o8=Gu465=K-Ub7O4y9A@mail.gmail.com>
Message-ID: <Zh06O35yKIF2vNdE@google.com>
Subject: Re: [PATCH 1/3] x86/cpu: Actually turn off mitigations by default for SPECULATION_MITIGATIONS=n
From: Sean Christopherson <seanjc@google.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, 
	Daniel Sneddon <daniel.sneddon@linux.intel.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-arch@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 15, 2024, Geert Uytterhoeven wrote:
> Hi Michael,
>=20
> On Sat, Apr 13, 2024 at 11:38=E2=80=AFAM Michael Ellerman <mpe@ellerman.i=
d.au> wrote:
> > Michael Ellerman <mpe@ellerman.id.au> writes:
> > > Stephen Rothwell <sfr@canb.auug.org.au> writes:
> > ...
> > >> On Tue,  9 Apr 2024 10:51:05 -0700 Sean Christopherson <seanjc@googl=
e.com> wrote:
> > ...
> > >>> diff --git a/kernel/cpu.c b/kernel/cpu.c
> > >>> index 8f6affd051f7..07ad53b7f119 100644
> > >>> --- a/kernel/cpu.c
> > >>> +++ b/kernel/cpu.c
> > >>> @@ -3207,7 +3207,8 @@ enum cpu_mitigations {
> > >>>  };
> > >>>
> > >>>  static enum cpu_mitigations cpu_mitigations __ro_after_init =3D
> > >>> -   CPU_MITIGATIONS_AUTO;
> > >>> +   IS_ENABLED(CONFIG_SPECULATION_MITIGATIONS) ? CPU_MITIGATIONS_AU=
TO :
> > >>> +                                                CPU_MITIGATIONS_OF=
F;
> > >>>
> > >>>  static int __init mitigations_parse_cmdline(char *arg)
> > >>>  {
> >
> > I think a minimal workaround/fix would be:
> >
> > diff --git a/drivers/base/Kconfig b/drivers/base/Kconfig
> > index 2b8fd6bb7da0..290be2f9e909 100644
> > --- a/drivers/base/Kconfig
> > +++ b/drivers/base/Kconfig
> > @@ -191,6 +191,10 @@ config GENERIC_CPU_AUTOPROBE
> >  config GENERIC_CPU_VULNERABILITIES
> >         bool
> >
> > +config SPECULATION_MITIGATIONS
> > +       def_bool y
> > +       depends on !X86
> > +
> >  config SOC_BUS
> >         bool
> >         select GLOB
>=20
> Thanks, that works for me (on arm64), so
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Oof.  I completely missed that "cpu_mitigations" wasn't x86-only.  I can't =
think
of better solution than an on-by-default generic Kconfig, though can't that=
 it
more simply be:

diff --git a/drivers/base/Kconfig b/drivers/base/Kconfig
index 2b8fd6bb7da0..5930cb56ee29 100644
--- a/drivers/base/Kconfig
+++ b/drivers/base/Kconfig
@@ -191,6 +191,9 @@ config GENERIC_CPU_AUTOPROBE
 config GENERIC_CPU_VULNERABILITIES
        bool
=20
+config SPECULATION_MITIGATIONS
+       def_bool !X86
+
 config SOC_BUS
        bool
        select GLOB
