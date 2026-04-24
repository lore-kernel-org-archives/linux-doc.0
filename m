Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43182F12DA;
	Fri, 24 Apr 2026 23:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777073679; cv=none; b=SaTcZbfOtOmGyppQA9pWK389je7599mXEZHSjPgtU9L8DuXEeta29Lf4KNb8pAcXPDY3WOrqGqzjsYMHUwW9OyZlZ0xYJQOaiXc+mo7lVPjy8srlaiucpdjZyJIxhGf+PK6bQL8ni72HKe38jiliaj96nznIUdyl6uWcPtoJsts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777073679; c=relaxed/simple;
	bh=1jfIqbSPLq0qNuZBiP9OXbiRWtkR9TZEqZHMCmgXsmY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RN8t1wsozz8GukVmyWootU5nQ2Gk2q56+8o7WlbHoNGuaZ8+7UweYjZdaRORnjb/rQN3G8PPO5WMDoX0shbWxblGahITt41QRf4r7CoT0Bk0mpY0IXBrtMdeASzqpanaIDGWk7k4q0u46VbW4B76vzHtLN+6wRYDslggnvySX1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QXAoIme3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QXAoIme3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07202C19425;
	Fri, 24 Apr 2026 23:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777073679;
	bh=1jfIqbSPLq0qNuZBiP9OXbiRWtkR9TZEqZHMCmgXsmY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QXAoIme3BN9MOWbMmkOHbwVnKRUFLR6VA0Nnquc++LvdF7S1NRFA0R/KtjF3T31fR
	 svONuj93lYFCzC7uf/K9bL9As8LSUJ4ooDs+dLm5ykPwNbmO+aPeKS9XN1T4BihfV6
	 8qooFBLCoBDVpWEUjy1/yEYa/rgElMvoQbOEh5n9QxsAd0dbhIEJ/RPZs0rHYOM79T
	 +t4nxZTZVaUG/WWE7s8E7hagyKZ0zd6Ro4nFwG9qimjeLy6VAWynfbBP4efTy1/ZUm
	 WR+4oOxM1gjDxhzL6WLX534MH1AegOHN6c3AcOa811gzfzQ3ai+99KCFjCfItg8EOU
	 evbLewer0CmVA==
Date: Fri, 24 Apr 2026 19:34:37 -0400
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
Message-ID: <aev-DS4YTp5soVPd@laps>
References: <20260424140056.2094777-1-sashal@kernel.org>
 <20260424140056.2094777-5-sashal@kernel.org>
 <4b961a07-b72d-4c8a-ab49-23f61ed12b53@kernel.org>
 <aeuC6TJ4XowazVZj@laps>
 <aeuFnuiYDBjttEKt@plex>
 <12985b32-88b3-47ab-8292-2e0ec6f5fbae@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <12985b32-88b3-47ab-8292-2e0ec6f5fbae@kernel.org>

On Fri, Apr 24, 2026 at 08:28:14PM +0200, David Hildenbrand (Arm) wrote:
>On 4/24/26 17:06, Pasha Tatashin wrote:
>> On 04-24 10:49, Sasha Levin wrote:
>>> On Fri, Apr 24, 2026 at 04:25:41PM +0200, David Hildenbrand (Arm) wrote:
>>>>
>>>> One bitmap that covers all sparse memory available at boot.
>>>>
>>>> Conclusion: Just horrible.
>>>
>>> Depends on who's looking at the code :)
>>>
>>> I picked it for auditability: covering the whole range with two
>>> memblock_alloc'd arrays means the only thing on the lookup path is the bitmap
>>> words themselves, which is what the dual-bitmap invariant already checks.
>>
>> The issue is that we are going back in time to a flat memory,
>> without NUMA or hotplug support. We need an abstraction that avoids
>> allocating this memory in enormous contiguous chunks, as thit approach
>> will not work on modern hardware.
>>
>>>
>>> We could go with per-section bitmaps which will fix the waste but pull
>>> mem_section[] into the trust boundary, so we'd have to start validating it too.
>>
>> Page-ext provides all of these capabilities, but as you described in the
>> cover letter, it does not meet your requirements. Therefore, I believe
>> a new abstraction layer is needed.
>
>If we decided that we want this (and I am not convinced), we definitely want
>something that supports sparsity and, in particular, something that support
>memory hotplug.

Makes sense. Let me take a few days and see if I can find some middle ground
here.

-- 
Thanks,
Sasha
