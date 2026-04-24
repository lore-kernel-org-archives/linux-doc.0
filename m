Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2CE53E0250;
	Fri, 24 Apr 2026 14:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777042154; cv=none; b=O0/jg1IecLL7BOOeqa73YgG5WC0em+tDN5mBJ89/RrkwvVgK+jdWKbYIAOMoyYfv3fgbEuYirqvRFeXu45RKTYfCsI/7G1IqmUMSGkWyD4nJ7XdgvlQkysjY+5mf+YMlUNjzcHgh7AAEPViCw+98kEVApo/aKPEX3u6+wgmtvDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777042154; c=relaxed/simple;
	bh=N3KRDFRWCC7Nko2EDRm46i09HlpWUKUQ8/WalpyXK0c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P5uCAWE38GuohiEBik5Sq1GhdfjjwSUxDhYYoxHw5OO5bYTDoMAO2DKb/9M6xKvUThQgBCusvF8OJ6uJITsrtrFyrRAWnt9VN3LZWLYYJPMnadlsPYU18MrBUqRDyX2kKkk5aHeYeN7GksWLi5wy4VBIOVMP3dvKBHwM+fEX3ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qzc4YfJ9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qzc4YfJ9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82E77C2BCB2;
	Fri, 24 Apr 2026 14:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777042154;
	bh=N3KRDFRWCC7Nko2EDRm46i09HlpWUKUQ8/WalpyXK0c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qzc4YfJ9NTx+KD7S0Xp53xzlAPbzzkgMXPKPiC8gXSIon4KBsyhscCVPWLqAvZvwh
	 zTaZ7QYY4far8/rL5R8wnT/eUkudetpRKmWvl64J/Mb/vmCieSBVQj5zpc2Q/BTj29
	 invfCMEjPF+8KvwrlPO2Q8iG2mlyyt1ASk9cs8vPNJ8E+O2Gu+WpUSe145g6HNNMc3
	 DTJ6HJ1eaFo4Dt3wo70jjdLm28YLbU11QaljXqYQaBIYnW/m/WX/yKsYFG6ucxOSi5
	 ImV2VxvRIsMV+kbu/KzNKo/hN22ocHGj5tVABPsOGZzh45U9d6VAttOe0/RCgTw9pM
	 tRubiRxjLFWPg==
Date: Fri, 24 Apr 2026 10:49:13 -0400
From: Sasha Levin <sashal@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: akpm@linux-foundation.org, corbet@lwn.net, ljs@kernel.org,
	Liam.Howlett@oracle.com, vbabka@kernel.org, rppt@kernel.org,
	surenb@google.com, mhocko@suse.com, skhan@linuxfoundation.org,
	jackmanb@google.com, hannes@cmpxchg.org, ziy@nvidia.com,
	linux-mm@kvack.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Sasha Levin <sashal@nvidia.com>,
	Sanif Veeras <sveeras@nvidia.com>,
	"Claude:claude-opus-4-7" <noreply@anthropic.com>
Subject: Re: [RFC 4/7] mm: add page consistency checker implementation
Message-ID: <aeuC6TJ4XowazVZj@laps>
References: <20260424140056.2094777-1-sashal@kernel.org>
 <20260424140056.2094777-5-sashal@kernel.org>
 <4b961a07-b72d-4c8a-ab49-23f61ed12b53@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <4b961a07-b72d-4c8a-ab49-23f61ed12b53@kernel.org>

On Fri, Apr 24, 2026 at 04:25:41PM +0200, David Hildenbrand (Arm) wrote:
>> +	/*
>> +	 * Size bitmaps to cover the full PFN range including any holes.
>> +	 * Holes waste a few bits but a flat bitmap keeps the indexing
>> +	 * trivial (pfn - min_pfn) and avoids additional data structures
>> +	 * that would themselves be subject to corruption.  This matches
>> +	 * the approach used by pageblock_flags.
>> +	 */
>> +	pc_state.min_pfn = PHYS_PFN(memblock_start_of_DRAM());
>> +	pc_state.max_pfn = PHYS_PFN(memblock_end_of_DRAM());
>> +	spanned_pfns = pc_state.max_pfn - pc_state.min_pfn;
>> +	if (!spanned_pfns || spanned_pfns > UINT_MAX) {
>> +		pr_err("PFN span %lu cannot be represented by bitmap APIs, feature disabled\n",
>> +		       spanned_pfns);
>> +		return;
>> +	}
>> +
>> +	pc_state.db.nbits = spanned_pfns;
>> +
>> +	bitmap_bytes = BITS_TO_LONGS(pc_state.db.nbits) * sizeof(unsigned long);
>> +
>> +	pr_info("Initializing: PFN range [%lu-%lu), %u bits (%zu KB per bitmap)\n",
>> +		pc_state.min_pfn, pc_state.max_pfn, pc_state.db.nbits,
>> +		bitmap_bytes / 1024);
>> +
>> +	/* Allocate primary bitmap (zeroed by memblock_alloc) */
>> +	pc_state.db.bitmap[DUAL_BITMAP_PRIMARY] =
>> +		memblock_alloc(bitmap_bytes, SMP_CACHE_BYTES);
>> +	if (!pc_state.db.bitmap[DUAL_BITMAP_PRIMARY]) {
>> +		pr_err("Failed to allocate primary bitmap, feature disabled\n");
>> +		return;
>> +	}
>>
>
>One bitmap that covers all sparse memory available at boot.
>
>Conclusion: Just horrible.

Depends on who's looking at the code :)

I picked it for auditability: covering the whole range with two
memblock_alloc'd arrays means the only thing on the lookup path is the bitmap
words themselves, which is what the dual-bitmap invariant already checks.

We could go with per-section bitmaps which will fix the waste but pull
mem_section[] into the trust boundary, so we'd have to start validating it too.

-- 
Thanks,
Sasha
