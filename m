Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578FD178CCA
	for <linux-doc@vger.kernel.org>; Wed,  9 Oct 2024 22:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728511357; cv=none; b=TzCdhV8H8pe5ZUsXPXPtCZRhZD0LIvc67JfxGot7q7U/SnNiJSSQ/rRv5Ff3+iAr/XA9yrml+2Zh9eLS4rfGKpnCBUSfww5810IEv89q8moonYmh+gzw+CDVS2R5yoGIyvyLVBGLIiaKyRxKJMiOqlT5BUmQ4y/aYadwAh8+TaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728511357; c=relaxed/simple;
	bh=WmzhW4Yz9d4CYS2cvnPXGqkoVEAeBlG0bw816P86+6U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fSmfdkCfsaIFhlkx5ZI0sKde5waYNu+Ls2guHxF2QAxNMPaGe/rP/8KjXvEv17xzxrDTwk+XhYsCe8FMe/Cy9ZhMa+wZDQ8o+q6c55YoEmYTg9t0JJrp18M0IQRdc050N+Dn9eH0F9TPmmsX9s8PgAQI6LguPD3bdOXOZ85/n+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=siatCB37; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="siatCB37"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=HCh2YRncTzKIRqu2AgE80f/pX5qYbpsU8s2PLS/3fiY=; b=siatCB378wZ3PecidgHlodLsex
	G1r8lDqv5Z4b9Wh+HbDnMJDIjPhqKzdI5yth6fslhdRCR00CuFmOv8bmsHzUjG2+5iXz54XiAtZ3W
	ZZcoL6GMe9w9uDpplmzXJMe0YpKn6X/Y8wdI8v0ZE/SV2Hvnke3FV9mh8l71qX3JLARJmInhSCfI9
	wdVNdtc2boSApVioXl9+BzYWqe+wXhctgVLNUFFS49ostn5cq85XguCi8D2jQefgTTSu4bqhDvvlB
	H+nypnR6VGVHoapUMg13yB8vcUAR1mptFZs5BtQ1LRMCnEkC2d9eYDpcPSlUmFyWTwt4LTCmtLbNt
	oXAxMy8A==;
Received: from [50.53.2.24] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1syelC-00000005vRL-0jx9;
	Wed, 09 Oct 2024 22:02:24 +0000
Message-ID: <8b0c1bb9-4a9a-4f8e-87df-275994df739d@infradead.org>
Date: Wed, 9 Oct 2024 15:02:17 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm, slab: add kerneldocs for common SLAB_ flags
To: Jonathan Corbet <corbet@lwn.net>, Vlastimil Babka <vbabka@suse.cz>,
 David Rientjes <rientjes@google.com>, Christoph Lameter <cl@linux.com>
Cc: Hyeonggon Yoo <42.hyeyoo@gmail.com>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 linux-doc@vger.kernel.org
References: <20241009142936.56092-2-vbabka@suse.cz>
 <878quxe2kw.fsf@trenco.lwn.net>
 <f6fa720b-e8af-4afa-906f-29019aefe49a@suse.cz>
 <878quxb4rm.fsf@trenco.lwn.net>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <878quxb4rm.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/9/24 9:49 AM, Jonathan Corbet wrote:
> Vlastimil Babka <vbabka@suse.cz> writes:
> 
>> Thanks for the hints. I hope if we can agree that documenting the macros was
>> intended to be supported, doesn't break the build (there are users already)
>> and has only those minor rendering issues, it can be used?
> 
> I'd totally forgotten that this was supposed to work.
> 
> Yes it can be used... $WE just need to find a way to make it work
> properly.

The code probably isn't expecting a macro on the right side. I'll take a look,
but no promises.

> 
> Every now and then I ponder rewriting kernel-doc in Rust, both to make
> it more reasonable to modify and as a learning exercise.  But then I
> come to my senses and go back to stuff that actually needs to get done.

That's a good way to lose helpers, although it might also gain you a few...

Yesh, I know, current is Perl.

-- 
~Randy
