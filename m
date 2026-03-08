Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch [109.224.244.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4D7202C29
	for <linux-doc@vger.kernel.org>; Sun,  8 Mar 2026 10:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772966316; cv=none; b=rI2sAEz7ehTGCx7dRvp5PfMLI/xd1nMSCCEjdM6pQxSbV7K2bYzbeyXDYrgmD0IGO0s/O02crbmu5Yel6X/Lhaf/g2n/2mMvEpYMY0YaxbsosyKQ42yHOUr2St3d2mZJokFqB94iLXURLfl7JOMck4zm1PC5mo0o9eGsMGgJbSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772966316; c=relaxed/simple;
	bh=PyPgC8GvoAsfDI2jOERe3hqAxlWpt0d2theva8J7ntk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uLI2gEHs0IjEs3z+vle9QHzbiw6RT8ZnPzsBZI2XLZshR65MZsSNeWjXuVkOLj08TXA07v+2dL5vRPZ/BVAu6e2G4qoeFIclGewHj0HUOC9iDo3EwvcgyqkoJHBbid4YIQbq5FsCJbYz0Bx5TwBmWsuHpfGT5pDQ7t/mH3Jg5I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=HoMFIXIQ; arc=none smtp.client-ip=109.224.244.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="HoMFIXIQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1772966310; x=1773225510;
	bh=KzacKZ/Z74Es5hKQoeAGOYFVTl3wJXOLWq4/nWh9lxc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=HoMFIXIQtp3q2vwxB3rnUBDyeXHN1ChLM/lbc2HcBTgmElOGUssBE+NEcWYFi86Tq
	 H3D7Aqv4PB/APpJQBp68FS+xJLDAIdbdFjJaI17Vg8C+JDhei5P6HsQn7SiHprD4F3
	 Gj9ECE9MzGpz8mViNy+ZX6TnoBarJDIANNlxNzeVP6eM0kTDyQdp0RsHyq2WPyQp1a
	 JMGSs+mxuCwLw8fdwBIhbKA3G7vMmUnYlH+Vz5hnHWwDH88DTtqd0ho8YZBfbS2uSy
	 qauqWkKnUfmbxnloJ4SH2w8GSOOdrTMp8a17urqVz/Me5z/dWRLeOtgOi5IkmOwMZ0
	 aYznhlDWHZBpg==
Date: Sun, 08 Mar 2026 10:38:24 +0000
To: Sohil Mehta <sohil.mehta@intel.com>
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@alien8.de>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Kiryl Shutsemau <kas@kernel.org>, Brendan Jackman <jackmanb@google.com>, Sean Christopherson <seanjc@google.com>, Nam Cao <namcao@linutronix.de>, Cedric Xing <cedric.xing@intel.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tony Luck <tony.luck@intel.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] x86: Enable LASS support with vsyscall=xonly mode
Message-ID: <aa1Qu1MPkP2nyaXg@wieczorr-mobl1.localdomain>
In-Reply-To: <20260305214026.3887452-1-sohil.mehta@intel.com>
References: <20260305214026.3887452-1-sohil.mehta@intel.com>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: 32088ed06a1b4f6f424b2a296545a318eb80b447
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi! Tested the patchset on a Sierra Forest system using mostly the selftest=
 and
checking out the feature status. Verified all combinations of config option=
s and
cmdline arguments behave as expected.

Tested-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>

Kind regards
Maciej Wiecz=C3=B3r-Retman

On 2026-03-05 at 13:40:21 -0800, Sohil Mehta wrote:
>Linear Address Space Separation (LASS) is currently disabled [1] when
>support for vsyscall emulation is configured. This series extends LASS
>support specifically to the default XONLY mode (vsyscall=3Dxonly).
>
>Changes in v2
>-------------
>- Pick up review tags from Dave.
>- Improve commit messages based on feedback from Dave and Peter.
>- Minor change in patch 4 to avoid unnecessary clearing of CR4.LASS.
>
>v1: https://lore.kernel.org/lkml/20260219233600.154313-1-sohil.mehta@intel=
.com/
>
>Patches
>-------
>These patches were originally part of the v10 LASS series [2] before
>being split out into a smaller series to make it easier to review and
>merge. The overall approach to enable vsyscall support was okayed by
>Andy Lutomirski [3].
>
>The patches are based on the tip x86/cpu branch which has the recently
>merged LASS-EFI series [4].
>
>Issue
>-----
>Userspace attempts to access any kernel address generate a #GP when LASS
>is enabled. Legacy vsyscall functions are located in the address range
>0xffffffffff600000 - 0xffffffffff601000. Prior to LASS, default access
>(XONLY) to the vsyscall page would generate a page fault and the access
>would be emulated in the kernel. Currently, as the #GP handler lacks any
>emulation support, LASS is disabled when config X86_VSYSCALL_EMULATION
>is set.
>
>Solution
>--------
>These patches primarily update the #GP handler to reuse the existing
>vsyscall emulation code for #PF. In XONLY mode, the faulting RIP is
>readily available and can be used to determine if the #GP was triggered
>due to a vsyscall access.
>
>In contrast, the vsyscall EMULATE mode is deprecated and not expected to
>be used by anyone. Supporting EMULATE mode with LASS would require
>complex instruction decoding in the #GP fault handler, which is not
>worth the effort. So, LASS is disabled in the rare case when someone
>absolutely needs to enable vsyscall=3Demulate via the command line.
>
>Please find more details in the individual commit messages.
>
>Links
>-----
>[1]: https://lore.kernel.org/lkml/20251118182911.2983253-1-sohil.mehta@int=
el.com/
>[2]: https://lore.kernel.org/lkml/20251007065119.148605-1-sohil.mehta@inte=
l.com/
>[3]: https://lore.kernel.org/lkml/f4ae0030-9bc2-4675-ae43-e477cd894750@app=
.fastmail.com/
>[4]: https://lore.kernel.org/lkml/20260120234730.2215498-1-sohil.mehta@int=
el.com/
>
>Sohil Mehta (5):
>  x86/vsyscall: Reorganize the page fault emulation code
>  x86/traps: Consolidate user fixups in the #GP handler
>  x86/vsyscall: Restore vsyscall=3Dxonly mode under LASS
>  x86/vsyscall: Disable LASS if vsyscall mode is set to EMULATE
>  x86/cpu: Remove LASS restriction on vsyscall emulation
>
> .../admin-guide/kernel-parameters.txt         |  4 +-
> arch/x86/entry/vsyscall/vsyscall_64.c         | 89 +++++++++++--------
> arch/x86/include/asm/vsyscall.h               | 13 ++-
> arch/x86/kernel/cpu/common.c                  | 15 ----
> arch/x86/kernel/traps.c                       | 12 +--
> arch/x86/kernel/umip.c                        |  3 +
> arch/x86/mm/fault.c                           |  2 +-
> 7 files changed, 77 insertions(+), 61 deletions(-)
>
>
>base-commit: 68400c1aaf02636a97c45ba198110b66feb270a9
>--=20
>2.43.0
>

