Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004B53D9030
	for <linux-doc@vger.kernel.org>; Fri,  3 Jul 2026 15:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783091424; cv=none; b=IsiwVkTBkoY9sNjT17ekcUo7L7YQOBEgzXcRB1+SqXGoLfDlPfZryHQXsSqPondNFythU5y1WHg0/dQhqM5X9yxerjdB5dd3IjFAJfNcUQwJ6Xumnyv31K1W50dg7zZRs1LFV1IjNVa6XAi9NGzkiIyRFlEXx1TT9WP9sL7A6bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783091424; c=relaxed/simple;
	bh=gMq49LfcOOMy7F8qJulmEnCAYgqGsKpGp2FMwqmiwLA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kKZizvRX/2a0vEw+VXfVHxZdbGLKOEf4hTC4zpp5wxECFC42R/HIW8rvCRO92oTtw1WcWlb4rIXLmP4egE5bB3bjCYkkj5G6aX9WPmiQI6I3qh9jOQ0FcxaXMquEwAx8VJzbHmEZb3AUiXa8RYSDsN68GcHCpURLXieAEDX2s+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=j/vuK0n+; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="j/vuK0n+"
Message-ID: <b6f5f3b2-bf62-4b77-9c74-debbed9a4738@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783091420;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D0jQhMPhscsL1NbyNjS1WJWCL9R2xskq5LtPdLuRjgQ=;
	b=j/vuK0n+G28zyIBLktJU1GlREKmOyVhgVtBHvZIfkZ4ZTiO05suHg86BY+INcDSH3/rzg2
	eYKS5nnCjeL0L8QyipRBNB3i4lx61WmR8qewTnZB8a6H4G6v1/uqV3zSQLbG+NWz4f4tBv
	P9w44JsWEgPbVPjshqUB3G39TMkvs9Y=
Date: Fri, 3 Jul 2026 23:09:55 +0800
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
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Leon Hwang <leon.hwang@linux.dev>
In-Reply-To: <20260703114128-2a7a4723-0060-436b-99d9-7499bd90fa82@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On 2026/7/3 17:44, Thomas Weißschuh wrote:
> On Fri, Jul 03, 2026 at 10:25:07AM +0800, Leon Hwang wrote:
> (...)
> 
>>    The following architectures currently support this feature: x86-64, arm64,
>> -  loongarch and s390.
>> +  loongarch, riscv, and s390.
> 
> For per-architecture feature documentation we also have
> Documentation/features/. Maybe move it there.


Better to replace with a reference to the feature doc?

+  Refer to :doc:`features/core/mseal_sys_mappings/arch-support` for the
+  support status of each architecture.

Thanks,
Leon

> 
>>  
>>    WARNING: This feature breaks programs which rely on relocating
>>    or unmapping system mappings. Known broken software at the time
> 
> (...)

