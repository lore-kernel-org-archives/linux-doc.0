Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4341647F2D2;
	Thu, 11 Jun 2026 17:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781198013; cv=none; b=AZmPV3EcfdVVsBOcP+g7ofXSJp50ECCbui7ZG26JHzJugo6bBliurLMPnZqCAms8Nbsow56R7mU96ydFMwXPzeyQ5+97deBqTQvqyDsp5pf2zfbCEB+88A9vrxTfwjeO8gVMRNjhO4mHNKWEtA0PvUiR6ABiz0K0d9ocnNOYvIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781198013; c=relaxed/simple;
	bh=fIkGv3nxYDqrrVIs/iO+fme1R1ZaFZY1H+O0erPFSog=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tRNnk2IVy6VFS302SSUNiK6ws09qwk2MMIK42MRf8qK4zq5PM8SF9GXT4lv1BiPjvdSJfj3UplUlrt+f3dd3+uMho30bj7Z2TgxQjTS0SKOUFPR2GJYlQvXAV/Xh8Hy3bVhAH5ART0CC515gfmm1KpOVI25wGLzQ0k5G5BHMwAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HA0uKigk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HA0uKigk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B3911F00893;
	Thu, 11 Jun 2026 17:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781198010;
	bh=Nwdxz81celIWV0g+LXaRXXBHu4C0uL5MSLZDhZvdBVM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=HA0uKigkLOcHQ7YitAFpJn66wcFJnpHFUImT72I4hnXNmC4KiZBB1vewKMkG95gXS
	 lPQR6Rssw1umWs+neqkAgV0wH1nUqJg1kcMlqZtri6FkG5MtaCZQ8PovwbvjYc72H0
	 W5J3X7zmWRiWxMn1+HofALnPaNvjcPxWbXuNU22seGqiEVyZ08Q1THfyHuhEYm+HEM
	 rgHs7LjibR0HTqzCW/og0M3tHy6E6QgJ3vFeGPRfkSOlIvkPHO2qHUWoEnYQHCo717
	 UGJXXqkieucbGxxeKWE24x4PnAycgrZFCHTAOHCy3D9kasbcULPPt18DyT3sUAr07L
	 h7jOmhptUvAwg==
Message-ID: <8c5d67d1-e4b0-4cb2-9336-875f4f2ca96b@kernel.org>
Date: Thu, 11 Jun 2026 19:13:25 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/5] mm/slub: preserve previous object lifetime
Content-Language: en-US
To: Harry Yoo <harry@kernel.org>, Pengpeng Hou <pengpeng@iscas.ac.cn>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org
Cc: Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>,
 David Rientjes <rientjes@google.com>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 liam@infradead.org, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260611063926.38111-1-pengpeng@iscas.ac.cn>
 <2b5577b0-d81a-4dee-b4e2-acadcf7f7db2@kernel.org>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Autocrypt: addr=vbabka@kernel.org; keydata=
 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
In-Reply-To: <2b5577b0-d81a-4dee-b4e2-acadcf7f7db2@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/11/26 09:19, Harry Yoo wrote:
> Hi Pengpeng,
> 
> On 6/11/26 3:39 PM, Pengpeng Hou wrote:
>> SLAB_STORE_USER currently stores one allocation track and one free track
>> for an object. This is useful, but it loses part of the previous lifetime
>> when the object is reused: the new allocation overwrites the allocation
>> track, and a later stale free can overwrite the free track.
> 
> I'm not sure what you meant by "stale free", UAF is accessing object
> that are freed. What makes the free "stale"?

I'm guessing it means 'second/duplicated free" of the previous owner.
Accesses (UAF) perhaps may not happen by that owner, or if they happen after
he object is reallocated, they are not recognized as such.

> In general, I don't think slab_debug=UP is the right tool to debug
> use-after-frees, because slab will never know _when_ the object was
> overwritten. It can only tell that somebody has overwritten freed
> objects by checking if the object content is POISON_FREE or POISON_END.

It could give more information about double frees like this, however.

> KASAN is a better tool to debug use-after-frees, because it can
> tell you which kernel code is accessing memory it shouldn't. (It also
> quarantines slab objects to avoid immediately reusing the object for
> better coverage).
> 
> So I have to ask, "Why not use KASAN instead?" before enhancing
> slab_debug (neither is intended for production anyway).

From my distro experience, it's very useful to tell a user to just enable
slub_debug for a specific cache with the existing kernel, with some but not
prohibitive overhead. And with some luck it gives you enough information to
find the root cause too. So in that sense it can be used in production.
KASAN is indeed superior wrt catching issues, but almost never applicable in
such environment. It would need a rebuilt kernel and the overhead is much
higher. So it's a tradeoff.

>> For free-after-reuse bugs, the report can therefore contain the victim
>> allocation and the stale free, while the earlier alloc/free pair that
>> explains where the stale pointer came from is no longer available.
> 
> Again, I'm confused. I have no idea what "free-after-reuse" means.
> Objects cannot be reused until they are not freed, no?




