Received: from mail.cyberchaos.dev (mail.cyberchaos.dev [195.39.247.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901223E63BB;
	Mon, 27 Jul 2026 08:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.39.247.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785142669; cv=none; b=nqYDbf3njmu5dtigs1+NtmkBgDAhtYnDcaR8Ez5mGjWpipgYoGudXgmp8dsXBHjiG/U/D2EXGtj5IEGLW6FuZ4WOOXYGtkq44zdZTV0YRXyIISPzlRsgBFzoGs0J3TrjYonLw7dr4InSCbOCwvi03k9MqrWWKgjUmTERrKI/kp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785142669; c=relaxed/simple;
	bh=PAiDucZtyf8K0PvPC0saGWZYzdGPKljSZig0W+u+INU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=upt38FZ5/02nShpH6/a0AFUa7XB/Oxz9yumnY0hs+wtRhOqpdQoho2OyTmGZqRnBpnYu9dwhA35Sq/PD4C7yI+GRauF4jyMVAfpYRQZ9Em5V+RQFPzB/ZOYR20jkwjTVks71g9P2b4eRaTqowEDWkPXc1CG26ZNapEacse9yraE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev; spf=pass smtp.mailfrom=cyberchaos.dev; dkim=pass (1024-bit key) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.b=BE0AFREN; arc=none smtp.client-ip=195.39.247.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.b="BE0AFREN"
Message-ID: <a6602971-87f8-4365-9ec2-dfe3a1ccfeb6@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1785142201;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4CxWBQDeU5xVUZ5kekhvvHmx15qwBTQL8qybV6/TlUs=;
	b=BE0AFRENAJ2UYvSuzj+AWbyilZ8oTXTQO56nKU42/MZmWf3/sO3HFk5Ofhvo4zmModtyau
	PLc2q+wTzDZVSoQAUkeVeFxhxnBuQRt+I5pd4LdnkY8mamlhpMddp0SRQaBrlhbV20ORIi
	ri2oeU8LRkBS+hWg2hIxpG/wiWBZIPw=
Date: Mon, 27 Jul 2026 10:49:57 +0200
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
Content-Language: en-US
From: Yureka Lilian <yureka@cyberchaos.dev>
In-Reply-To: <amE5bX0jey6WS0U1@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/22/26 23:43, Will Deacon wrote:
> On Sat, Jul 11, 2026 at 09:35:25AM +0200, Yureka Lilian wrote:
>> diff --git a/arch/arm64/lib/delay.c b/arch/arm64/lib/delay.c
>> index e278e060e78a..2452990ed37a 100644
>> --- a/arch/arm64/lib/delay.c
>> +++ b/arch/arm64/lib/delay.c
>> @@ -15,6 +15,8 @@
>>   
>>   #include <clocksource/arm_arch_timer.h>
>>   
>> +#include "../kernel/idle.h"
>> +
>>   #define USECS_TO_CYCLES(time_usecs)			\
>>   	xloops_to_cycles((time_usecs) * 0x10C7UL)
>>   
>> @@ -49,7 +51,8 @@ void __delay(unsigned long cycles)
>>   		 * Start with WFIT. If an interrupt makes us resume
>>   		 * early, use a WFET loop to complete the delay.
>>   		 */
>> -		wfit(end);
>> +		if (likely(idle == ARM64_IDLE_WFI))
>> +			wfit(end);
> Rather than scatter the idle implementation check across all users of
> WFI*, why not move this into the macro itself? That way, the callers can
> all stay like they are but the macro behaves as specified.
>
> Will

In practise, I could only find the following uses of WFI / WFIT / wfi() 
/ wfit() in arm64 code: 1) the default idle loop and delay() function; 
arguably the only "real" users 2) parking cores after different kinds of 
unexpected situations / crashes.

Just to confirm, you are suggesting to add the conditionals to 
arch/arm64/include/asm/barrier.h, and have wfi() and wfit() macros not 
actually do WFI / WFIT depending on the value of the idle param?

I'm torn about this: We should maybe first discuss what effect idle= 
should have: Should it prevent WFI running anywhere in the kernel when 
idle=nop, OR is its intended use case to change the default arm64 
implementations for idle and delay, while still allowing other parts of 
the kernel to use WFI (for example, for custom cpuidle implementation)? 
I think the existing nohlt parameter, which disables all idle states, is 
more fitting for the first goal, even though it currently does not 
prevent the wfit in the delay function.

For preventing WFI anywhere, I think alternatives patching based on the 
earlyparam would be the most reliable way to achieve that, and second 
most reliable way is putting the conditional in the wfi() / wfit() macros.

But my assumption is that what we want to achieve is actually closer to 
changing only the default idle implementation, while allowing an idle 
state registered at later point to still do its thing (including using 
WFI for this purpose). And for this (and to be more flexible with other 
idle modes e.g. yield), what I proposed in this patch makes more sense, 
and I'm relatively confident it will fulfill the Apple Silicon use case 
without adding many more scattered checks other than these two.
Does this make sense?


Thanks!

— Yureka


