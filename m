Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99763BED23
	for <linux-doc@vger.kernel.org>; Thu, 28 May 2026 12:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779973189; cv=none; b=GklBCnF2xxv6nOrEINt19S72ybnzkqKEtj10REsZ2H+ngvwG5wIwWovXePSA/uZWdBwza2jQJNq1ZhIDb7VbThJzNvuaGhxGL84eTzCVNwUKAez7r+PHBzD0lvYcjYwOgmVEEaxEJU8A3IK5+JjOcwI89gwhfzn11206BFB/iLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779973189; c=relaxed/simple;
	bh=sIou1/uCXi+iGnp3M+/32mIuL66viWaxtFcS2RSdN1c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C3l5ErdugTvR8PaQpdxN2xA/IOo1rDZwgYrzqW5MuPNcySUtrS859Wsr2NjGUMqE2rfm6KnAGO2jqvq8yCPgjewMEVIhHPAzoTtGgf1fVbRT0AAM6CfqfUP6O6B37xeFTOgnlzzECzZ5uNTbCB/nypGB0Bb4dgLFEPrLVfGtrIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=gEgOWBYl; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="gEgOWBYl"
Message-ID: <6ca2af4a-90ed-4d7e-9c21-42ebffddc3fe@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1779973183;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/7aIdks3CmcGjyyyeA3kszxapotlnaFMZvWoNmtYiZ8=;
	b=gEgOWBYleLfJ4o8TSg0b50sNALcy2gCscDl4hn9L3rEguhiBPhziUkl0d99DPhO9vrbiJA
	YW1cr5Ep5I+x6SCOT8z3GK/UPBroP4o1fdzutyJQgI702NZG5ifiEXWxWOJ0OmwG8O9ddc
	PPlposNDvM6/0Ynl+Tvu6F1gAfrF4uI=
Date: Thu, 28 May 2026 13:59:37 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: =?UTF-8?B?UmU6IOetlOWkjTog562U5aSNOiBb5aSW6YOo6YKu5Lu2XSBSZTogW1BB?=
 =?UTF-8?Q?TCH=5D_mm/mempool=3A_use_static_key_for_boot-time_debug_enablemen?=
 =?UTF-8?Q?t?=
To: "Li,Rongqing(ACG CCN)" <lirongqing@baidu.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Hao Li <hao.li@linux.dev>,
 Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>
References: <20260527104634.2434-1-lirongqing@baidu.com>
 <20260527130337.983366-1-usama.arif@linux.dev>
 <fcf5585aba18414cbd0ab01935eeb1df@baidu.com>
 <ddb499d5-6821-4fa7-9fec-563bdfbc8cbc@linux.dev>
 <b9d53cb0be024778b09e1bb1ef7d0211@baidu.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Usama Arif <usama.arif@linux.dev>
In-Reply-To: <b9d53cb0be024778b09e1bb1ef7d0211@baidu.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 28/05/2026 11:50, Li,Rongqing(ACG CCN) wrote:
> 
> 
>>
>> On 28/05/2026 04:00, Li,Rongqing(ACG CCN) wrote:
>>>>> From: Li RongQing <lirongqing@baidu.com>
>>>>>
>>>>> Replace the #ifdef CONFIG_SLUB_DEBUG_ON conditional compilation with
>>>>> a static key (mempool_debug_enabled). This allows enabling mempool
>>>>> debugging at boot time via:
>>>>>
>>>>>     mempool_debug
>>>>>
>>>>> Instead of requiring CONFIG_SLUB_DEBUG_ON at compile time. Benefits:
>>>>>
>>>>> - Debugging can be enabled without rebuilding the kernel
>>>>> - Uses standard kernel static_key mechanism with minimal overhead
>>>>>
>>>>> Suggested-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
>>>>> Signed-off-by: Li RongQing <lirongqing@baidu.com>
>>>>> Cc: Vlastimil Babka <vbabka@kernel.org>
>>>>> Cc: Harry Yoo <harry@kernel.org>
>>>>> Cc: Andrew Morton <akpm@linux-foundation.org>
>>>>> Cc: Hao Li <hao.li@linux.dev>
>>>>> Cc: Christoph Lameter <cl@gentwo.org>
>>>>> Cc: David Rientjes <rientjes@google.com>
>>>>> Cc: Roman Gushchin <roman.gushchin@linux.dev>
>>>>> ---
>>>>>  Documentation/admin-guide/kernel-parameters.txt |  5 ++++
>>>>>  mm/mempool.c                                    | 32
>>>> ++++++++++++++++++-------
>>>>>  2 files changed, 28 insertions(+), 9 deletions(-)
>>>>>
>>>>> diff --git a/Documentation/admin-guide/kernel-parameters.txt
>>>>> b/Documentation/admin-guide/kernel-parameters.txt
>>>>> index 35ed9dc..5a070e6 100644
>>>>> --- a/Documentation/admin-guide/kernel-parameters.txt
>>>>> +++ b/Documentation/admin-guide/kernel-parameters.txt
>>>>> @@ -3998,6 +3998,11 @@ Kernel parameters
>>>>>  			Note that even when enabled, there are a few cases where
>>>>>  			the feature is not effective.
>>>>>
>>>>> +	mempool_debug	[MM]
>>>>> +			Enable mempool debugging. This enables element
>>>>> +			poison checking when freeing elements back to the
>>>>> +			pool. Useful for debugging mempool corruption.
>>>>> +
>>>>>  	memtest=	[KNL,X86,ARM,M68K,PPC,RISCV,EARLY] Enable
>> memtest
>>>>>  			Format: <integer>
>>>>>  			default : 0 <disable>
>>>>> diff --git a/mm/mempool.c b/mm/mempool.c index db23e0e..4f429a1
>>>> 100644
>>>>> --- a/mm/mempool.c
>>>>> +++ b/mm/mempool.c
>>>>> @@ -16,11 +16,28 @@
>>>>>  #include <linux/export.h>
>>>>>  #include <linux/mempool.h>
>>>>>  #include <linux/writeback.h>
>>>>> +#include <linux/static_key.h>
>>>>> +#include <linux/init.h>
>>>>>  #include "slab.h"
>>>>>
>>>>>  static DECLARE_FAULT_ATTR(fail_mempool_alloc);
>>>>>  static DECLARE_FAULT_ATTR(fail_mempool_alloc_bulk);
>>>>>
>>>>> +/*
>>>>> + * Debugging support for mempool using static key.
>>>>> + *
>>>>> + * This allows enabling mempool debug at boot time via:
>>>>> + *   mempool_debug
>>>>> + */
>>>>> +static DEFINE_STATIC_KEY_FALSE(mempool_debug_enabled);
>>>>> +
>>>>> +static int __init mempool_debug_setup(char *str) {
>>>>> +	static_branch_enable(&mempool_debug_enabled);
>>>>> +	return 0;
>>>>> +}
>>>>> +early_param("mempool_debug", mempool_debug_setup);
>>>>> +
>>>>
>>>> Can static_branch_enable() in mempool_debug_setup() run before
>>>> jump_label_init() has set static_key_initialized?
>>>>
>>>> Looking at start_kernel() in init/main.c:
>>>>
>>>> 	setup_arch(&command_line);
>>>> 	mm_core_init_early();
>>>> 	/* Static keys and static calls are needed by LSMs */
>>>> 	jump_label_init();
>>>> 	...
>>>> 	/* parameters may set static keys */
>>>> 	parse_early_param();
>>>>
>>>> This will trigger the warning in include/linux/jump_label.h has:
>>>>
>>>> 	#define STATIC_KEY_CHECK_USE(key) WARN(!static_key_initialized, \
>>>> 	    "%s(): static key '%pS' used before call to jump_label_init()", \
>>>> 	    __func__, (key))
>>>>
>>>>
>>>> mm/dmapool.c registers an equivalent debug toggle via __setup()
>>>> rather than
>>>> early_param():
>>>>
>>>> 	static int __init dmapool_debug_setup(char *str)
>>>> 	{
>>>> 		static_branch_enable(&dmapool_debug_enabled);
>>>> 		return 1;
>>>> 	}
>>>> 	__setup("dmapool_debug", dmapool_debug_setup);
>>>>
>>>> I think you can reuse that.
>>>
>>> Thanks for your review!
>>>
>>> While this boot-time ordering used to be a generic issue, it seems
>>> many architectures have already aligned or fixed this internally. For
>>> instance,
>>>
>>> commit ca829e05d3d4 ("powerpc/64: Init jump labels before
>>> parse_early_param()") and commit 6070970db9fe ("m68k: Initialize jump
>>> labels early during setup_arch()") explicitly relocated jump_label_init() before
>> the early parameter parsing.
>>>
>>
>> I think 32 bit ARM doesnt?
> 
> You are right, 32-bit ARM doesn't. 
> 
> However, the correct architectural approach should be fixing the boot sequence 
> inside arch/arm/ to match arm64 , powerpc and m68k, rather than compromising core MM 
> code with temporary boilerplate variables.
> 
> I prefer to keep the mempool implementation clean. If ARM32 triggers the 
> warning, the proper remedy is a follow-up patch to align its setup_arch() 
> ordering.
> 
> What do you think?
> 

I think it would be a prerequisite rather than a follow up patch inorder to not
break 32 bit arm. I will let ARM and slab maintainers decide on this. 


