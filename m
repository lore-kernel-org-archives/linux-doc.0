Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE5F2417D9
	for <linux-doc@vger.kernel.org>; Wed, 12 Nov 2025 15:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762960729; cv=none; b=O0R4Q51C7QZaBCVQjEV/CCYEx2wO2x4T4r7DRpOAC6VH0XmjnHAagkp6H4ZJQfVSz8pbc/nnp6c3mR96MB1yQpu3FeZEccoRbdR/PftZ2z0Q56sm5mPF8yZu+f7wgM0GkIa42jCM5Z5tufBTMGD2H+Pei2/YTFsd3heGGCcY2XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762960729; c=relaxed/simple;
	bh=iLnxgFyU1QDbMTELG3Fxbzkq6isaDRxHBg0vdYSv7AE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tYE9JVQgPeCk7xVWqJkpjku6VIaVdpD1FkQysoDbqKX6w7gpEe7okOQfNn7SBkZ2+SHsL1K3iZOPs+Pqe38wnhdFv88TTAu0KhzIf5Q+CzE/dchFtFu6KmMvUvTVV7QJQpknWmoq4oCGcGII1B5vmVhn//FO1Jgn0wkYc3t7psY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i5LogE0r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i5LogE0r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A46BBC4CEF7
	for <linux-doc@vger.kernel.org>; Wed, 12 Nov 2025 15:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762960728;
	bh=iLnxgFyU1QDbMTELG3Fxbzkq6isaDRxHBg0vdYSv7AE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=i5LogE0rzrApEg/z/AH+jkxsNRO0Z/wlHOTL6b9glnDyt5+2DtUB35L2Uv4w/Km0W
	 A01EdtvbWOueNtDFTuB29xdiuig0LTetVIQW5erWQiew0m/QGkk6TQnzdJQOrUfKOq
	 T1qbQ2BWbax2w6/Q9pT8SbIGywnzRHHwePCd24B+cByQ3uEzzX1KTIR/0SMoN6XEnH
	 IoHTN6dWHULVLiGF5WOeNrRIO1HKtbY+IkoUCPVx3ge+ugS1BljRuYHLnR2nA9gMgH
	 Aq/vLStatho+g9LCt250Uysfa3bHBjPJygOGeJ6mpSRmBVjiVivyh9EZQ9qgrD3rlI
	 8G1d9jDbmBP6A==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-37b95f87d4eso5996171fa.1
        for <linux-doc@vger.kernel.org>; Wed, 12 Nov 2025 07:18:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWyqY3XtBLxymqn6oyAequXQxiNkWREoI3ae1neuz4hux/LB9oUartK0noKJO8nR+haBKek6v26+/s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv87qiCeEnfkBBZVzu1dQzx5vAuDuoPCIpmWHdsJI/iBU0s8xP
	8/jbjMSQjZHnfCFoFKTpWdBVoXEF0slt3suXb7ZtgLemERtrxOqX3BAl5yvmxZYoYxkU5rHzcbT
	rcQigDIjlppviu8IyCaxQkr8LEqc4Oek=
X-Google-Smtp-Source: AGHT+IEZJNYM8RSAWY7JhY3msblJGctSWnuxWyOr/XKZCDnEvnzTK0CVMbYL+FXUVQmYYZDS5c4FeflgFcwTg/j1yso=
X-Received: by 2002:a2e:8a90:0:b0:37a:5990:2ba8 with SMTP id
 38308e7fff4ca-37b8c39eb6emr7262651fa.23.1762960725360; Wed, 12 Nov 2025
 07:18:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251029210310.1155449-1-sohil.mehta@intel.com>
 <20251029210310.1155449-5-sohil.mehta@intel.com> <29f2d16f-361f-475c-957e-0ebcefcd1a8c@intel.com>
 <CAMj1kXHvfgMqFncvP5A6ed=2qEPkNkS8ecoM6iXMect51Tpz4w@mail.gmail.com>
 <7c26ae81-3495-457b-9f64-f5b2e169a63b@intel.com> <DDEF6164-D1E6-4003-A251-804738CB59E0@zytor.com>
In-Reply-To: <DDEF6164-D1E6-4003-A251-804738CB59E0@zytor.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 12 Nov 2025 16:18:33 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGyTo=4Va1PevMQyCauEKSutfSPo6je0Ps09TabhTe4zQ@mail.gmail.com>
X-Gm-Features: AWmQ_bkATy8eQW1W11WM4a6PnYbNwFNrApQpl2tGvWjez9wDd66g-WVyWrnM5Mw
Message-ID: <CAMj1kXGyTo=4Va1PevMQyCauEKSutfSPo6je0Ps09TabhTe4zQ@mail.gmail.com>
Subject: Re: [PATCH v11 4/9] x86/alternatives: Disable LASS when patching
 kernel code
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Dave Hansen <dave.hansen@intel.com>, Sohil Mehta <sohil.mehta@intel.com>, x86@kernel.org, 
	Borislav Petkov <bp@alien8.de>, Jonathan Corbet <corbet@lwn.net>, Andy Lutomirski <luto@kernel.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	"Kirill A . Shutemov" <kas@kernel.org>, Xin Li <xin@zytor.com>, David Woodhouse <dwmw@amazon.co.uk>, 
	Sean Christopherson <seanjc@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Vegard Nossum <vegard.nossum@oracle.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org, 
	Dave Hansen <dave.hansen@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 12 Nov 2025 at 15:58, H. Peter Anvin <hpa@zytor.com> wrote:
>
> On November 12, 2025 6:51:45 AM PST, Dave Hansen <dave.hansen@intel.com> wrote:
> >On 11/12/25 05:56, Ard Biesheuvel wrote:
> >...
> >>> it looks like we would now need to toggle
> >>> CR4.LASS every time we switch to efi_mm. The lass_enable()/_disable()
> >>> naming would be more suitable for those wrappers.
> >>>
> >> Note that Linux/x86 uses SetVirtualAddressMap() to remap all EFI
> >> runtime regions into the upper [kernel] half of the address space.
> >>
> >> SetVirtualAddressMap() itself is a terrible idea, but given that we
> >> are already stuck with it, we should be able to rely on ordinary EFI
> >> runtime calls to only execute from the upper address range. The only
> >> exception is the call to SetVirtualAddressMap() itself, which occurs
> >> only once during early boot.
> >
> >Gah, I had it in my head that we needed to use the lower mapping at
> >runtime. The efi_mm gets used for that SetVirtualAddressMap() and the
> >efi_mm continues to get used at runtime. So I think I just assumed that
> >the lower mappings needed to get used too.
> >
> >Thanks for the education!
> >
> >Let's say we simply delayed CR4.LASS=1 until later in boot. Could we
> >completely ignore LASS during EFI calls, since the calls only use the
> >upper address range?
> >
> >Also, in practice, are there buggy EFI implementations that use the
> >lower address range even though they're not supposed to? *If* we just
> >keep LASS on for these calls is there a chance it will cause a
> >regression in some buggy EFI implementations?
>
> Yes, they are. And there are buggy ones which die if set up with virtual addresses in the low half.

To elaborate on that, there are systems where

a) not calling SetVirtualAddressMap() crashes the firmware, because,
in spite of being clearly documented as optional, not calling it
results in some event hook not being called, causing the firmware to
misbehave

b) calling SetVirtualAddressMap() with an 1:1 mapping crashes the
firmware (and so this is not a possible workaround for a))

c) calling SetVirtualAddressMap() crashes the firmware when not both
the old 1:1 and the new kernel mapping are already live (which
violates the UEFI spec)

d) calling SetVirtualAddressMap() does not result in all 1:1
references being converted to the new mapping.


To address d), the x86_64 implementation of efi_map_region() indeed
maps an 1:1 alias of each remapped runtime regions, so that stray
accesses don't fault. But the code addresses are all remapped, and so
the firmware routines are always invoked via their remapped aliases in
the kernel VA space. Not calling SetVirtualAddressMap() at all, or
calling it with a 1:1 mapping is not feasible, essentially because
Windows doesn't do that, and that is the only thing that is tested on
all x86 PCs by the respective OEMs.

Given that remapping the code is dealt with by the firmware's PE/COFF
loader, whereas remapping [dynamically allocated] data requires effort
on the part of the programmer, I'd hazard a guess that 99.9% of those
bugs do not involve attempts to execute via the lower mapping, but
stray references to data objects that were not remapped properly.

So we might consider
a) remapping those 1:1 aliases NX, so we don't have those patches of
RWX memory around
b) keeping LASS enabled during ordinary EFI runtime calls, as you suggest.
