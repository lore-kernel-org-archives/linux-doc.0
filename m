Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6AD303C87;
	Sat, 25 Apr 2026 16:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777133387; cv=none; b=KA9UHv4mHlPQ88WxVn+bZ88aWw++szb5ABDEmtqTV+A0nKKSr+TrYMukt0RzYhibTXC+FdXc1bkjmUET9JFkAkzgEAfZtBs+SMoaaFZSsW91srs1A+2C99EEWTLG13WqdCOBBy+eV3qjz2r42QaVpCFOp8Fqr6SHCNmD/yebxt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777133387; c=relaxed/simple;
	bh=B/lgklGe1J5JXKAyck0MPX6Wmp6wz1ndCOue9ot4ns8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Eytvke8SyTvNpkfXReiI5m4gCF9P2yZ12EP65ZQjSTo1ZDrWVjQXo175NBijYdCOxC3akiG7hrIXlvdGEx8dYErajSXnmgRIMj1IQecPxZiDY4TDuA0zRYvE+vCj9qmZo4iaOZFo2XH+PDErvxxMF248/Ck22QT4xv7LX73MJMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tzPVVKPi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tzPVVKPi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D81E6C2BCB0;
	Sat, 25 Apr 2026 16:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777133387;
	bh=B/lgklGe1J5JXKAyck0MPX6Wmp6wz1ndCOue9ot4ns8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tzPVVKPihQ9cAeGJzgRwLIjBHoZIftqV9ajNQhJmX+k02XFjVI5kgwRu8DbVr7QMn
	 J7qIPnY+opMqspKI6iSzRLacFQnXaP/MLfT3tYBBFWGjefvrRFp+bvVN2AcJ6XSjup
	 NOeJCnWOZdKz0JOSS+bQlO5gjgYhAHNn3FtpUY6EFm/RmRlJiA3P10UY43WhMwAQ2x
	 fiOmqIyXgDWVZm+leyJJ/a5MxbkfFftUuPk/i0P2gISGXCL3SL8o4NZX10cKpSNoQu
	 iNsOT06S0XKdPzDyHFoe85HoMkjwetveI1r7TC4Ak41RonQQgqkl/lQX5LG+VBpybP
	 lD8B5e2YkPIIQ==
Date: Sat, 25 Apr 2026 12:09:45 -0400
From: Sasha Levin <sashal@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, akpm@linux-foundation.org,
	corbet@lwn.net, ljs@kernel.org, Liam.Howlett@oracle.com,
	rppt@kernel.org, surenb@google.com, mhocko@suse.com,
	skhan@linuxfoundation.org, jackmanb@google.com, hannes@cmpxchg.org,
	ziy@nvidia.com, linux-mm@kvack.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC 0/7] mm: dual-bitmap page allocator consistency checker
Message-ID: <aeznSeoi1qFAVu3n@laps>
References: <20260424140056.2094777-1-sashal@kernel.org>
 <b001932c-e376-462e-895a-5e4a9c7c0dc5@kernel.org>
 <aeuZcY0u_7PIQb6R@laps>
 <b2a15eea-6ed9-4b35-af68-4586554ad2a3@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <b2a15eea-6ed9-4b35-af68-4586554ad2a3@kernel.org>

On Sat, Apr 25, 2026 at 07:51:10AM +0200, David Hildenbrand (Arm) wrote:
>On 4/24/26 18:25, Sasha Levin wrote:
>> On Fri, Apr 24, 2026 at 05:42:53PM +0200, Vlastimil Babka (SUSE) wrote:
>>> On 4/24/26 16:00, Sasha Levin wrote:
>>>> Existing memory debugging tools - KASAN, KFENCE, page_poisoning - detect
>>>> access violations and content corruption, but none of them can detect
>>>> silent corruption in the page allocator's own metadata. If a hardware
>>>> bit flip corrupts an allocation bitmap, the allocator hands out a page
>>>
>>> An allocation what? The page allocator is a buddy allocator, it has no
>>> bitmap to track free/allocated state of pages?
>>
>> You're right, the cover letter is misleading there. Buddy doesn't use a bitmap:
>> PageBuddy lives in page_type, the free list is a list, and page->private holds
>> the order. The dual-bitmap is new metadata the feature adds, maintained from
>> the alloc/free hooks.
>
>Given that you have PageBuddy (first "bit"), could we use a second bit in page_ext?

Hmm... Thats an interesting idea.

I can see two concerns with something like this:

1. The checker has to be live before memblock_free_all() hands pages to buddy.
page_ext isn't fully up that early I think.

2. page_type encodes buddy, offline, slab tags, etc... and a page that isn't
PageBuddy isn't necessarily allocated through alloc_pages. The invariant gets
case-y.

But let me think about it a bit more.

-- 
Thanks,
Sasha
