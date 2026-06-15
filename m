Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7667F3FE666;
	Mon, 15 Jun 2026 16:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781539302; cv=none; b=Re+mgP9ssxPkD24yrh7i7DysNzPty3LCl7LZddbpZcwa4Gl71Cfk9oRE7+dYiRPWhNKix+j89zFHIihUKnMk41F3hLj1k3ZETFwPyR5MUeHtBNuVORL/xNjXXokcZRKC+2A7VNApBhk0XQ+6p7eQ/wN15mj9oCnbTl+MIyvzJuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781539302; c=relaxed/simple;
	bh=a+XyRnORn/0yKpl4WMZH/YJvJoP6t86l93pFFJExXCs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DvEoke2BW9wSsvuE5uaatKpGbv0VtNGIAdhkcgOFMu+fD1GZtOzgzXz4Qo1JbQ2DxQgkInvbNaWMqHG304NsrlcQN293DYwlmK4tgpMi4boWyRb0Amloar7yq2QugcF0B4Q12motcGoOqfi0KXabMHtig/IzMYe/n+KFn+bu9QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dpX9vS/W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dpX9vS/W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F3CE1F000E9;
	Mon, 15 Jun 2026 16:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781539301;
	bh=fw9ipZ1soWvH2JNYG+Z2DPzy8xqT/cR/rq8gvZbdmIg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=dpX9vS/W/z2ZpUgfkhsbyA7ndOmnjk5PBqrpa8kaPAdJF3QhnIBRjui8HGaSpX9xo
	 QEUU6uFIKI5uMP0kngIUdg65PgR93xTvr3ueaFg8Gh2pXfgz5CDhxP6rZlB604HVPM
	 hq9ClC4P8lcmSx5RpBmH0WESEgjN1h3c4cVfnxnGp4C+U8ojDsgErmky6qXJRaMxGt
	 yrDdSJRAU61VURWOVA8ZmiR9nvW9Kjxm1fOsKbEtFISVUdHxvIEoY/ccF0GpWeUczn
	 x4ZCDEkxGQ179bSMfDuONzCJX1/57JM1B2O9y4rOu1yJsU7Bl3QK02sXXhTvBaWPgv
	 ISYNqe7xMs87Q==
Message-ID: <dabfd73b-d872-4267-9a40-45463fe146ac@kernel.org>
Date: Mon, 15 Jun 2026 18:01:36 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC V2 3/3] mm: Replace pgtable entry prints with new format
To: Hugh Dickins <hughd@google.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
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
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <4a416383-62f5-1716-8e04-a2ee1f89a864@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/12/26 23:26, Hugh Dickins wrote:
> On Fri, 12 Jun 2026, David Hildenbrand (Arm) wrote:
> ...
>>
>> After some off-list discussion, I wonder if we can make our life easier.
>>
>> I think, even with your patch, there is still the case:
>>
>> pr_alert("BUG: Bad page map in process %s  %s:%08llx", current->comm,
>> 	 pgtable_level_to_str(level), entry);
>>
>> Where we cast all entries to an "unsigned long" in the callers. We'd have to rework all
>> that for 128bit entries either way (passing them in some struct instead).
>>
>> I really just extended what we used to do here in print_bad_pte() before commit ec63a44011d.
>>
>> Maybe we should just drop the "print the involved page table entries" thing?
>>
>> I mean, we do have the actual page, and we do have the address in the address space, which
>> we all print.
>>
>> Not sure if the actual page table entries are that relevant?
> 
> The page table entry is BUGgily Bad: we want to see what it looks like
> (sometimes, a sequence of bad page map entries may even show up as ASCII).

But is printing raw page table entries really what we want? I guess to detect
"random corruption" it might help sometimes.

And do we really need information about the full page table walk, or is the last
level good enough?

-- 
Cheers,

David
