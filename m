Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC911494D6
	for <linux-doc@vger.kernel.org>; Thu, 13 Jun 2024 16:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718297743; cv=none; b=inDjk4LWDG8tV8JIkG/JVT6Wd9e9aoAwfn2pkmGL3YDL9XDjmHkKWAsir/a7+ihWvVV5shVkMnCM6GlPnzNfYPeWKSIJo/TRmzmEaX5rZaFCbOhmoxY8vGbj/OGO7MMiGXY3ru1IgzD5O411ZNAn6oSdfWwEoleGO2HMBLL4eBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718297743; c=relaxed/simple;
	bh=JBcO41UleHNq3lhHasPs977C4yzTa+av52awcjkovk0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=eJl5jdbZRTTS/t3Uzyd9Qx7XEicwAuD/2fHhC/WsoOEVOQ7qwVgG2K+PR3hNFiL4dPQWWmN6N/iN/I0QKXXDICY4smAFlnRMEm3X6yVznHkzIfclr1Mcs1NcrHjDucfeopmqAuUvI+X5nkGYbW+cfL3LLFU3HApz3Wi2UeTX3S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lPSXC9he; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lPSXC9he"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-627f20cff42so20678067b3.0
        for <linux-doc@vger.kernel.org>; Thu, 13 Jun 2024 09:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718297741; x=1718902541; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=f9CYt9bUQNxiXkzpZqytzyg53ZWv58TJdgtMwrRPm6U=;
        b=lPSXC9heprNeF8vL2j4xpLJh3aiTpXy9XicaYRrOPgkQlY8jqYcB26meROjBBxof19
         aKypBhw7bwuWFGZP5z3t/bWSVqHFDQHwXTVXEZRvdMU8mkGtXPIjG4r/NNYSsOp8Hqj2
         oIrIEZMQ4d2UfQ5Rgperkj9Zb9KmyDQ33LAsFYNunEI0P3ZqpWfKtx1hKOFfe7zdyUgx
         Dw45r6nR9vOREuYDYzDAxYchjT/tKPWhUwLk89rmY2MDGcCg/mPG+jeo8z3ncHn5DQhS
         tZAgHZUL8/PpBWlGwB+2X2ePpqD86UTrpYVE/lVKZr8ZY8ORn783y2l4M79pozTSrQ00
         34IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718297741; x=1718902541;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f9CYt9bUQNxiXkzpZqytzyg53ZWv58TJdgtMwrRPm6U=;
        b=oG+27ggiuAHY/OqHlejJGhcFBdQ3z3nW+3FVy0Yu9GF14l2XEF87Cj2u818qGjkYYT
         8UOssRnomrQmjI7IRQ/ev7l64W8Dfo2dRalPACztX4mF8kCnCEMjenUdFJhXxNmsiCW7
         TkE2eiZCStqYqf7kf+MOBKxxXo2uVDodGAUZedvPIKb8+Ayc0g+RI0/81rMQ7et0WvhA
         4Vw+eY1L5+6MJqivhV/L6a1dMNfgGN9IB3dpPHRDEY7UXb1+l1qn842UhX4KMMo7/0PA
         UYAlkPeddPu0eFq2I8mX7XCmHuvlDbdY04KzmLc7Eole9y4pmtQoO2yzw4QxObmXUOiV
         i41A==
X-Forwarded-Encrypted: i=1; AJvYcCWP6DLvPKNSuRh30DdrM5p4WArs4N8AWQmsydB+5wHkXNOhoruS62bgfXE14BWSQ4X63QlcvOGJVpcad+SWxMnu4gxWnsLzt3HP
X-Gm-Message-State: AOJu0YyecRiT7q510otOCBdEEk04+CWiBOQsyR/HGEcLG+aIL7t0FBtv
	avkIyue47mOqJS7kASMHjlgFcoLeXKBh8ijWdO9At2v+tvIo1Jslm6AO44M8K/sD3elOkpgrAdT
	d2w==
X-Google-Smtp-Source: AGHT+IHCQlTH8aUKVHWrREgqElX3I3HQvj6sWaaSxtbwu4nlawWKgv1Yel798rbyLMa4rUaGweqDKSAm9QU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:100f:b0:dfd:d6ec:4e3b with SMTP id
 3f1490d57ef6-dff15399367mr1866276.7.1718297740902; Thu, 13 Jun 2024 09:55:40
 -0700 (PDT)
Date: Thu, 13 Jun 2024 09:55:39 -0700
In-Reply-To: <20240207172646.3981-12-xin3.li@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240207172646.3981-1-xin3.li@intel.com> <20240207172646.3981-12-xin3.li@intel.com>
Message-ID: <Zmski7ixgWOE7Snl@google.com>
Subject: Re: [PATCH v2 11/25] KVM: x86: Add kvm_is_fred_enabled()
From: Sean Christopherson <seanjc@google.com>
To: Xin Li <xin3.li@intel.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	pbonzini@redhat.com, corbet@lwn.net, tglx@linutronix.de, mingo@redhat.com, 
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	shuah@kernel.org, vkuznets@redhat.com, peterz@infradead.org, 
	ravi.v.shankar@intel.com, xin@zytor.com
Content-Type: text/plain; charset="us-ascii"

On Wed, Feb 07, 2024, Xin Li wrote:
> Add kvm_is_fred_enabled() to get if FRED is enabled on a vCPU.
> 
> Signed-off-by: Xin Li <xin3.li@intel.com>
> Tested-by: Shan Kang <shan.kang@intel.com>
> ---
> 
> Change since v1:
> * Explain why it is ok to only check CR4.FRED (Chao Gao).
> ---
>  arch/x86/kvm/kvm_cache_regs.h | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/arch/x86/kvm/kvm_cache_regs.h b/arch/x86/kvm/kvm_cache_regs.h
> index 75eae9c4998a..1d431c703fdf 100644
> --- a/arch/x86/kvm/kvm_cache_regs.h
> +++ b/arch/x86/kvm/kvm_cache_regs.h
> @@ -187,6 +187,23 @@ static __always_inline bool kvm_is_cr4_bit_set(struct kvm_vcpu *vcpu,
>  	return !!kvm_read_cr4_bits(vcpu, cr4_bit);
>  }
>  
> +/*
> + * It's enough to check just CR4.FRED (X86_CR4_FRED) to tell if
> + * a vCPU is running with FRED enabled, because:
> + * 1) CR4.FRED can be set to 1 only _after_ IA32_EFER.LMA = 1.
> + * 2) To leave IA-32e mode, CR4.FRED must be cleared first.
> + *
> + * More details at FRED Spec 6.0 Section 4.2 Enabling in CR4.

Please don't reference specific sections/tables/fields in comments.  They always
become stale.  And the code+comments always reflect the current state, i.e. don't
need to worry about spec revisions and whatnot.  If there is a spec change, then
there darn well needs to be a way for software to differentiate old vs. new, at
which point there will be accompanying code to capture the difference.

Even in changelogs, references specific specs by section number is usually
discouraged.  Again, it shouldn't matter if its FRED spec 6.0 vs. spec 5.0,
because if there is a difference between those two, then the code better be
different too.

Instead, for the changelog, if it's really necessary/helpful, reference the section
by name and/or keyword, as those are much less likely to become stale.

> + */
> +static __always_inline bool kvm_is_fred_enabled(struct kvm_vcpu *vcpu)

This doesn't need to be __always_inline, it's not used from a noinstr section.
kvm_is_cr4_bit_set() is  __always_inline so that @cr4_bit is guaranteed to be a
compile-time constant, otherwise the BUILD_BUG_ON() would fail.
