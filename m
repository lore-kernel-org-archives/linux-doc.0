Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF93396D03
	for <linux-doc@vger.kernel.org>; Tue,  7 Jul 2026 13:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783432105; cv=none; b=DDScehHTkabrTRGaHA0/ynDxr0T77B91AbhzUhOE5lwmorcrtLgx/FWOZsGo5+eYoCfNXpGwr+70lecbtmEb8PLdo5x9stqJfZvEviO2HPAMFW1pegwWeeKBs/b/aaUkG3iRPo9ZFJ2G5mJqqbb/J4ih/ZZeVKkVfjLOUct/2UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783432105; c=relaxed/simple;
	bh=lV2ecVLVmUkiH1L5MUI1hTKEJivARA9v/wLdH6Cr1dY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K8K5Srrcwo6AFslMY6cKWIai+fF1uEXe72CD6Y95mdALwnVmgi3eFeRZOUuKimoQ9MOHq/9nlLu6LK19uTUeR8CjxpPybZrVbqBZ+JmQvtGTHdWp05b2BpC2zZ7Jhcp4kdIqk/2V/ZNrbmsK5d97EwMcLIIz5ZugMjVZHxvbgEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=jxfgT/1X; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="jxfgT/1X"
Message-ID: <4320145e-a0ba-40f6-b99b-f01f32634f28@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783432101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PeXRy5OWREcqxAhLOrbYEMd2NpniYtCVndcj0EJ5z58=;
	b=jxfgT/1XOYBNftDoCCQtjO1UTLEGZqcaSM3erJbI5MSNI1hw+uNxPNVFEMZ1k1OYxIlRDQ
	bARn0NHa6HqJR4RgWsVPTof/V3DqEHP8Agcf7McGO5jsUtB+UuoOAeU8Yl+tlkM+J2dtsj
	WHZIZ7UGeXrjpEtk5qwhtCKwL02ZdUo=
Date: Tue, 7 Jul 2026 21:48:02 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] mm/mseal: fix mseal documentation for 32-bit kernels
To: Pedro Falcato <pfalcato@suse.de>
Cc: linux-mm@kvack.org, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Liam R . Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Nathan Chancellor <nathan@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>,
 Nicolas Schier <nsc@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Alice Ryhl <aliceryhl@google.com>, Douglas Anderson <dianders@chromium.org>,
 Gary Guo <gary@garyguo.net>, Anand Moon <linux.amoon@gmail.com>,
 Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20260703022507.187457-1-leon.hwang@linux.dev>
 <akeDk49-pPgUDek1@pedro-suse>
 <8f75dc18-dd4c-4989-a76c-eec6cc513ccf@linux.dev>
 <akzN_HNJJWBW7htL@pedro-suse.lan>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Leon Hwang <leon.hwang@linux.dev>
In-Reply-To: <akzN_HNJJWBW7htL@pedro-suse.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 2026/7/7 18:01, Pedro Falcato wrote:
> On Fri, Jul 03, 2026 at 10:50:29PM +0800, Leon Hwang wrote:
>> On 2026/7/3 17:44, Pedro Falcato wrote:
[...]
>>>
>>>>  
>>>>    The following architectures currently support this feature: x86-64, arm64,
>>>> -  loongarch and s390.
>>>> +  loongarch, riscv, and s390.
>>>
>>> This is also useless, every 64-bit architecture will support this.
>>
>>
>> Do you mean dropping this sentence, or this change?
> 
> This sentence (this is not architecture specific...).


Got it.

> 
>>
>>>
>>>>  
>>>>    WARNING: This feature breaks programs which rely on relocating
>>>>    or unmapping system mappings. Known broken software at the time
>>>> diff --git a/init/Kconfig b/init/Kconfig
>>>> index 5230d4879b1c..12bb39f637b1 100644
>>>> --- a/init/Kconfig
>>>> +++ b/init/Kconfig
>>>> @@ -2112,7 +2112,7 @@ config ARCH_SUPPORTS_MSEAL_SYSTEM_MAPPINGS
>>>>  	  from a kernel perspective.
>>>>  
>>>>  	  After the architecture enables this, a distribution can set
>>>> -	  CONFIG_MSEAL_SYSTEM_MAPPING to manage access to the feature.
>>>> +	  CONFIG_MSEAL_SYSTEM_MAPPINGS to manage access to the feature.
>>>>  
>>>>  	  For complete descriptions of memory sealing, please see
>>>>  	  Documentation/userspace-api/mseal.rst
>>>> diff --git a/mm/mseal.c b/mm/mseal.c
>>>> index 9781647483d1..0464c7b94ab9 100644
>>>> --- a/mm/mseal.c
>>>> +++ b/mm/mseal.c
>>>> @@ -132,8 +132,8 @@ static int mseal_apply(struct mm_struct *mm,
>>>>   *   addr is not a valid address (not allocated).
>>>>   *   end (start + len) is not a valid address.
>>>>   *   a gap (unallocated memory) between start and end.
>>>> - *  -EPERM:
>>>> - *  - In 32 bit architecture, sealing is not supported.
>>>> + *  -EINTR:
>>>> + *   interrupted while waiting for the mmap write lock.
>>>>   * Note:
>>>>   *  user can call mseal(2) multiple times, adding a seal on an
>>>>   *  already sealed memory is a no-action (no error).
>>>
>>> And this whole header needs to be deleted as well. No one's looking at
>>> kernel code for documentation (and if they are, we did a horrendous job
>>> at actually documenting the thing).
>>>
>>
>> Just to confirm, do you mean removing the entire function comment above
>> do_mseal()?
> 
> Yes. Again, not your fault, just old gripes :)
> 

Got it.

Thanks,
Leon


