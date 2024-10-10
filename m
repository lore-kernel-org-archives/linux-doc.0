Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB0D2F50
	for <linux-doc@vger.kernel.org>; Thu, 10 Oct 2024 05:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728536832; cv=none; b=PXVoy5q/K8TFpai4x29Get89ryg/lQ7h4GF9q+k/mm6LNPgyF6gMiOTrRmHXVcrXoKMBzDTWc/SorWb/7JuW1sc+IGM5XOMTTY532JH5IxpexECdONMitn1Qrrmnryh7llmvmv/3o9soobEdeRRiC3jmxeQ64whE+SOcM2TXe8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728536832; c=relaxed/simple;
	bh=MhyaaqfZS8RRFBzJ7Erc/q5N8zrMVQyU/5s0xyXsBuk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=bzBcWIEJNpOKCYj6hl4rB6MG5LGhtBlXPeEopBl8KPlD7YD03Nd35DlApJu44FrtwGMg55exIdWgTz4kegz8peYitKQRfne2SmUMonRjRosBrwzPMPAlu3aIdGX31C6AK1j5P8EMKrLae5ROcTnmKqBZJwe2hhyTfU5+Uti7A2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=NNEOpVOI; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="NNEOpVOI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=wEgvGlzfOb4jVHpg0zy7I32G3MPlOwZBuQVAvB/6vAo=; b=NNEOpVOI0rd6NRvv8+ZVaIs1VH
	q2EYnY8rgNBNYcGXor6EUeeg0IM/hkN7u+dsIsL5u2AHZwTpgMuODIsM/6fR9ZM1AxPNx7IMVPur8
	SVi65dIHCAC2PWFDZ71Zq7dbibVpZhhuVOYCgwT7UrcRsie+/jyYVvIlEBZta5KZTXJpZasUD4+6y
	cI0JPHA3ht4FtWlEdft+RcDeSTJgB64+7x0dMCZtrZmeUazZ9obgNmrO9YwHkgYdnPI6Wk9vcD/YR
	j2DiMo/DblrqtYKttt2wzoNSSm/+Syss/tDx0uE3BTXZq89Xh3xERLEHgXQ1/PYfi+ja9uLVsDHra
	1V7UpF+A==;
Received: from [50.53.2.24] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1sylNx-00000005B6i-36o6;
	Thu, 10 Oct 2024 05:06:50 +0000
Message-ID: <1406d498-84bf-49aa-9efd-6480ad618582@infradead.org>
Date: Wed, 9 Oct 2024 22:06:43 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm, slab: add kerneldocs for common SLAB_ flags
From: Randy Dunlap <rdunlap@infradead.org>
To: Jonathan Corbet <corbet@lwn.net>, Vlastimil Babka <vbabka@suse.cz>,
 David Rientjes <rientjes@google.com>, Christoph Lameter <cl@linux.com>
Cc: Hyeonggon Yoo <42.hyeyoo@gmail.com>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 linux-doc@vger.kernel.org
References: <20241009142936.56092-2-vbabka@suse.cz>
 <878quxe2kw.fsf@trenco.lwn.net>
 <f6fa720b-e8af-4afa-906f-29019aefe49a@suse.cz>
 <878quxb4rm.fsf@trenco.lwn.net>
 <8b0c1bb9-4a9a-4f8e-87df-275994df739d@infradead.org>
Content-Language: en-US
In-Reply-To: <8b0c1bb9-4a9a-4f8e-87df-275994df739d@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/9/24 3:02 PM, Randy Dunlap wrote:
> 
> 
> On 10/9/24 9:49 AM, Jonathan Corbet wrote:
>> Vlastimil Babka <vbabka@suse.cz> writes:
>>
>>> Thanks for the hints. I hope if we can agree that documenting the macros was
>>> intended to be supported, doesn't break the build (there are users already)
>>> and has only those minor rendering issues, it can be used?
>>
>> I'd totally forgotten that this was supposed to work.
>>
>> Yes it can be used... $WE just need to find a way to make it work
>> properly.
> 
> The code probably isn't expecting a macro on the right side. I'll take a look,
> but no promises.
> 
That would have been too simple.
I haven't found the problem yet. Ran out of time. Will continue on it tommorrow/Thursday.

>>
>> Every now and then I ponder rewriting kernel-doc in Rust, both to make
>> it more reasonable to modify and as a learning exercise.  But then I
>> come to my senses and go back to stuff that actually needs to get done.
> 
> That's a good way to lose helpers, although it might also gain you a few...
> 
> Yesh, I know, current is Perl.
> 

-- 
~Randy
