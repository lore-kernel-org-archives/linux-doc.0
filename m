Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6031ADC83
	for <linux-doc@vger.kernel.org>; Wed, 12 Nov 2025 14:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762956299; cv=none; b=Yf528VKM6khQm7HkqGt6maK4E7eEdUUaiW0ZBYUTPoDcIGcYoaAk5jqBJ25g4lVb9mHywLLnQHGWLNBz9tvyersFMm4sfubtNfD1fVsfTBN2lAQjg/Tw5EMdJX/bmQw1HleJcv+2Fbb3cvOID1tKgxb0I23LClNo8ovUtUXWo9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762956299; c=relaxed/simple;
	bh=tHJOhNS/6u7uEkNaEtbiVXZYwmle7ISnqeBqpq4Kzqg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NIh1prtDBR/R6ft1omESkKuAr2UYXT1YmgT5xKzaXF4uHHItxTXM+6JlUq+5acA7ohtse4LSLKSqc4/Q76pHkfV5oktQlj3+b/yXmcA/DwJwlg4GJtbqoLUxmwpfsI5Tbi+mOsCvxqr98i9SW8BHoBjEm1yvKWqJlsrB1jIzssY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oSKXMFAM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oSKXMFAM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81357C16AAE
	for <linux-doc@vger.kernel.org>; Wed, 12 Nov 2025 14:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762956299;
	bh=tHJOhNS/6u7uEkNaEtbiVXZYwmle7ISnqeBqpq4Kzqg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=oSKXMFAM9NxWCxyKqF2B0ffgQjjqaOtIS0199ntCxTE0UxgEAs4zjR9tA3XVN+2Oe
	 6Tsl52qqWXAWKlhiATCY0K73+FV+qmyFRi1fqRkHZks3TwY7Xum6ZcAGmUrIEnSpYp
	 Uuz1ehlKdwZvu1F9OhqvAIkOZ675aPnfQXDkP5drhAoATrtOKw7n1IsfnzSILma5pz
	 NPxwp1+1QbaY/2J35h1Gu73saxNlAr1YFLr3iDqwYWzVY1+xyq7ohk6Ojnmdmqlt2+
	 jz4pvlDN8D13GPd9rNeJ2/NhU4QimDFGQDholj1UhXbep53zJW5emFOYo8VUC9u6sP
	 VPqSNi0YGbJDA==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-594516d941cso963208e87.0
        for <linux-doc@vger.kernel.org>; Wed, 12 Nov 2025 06:04:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWjNiamLPAkzSxVaSNvYlSwkiixEdS616uN90k/ascD2vwa8UDJQ9S+1AXmGRf2Kjp7W/Qb3cKgmmo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg1LSyfoFE1mN+V8258HkdI89YqKakdKi8fPipqNXhyJ3+8ta9
	iYTyBMPS4L+QaizvWa5G4eBkNUuE4BXmfcRnPDu2NAaa4h4ydJNERfFVq4G28L9stM6PqEfH3xP
	l+XqUGBaJLb1fvNAYAnZUMRTEfr/AaOY=
X-Google-Smtp-Source: AGHT+IGXAF4rUi9O4+ZXVKR3NNYktKS/FyFWJQfBYe693cP1LOAh54szQzCs9X+fzOsFf3NVrgtQ+SBmqveiSr5SGIo=
X-Received: by 2002:a05:6512:400c:b0:595:765f:a5de with SMTP id
 2adb3069b0e04-59576e653aemr992791e87.42.1762955827202; Wed, 12 Nov 2025
 05:57:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251029210310.1155449-1-sohil.mehta@intel.com>
 <20251029210310.1155449-5-sohil.mehta@intel.com> <29f2d16f-361f-475c-957e-0ebcefcd1a8c@intel.com>
In-Reply-To: <29f2d16f-361f-475c-957e-0ebcefcd1a8c@intel.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 12 Nov 2025 14:56:56 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHvfgMqFncvP5A6ed=2qEPkNkS8ecoM6iXMect51Tpz4w@mail.gmail.com>
X-Gm-Features: AWmQ_blXGWjy7m-ZL23HpefUvy7djJ90ttXhT8zFrf_zvGN5o6-zn9r3GtsUR7Y
Message-ID: <CAMj1kXHvfgMqFncvP5A6ed=2qEPkNkS8ecoM6iXMect51Tpz4w@mail.gmail.com>
Subject: Re: [PATCH v11 4/9] x86/alternatives: Disable LASS when patching
 kernel code
To: Sohil Mehta <sohil.mehta@intel.com>
Cc: x86@kernel.org, Borislav Petkov <bp@alien8.de>, Jonathan Corbet <corbet@lwn.net>, 
	"H . Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, "Kirill A . Shutemov" <kas@kernel.org>, Xin Li <xin@zytor.com>, 
	David Woodhouse <dwmw@amazon.co.uk>, Sean Christopherson <seanjc@google.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Vegard Nossum <vegard.nossum@oracle.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Randy Dunlap <rdunlap@infradead.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org, 
	Dave Hansen <dave.hansen@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 10 Nov 2025 at 19:15, Sohil Mehta <sohil.mehta@intel.com> wrote:
>
> Hi Boris,
>
> On 10/29/2025 2:03 PM, Sohil Mehta wrote:
> > +/*
> > + * LASS enforcement is based on bit 63 of the virtual address. The
> > + * kernel is not allowed to touch memory in the lower half of the
> > + * virtual address space.
> > + *
> > + * Use lass_disable()/lass_enable() to toggle the AC bit for kernel data
> > + * accesses (!_PAGE_USER) that are blocked by LASS, but not by SMAP.
> > + *
> > + * Even with the AC bit set, LASS will continue to block instruction
> > + * fetches from the user half of the address space. To allow those,
> > + * clear CR4.LASS to disable the LASS mechanism entirely.
> > + *
>
> Based on the EFI discussion,

Which discussion is that?

> it looks like we would now need to toggle
> CR4.LASS every time we switch to efi_mm. The lass_enable()/_disable()
> naming would be more suitable for those wrappers.
>

Note that Linux/x86 uses SetVirtualAddressMap() to remap all EFI
runtime regions into the upper [kernel] half of the address space.

SetVirtualAddressMap() itself is a terrible idea, but given that we
are already stuck with it, we should be able to rely on ordinary EFI
runtime calls to only execute from the upper address range. The only
exception is the call to SetVirtualAddressMap() itself, which occurs
only once during early boot.
