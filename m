Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B3C21A423
	for <linux-doc@vger.kernel.org>; Fri, 20 Dec 2024 19:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734722079; cv=none; b=jW7pFNJlz1oJlkBMTLZ6WJtOy/yBza8Z3f7TX5Nq4YNfiXTdM0BUcfwBSTyADSnJH6oGaKEdVvDDXi+osbtvFNnDXpswz/KMBloqjogBV8zkby2Umf5RFCuiA1qh+pT0QWwGAvRTOIXYGh/BMYpJEOSJ/fnP0m9ZmmN+48BKJ/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734722079; c=relaxed/simple;
	bh=Ncxpi5ozh9nT7s1aKnFr1UJDi94Q9Uz5Zp1szedeBLs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=MoNa9pFvBrkhy4Oui6SYFUOnBIXSTH3w5S+e3o5JKRRsE/XFI0XP7g5ZRieOBjgUHA7OXFM2lFFGcLLf2EY+TJNW1elHc5CePcmTvrYIFxLKzVZbjF5h8m05z/yuUjn6yB+KttM2pVLCmvdgg9NbQzSLdgblKVP0kllyMmdbocQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=KOFMyUzF; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="KOFMyUzF"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=GSmbtptLAfvM7F6AkplYWsRt51X4hhhNe9MvZz5bZ5w=; b=KOFMyUzFq9EaN0/FrhUlxEcdZm
	G6sTtmyaBipUMbBUnsUBw4lXfJ3soZDSTp6sFGzV+Lphdi8TJRqbSEO3EYYbR/hELl87Dtp/vvy5X
	vZ2/dhyxqcJjtUHAIsHT4iYU0oyIR6pThZQkadfHnRAkpkCJVsN/riIex589Wc5COPxLgX/q73N+p
	qDPtI3+kCfgK2Q3uc4BI4wv/BGlWL9oJ135Nqla7Lef3cpX5V8BthzCrfo06YEbmHatnoGukS82MS
	bI9jR/J2qT8hxXdv7qoaj4AfsnTGHkkNIw7PV5UiiYdBFuT6D5HweA/eRC+uJK2z3NwrloEEgMeqt
	z+4mscPw==;
Received: from [50.53.2.24] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tOiSF-00000005lBO-3yFK;
	Fri, 20 Dec 2024 19:14:33 +0000
Message-ID: <93403b32-c588-4dd4-af0e-b60a550ea556@infradead.org>
Date: Fri, 20 Dec 2024 11:14:26 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Bug in kernel-doc ("-" misinterpretation)
To: Vegard Nossum <vegard.nossum@oracle.com>,
 John Ousterhout <ouster@cs.stanford.edu>, linux-doc@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>
References: <CAGXJAmzfRzE=A94NT5ETtj3bZc-=2oLg-9E5Kjh4o_-iuw1q8g@mail.gmail.com>
 <78b837e5-5fdf-47b3-8f83-824777ba0569@infradead.org>
 <31a0a954-7d45-4ec1-ad55-50a788ddcbeb@oracle.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <31a0a954-7d45-4ec1-ad55-50a788ddcbeb@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Vegard,

On 12/19/24 11:10 PM, Vegard Nossum wrote:
> 
> On 20/12/2024 06:02, Randy Dunlap wrote:
>> On 12/19/24 10:37 AM, John Ousterhout wrote:
>>> kernel-doc gets confused by code like the following:
>>>
>>> /**
>>>   * define HOMA_MIN_DEFAULT_PORT - The 16-bit port space is divided into
>>>   * two nonoverlapping regions. Ports 1-32767 are reserved exclusively
>>>   * for well-defined server ports. The remaining ports are used for client
>>>   * ports; these are allocated automatically by Homa. Port 0 is reserved.
>>>   */
>>> #define HOMA_MIN_DEFAULT_PORT 0x8000
>>>
>>> It seems to use the last "-" on the line (the one in "16-bit") rather
>>> than the first one, so it produces the following false error message:
>>>
>>> homa.h:50: warning: expecting prototype for HOMA_MIN_DEFAULT_PORT -
>>> The 16(). Prototype was for HOMA_MIN_DEFAULT_PORT() instead
>>>
>>> There are similar problems if there is a ":" later on the line.
>>
>>
>> @Vegard, can you look at this, please?
>> I have already looked but didn't arrive at a solution.
>>
>>
>> It appears to be these lines in process_name() that are confusing the function name
>> and following description:
>>
>>          # Look for foo() or static void foo() - description; or misspelt
>>          # identifier
>>          elsif (/^$decl_start$fn_type?(\w+)\s*$parenthesis?\s*$decl_end?$/ ||
>>              /^$decl_start$fn_type?(\w+.*)$parenthesis?\s*$decl_end$/) {
>>              $identifier = $1;
>>
>> Thanks.
> 
> Hi,
> 
> Is it just a matter of making that capture group less greedy?

Yes, should be.

> diff --git a/scripts/kernel-doc b/scripts/kernel-doc
> index f66070176ba31..ba9bc8760ff82 100755
> --- a/scripts/kernel-doc
> +++ b/scripts/kernel-doc
> @@ -2085,7 +2085,7 @@ sub process_name($$) {
>          # Look for foo() or static void foo() - description; or misspelt
>          # identifier
>          elsif (/^$decl_start$fn_type?(\w+)\s*$parenthesis?\s*$decl_end?$/ ||
> -            /^$decl_start$fn_type?(\w+.*)$parenthesis?\s*$decl_end$/) {
> +            /^$decl_start$fn_type?(\w+.*?)$parenthesis?\s*$decl_end$/) {
>              $identifier = $1;
>              $decl_type = 'function';
>              $identifier =~ s/^define\s+//;
> 
> We could also use [^-:]* instead of .* I guess.

Yes, either (both) of those works.
I slightly prefer the alternative since it is stronger in some way (IMO).

Thanks!

-- 
~Randy

