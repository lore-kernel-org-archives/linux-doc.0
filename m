Received: from mail.cyberchaos.dev (mail.cyberchaos.dev [195.39.247.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0918A334C05;
	Fri, 31 Jul 2026 19:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.39.247.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785526340; cv=none; b=KGonfbzdvCERy587i65EXxq1iQcHOcbXcoUQxDFrokRwOPxPd63yK1DqjYflMWwvZoPcUVd2P5WFfdUNZa0eLQJvRyVdjjENYTpOHGmXqcdNzzbUWmBe0wAgqYVS/cbG+ywabGqccMTNHECyqUUMHcoLLf0/jm3BcWvtg/N9k0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785526340; c=relaxed/simple;
	bh=/x3DAX8mMJBaUM4CPpO3v+QMfwDWiNe/r4tGssdMriA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WlXZCACXK0ym6VYYQxIc4bPojvZYN1ZvOrp6CdN7xtCMhZoZj2/Pprz7/E3+NLW00EMucLPcL1/Q+Uj3HZziklGS/A3Fa+KbAK6iLMREw03xnG+X/VjNwm237A7SrAZV39yRNKcmhRkuQdVEiS7YaPnJgYndiMudN3qb96Sr+MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev; spf=pass smtp.mailfrom=cyberchaos.dev; dkim=pass (1024-bit key) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.b=4JL39Brv; arc=none smtp.client-ip=195.39.247.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.b="4JL39Brv"
Message-ID: <90d1e043-22bd-4396-9661-7d6bc09c577b@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1785526329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O4jqEg0X0hwJwDC02WsOCU0Xy7yncoYUpeBkZdxksZM=;
	b=4JL39BrvYPYHsvFJM4CNpZONrevzOx+RknRAnMGzuncHoduVpTabTilU9U7fGI7yy6djzt
	RZMtGqu5HL4gAtCNxIJt//HzjelpMA/vQCJIEe8h9P/29CjtPSIOs01+9KLkzuwpZaGjfe
	rUEqfjXt/Kt4ZCEVTWPLRvckwT7+krI=
Date: Fri, 31 Jul 2026 21:32:04 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2] arch: arm64: add early_param idle=<wfi|yield|nop>
To: Will Deacon <will@kernel.org>, Yureka Lilian <yureka@cyberchaos.dev>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260711-arm64-idle-param-v2-1-0ab67652a435@cyberchaos.dev>
 <amE5bX0jey6WS0U1@willie-the-truck>
 <a6602971-87f8-4365-9ec2-dfe3a1ccfeb6@cyberchaos.dev>
 <amzKZgqrqqM7E_9Q@google.com>
Content-Language: en-US
From: Yureka Lilian <yureka@cyberchaos.dev>
In-Reply-To: <amzKZgqrqqM7E_9Q@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/31/26 18:16, Will Deacon wrote:
> Hi Yureka,
>
> On Mon, Jul 27, 2026 at 10:49:57AM +0200, Yureka Lilian wrote:
>> On 7/22/26 23:43, Will Deacon wrote:
>>> On Sat, Jul 11, 2026 at 09:35:25AM +0200, Yureka Lilian wrote:
>>>> diff --git a/arch/arm64/lib/delay.c b/arch/arm64/lib/delay.c
>>>> index e278e060e78a..2452990ed37a 100644
>>>> --- a/arch/arm64/lib/delay.c
>>>> +++ b/arch/arm64/lib/delay.c
>>>> @@ -15,6 +15,8 @@
>>>>    #include <clocksource/arm_arch_timer.h>
>>>> +#include "../kernel/idle.h"
>>>> +
>>>>    #define USECS_TO_CYCLES(time_usecs)			\
>>>>    	xloops_to_cycles((time_usecs) * 0x10C7UL)
>>>> @@ -49,7 +51,8 @@ void __delay(unsigned long cycles)
>>>>    		 * Start with WFIT. If an interrupt makes us resume
>>>>    		 * early, use a WFET loop to complete the delay.
>>>>    		 */
>>>> -		wfit(end);
>>>> +		if (likely(idle == ARM64_IDLE_WFI))
>>>> +			wfit(end);
>>> Rather than scatter the idle implementation check across all users of
>>> WFI*, why not move this into the macro itself? That way, the callers can
>>> all stay like they are but the macro behaves as specified.
>> In practise, I could only find the following uses of WFI / WFIT / wfi() /
>> wfit() in arm64 code: 1) the default idle loop and delay() function;
>> arguably the only "real" users 2) parking cores after different kinds of
>> unexpected situations / crashes.
>>
>> Just to confirm, you are suggesting to add the conditionals to
>> arch/arm64/include/asm/barrier.h, and have wfi() and wfit() macros not
>> actually do WFI / WFIT depending on the value of the idle param?
>>
>> I'm torn about this: We should maybe first discuss what effect idle= should
>> have: Should it prevent WFI running anywhere in the kernel when idle=nop, OR
>> is its intended use case to change the default arm64 implementations for
>> idle and delay, while still allowing other parts of the kernel to use WFI
>> (for example, for custom cpuidle implementation)? I think the existing nohlt
>> parameter, which disables all idle states, is more fitting for the first
>> goal, even though it currently does not prevent the wfit in the delay
>> function.
> I think nohlt will break the PSCI cpuidle proposal here:
>
> https://lore.kernel.org/all/20260708-efi-psci-v1-0-9efb3abf0e4c@kernel.org/
>
>> For preventing WFI anywhere, I think alternatives patching based on the
>> earlyparam would be the most reliable way to achieve that, and second most
>> reliable way is putting the conditional in the wfi() / wfit() macros.
>>
>> But my assumption is that what we want to achieve is actually closer to
>> changing only the default idle implementation, while allowing an idle state
>> registered at later point to still do its thing (including using WFI for
>> this purpose). And for this (and to be more flexible with other idle modes
>> e.g. yield), what I proposed in this patch makes more sense, and I'm
>> relatively confident it will fulfill the Apple Silicon use case without
>> adding many more scattered checks other than these two.
>> Does this make sense?
> I keep changing my mind about this patch :/
Ultimately I'm happy we found a solution which covers the Apple Silicon 
use case while also not making too much of a mess elsewhere, and I 
appreciate your feedback a lot!
>
> What do you think about a funny sort of hybrid approach where:
>
>    * We have idle=, but it really only affects the idle loop
>    * We have a cpu_errata entry to detect (based on the MIDR) this CPU
>      and then avoid patching in the WFIT instructions (i.e. don't detect
>      the ARM64_HAS_WFXT capability).
>
> I think that would solve the case for you, as well as giving others finer
> grained control over the idle implementation and adding the infrastructure
> we need to handle a CPU with broken wfit.

The idle param portion, if implemented like you say only affecting the 
idle loop, should be rather uncontroversial.

Getting the other part of it (the WFIT in the delay function) right is 
much more difficult, but it also has less of an performance / efficiency 
impact if it's a bit on the conservative side and we can find a good 
solution independently of the idle param.

>
> Will

Thanks,

- Yureka

