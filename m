Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F59B26ED37;
	Sat, 25 Apr 2026 16:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777135097; cv=none; b=uKCtzdDjFuWLmuNnwVRk4ZT/+N00jSGlwRPa7W5C0pJON+CJnJsB4CLSny3A79+eFgXxA+wX/DJ4Jj4FpNKyAAvq+XTalIIhIqEgu1dAwOP6y1A306DXRRb4migHnA66NljJYvu3o99R7Lnh3pWa2jgiLYR7A723KGlajW85qV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777135097; c=relaxed/simple;
	bh=EQaknTyW5xfrIybCdsauIZdStSASsj39zFLJnMiJgm4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wp33NQe3tK2bfUaRS5xfFn6RpnYuxMw4kcrUcx4lpBipF2lOFHObVcGXAAk5aYMt+RRa2Xty3iPph+Am3nH/ASdCKxduAbIyAZKCL9k9BLJPLgE7xI+dxu5tzsfX+IQ3/fSeRPWlJNlynXJvHqxSE9c+PXp7UdSAUf4aunCNMRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dkp8MEy6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dkp8MEy6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00F4CC2BCB0;
	Sat, 25 Apr 2026 16:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777135097;
	bh=EQaknTyW5xfrIybCdsauIZdStSASsj39zFLJnMiJgm4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dkp8MEy6yFyo6oGIcyMXEu1jfTy/7hNVAesl76XcrbMoLka631A+jjV3mUGp2nK0c
	 c8uou1pbzxT1Gbu4kKSXLNyV4QSkOPHlSeBZlMd/Xdsk4terPUz48fqhUkqncAQUqB
	 WbOT43uXx5U/gMI6w2dwjJANUgXXjMC0xaU58GZg3Q4MXp9M6j+dtXWcQMfqqJk2Ve
	 B6zYvzGkkIqJr4Kur/pmx/AMOPPSqE5FWGinQ+/J+89+tBObJgNrkZaDxVM+1v/H4J
	 L0cfYdvHWg5YYSfSMvPQ/iOKQKZtFjjqrqRYEgSyxaYxM0Oo041NY1zmypkMBSFc1T
	 bAUpyfNeU0Q5w==
Date: Sat, 25 Apr 2026 12:38:15 -0400
From: Sasha Levin <sashal@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, akpm@linux-foundation.org,
	corbet@lwn.net, ljs@kernel.org, Liam.Howlett@oracle.com,
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
	mhocko@suse.com, skhan@linuxfoundation.org, jackmanb@google.com,
	hannes@cmpxchg.org, ziy@nvidia.com, linux-mm@kvack.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Sasha Levin <sashal@nvidia.com>, Sanif Veeras <sveeras@nvidia.com>,
	"Claude:claude-opus-4-7" <noreply@anthropic.com>
Subject: Re: [RFC 4/7] mm: add page consistency checker implementation
Message-ID: <aezt96xgz_qyf4d-@laps>
References: <20260424140056.2094777-1-sashal@kernel.org>
 <20260424140056.2094777-5-sashal@kernel.org>
 <4b961a07-b72d-4c8a-ab49-23f61ed12b53@kernel.org>
 <aeuC6TJ4XowazVZj@laps>
 <aeuFnuiYDBjttEKt@plex>
 <12985b32-88b3-47ab-8292-2e0ec6f5fbae@kernel.org>
 <aev-DS4YTp5soVPd@laps>
 <3146ebcf-5649-44a7-aa21-163bf404c42b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <3146ebcf-5649-44a7-aa21-163bf404c42b@kernel.org>

On Sat, Apr 25, 2026 at 07:30:56AM +0200, David Hildenbrand (Arm) wrote:
>On 4/25/26 01:34, Sasha Levin wrote:
>> On Fri, Apr 24, 2026 at 08:28:14PM +0200, David Hildenbrand (Arm) wrote:
>>> On 4/24/26 17:06, Pasha Tatashin wrote:
>>>>
>>>> The issue is that we are going back in time to a flat memory,
>>>> without NUMA or hotplug support. We need an abstraction that avoids
>>>> allocating this memory in enormous contiguous chunks, as thit approach
>>>> will not work on modern hardware.
>>>>
>>>>
>>>> Page-ext provides all of these capabilities, but as you described in the
>>>> cover letter, it does not meet your requirements. Therefore, I believe
>>>> a new abstraction layer is needed.
>>>
>>> If we decided that we want this (and I am not convinced), we definitely want
>>> something that supports sparsity and, in particular, something that support
>>> memory hotplug.
>>
>> Makes sense. Let me take a few days and see if I can find some middle ground
>> here.
>>
>
>"The natural question is why not use page_ext. The key objection from a
>safety perspective is that page_ext stores per-page metadata in memory
>that is itself subject to the same hardware faults we're trying to
>detect. The dual-bitmap approach works because the two bitmaps are
>independent allocations - corruption in one is caught by comparison
>with the other."
>
>So you want to have two bits per page, whereby both bits come from in dependent
>pages I assume?

Ideally completely different DIMMs (though as you point out later, we can't
easily make this happen).

>Storing one bit in page_ext and one bit in page flags would be possible if we
>had a spare bit in page flags ...  We could allocate two bitmaps per memory section.

Right, I think that the approach you proposed is roughly equivalent spatially
(though I'd need to check with the safety folks here).

>But the real question is: how far away do these bits have to be in memory to be
>considered "independent" and not prone to the same corruption?
>
>1 bit?
>1 byte?
>64 byte?
>4096 byte?
>???

The notes I have from the research side of things (which should be taken with a
grain of salt) are something along the lines of:

  - ~79% are a single bit corruption
  - ~9% are row faults, so multiple bit corruption within ~8kb
  - ~4% are bank faults, so multiple bit corruption within ~512mb

Obviously the numbers would be very different depending on usecase, hardware,
physical location (did you know bits are more likely to flip in higher
altitudes?)...

>"Embedding both in page_ext means a single fault could
>corrupt both the tracking data and its redundant copy in the same
>allocation region."
>
>I might be wrong, but isn't that the case for any such fault, as you don't 100%
>know how the DIMM is organized internally?
>
>Do we really expect that a MCE event would, for example, very likely corrupt two
>neighboring bits, or two bits in the same byte etc? What are the odds that we care?

For something like a datacenter deployment I'd agree with you - the odds are
too low to care. For an unsupervised self driving vehicle, where there's no
human (locally or remotely) available to take over, I'd like the odds to be as
low as possible :)

>It's hard to tell here which part of this work is "too research focused". For
>example, if I were to write a paper about that, I would make such claims to make
>it sound more complicated than it needs to be :)

-- 
Thanks,
Sasha
