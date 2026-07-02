Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD9E22AE48;
	Thu,  2 Jul 2026 07:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782977537; cv=none; b=pgKzuDTPdpKqIIPJ15D7uaergUaek4AOXqJC2nukOFByonuW638k65OjFSvy/olprVWVB4xZMfzioj4BKjN6ItjHGEWBM8lpzou3lp8WwMwktBfKZXXH9u503xUK9M7Ygud7di4DSWCshs+73OcUdtgYHGUIia8ZOvmn+NrqkL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782977537; c=relaxed/simple;
	bh=auLzMwG3Lnq7IbisEmLX7c5+WHEQ3P7wUVPgXjEcLlw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fMsU0lnLWB++0W1fKpabGv3LSo1mTd3Bb5p3/tnCXxJFlk6dc2ZuilK3XtNA5hvbRQGfQQIuN5Acrjw4OMbMc1BZz3AsZxCNiWyN4O305iKHeGFMSyEiylHV9YYwrlS2CAoUbYSAFMg/ZFm2jEkHS5cTRE2w1FOQffuOGaySTWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MW+Cxy3i; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MW+Cxy3i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 709E91F000E9;
	Thu,  2 Jul 2026 07:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782977535;
	bh=2X9JgKwdl0p8GFmiN7/WiWwXZjF81If+NXIGu122JaQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=MW+Cxy3i7kKl27n3xo/UiBNkar1zcuPifzaQc4/oHmG3ozOFx3XzhBiI30HxM/NDn
	 AdgY1vKY+9+bPi3C6n3Ndgsd+F3hlZEG5fXvpF9tKKcw2aLv+5c8aJXALImk7qSvon
	 +TrqI0OdQFdsviZjihpHIvlOzdwXL7+K5enNi4kz50ntWpUVInHpJliO+JH3GzxaQQ
	 AOiKHvllHPFHVmWTIHLaPWCAKHrvXI5XwUAxskOZgFpRZ6opQjf3WXaxcDVFwRj/4m
	 cDIcqEho3I4oLxFvP1zMiO5ATbeoScRPjoRpXBguxm94o54Co/VlJ1UiXdVvBRqxJD
	 jsEGzvck9t8eA==
Message-ID: <82902a84-7e62-496b-b1c0-62bad1be4525@kernel.org>
Date: Thu, 2 Jul 2026 09:32:10 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC V2 3/3] mm: Replace pgtable entry prints with new format
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 Hugh Dickins <hughd@google.com>
Cc: linux-mm@kvack.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, Petr Mladek
 <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
 Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Lorenzo Stoakes <ljs@kernel.org>
References: <20260610043545.3725735-1-anshuman.khandual@arm.com>
 <20260610043545.3725735-4-anshuman.khandual@arm.com>
 <fc57bb9a-4564-489e-8da4-65068b5283ae@kernel.org>
 <4a416383-62f5-1716-8e04-a2ee1f89a864@google.com>
 <dabfd73b-d872-4267-9a40-45463fe146ac@kernel.org>
 <3afa822d-3cc9-1068-9a10-94a5f2e4d29a@google.com>
 <90b5cd31-87ed-4ef7-86cc-458b9e06b02d@kernel.org>
 <5a8e82f3-ed21-48a8-af3c-36a08fd2b0ec@arm.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <5a8e82f3-ed21-48a8-af3c-36a08fd2b0ec@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/2/26 06:29, Anshuman Khandual wrote:
> 
> 
> On 30/06/26 7:06 PM, David Hildenbrand (Arm) wrote:
>> On 6/16/26 08:19, Hugh Dickins wrote:
>>>
>>> Yes, that's what it's for. What we really want is to understand what went
>>> wrong: that's too much to ask of a printk, but it can give us a good clue.
>>>
>>>
>>> Page table entry and pmd entry are good enough: higher levels got
>>> added at some stage, but they are unlikely to be useful here.
>>
>> Yes, I added them when we're processing PUD entries we'd also want
>> P4D entry + PUD entry.
>>
>> This is one approach of having the printing be done mostly
>> manually, supporting 32, 64 and 128bit pte_val(). As raised by Ryan,
>> using local bufs to store the data to not involve printk.
>>
>>
>> I played with printing the byte stream manually, but didn't really like it.
>>
>> Gave it a quick test and it seems to do its trick. I have the feeling that
>> this can be beautified a bit more.
>>
>>
>> From 05af7317b126991a61b0a3d01c2863ce5a578d1b Mon Sep 17 00:00:00 2001
>> From: "David Hildenbrand (Arm)" <david@kernel.org>
>> Date: Tue, 30 Jun 2026 15:23:02 +0200
>> Subject: [PATCH] tmp
>>
>> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
>> ---
>>  mm/memory.c | 110 +++++++++++++++++++++++++++++++++++++++++-----------
>>  1 file changed, 87 insertions(+), 23 deletions(-)
>>
>> diff --git a/mm/memory.c b/mm/memory.c
>> index ff338c2abe923..ad39cafe110f9 100644
>> --- a/mm/memory.c
>> +++ b/mm/memory.c
>> @@ -519,9 +519,57 @@ static bool is_bad_page_map_ratelimited(void)
>>  	return false;
>>  }
>>  
>> +#define PTVAL_STR_MAX	(sizeof(u64) * 4 + 1)
>> +
>> +static void ptval_bytes_to_str(char *buf, size_t buf_size,
>> +		const void *entry, size_t entry_size)
>> +{
>> +	if (WARN_ON_ONCE(buf_size < entry_size * 2 + 1)) {
>> +		snprintf(buf, buf_size, "overflow");
>> +		return;
>> +	}
>> +
>> +	switch (entry_size) {
>> +	case sizeof(u32):
>> +		snprintf(buf, buf_size, "%08x", *(const u32 *)entry);
>> +		break;
>> +	case sizeof(u64):
>> +		snprintf(buf, buf_size, "%016llx",
>> +			 (unsigned long long)*(const u64 *)entry);
>> +		break;
>> +	case sizeof(u64) * 2: {
> 
> Could this be made sizeof(u128) instead ? But overall this
> approach looks good.

The would be cleaner. We might have to protect this case by something like

#defined(__SIZEOF_INT128__)
	case sizeof(u128):
		...
		break;
#endif
	default:

	...

Can you take over this approach and refine it (and address Andy's comments)?

I'm not quite happy about the

	typeof(pud_val(pud)) entry = pud_val(pud);

stuff, but I didn't see an easy (less ugly) way to avoid it. Maybe there is one :)

-- 
Cheers,

David
