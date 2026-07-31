Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D65446830;
	Fri, 31 Jul 2026 16:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785514611; cv=none; b=S7QZ3akzcGMmihm5xwbxFdngu8mNsblFv9YHnlXkuwAVohiSKkWul924cAS2vYA5HLuLYK4/v2HB+cPJzJhVhUeE0Jq3s9NnYVECF3KZG/1WtVfBDLEx0g2YTFxY4KBwdTqhTRuzAxZ0I0eNJYJvVZDLp1OfDui18wOwPVDmmDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785514611; c=relaxed/simple;
	bh=GIjPD1w5OHB2P7Y0c5tY4ojefDrpxx1+O22kGut4bwE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SHDXPJksZWd/XjWV5HW1FI+8SVe1sMAlWWl+HLUc0hDNf1qy6dWWw9vTv5qmWmH0uOBMbNFBuP0op8FJ63lQFueHvamrazpflHAIoLl7vr42EWhkXKsFjccKwpQyia3z7dlvYYgqU0YigJ/iCrACHbL8CTPjfFglP116hQ9cv5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f7YBLmtn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f7YBLmtn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 936231F00AC4;
	Fri, 31 Jul 2026 16:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785514603;
	bh=iTHe1fmNUO9bvL9hCjLeub+8/tAAP+2ZQbhY2uHobs4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=f7YBLmtnFmTslofGzS3hwbZxgz4GJWBwGCfZ2n/xsQV6wD1takhdmkFvCjGSLZWmE
	 pZKWQU6ozvZhrilus4n1XAB7J4loKay8CBeiOYTNc3/XmLAilMjky7Lzxnz0SisaxC
	 o/xwV83soagMYdxB1xPD2UNG0XtDxQaJE/XFjnXn4eHm9KCZDYD9gp/w8EL3NwYQzy
	 ZresMeF1Kp+IJ2C7eKinAa2EaNNmF0Pl4eeTebclz8cSzMz4HkkxmVMKPG32hwn4i7
	 kdUyqu2dklna0+IXAWLI2mV//2cin5GnIlYmEiv2ToRjFfOMuCfq1PEkMCo+Ejbejf
	 Gxpd9Xe1fWwow==
Date: Fri, 31 Jul 2026 17:16:38 +0100
From: Will Deacon <will@kernel.org>
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] arch: arm64: add early_param idle=<wfi|yield|nop>
Message-ID: <amzKZgqrqqM7E_9Q@google.com>
References: <20260711-arm64-idle-param-v2-1-0ab67652a435@cyberchaos.dev>
 <amE5bX0jey6WS0U1@willie-the-truck>
 <a6602971-87f8-4365-9ec2-dfe3a1ccfeb6@cyberchaos.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a6602971-87f8-4365-9ec2-dfe3a1ccfeb6@cyberchaos.dev>

Hi Yureka,

On Mon, Jul 27, 2026 at 10:49:57AM +0200, Yureka Lilian wrote:
> On 7/22/26 23:43, Will Deacon wrote:
> > On Sat, Jul 11, 2026 at 09:35:25AM +0200, Yureka Lilian wrote:
> > > diff --git a/arch/arm64/lib/delay.c b/arch/arm64/lib/delay.c
> > > index e278e060e78a..2452990ed37a 100644
> > > --- a/arch/arm64/lib/delay.c
> > > +++ b/arch/arm64/lib/delay.c
> > > @@ -15,6 +15,8 @@
> > >   #include <clocksource/arm_arch_timer.h>
> > > +#include "../kernel/idle.h"
> > > +
> > >   #define USECS_TO_CYCLES(time_usecs)			\
> > >   	xloops_to_cycles((time_usecs) * 0x10C7UL)
> > > @@ -49,7 +51,8 @@ void __delay(unsigned long cycles)
> > >   		 * Start with WFIT. If an interrupt makes us resume
> > >   		 * early, use a WFET loop to complete the delay.
> > >   		 */
> > > -		wfit(end);
> > > +		if (likely(idle == ARM64_IDLE_WFI))
> > > +			wfit(end);
> > Rather than scatter the idle implementation check across all users of
> > WFI*, why not move this into the macro itself? That way, the callers can
> > all stay like they are but the macro behaves as specified.
> 
> In practise, I could only find the following uses of WFI / WFIT / wfi() /
> wfit() in arm64 code: 1) the default idle loop and delay() function;
> arguably the only "real" users 2) parking cores after different kinds of
> unexpected situations / crashes.
> 
> Just to confirm, you are suggesting to add the conditionals to
> arch/arm64/include/asm/barrier.h, and have wfi() and wfit() macros not
> actually do WFI / WFIT depending on the value of the idle param?
> 
> I'm torn about this: We should maybe first discuss what effect idle= should
> have: Should it prevent WFI running anywhere in the kernel when idle=nop, OR
> is its intended use case to change the default arm64 implementations for
> idle and delay, while still allowing other parts of the kernel to use WFI
> (for example, for custom cpuidle implementation)? I think the existing nohlt
> parameter, which disables all idle states, is more fitting for the first
> goal, even though it currently does not prevent the wfit in the delay
> function.

I think nohlt will break the PSCI cpuidle proposal here:

https://lore.kernel.org/all/20260708-efi-psci-v1-0-9efb3abf0e4c@kernel.org/

> For preventing WFI anywhere, I think alternatives patching based on the
> earlyparam would be the most reliable way to achieve that, and second most
> reliable way is putting the conditional in the wfi() / wfit() macros.
> 
> But my assumption is that what we want to achieve is actually closer to
> changing only the default idle implementation, while allowing an idle state
> registered at later point to still do its thing (including using WFI for
> this purpose). And for this (and to be more flexible with other idle modes
> e.g. yield), what I proposed in this patch makes more sense, and I'm
> relatively confident it will fulfill the Apple Silicon use case without
> adding many more scattered checks other than these two.
> Does this make sense?

I keep changing my mind about this patch :/

What do you think about a funny sort of hybrid approach where:

  * We have idle=, but it really only affects the idle loop
  * We have a cpu_errata entry to detect (based on the MIDR) this CPU
    and then avoid patching in the WFIT instructions (i.e. don't detect
    the ARM64_HAS_WFXT capability).

I think that would solve the case for you, as well as giving others finer
grained control over the idle implementation and adding the infrastructure
we need to handle a CPU with broken wfit.

Will
