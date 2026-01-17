Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B251EBFE0;
	Sat, 17 Jan 2026 18:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768673409; cv=none; b=GR2ZWcrtRjpCOodEjzRrfxBory+ZqD3unSNhV6ASXUf35J6pT2KobkyAawc0EXS6/e+TALTit+zU21fQ55eOXBWRrSGKNWMYEgvmlszaxc0tnqLWchokFkts6nrksr/7MVPbBto+iUUNTcJoV6NigKc8FPzzzXp3STf5gGWsX20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768673409; c=relaxed/simple;
	bh=ZIoNoJKX26LmirjLlq6UqubJYlwhfHX59ay68WdZxnM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SZELI5tOfFeTGXXjXeaLRNvuQR/yjCOuGvpRDxYH1P71hmL/w+OWc0vrYCv/fcYty+rb+8Gkg6GgF8UPLC39uD2g8pwTne8mtC13kMwqfL/DCmTGconSdNyvH3IHFbnELJ9oUiln45DfcC1mgdKcXe9kZJJhcmn4GjGpRBSg3Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=1yTmFWcY; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="1yTmFWcY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=eIdGFZQrq1W1+oDWg1pFyefKw3jSU0hUHz1p7WUuKX4=; b=1yTmFWcYMBAN3GUwybq8Skw0jv
	/AtSdjUOVImaSNSTmGcHv0K9Uko+kKNepRmHvVv8bZ6yS2kfYD+manlx6eBTliSaCQXeK63sBv46q
	lfNdoGXh4IbzDAH107sZXRBm3KLbxBW7SB871kCjEL7P2rUdrzXqX31at0lSVaiDMh2B++dG4/G+n
	Oi7XjPo2h9gF4Nzpo3ZSMLauFGt+OzV3ho9+Ai/X4hnC+lfg02ev43nVoUL5FmYRraDR2IIN7jlYh
	/Adkb1P/33Gqb6v6bKs3IKcFaWAIE+ArCgg45kCwI+oJ5PMPBY49zJuxPr39xFUuoBeYJIVR+MDCV
	cO2D5BhA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhAkH-0000000FiG2-1fs5;
	Sat, 17 Jan 2026 18:09:57 +0000
Message-ID: <1fd4145f-b9f2-471b-8203-679ecea0d214@infradead.org>
Date: Sat, 17 Jan 2026 10:09:56 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Move kernel-doc to tools/docs
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Akira Yokosawa <akiyks@gmail.com>, Shuah Khan <shuah@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>
References: <20260114164146.532916-1-corbet@lwn.net>
 <813cd0b6-e23b-4571-91fa-224106d3ad54@infradead.org>
 <87zf6gt2ts.fsf@trenco.lwn.net> <20260114212558.1aeb1b17@foz.lan>
 <87wm1ho3cs.fsf@trenco.lwn.net> <20260117110049.6cc49048@foz.lan>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260117110049.6cc49048@foz.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 1/17/26 2:00 AM, Mauro Carvalho Chehab wrote:
> Em Fri, 16 Jan 2026 10:48:51 -0700
> Jonathan Corbet <corbet@lwn.net> escreveu:
> 
>> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
>>
>>> Em Wed, 14 Jan 2026 12:24:31 -0700
>>> Jonathan Corbet <corbet@lwn.net> escreveu:
>>>  
>>>> Randy Dunlap <rdunlap@infradead.org> writes:
>>>>   
>>>>> I do many of these on a regular basis:
>>>>>
>>>>> $ ./scripts/kernel-doc -none -Wall <path_to_source_file>
>>>>>
>>>>> Will I still be able to do that (by using ./tools/doc/kernel-doc ...)?    
>>>>
>>>> Yes.  The tool moves, but its functionality remains unchanged.  
>>>
>>> That's actually a good point: should we preserve a link on scripts
>>> pointing to ../tools/doc/kernel-doc? I suspect that a change like
>>> that could break some machinery on several CI tools and scripts
>>> out there. If so, it could be useful to keep a link - at least for
>>> a couple of kernel releases.  
>>
>> So is the location of kernel-doc part of our ABI, or an internal detail?
>> :)
> 
> Surely it is not part of ABI: it can be changed whenever we want.
> 
> From my side, I don't mind where it is located: it will take some
> time, but my fingers will end learning its new location/name ;-)
> 
>> I'm not deeply opposed to maintaining the symlink, though I'd rather
>> not.  It won't be for "a couple of releases", though; if the symlink is
>> there, nothing will ever change.
> 
> I see two reasons why having a symlink:
> 
> 1. to avoid the risk of eventually breaking someone's CI or scripts.
>    This is just a preventive measure, as I'm not aware of anyone
>    with such scripts;

I have some such scripts. And it's easy to update them, but I'd like for them
to be compatible both going forward and backward in kernel versions -- without
having to do something like:

	if [ -x scripts/kernel-doc ]; then
		foo
	elif [ -x tools/docs/kernel-doc ]; then
		baz
	else { help; }

I doubt that I am unique/alone in this.

> 2. as you don't want ".py" extension on execs, but PEP8 mandates it, >    together with replacing "-" with "_", you can have a symlink that
>    would make both PEP8 and you happy ;-)
> 
> Just my 2 cents.


-- 
~Randy

