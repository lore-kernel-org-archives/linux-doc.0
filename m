Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A0F2E0925;
	Thu, 15 Jan 2026 18:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768502911; cv=none; b=RbPnc75ID4SOgas17SEorlXe0FZwD9YaCabZQQ2K/6alQJUE0/BTy0q1XvHQ5jz4F1qwcNhIKrOg0G8Q0Noz4OXVWj+Dqa84ChS2d60rTZWLxyXJmD8rsw+zGpP0jyeypU1ECVvJb0ToUrhDsx2B1XfLyXE2xFOpb1NocmAa/8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768502911; c=relaxed/simple;
	bh=LWJuOIDu4ZuDCGb4raOG0qnjdpnJLL4mdzKcC5d+n1k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hvfr6HTRu2n4M+WeKcGSB/jdnAa0Svr6NckPuqaoGFulEzBgitz5DhWRgtCty0wPLGeplXCaj2E7FMNeU8hSNYslqFWtCul32ZgXfCv7eJLyEoguPMK/AaAZQtiSq6rEWQwmVYpYNfWJ9IOgo5yg3ZKGJftAzbGpdtCKoLTfzww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=c/h0JnZx; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="c/h0JnZx"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=h1qSFWQZ3NHfUcLCSKhIlTH/BlYzT7y5MZMSPKJzPMQ=; b=c/h0JnZxcYBU0AsJveMGxCJX5A
	XI+OXdc8ZpBGJ9H5ZcNklgfwUkQRjnnQzzd9UFcNSFZJofn0katiSiRpgvqVqBnEi4L27gAdA6w59
	42vwTEW+LXl0MvY89qmwbypVKZgrR0cSpNhncmpQsuZV7GdIWZzrO1yK8zaR3OmwEEtaTcd/eCjQB
	+3Ezr+PSS/KOb1QdX0yWICYIn65APEz2qqzakao5pNzo5PpFPz2QYLg8h9KqZL1/rlCM4uKN/9mkl
	uDyf1cQuFTZa/83KdTHgJXk2N/NJekd+ceDn0/UqVZjvnKtqYK3YvLwAo3eow2zI0i8OaZ2QBI6bz
	B0V+tF4A==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgSOM-0000000D02h-3Unj;
	Thu, 15 Jan 2026 18:48:23 +0000
Message-ID: <6aea353f-9dfa-4319-8437-4f4e2ec47186@infradead.org>
Date: Thu, 15 Jan 2026 10:48:22 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Move kernel-doc to tools/docs
To: Jonathan Corbet <corbet@lwn.net>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Akira Yokosawa <akiyks@gmail.com>, Shuah Khan <shuah@kernel.org>
References: <20260114164146.532916-1-corbet@lwn.net>
 <813cd0b6-e23b-4571-91fa-224106d3ad54@infradead.org>
 <87zf6gt2ts.fsf@trenco.lwn.net> <20260114212558.1aeb1b17@foz.lan>
 <3237bd2e1397910708743dba2c7d80b2c8eecb0b@intel.com>
 <87ecnquda3.fsf@trenco.lwn.net>
 <8af04281-6cde-4903-8b30-3eea213d8ff9@infradead.org>
 <87wm1isqf8.fsf@trenco.lwn.net>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <87wm1isqf8.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 1/15/26 10:04 AM, Jonathan Corbet wrote:
> Randy Dunlap <rdunlap@infradead.org> writes:
> 
>> On 1/15/26 7:05 AM, Jonathan Corbet wrote:
>>> Jani Nikula <jani.nikula@linux.intel.com> writes:
>>>
>>>> On Wed, 14 Jan 2026, Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
>>>>> Em Wed, 14 Jan 2026 12:24:31 -0700
>>>>> Jonathan Corbet <corbet@lwn.net> escreveu:
>>>>>
>>>>>> Randy Dunlap <rdunlap@infradead.org> writes:
>>>>>>
>>>>>>> I do many of these on a regular basis:
>>>>>>>
>>>>>>> $ ./scripts/kernel-doc -none -Wall <path_to_source_file>
>>>>>>>
>>>>>>> Will I still be able to do that (by using ./tools/doc/kernel-doc ...)?  
>>>>>>
>>>>>> Yes.  The tool moves, but its functionality remains unchanged.
>>>>>
>>>>> That's actually a good point: should we preserve a link on scripts
>>>>> pointing to ../tools/doc/kernel-doc? I suspect that a change like
>>>>> that could break some machinery on several CI tools and scripts
>>>>> out there. If so, it could be useful to keep a link - at least for
>>>>> a couple of kernel releases.
>>>>
>>>> I think the tool source should be called kernel_doc.py or something, and
>>>> scripts/kernel-doc should be a script running the former.
>>>
>>> I honestly don't get it - why add an extra indirection step here?
>>
>> a. compatibility with people in the wild running scripts/kernel-doc
> 
> That is easily achieved with a symbolic link if we need it.

Sure.

>> b. adhere to well-known naming conventions.
> 
> The normal convention is to not have language-specific extensions on
> commands.  As in "scripts/kernel-doc".  I still don't understand how
> making a wrapper script somehow makes this better.

Ah, like .py or .pl or .sh.
Yeah, nice to avoid those.

-- 
~Randy

