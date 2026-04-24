Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6972BE026;
	Fri, 24 Apr 2026 15:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777046039; cv=none; b=h2u2ao5cjGqwLq+4RgLp0k9SeB0QBjZ0BYfewN6nTZlaX4av291rEyC0hFjnoHUIqKu6XSQMzboxey/0p96Hcc90G/XmsWWF28wgYK6L31e6MF8015OEbGk/xJdtek21zaPbYJRboLMHDeHNEImJaBLhaKt4l3Unpt2ybLEIooM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777046039; c=relaxed/simple;
	bh=L1qvt9XFmKqHuBL1luYsZv9G/s41zEhYQsK5r3exiK0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dgzmHz1XC8QiC7MBMVBdxPwDrSHAiCsn9lT6Jjm0YbEKPvru+o+hcUJ0SPgZziYdPK2WkLBQUQ0i0vUUEMB3qLfTopxHkXtniRrWNfpCxK3GZm9+ZcsU8PNFXZsMcov0RH3c/FeX3V/iKgTG9fLhdvxEkHur90on+k2XKkWyMis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UCixd85V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UCixd85V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 277C0C19425;
	Fri, 24 Apr 2026 15:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777046039;
	bh=L1qvt9XFmKqHuBL1luYsZv9G/s41zEhYQsK5r3exiK0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UCixd85VwId4bqsHLmqNCoDTR2MYJm8+INbqMo/JyDU6Bd6W8QxEUsNRNOk5hcEHN
	 6nfDzJ8wOunIAz7+NbcFhjEcKl0X5z25xjIDav2SO4h6K+ujR0Z198EWEqN3nKp++/
	 8Sq5sUmfGu7h3lSguPSUMwuQQZGLRWeCOgTpxSfi1vDDIBk52pKVVqH8XfxYm6+rf2
	 6OCtZRLYzVQp/bPCtRdv6cJ2MX6TNVxHQ3bVKdh3mknIiCSHsYFH96Z3AfnJQk4EwX
	 pdyzEAssBR6sd99ee/Qx/2TX38FkKQCh6ZQzZWvld5WTzqeQ8aEypEDRaCHjdmzbJ2
	 23m7B8PYQoXKA==
Date: Fri, 24 Apr 2026 11:53:57 -0400
From: Sasha Levin <sashal@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: akpm@linux-foundation.org, david@kernel.org, corbet@lwn.net,
	ljs@kernel.org, Liam.Howlett@oracle.com, vbabka@kernel.org,
	rppt@kernel.org, surenb@google.com, mhocko@suse.com,
	skhan@linuxfoundation.org, jackmanb@google.com, hannes@cmpxchg.org,
	ziy@nvidia.com, linux-mm@kvack.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC 0/7] mm: dual-bitmap page allocator consistency checker
Message-ID: <aeuSFV6IcfQ0lifO@laps>
References: <20260424140056.2094777-1-sashal@kernel.org>
 <aeuNdOmgxA-k9BqY@casper.infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <aeuNdOmgxA-k9BqY@casper.infradead.org>

On Fri, Apr 24, 2026 at 04:34:12PM +0100, Matthew Wilcox wrote:
>On Fri, Apr 24, 2026 at 10:00:49AM -0400, Sasha Levin wrote:
>> corruption must be detected before it propagates. The dual-bitmap
>> implements a way to protect from corruption coming from hardware or
>> software - two complementary representations of page allocation state,
>> allocated independently via memblock, where any single-bit fault in
>> either bitmap is immediately detectable. Performance is secondary to
>> correctness in this context. A safety mechanism must be simple enough
>> to audit and certify, must fail deterministically (panic, not
>> log-and-hope), and its correctness matters more than its throughput.
>> The dual-bitmap adds two atomic bitops per alloc/free, but for
>> safety-critical deployments this cost is acceptable because the
>> alternative - undetected corruption propagating silently - violates
>> the system's safety case. The static key ensures zero cost for kernels
>> that don't need it.
>
>But doubling the storage requirement in order to achieve merely detection
>is significantly worse than state-of-the-art in 1950 (when Richard
>Hamming invented Hamming codes).  If we used a (7,3) code, we'd have
>SECDED at a lower cost.  Of course, there are far better codes available
>than that today.

I agree with the density concern. I have two reasons for that:

1. Update cost. On the alloc/free hot path the dual-bitmap update is two
independent test_and_set_bit. A Hamming/SECDED codeword needs a
read-modify-write of the whole word with locking on every state change.

2. Correlated faults. The two copies need to sit in different physical memory
so a multi-bit fault (row, column, bank, row-hammer) can only hit one of them.
See this paper which has some numbers:
https://dl.acm.org/doi/epdf/10.1145/2786763.2694348 - About 21% of DRAM faults
span more than one bit, plain SECDED can leave up to 20 FIT per device of
undetected errors from those, and it only helps at all if data and parity bits
are spread across physically separate cells.

Two memblock_alloc'd bitmaps give that separation for free. You could
interleave a code across two independent regions instead, but then
the invariant check stops being a one-line complement check, which is
what I was trying to keep simple for the audit side.

-- 
Thanks,
Sasha
