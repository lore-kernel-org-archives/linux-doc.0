Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C83F1C6FF5;
	Thu,  5 Mar 2026 00:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772670280; cv=none; b=m7SbRhaLdSdEK7nIS/NJF3i4OoLEHSeP7XLAasSUYENnmcaKn8iHIiZLioTX0Rdy2XUY9Cv6fUqV21B+WTIOXclo9oKITUpYbsoBfo9LzJ6zW1lNt5lxzcd+BRDztO9feKdrAS3aqy7eS3G5o8e9Wr4TdALN8K8bgj+SRvdJCT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772670280; c=relaxed/simple;
	bh=w84+XvbJQUTVGCoBwbVcV8MARvaMnIaqfxr7ktxmIPs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tKmVNYJYZHexqIy/bRQzgAAPnTU4WuZvtoKd17yOgm6p6yo4NUTDtL78bnHw8VwUte8+Vblue4HvVufB1UDzvxYp7fcG8C2qSN3jQF9vnxLq0wEJZ7JPsFPn+W6Fz3AA/uSoExHKn2r0v2FRwMLCyep2VTjhBO8uHl2OVPwI5SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ZoDi4+nh; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ZoDi4+nh"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=hXXUIbAxq9NoGFe3cfk1MLJUg+HNoEgMGrcnbNV5sgc=; b=ZoDi4+nh3ENUdxUJ2n9pqCnRVS
	e5qt55CXfXljyL8jc5FR+WbHK+RsLsM09wRf9qhXEAoEz5Lwl+7yisHmrpVWBbwjQufaY8jylsLF1
	oyw7gy+KiRV/inSomUZ8gVpM+vuunxhIqMKjYg66Z7e+VoSz1UwytTM5+XzckZb3wvGLnAM9ksjsO
	xM4QNb6gc9hSKO1SGk5Xc2FE61rynyWjP+TJtWHJAdR7Up6A3R+RCV7+L0F+H1tkhYJL/jPRPWLiV
	Rf1lYcxFc+1su+RHSMJj7Ge0wtppLC7On1ARXeQ7MRK5q4TP0J16JYeLOjxndm5sRIimIHcjrV9jV
	HtZSCPHQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxwW2-00000000hOv-3cuY;
	Thu, 05 Mar 2026 00:24:34 +0000
Message-ID: <8a4def17-714b-4768-830a-16a84af8f937@infradead.org>
Date: Wed, 4 Mar 2026 16:24:33 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: fix '*' wildcard formatting
To: Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
 Kees Cook <kees@kernel.org>
References: <20260304224201.1072044-1-rdunlap@infradead.org>
 <87o6l343bx.fsf@trenco.lwn.net>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <87o6l343bx.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/4/26 2:50 PM, Jonathan Corbet wrote:
> Randy Dunlap <rdunlap@infradead.org> writes:
> 
>> It seems that these wildcards confuse some parser (docutils, sphinx,
>> or maintainers_include.py), so quote them to avoid this issue.
>> Also insert a hyphen ('-') before "all files" in several places
>> to make the html output easier to read.
>>
>> Fixes this htmldocs warning:
>>
>> linux-next-20260304/MAINTAINERS:40: WARNING: Inline strong start-string without end-string. [docutils]
>>
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> ---
>> Cc: Jonathan Corbet <corbet@lwn.net>
>> Cc: Shuah Khan <skhan@linuxfoundation.org>
>> Cc: linux-doc@vger.kernel.org
>> Cc: Kees Cook <kees@kernel.org>
>>
>>  MAINTAINERS |   10 +++++-----
>>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> I remain unconvinced that dragging all of MAINTAINERS into the docs
> build brings any joy.  Is that something that you actually use?

No, I use '$editor MAINTAINERS'.
I'm quite good with rm Documentation/sphinx/maintainers_include.py.

> (That said, as long as we're doing it, it should work properly)
Yeah, just make the warning go away.

-- 
~Randy

