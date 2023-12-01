Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2Yuf4U0y"
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF73DAC
	for <linux-doc@vger.kernel.org>; Fri,  1 Dec 2023 09:47:17 -0800 (PST)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5ca61d84dc3so41003687b3.0
        for <linux-doc@vger.kernel.org>; Fri, 01 Dec 2023 09:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701452837; x=1702057637; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ekY0qH1P2v7sxet+FFzSNmfvdCHeSDMjAlh064D7O84=;
        b=2Yuf4U0y/otd79jj1rlpstx914BdJ+x9EcIqpsRmKvrq9Y07Bb/mM+8dAKhOhy9G+T
         s94snDmQuAmGp8uovCeVwZU1orBfArvFzOHGfCJOhiit3CZYaQJdOKkcYxFO6Basfbeb
         5/siLSTEoTu2ovxOBzkm2qxvwmKq75uPvi/y7R0Jek40T+U9a2lWq/USiT6lsp3VBGJg
         cX5Ua8fvyaczOhAGtaGuOLtkNnH54EHO5PsMW7D9L7Vi7At6MdATt/KW6Y3QwzN5TepV
         Rf35ObflW5Y2qybNwhlggO3tQMYhjAlrVT0SEzYofJ2qXwLNeX95g8MHRLJb9Bo3Uny9
         9pwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701452837; x=1702057637;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ekY0qH1P2v7sxet+FFzSNmfvdCHeSDMjAlh064D7O84=;
        b=H7u1jFCK5375fISNIPUzPb1R3qR0yJUz6H5fKmdSBxAMuep6R6M9XNuyRis/8kGjfe
         mUecyHJG2oURIHSx6M9Kzwl5YpJ6Pm5tFeljO1DPikmbGJI6gsqYI3g5tZDkXl3MAhn6
         but/1f23x8hgZs0LkzNAF+n1DDKGo8d/fNLRioEVdGmP4fd2ipSkMZ8MSurbD8d2UjeO
         coievgMyKI+veXRC5VcWhjMaIWPlZC1QOmY9sjG2+ok9fUAp/PQ6IjCxlBP6aSMQ9c70
         V2GLPEmeazOYq+CvL9Z0xrlSKeGKIwySEN3F5URfAPA+aE1yO1mTY8Lz63NurzOpmuBU
         Z6qw==
X-Gm-Message-State: AOJu0YyWxAKa2TPK3Q3OVxKiMgIpiUvxxqqlc8fL6mWEQCbVdONvyHzu
	cX/+boDP5BYW/lFc2buHsSk1d/IE7M4=
X-Google-Smtp-Source: AGHT+IGhYfPZ1olbigqH98QigIcNR2O3rDqntLBQK660WHy3YcxXWqy8DOzYQjXtgojo0EBei7sSFc5etMo=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:690c:98d:b0:5d6:cb62:4793 with SMTP id
 ce13-20020a05690c098d00b005d6cb624793mr36113ywb.0.1701452837094; Fri, 01 Dec
 2023 09:47:17 -0800 (PST)
Date: Fri, 1 Dec 2023 09:47:15 -0800
In-Reply-To: <CXD5HJ5LQMTE.11XP9UB9IL8LY@amazon.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20231108111806.92604-1-nsaenz@amazon.com> <20231108111806.92604-6-nsaenz@amazon.com>
 <f4495d1f697cf9a7ddfb786eaeeac90f554fc6db.camel@redhat.com>
 <CXD4TVV5QWUK.3SH495QSBTTUF@amazon.com> <ZWoKlJUKJGGhRRgM@google.com> <CXD5HJ5LQMTE.11XP9UB9IL8LY@amazon.com>
Message-ID: <ZWocI-2ajwudA-S5@google.com>
Subject: Re: [RFC 05/33] KVM: x86: hyper-v: Introduce VTL call/return
 prologues in hypercall page
From: Sean Christopherson <seanjc@google.com>
To: Nicolas Saenz Julienne <nsaenz@amazon.com>
Cc: Maxim Levitsky <mlevitsk@redhat.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, pbonzini@redhat.com, vkuznets@redhat.com, 
	anelkz@amazon.com, graf@amazon.com, dwmw@amazon.co.uk, jgowans@amazon.com, 
	kys@microsoft.com, haiyangz@microsoft.com, decui@microsoft.com, 
	x86@kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, Dec 01, 2023, Nicolas Saenz Julienne wrote:
> On Fri Dec 1, 2023 at 4:32 PM UTC, Sean Christopherson wrote:
> > On Fri, Dec 01, 2023, Nicolas Saenz Julienne wrote:
> > > > To support this I think that we can add a userspace msr filter on the HV_X64_MSR_HYPERCALL,
> > > > although I am not 100% sure if a userspace msr filter overrides the in-kernel msr handling.
> > >
> > > I thought about it at the time. It's not that simple though, we should
> > > still let KVM set the hypercall bytecode, and other quirks like the Xen
> > > one.
> >
> > Yeah, that Xen quirk is quite the killer.
> >
> > Can you provide pseudo-assembly for what the final page is supposed to look like?
> > I'm struggling mightily to understand what this is actually trying to do.
> 
> I'll make it as simple as possible (diregard 32bit support and that xen
> exists):
> 
> vmcall	     <-  Offset 0, regular Hyper-V hypercalls enter here
> ret
> mov rax,rcx  <-  VTL call hypercall enters here

I'm missing who/what defines "here" though.  What generates the CALL that points
at this exact offset?  If the exact offset is dictated in the TLFS, then aren't
we screwed with the whole Xen quirk, which inserts 5 bytes before that first VMCALL?
