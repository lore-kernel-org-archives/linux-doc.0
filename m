Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74AA2857C7;
	Sat, 18 Apr 2026 11:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776511251; cv=none; b=ir5MCcJ9VV/mUc9LkosGU2JXBkOcgxGcG0NpdXj7jlaCZTPljGqALTBSPd/YTXLNK3C55m4PYkv8mhrdsv03hvPW5KgV1/tbV8bukHwM1GHzTdmUKHWPOL4JraDdW4WAv+s5sFMEqYu1otLuqN3BPkKvZ/rs0fEmWMS0k2T7H9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776511251; c=relaxed/simple;
	bh=OHIb1c9BBc70WI75peUduOfKkf3hZtDZ+y1C4MSgIn8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EbfubCFTEJa05ozVQ9qPnUrcyJVIEpshE/uNdXxsLTJ7YrP4iTrdESfC7mg7G8JDNSk82DPD0dOxfG4No5LPIkOrCrzvgRxmUO1khNqXnOJbS2RuPlzRP2oJAoijaubMb7XjkvQUeplo6Pd3BkXfpDa/kXSoGuMOZ8PfBzd14UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rQ5bxRKG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rQ5bxRKG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A03C4C19424;
	Sat, 18 Apr 2026 11:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776511250;
	bh=OHIb1c9BBc70WI75peUduOfKkf3hZtDZ+y1C4MSgIn8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rQ5bxRKGs1G5VtMPzCsJkd8rySYpt+Z9a6kF0T9TCytsuks+aLJleV5C2visLQuk/
	 148GF6lLvzu08n33pqnlteLO6u961kDUdLjAtwgerJqh+UEBzqav/JqRBzz81npYs/
	 EdgSZRpMfAjzy2TvL1lbj/HVH7bYERuAiI+jF3v8BdBe1W4vlnJS5oYtawBxFbYipf
	 lnlQPKcLspYfESm13qRMcUGzxo4yImY4tSVMBVbOIIDKMPzw6Ry9Nvsm5eEBLQ6YMP
	 yYCG2ENmvZTJ1q2uUjBbI2jmgsRJhG0q1DnpGVMDXiumAq3Pe1kYUZa5t3CmA0aGWJ
	 nI/rtS1PyuztA==
Message-ID: <75b2b254-2e02-43ca-9109-9812cf3f85b2@kernel.org>
Date: Sat, 18 Apr 2026 13:20:42 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: Add overview and SLUB allocator sections to slab
 documentation
To: Nick Huang <sef1548@gmail.com>, Lorenzo Stoakes <ljs@kernel.org>
Cc: Matthew Wilcox <willy@infradead.org>, Harry Yoo <harry@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>,
 David Rientjes <rientjes@google.com>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, Mike Rapoport
 <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-mm@kvack.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260418000635.17499-1-sef1548@gmail.com>
 <aeMQ36jFnCKmCSyA@casper.infradead.org>
 <CABZAGREDHwsXMm65_WxEn=v-zTv7_eVqQzQeCRqU2Gyc0aTETQ@mail.gmail.com>
 <CABZAGRGFpiiEr7Odd5an1+9Z+sX1C6QT2iadv-0hNhxGj8eEyg@mail.gmail.com>
 <aeNKDh8S6pXHqRFh@lucifer>
 <CABZAGRGCwM1PiSxennV-Uy9y1gGKjpcHeq+eOAbqSZcy3Qb55g@mail.gmail.com>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Content-Language: en-US
In-Reply-To: <CABZAGRGCwM1PiSxennV-Uy9y1gGKjpcHeq+eOAbqSZcy3Qb55g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 4/18/26 1:00 PM, Nick Huang wrote:
> Hi Lorenzo Stoakes
> Lorenzo Stoakes <ljs@kernel.org> 於 2026年4月18日週六 下午5:11寫道：
>>
>> On Sat, Apr 18, 2026 at 02:12:22PM +0800, Nick Huang wrote:
>>> Nick Huang <sef1548@gmail.com> 於 2026年4月18日週六 下午1:27寫道：
>>>>
>>>> Matthew Wilcox <willy@infradead.org> 於 2026年4月18日週六 下午1:04寫道：
>>>>>
>>>>> On Sat, Apr 18, 2026 at 12:06:19AM +0000, Nick Huang wrote:
>>>>>> - Add "Overview" section explaining the slab allocator's role and purpose
>>>>>> - Document the three main slab allocator implementations (SLAB, SLUB, SLOB)
>>> Hi Matthew Wilcox
>>> I will remove this sentence in the next version:
>>> “Document the three main slab allocator implementations (SLAB, SLUB, SLOB).”
>>> I’m not entirely sure I fully understand your point. If I’ve missed
>>> anything, please let me know what needs to be changed. Thank you.
>>
>> No, please don't send any more revisions of this garbage, thanks.
> 
> thank you for your guidance. I will correct my work and introduce the
> more recent `barn`, `sheave`, and `kmalloc_obj`.
> Do you think this is appropriate?

No, this whole thing is inappropriate from the beginning. We are not
going to waste more time on development-by-review for something that
started as undisclosed LLM slop.

