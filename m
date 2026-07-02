Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6BE835202C;
	Thu,  2 Jul 2026 09:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782983075; cv=none; b=s4+0Lis965PnFMeSoM8jZ+RyPOSLXSK9tmZU/CjfvbLxsrUCwujuupwSMpg4QpPm8u9gzl9eiz546xQGApUUCvD7qafuPy5J/N8IIclpUH3PY7Dy1pinzA1W1TNe34NxME9GyyaOVPOLnlGjlbaom2Fele51ThtJmO3VsB6NjyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782983075; c=relaxed/simple;
	bh=skZBuRwgJNMMqdH9+tXWMrShb4xpbFgofyo5yVQjkog=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H9wqZ6rnQfRXH+eB0FZZq1AUciVpfSF7uaMLKJ6DY7Au1b8CEmatLPh1k/AmDWaquneLLmiqW2CghkOxqpHCvdhusEenIU5DqToWFQ2nE9nKk5AhszyYpnf8QvJ56dVJg/G+nj/yUDibvBnCnqEKHcgCQGWOi/zxhHrnNpUmXEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ZFIZ7JLA; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ZFIZ7JLA"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CF7A5288E;
	Thu,  2 Jul 2026 02:04:28 -0700 (PDT)
Received: from [10.163.170.96] (unknown [10.163.170.96])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B584F3F85F;
	Thu,  2 Jul 2026 02:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782983073; bh=skZBuRwgJNMMqdH9+tXWMrShb4xpbFgofyo5yVQjkog=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZFIZ7JLA725PMonMebzR9pkpHavkPQi9FODAisJ1dYA8dr9CD19PiaisyGbmljAI0
	 K+vHcZmzR0ANbP7QhSPzdF8X3Vy6qt2Ih1iWsoTBpDLyO22rnSQ0jw1QgvqPXaMwnF
	 lz25PKyKNBozoNyB560EHDLYHK9IUFxolBQ2avVg=
Message-ID: <e4ec99fc-dfb1-4205-a193-f694e9f6a13b@arm.com>
Date: Thu, 2 Jul 2026 14:34:22 +0530
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC V2 3/3] mm: Replace pgtable entry prints with new format
To: "David Hildenbrand (Arm)" <david@kernel.org>,
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
 <82902a84-7e62-496b-b1c0-62bad1be4525@kernel.org>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <82902a84-7e62-496b-b1c0-62bad1be4525@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 02/07/26 1:02 PM, David Hildenbrand (Arm) wrote:
> On 7/2/26 06:29, Anshuman Khandual wrote:
>>
>>
>> On 30/06/26 7:06 PM, David Hildenbrand (Arm) wrote:
>>> On 6/16/26 08:19, Hugh Dickins wrote:
>>>>
>>>> Yes, that's what it's for. What we really want is to understand what went
>>>> wrong: that's too much to ask of a printk, but it can give us a good clue.
>>>>
>>>>
>>>> Page table entry and pmd entry are good enough: higher levels got
>>>> added at some stage, but they are unlikely to be useful here.
>>>
>>> Yes, I added them when we're processing PUD entries we'd also want
>>> P4D entry + PUD entry.
>>>
>>> This is one approach of having the printing be done mostly
>>> manually, supporting 32, 64 and 128bit pte_val(). As raised by Ryan,
>>> using local bufs to store the data to not involve printk.
>>>
>>>
>>> I played with printing the byte stream manually, but didn't really like it.
>>>
>>> Gave it a quick test and it seems to do its trick. I have the feeling that
>>> this can be beautified a bit more.
>>>
>>>
>>> From 05af7317b126991a61b0a3d01c2863ce5a578d1b Mon Sep 17 00:00:00 2001
>>> From: "David Hildenbrand (Arm)" <david@kernel.org>
>>> Date: Tue, 30 Jun 2026 15:23:02 +0200
>>> Subject: [PATCH] tmp
>>>
>>> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
>>> ---
>>>  mm/memory.c | 110 +++++++++++++++++++++++++++++++++++++++++-----------
>>>  1 file changed, 87 insertions(+), 23 deletions(-)
>>>
>>> diff --git a/mm/memory.c b/mm/memory.c
>>> index ff338c2abe923..ad39cafe110f9 100644
>>> --- a/mm/memory.c
>>> +++ b/mm/memory.c
>>> @@ -519,9 +519,57 @@ static bool is_bad_page_map_ratelimited(void)
>>>  	return false;
>>>  }
>>>  
>>> +#define PTVAL_STR_MAX	(sizeof(u64) * 4 + 1)
>>> +
>>> +static void ptval_bytes_to_str(char *buf, size_t buf_size,
>>> +		const void *entry, size_t entry_size)
>>> +{
>>> +	if (WARN_ON_ONCE(buf_size < entry_size * 2 + 1)) {
>>> +		snprintf(buf, buf_size, "overflow");
>>> +		return;
>>> +	}
>>> +
>>> +	switch (entry_size) {
>>> +	case sizeof(u32):
>>> +		snprintf(buf, buf_size, "%08x", *(const u32 *)entry);
>>> +		break;
>>> +	case sizeof(u64):
>>> +		snprintf(buf, buf_size, "%016llx",
>>> +			 (unsigned long long)*(const u64 *)entry);
>>> +		break;
>>> +	case sizeof(u64) * 2: {
>>
>> Could this be made sizeof(u128) instead ? But overall this
>> approach looks good.
> 
> The would be cleaner. We might have to protect this case by something like
> 
> #defined(__SIZEOF_INT128__)
> 	case sizeof(u128):
> 		...
> 		break;
> #endif
> 	default:

Right - realized that just a bit later :) Not all
platforms and corresponding tool chains might not
support u128.

> 
> 	...
> 
> Can you take over this approach and refine it (and address Andy's comments)?

Sure will do that.
> 
> I'm not quite happy about the
> 
> 	typeof(pud_val(pud)) entry = pud_val(pud);
> 
> stuff, but I didn't see an easy (less ugly) way to avoid it. Maybe there is one :)
>

Could __auto_type be an alternative ?
