Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sb81ttRM"
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8033C10DF
	for <linux-doc@vger.kernel.org>; Fri,  1 Dec 2023 08:32:22 -0800 (PST)
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-5c62c98f682so724049a12.2
        for <linux-doc@vger.kernel.org>; Fri, 01 Dec 2023 08:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701448342; x=1702053142; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/K7HE0EB9COwZnWNHAn0RCBpw/EJerDEKjS1XCTH01o=;
        b=sb81ttRMy+4zDNQ3pBlsxtaovroVp6bOprAEQjGOKZqjl1VlY+AH9qes2XuFym/dfG
         6CuzeVxgDSh9s0x9SwuRY13U5jo+e2pb6iECKRbtETREHex7+URnpkgizRdvBlz1HXTW
         76EyyQiNlpCB4mzeGDYPdrwL5DaneL/LhpWQpBczUPRDmyQYZnrX0syjuG/4EQ01t97R
         SHPpnoajTXJ6aBkl5urglMFAJ/1iIU0lNpMN6zmXGl8X4HZUCkhXPPnT8hMRI4NbKcYl
         JtcD83MLhirCDMETTLLZJEN7n5PAUn/i8+b4fZp2csdMq4EL0J4/GdFNWwm6osa5slxq
         p/zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701448342; x=1702053142;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/K7HE0EB9COwZnWNHAn0RCBpw/EJerDEKjS1XCTH01o=;
        b=CqwUlSRacq4Ryo40+708D2fDtdpn0G1yaRNj5tsbN5H1NFeo78gBE/jjyAsptOPxV5
         XRfmjyGzkm4fdDjY4HPLAwhMpbZcwcClFVXLrdMXBr459/mms/5pXBJ7BusfPvVAhq13
         N1Pw9N4cdYE0LhQx4z2Ywsk5On+WXe9vEh2dAXTx9RBaQjuib19plRf1Fr3gT1OxaYH5
         BNxRw0cfoHyKfernWpvexAdkqxvPj0Tzqj8ieCzNu8+OOgISreSeK80WAu753oky7YF3
         F7ew+unPoN5ZqLon8SlM86ZiFFr975AIz5yR7eYRrJdbg6GIDk/ljltQMuff1TLxEA+7
         Sf/A==
X-Gm-Message-State: AOJu0YzvDHaqyf3WOTfzfq4E5Phtjv5GoJqquNXb+T2FzMqgGT39KPW3
	AbnYz1hBTjzRbJfJ5F9I2ow0KwrZMyY=
X-Google-Smtp-Source: AGHT+IH1lYPeVLhg1fK/372dKtjjpuPIbf/djPz/KyZw6BQ3OgmjhAtwIR2bi7SaI0dtlhyObZ26zc2sufk=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a63:211f:0:b0:5bd:bbb4:5275 with SMTP id
 h31-20020a63211f000000b005bdbbb45275mr3949230pgh.10.1701448342043; Fri, 01
 Dec 2023 08:32:22 -0800 (PST)
Date: Fri, 1 Dec 2023 08:32:20 -0800
In-Reply-To: <CXD4TVV5QWUK.3SH495QSBTTUF@amazon.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20231108111806.92604-1-nsaenz@amazon.com> <20231108111806.92604-6-nsaenz@amazon.com>
 <f4495d1f697cf9a7ddfb786eaeeac90f554fc6db.camel@redhat.com> <CXD4TVV5QWUK.3SH495QSBTTUF@amazon.com>
Message-ID: <ZWoKlJUKJGGhRRgM@google.com>
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
> > To support this I think that we can add a userspace msr filter on the HV_X64_MSR_HYPERCALL,
> > although I am not 100% sure if a userspace msr filter overrides the in-kernel msr handling.
> 
> I thought about it at the time. It's not that simple though, we should
> still let KVM set the hypercall bytecode, and other quirks like the Xen
> one.

Yeah, that Xen quirk is quite the killer.

Can you provide pseudo-assembly for what the final page is supposed to look like?
I'm struggling mightily to understand what this is actually trying to do.
