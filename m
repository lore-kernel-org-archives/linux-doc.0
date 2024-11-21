Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281636CDAF
	for <linux-doc@vger.kernel.org>; Thu, 21 Nov 2024 17:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732210737; cv=none; b=OFXFF2lQX5n/zPQFa/3/Z1OaZnchOWP5LCtUgMyEnyT6hfdogdBP45T7ghK0fswlBEPYUgsbR4GtW5pQjhi33pR2FVkV+siIWUeiA0k6DDyiUl/2ZOTYNUGYLWtGH11QjuUJ36oFRsdvLN0MhgnDNlHnF7UUXl+GMOx7qpijI88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732210737; c=relaxed/simple;
	bh=S/y5ZyYozL2J9WdTeutnmyNj6lkYDklgSKjBzODuq5k=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=iBSTiRZXRB2/8D/jJt4MevjdI0gs6DpNpKXTeEbOEmo+mPsfBPGG1FZ/6rA3CptpR0T3jxdTuxdjx3qeJHv62OH7OXBBn4cR4DtHY152gdLTQWiaBSt3Zqz54wVr3CBw19UUbPMrnExpM3rjgrmbLr4IgpPqjnzUGeWAQ1ld0fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=h8evHUOz; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="h8evHUOz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=9/Fvc5ORfLBUp92+5Ys5y+uUoLMk7GsogvOAb+TM/24=; b=h8evHUOzh6Gk6wHxxK/t77G2fk
	KmbTt3xgWlTcD3oWD2Z6pRtQBQm+na+sWeG2a4hwF+fNwML3h9VHpfXs/izhVnl0HFj5cGOvBY0Bo
	/k/xMzKhi2ht+fGwmZjjVYu4k1uYAi5JsKkv6VVPtRMg8TmpwpMhcOkegyhdd/D9zrk378/mORBhc
	VtAelK2TxFkpgdthVXWf7tXM+Fxuwz7XdoVZy0YjHQ5UDiv+1PglrsdRWqOA/LG1CcZWvZ4Bphpx2
	LiohnjKuTCvU8HkZkg7U38i8251mCCn+lg7jwe+dTEpFsZPJGXtmwdWA4QID3InxQsHJM+JnjUd7S
	JZqi3Luw==;
Received: from [50.53.2.24] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tEB8m-00000000bi1-0Rbd;
	Thu, 21 Nov 2024 17:38:52 +0000
Message-ID: <9b7a43f5-5d04-4917-906b-707581b5a39e@infradead.org>
Date: Thu, 21 Nov 2024 09:38:47 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: typedef output question/issue?
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
References: <e9d714fd-d034-4176-a2b7-50a72f80c8ad@infradead.org>
 <877c8w25sn.fsf@intel.com> <874j4025rq.fsf@intel.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <874j4025rq.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 11/21/24 3:19 AM, Jani Nikula wrote:
> On Thu, 21 Nov 2024, Jani Nikula <jani.nikula@linux.intel.com> wrote:
>> On Wed, 20 Nov 2024, Randy Dunlap <rdunlap@infradead.org> wrote:
>>> Hi,
>>>
>>> If I print a typedef in html (make htmldocs) from a .rst file,
>>> I see:
>>>
>>> type dma_cookie_t
>>>     an opaque DMA cookie
>>>
>>> Description
>>>
>>> if dma_cookie_t is >0 it’s a DMA request cookie, <0 it’s an error code
>>>
>>> ~~~~~~~~~~~~~~~~~~~
>>>
>>> If I print the same typedef in man format, it says 'typedef' instead of
>>> 'type', which is what I expect to see.
>>
>> I'm sorry, it's unambigous to me which one you expect.
> 
> *ambiguous, obvs!

Sorry about that. I would like to see 'typedef' instead of 'type'.

Thanks.

> 
>>
>>> man formatted output:
>>>
>>> Kernel API(9)                     API Manual                     Kernel API(9)
>>>
>>> NAME
>>>        typedef dma_cookie_t - an opaque DMA cookie
>>>
>>> Description
>>>        if dma_cookie_t is >0 it's a DMA request cookie, <0 it's an error code
>>>
>>> November 2024                    dma_cookie_t                    Kernel API(9)
>>
>> How do you generate the man pages?

One function or identifier (struct, union, enum, or typedef) at a time.
Just for testing.

$ scripts/kernel-doc -man -function function_or_identifier file | nroff -man | less

e.g.:
$ scripts/kernel-doc  -man -function dma_cookie_t  include/linux/dmaengine.h  | nroff -man  | less

>>
>>> I am using python311-Sphinx 8.0.2-1.2-noarch from openSUSE.
>>>
>>> [internet search ...]
>>>
>>> The $internet says that one option is to install and use:
>>> Add 'sphinx_autodoc_typehints' to the extensions list in your conf.py file.
>>> I tried that but now I get:
>>> Extension error:
>>> Unknown event name: autodoc-process-signature
>>
>> The kernel-doc thing is not hooked up in the Sphinx autodoc processing,
>> which is more geared towards Python. I presume sphinx_autodoc_typehints
>> uses autodoc-process-signature which isn't there because the autodoc
>> Sphinx extension isn't loaded, and even if it were, would not be called
>> on kernel-doc handling.
>>

OK, thanks. I'll just try to ignore it. :(

>>
>> BR,
>> Jani.
>>
>>
>>>
>>> Another option is to try a different theme so I reverted to
>>> sphinx_rtd_theme but that didn't help either.
>>>
>>> Does anyone know a good solution to this?
>>>
>>> thanks.
> 

-- 
~Randy

