Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FBF1266581;
	Mon, 27 Apr 2026 19:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777318632; cv=none; b=eIeDnpoCFutVtF2JmueeYUMUkbEx/zAIJTghluOZ6/2JzJ5WKwvpkumMAHviT/Fo/1zn4h3fYYt8xdnAn7HHv8xbmrsvZZ7xDFZsbwTSs4Rwdy2oDzIJt1GhXY/YGvH/vb1qakxp2zQ1TCYNsOx0goQf+0083oI/bfP4DcECUyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777318632; c=relaxed/simple;
	bh=sYmKObJMhnp7jy264AilvXj9lD+eqjDwhHG7MFsMTtA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W8WDpjbxkfaNSLBACqTJw9f6rwcloP/oWdHUJjrepUQkPwHJFlv8NsPGQcx6RS/sp4v8dvGgpr9faM15KvQHgSxvLB+7IiVgY4BlwUmz1v7rzd0eIvzBqvQCcctgSGWwrkh+I6gSNmLHdDDrs4yKxFBVfjRihFdAVuiRcRG4hSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EfhmJXK2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EfhmJXK2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73861C19425;
	Mon, 27 Apr 2026 19:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777318632;
	bh=sYmKObJMhnp7jy264AilvXj9lD+eqjDwhHG7MFsMTtA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EfhmJXK2MOebbFDynHs0e6ErEa+rR2fV5oPwMls7eMi5DhkgqFFrMxyutV36q8HmK
	 jSOorctS20K28WCUspXTRYb6tn6OjdGbIrPSo/Oq21tzGBI1fVdXH29EPZAw5RHoke
	 DDQQzzqBy+mYBUVQFpdpoTNB/XeWlNDii5FuiXObRKRN1CxRqGeg22rkLk+vtIdxoK
	 34seLrxMRA/Xg++UkPSqlQ6X/KUl4EX6WlLr+aGuczFFTAYeOp/UN5KEL8U7y+j+Wc
	 c9PtR7/0VgsfXri/FktT7d6SBqQxteh482P1+7pQVyl/LS/tn12GXvHgprGuk8/hbM
	 7VZxkVldOZhPw==
Message-ID: <36d82055-67f3-4c29-a605-a9848a28f7cb@kernel.org>
Date: Mon, 27 Apr 2026 21:37:02 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 4/7] mm: add page consistency checker implementation
To: Sasha Levin <sashal@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, akpm@linux-foundation.org,
 corbet@lwn.net, ljs@kernel.org, Liam.Howlett@oracle.com, vbabka@kernel.org,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com,
 skhan@linuxfoundation.org, jackmanb@google.com, hannes@cmpxchg.org,
 ziy@nvidia.com, linux-mm@kvack.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sasha Levin <sashal@nvidia.com>,
 Sanif Veeras <sveeras@nvidia.com>,
 "Claude:claude-opus-4-7" <noreply@anthropic.com>
References: <4b961a07-b72d-4c8a-ab49-23f61ed12b53@kernel.org>
 <aeuC6TJ4XowazVZj@laps> <aeuFnuiYDBjttEKt@plex>
 <12985b32-88b3-47ab-8292-2e0ec6f5fbae@kernel.org> <aev-DS4YTp5soVPd@laps>
 <3146ebcf-5649-44a7-aa21-163bf404c42b@kernel.org> <aezt96xgz_qyf4d-@laps>
 <f910969d-1071-4174-bd42-da45cb6f9749@kernel.org> <ae9ucgtCNf0JQtGu@laps>
 <c50aeb03-538b-4dca-9a81-ab84bc19a333@kernel.org> <ae-xXHUGfDiFcBUk@laps>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <ae-xXHUGfDiFcBUk@laps>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


>>
>> Thanks, but I fundamentally don't understand how RAS capabilities interact here?
>> We have mm/memory-failure.c for a reason :)
> 
> We do, but self driving safety requires way more than the current hardware can
> provide.
> 
> I'll point you to https://dl.acm.org/doi/10.1145/2775054.2694348 , which
> researched these issues in a datacenter environment (so no sun exposure,
> temperature controlled, designed to avoid electromagnetic interference).
> 
> "We call a fault that generates an error larger than 2 bits in an ECC word an
> undetectable-by-SECDED fault. A fault is undetectable-by-SECDED if it affects
> more than two bits in any ECC word, and the data written to that location does
> not match the value produced by the fault."
> 
> [...]
> 
> "A Cielo node has 288 DRAM devices, so this translates to 6048, 518, and 57.6
> FIT per node for vendors A, B, and C, respectively. This translates to one
> undetected error every 0.8 days, every 9.5 days, and every 85 days on a machine
> the size of Cielo."
> 
> [...]
> 
> "Our main conclusion from this data is that SEC-DED ECC is poorly suited to
> modern DRAM subsystems. The rate of undetected errors is too high to justify
> its use in very large scale systems comprised of thousands of nodes where
> fidelity of results is critical."

Yes, I read before that ECC is insufficient to detect certain bitflips.

But I don't understand how this patch set here is going to move the needle in
any reasonable way?

You have your magical self-driving car algorithm.

Bitflips can corrupt your algorithm, your data, the kernel image, your user page
tables, your kernel page tables. Even a pointer to a bitmap :)

... and we worry about the state of allocated vs. free pages.

Please enlighten me!

> 
> The passengers you've mentioned before would be excited if they knew how high
> the bar is around their safety :)
Heh :)

-- 
Cheers,

David
