Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6049378D9A;
	Mon, 27 Apr 2026 12:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777293172; cv=none; b=XH3pLdqip/xK02P5wUH7W3p2/ai4nUPnY7rB75Jd2R+G8FbRXTtnBQHqe8KC0WMRbodigN0CWl7YFYtr8KMptYV4Bz0g+KkdkAytW1gFLxYsEuGh65pOLx/pIgRuz3JbnboKnQoNuYYc5HxIbvsw+W/ffZeu3NkQCRATysmi+UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777293172; c=relaxed/simple;
	bh=xvYQlzxQ1hq53wWdlNPDCV/eKlBZfhodpK+RYNlKyPY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JNGmi5RSHczQg56ptZKMP+ozV5VU/gBcGcPZOXpXVJjdPckI93WYE/+S/p6NxI4W1LmsJG2wRWBeZWzluXVSkO3ZPY+aOPe6cEh/pCVAX5xOOKbFg9zDbKn1aa+kgQrbcejI3cv1EAFD8MNGA3MUQkRyt6N8UlzagI91oP41MKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ip7GywcA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ip7GywcA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B3FBC19425;
	Mon, 27 Apr 2026 12:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777293172;
	bh=xvYQlzxQ1hq53wWdlNPDCV/eKlBZfhodpK+RYNlKyPY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ip7GywcA1FH/14ypAf5q1GhBaMpCJMHNJ0oNwZyx91OdfE7ATWTVoPYbEIH7xG399
	 KCazSQ5YkVf5Fw0qo9Y2P5/or6YxBg947RjhEPACI2CfczVh4hUxJESc4w0C9S1xoT
	 oi9aqHS/7BEzQsQLf5oNBRAGWMRMLABkI2mLa91GPBaTCXdfmwUaqUu2u5JvvPOTI/
	 Zw50WOSUPMqUC7sOO00eBGgcD0aKmrJSVtzAqNShit8EgXCYqLfWhun4YWoZ12gdZI
	 pITTuW5YaGT3GDvAl8NrF4gkCzYlwkt38O3AH7YXPj/zN+rdrAmTdtkTX6jCPTIJlB
	 GRpeFz94yPTsw==
Message-ID: <f910969d-1071-4174-bd42-da45cb6f9749@kernel.org>
Date: Mon, 27 Apr 2026 14:32:43 +0200
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
References: <20260424140056.2094777-1-sashal@kernel.org>
 <20260424140056.2094777-5-sashal@kernel.org>
 <4b961a07-b72d-4c8a-ab49-23f61ed12b53@kernel.org> <aeuC6TJ4XowazVZj@laps>
 <aeuFnuiYDBjttEKt@plex> <12985b32-88b3-47ab-8292-2e0ec6f5fbae@kernel.org>
 <aev-DS4YTp5soVPd@laps> <3146ebcf-5649-44a7-aa21-163bf404c42b@kernel.org>
 <aezt96xgz_qyf4d-@laps>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <aezt96xgz_qyf4d-@laps>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

>> But the real question is: how far away do these bits have to be in memory to be
>> considered "independent" and not prone to the same corruption?
>>
>> 1 bit?
>> 1 byte?
>> 64 byte?
>> 4096 byte?
>> ???
> 
> The notes I have from the research side of things (which should be taken with a
> grain of salt) are something along the lines of:
> 
>  - ~79% are a single bit corruption
>  - ~9% are row faults, so multiple bit corruption within ~8kb
>  - ~4% are bank faults, so multiple bit corruption within ~512mb

Interesting numbers, thanks! What are the other missing %?

> 
> Obviously the numbers would be very different depending on usecase, hardware,
> physical location (did you know bits are more likely to flip in higher
> altitudes?)...

Yeah, heavy cosmic ray apparently makes the problem worse.

The 512mb case is obviously tricky to handle (and is very hw dependent).

Placing bits at least two pages apart could be done more easily.

> 
>> "Embedding both in page_ext means a single fault could
>> corrupt both the tracking data and its redundant copy in the same
>> allocation region."
>>
>> I might be wrong, but isn't that the case for any such fault, as you don't 100%
>> know how the DIMM is organized internally?
>>
>> Do we really expect that a MCE event would, for example, very likely corrupt two
>> neighboring bits, or two bits in the same byte etc? What are the odds that we
>> care?
> 
> For something like a datacenter deployment I'd agree with you - the odds are
> too low to care. For an unsupervised self driving vehicle, where there's no
> human (locally or remotely) available to take over, I'd like the odds to be as
> low as possible :)

I thought that people usually use special RT OSes (with proven logic etc) for
any safety-related systems. Using Linux on the core safety system sounds ... scary.

But, I'd expect corruption of other data (user pages? page tables?) a much
bigger problem than page al locator metdata? What am I missing that this here is
-- in context of the bigger problems there -- a thing we particularly care about?

-- 
Cheers,

David
