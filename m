Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427973D1CAA;
	Mon, 27 Apr 2026 14:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777299060; cv=none; b=KElYZpuAZ0cVcEiHwzkEo4hgh8JLKHVnF4WFCcSrakuAQL4mQGRL69OdWVnrRViO65OZyJGcmtPieVWnH+dtUvYnOvK/ngWBPd7tRXCWts8TgsPFSKMHZLww3MoP8sAFtUsYx0t+cC1Na/Kxe6rL9oeNShxCDVHlINzNlpdUiAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777299060; c=relaxed/simple;
	bh=h0NbYrCCZOEKkS2NsmUG0UAZWp9mvLLnt1P2UjZO87s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MNas9lUj8PIGy2hzRcNASQcS/LYRq8xRZV8QO7E6gjVlcFTcQX1F3g89uFvuZDNDbvNHo96po7QYfWJ2exni6AapeDWIra4bhfV30unZBcswNgTsDP7ObkArg5RjB364lk4bAwmncWmzKxwP0tRLDoepu6xsJ71o8eOJm1Dy8dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WOknQOVg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WOknQOVg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2E09C19425;
	Mon, 27 Apr 2026 14:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777299059;
	bh=h0NbYrCCZOEKkS2NsmUG0UAZWp9mvLLnt1P2UjZO87s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WOknQOVgPbUQDuhU1NhAYK9JNtY2qAEFUe2FWBcfjKM1C9jxY9m5ykZu0/9fQ/D+4
	 N1xQdbs/XTjqszZQ67NqIn+Zb+K57/4Zw711A+0XdFtvUzjV0uutggPuj9tAbf9zv8
	 vTfULqYfUOmwfCbg19UgBkUTkg3PndxcsnkNAz25HQQPm+XsyW2k/h/KDVKWbHElts
	 JBqJyWmLz9ZKZZhZSEUiHXVHNlE859w9Hh7og0b76cRfTGT+2EODFYrU9MCdUFDVuz
	 7jIbV+gpHMlCTpkWUXA6qQYVVVligLIumtKhYCFxcje/apK/+JaMMzP/dd/tVSuW+s
	 HljY3Y00D8u9A==
Date: Mon, 27 Apr 2026 10:10:58 -0400
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
Message-ID: <ae9ucgtCNf0JQtGu@laps>
References: <20260424140056.2094777-1-sashal@kernel.org>
 <20260424140056.2094777-5-sashal@kernel.org>
 <4b961a07-b72d-4c8a-ab49-23f61ed12b53@kernel.org>
 <aeuC6TJ4XowazVZj@laps>
 <aeuFnuiYDBjttEKt@plex>
 <12985b32-88b3-47ab-8292-2e0ec6f5fbae@kernel.org>
 <aev-DS4YTp5soVPd@laps>
 <3146ebcf-5649-44a7-aa21-163bf404c42b@kernel.org>
 <aezt96xgz_qyf4d-@laps>
 <f910969d-1071-4174-bd42-da45cb6f9749@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f910969d-1071-4174-bd42-da45cb6f9749@kernel.org>

On Mon, Apr 27, 2026 at 02:32:43PM +0200, David Hildenbrand (Arm) wrote:
>>> But the real question is: how far away do these bits have to be in memory to be
>>> considered "independent" and not prone to the same corruption?
>>>
>>> 1 bit?
>>> 1 byte?
>>> 64 byte?
>>> 4096 byte?
>>> ???
>>
>> The notes I have from the research side of things (which should be taken with a
>> grain of salt) are something along the lines of:
>>
>>  - ~79% are a single bit corruption
>>  - ~9% are row faults, so multiple bit corruption within ~8kb
>>  - ~4% are bank faults, so multiple bit corruption within ~512mb
>
>Interesting numbers, thanks! What are the other missing %?

  - ~6% single-column: bits in one physical column across multiple rows
  - ~1% multi-rank
  - ~0.6% multi-bank

>>
>> Obviously the numbers would be very different depending on usecase, hardware,
>> physical location (did you know bits are more likely to flip in higher
>> altitudes?)...
>
>Yeah, heavy cosmic ray apparently makes the problem worse.
>
>The 512mb case is obviously tricky to handle (and is very hw dependent).
>
>Placing bits at least two pages apart could be done more easily.
>
>>
>>> "Embedding both in page_ext means a single fault could
>>> corrupt both the tracking data and its redundant copy in the same
>>> allocation region."
>>>
>>> I might be wrong, but isn't that the case for any such fault, as you don't 100%
>>> know how the DIMM is organized internally?
>>>
>>> Do we really expect that a MCE event would, for example, very likely corrupt two
>>> neighboring bits, or two bits in the same byte etc? What are the odds that we
>>> care?
>>
>> For something like a datacenter deployment I'd agree with you - the odds are
>> too low to care. For an unsupervised self driving vehicle, where there's no
>> human (locally or remotely) available to take over, I'd like the odds to be as
>> low as possible :)
>
>I thought that people usually use special RT OSes (with proven logic etc) for
>any safety-related systems. Using Linux on the core safety system sounds ... scary.

RT OSes are indeed the current approach.

s/scary/exciting ;)

>But, I'd expect corruption of other data (user pages? page tables?) a much
>bigger problem than page al locator metdata? What am I missing that this here is
>-- in context of the bigger problems there -- a thing we particularly care about?

You are very correct! The allocator work was fairly standalone, so it was an
easy first project to tackle.

In general, the approach depends on what we're trying to defend from:

1. bugs: an ASI-like MMU enforced "context" system.
2. physics: just like in most other areas - lots of redundancy. For example,
consider redundant variables in safety critical code which exists as two
copies: var_v1 = value and var_v2 = value XOR mask. When accessing them, read
both copies, XOR the second back, compare.

There were a few sessions back in LPC about this. Here's the one from Bryan
Huntsman which gives a good overview:
https://www.youtube.com/watch?v=ie_ClBCed94

-- 
Thanks,
Sasha
