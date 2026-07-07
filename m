Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA155421EF6
	for <linux-doc@vger.kernel.org>; Tue,  7 Jul 2026 13:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783432258; cv=none; b=jt2ZWuh8d0XjlQarN0B7z8mVqSYdcv+EloUseGk8olMg3RrkIkNL22UCWKa0lgiBrhVa3a/1tI65JqKFO5PGR8e9NhpD6E0eN+IP9Y37q08iarjlWoIdyZy5DktM0jEv5yn4yraWvBxX6H+X+4DUrd7WGh+ZeizkOB53AdHCsYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783432258; c=relaxed/simple;
	bh=EblJGDDzazXZnZoXboX74MaUA/IesH8hpC0W2Plf1JQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j6jEnsvaxo7eZl+gJuZhbgeu5A4dEe4EDYZEGoqH9lmR1uxGHU1Urk4N4TLUWnJMRCGK6dGUvyaZkDw5eT0OuuZkcgFLeSfrzeFALX1OuMDxS6CU1q3OMFQllV2BgtqLKIpFTQ7kw0XCVDLEypGQIDOt+t7O8Ak5sLx4LjFAigY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=kNXg8Bh/; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="kNXg8Bh/"
Message-ID: <dd21ee9a-a7a9-46a2-b151-0f5c486772bd@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783432252;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U/pD5OdgWh4vEEhKM48CFXryGtzNwFwor3KN08M92Y0=;
	b=kNXg8Bh/q9j4Llb5rtZWfxrp9Lr2mMLw00i06Tq8leWaM2xmpar4qi+HxLU7esLXEoV2hT
	lRYT5Gna157c2xqc0Rz7Zhbcegjm1LDQ8bTTfNSUnWM44I5A9LU6MiAs96di/YcXOoMgdY
	DHVW9lVr15gj7wPwJRUzkGHE0XkrPW4=
Date: Tue, 7 Jul 2026 21:50:31 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] mm/mseal: fix mseal documentation for 32-bit kernels
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: linux-mm@kvack.org, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Liam R . Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Nathan Chancellor <nathan@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>,
 Nicolas Schier <nsc@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Douglas Anderson <dianders@chromium.org>,
 Gary Guo <gary@garyguo.net>, Anand Moon <linux.amoon@gmail.com>,
 Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20260703022507.187457-1-leon.hwang@linux.dev>
 <20260703114128-2a7a4723-0060-436b-99d9-7499bd90fa82@linutronix.de>
 <b6f5f3b2-bf62-4b77-9c74-debbed9a4738@linux.dev>
 <20260707122827-2d6c18d3-8e02-4d9a-bb29-2ec46e759645@linutronix.de>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Leon Hwang <leon.hwang@linux.dev>
In-Reply-To: <20260707122827-2d6c18d3-8e02-4d9a-bb29-2ec46e759645@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On 2026/7/7 18:34, Thomas Weißschuh wrote:
> On Fri, Jul 03, 2026 at 11:09:55PM +0800, Leon Hwang wrote:
>> On 2026/7/3 17:44, Thomas Weißschuh wrote:
>>> On Fri, Jul 03, 2026 at 10:25:07AM +0800, Leon Hwang wrote:
>>> (...)
>>>
>>>>    The following architectures currently support this feature: x86-64, arm64,
>>>> -  loongarch and s390.
>>>> +  loongarch, riscv, and s390.
>>>
>>> For per-architecture feature documentation we also have
>>> Documentation/features/. Maybe move it there.
>>
>> Better to replace with a reference to the feature doc?
>>
>> +  Refer to :doc:`features/core/mseal_sys_mappings/arch-support` for the
>> +  support status of each architecture.
> 
> It should automatically show up here:
> https://www.kernel.org/doc/html/latest/admin-guide/features.html
> 
> See also Documentation/sphinx/kernel_feat.py
> 
> So I don't think an explicit link is necessary.
> But the maintainers might disagree.
> In my opinion the link should then go to the rendered table entry.
> 

Let us drop the sentence following Pedro's suggestion.

Thanks,
Leon

