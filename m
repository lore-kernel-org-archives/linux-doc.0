Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099F5399
	for <linux-doc@vger.kernel.org>; Sun, 24 Mar 2024 00:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711240489; cv=none; b=LqgyMgXM4+K7nm1ZCEkjJ3AfoHydl1XeNbXdubxU7cYpweoKvX+/4MgqfPL5dX3NYqcRnF+uMHPgDby+I2iG0OE5ph7JB1u4NWMEXjB2q6xeoELwTkCIYwfPk90jc2fafCOpXGy7uO/Kvl/AcE7KvccAHQV+YQYEq3BqnBY0ypE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711240489; c=relaxed/simple;
	bh=btrYz8Wb645K5J5p6UAsm9DaLcXfeRxWzN199AXJPw0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tUJ7UNVHS+uJMqCfreeDnoNaKpCEETxMKEnt/wHqftjg/lhaBdJPHEv3UHrJv5WL90ZeULcJyW0rFn79pccYat8E1QMtlRcw/JgW35Oxrwsv6KtEkkjAr1JPBlL29uqc+dVhs51hyRdgJ+Wnu1iB9BEWO2o17RIHEWzOxNNCsc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=vAidbKLh; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="vAidbKLh"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=8Tmc8pzJ+Rf3vdw5rjf5lXxUEO83Tr3Fv58n04W5S38=; b=vAidbKLh86IsQKi2L6MtGutywn
	B8CE7dvepRR36bQclA6SSsIE9WnAbHVwfVfpgOVUTPWiwYDfOn67y+fr9BqBJmAKR3fhuTjPawPRZ
	gXmeEZmQFih4ESyU9gPp4gZWoTks0mYhxhtdhDoyOMQAg7ePXhMBrTQnaHTJN6E/HuKUJprcDR2HD
	V+DPQJWwj8eQWVaa62/ur/a7uq9O1MNK47nuLwm2xTqV2azCQgwCNxSF53K0yfD6PpGQsWt3OcD8a
	ZwNnAAP5uVBspdXwHT9ePAzBogsSgOGZKDDCuZ7t5ZkSALZmosCbYpkyngZX5uhc8DNJLl/xduD9t
	MG74J0cw==;
Received: from [50.53.2.121] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roBoz-0000000BTXK-021Z;
	Sun, 24 Mar 2024 00:34:45 +0000
Message-ID: <d91ec85c-6a44-4b4a-bfe4-b8ad8fa95c01@infradead.org>
Date: Sat, 23 Mar 2024 17:34:44 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: Detect variable fonts and suggest removing them
Content-Language: en-US
To: Akira Yokosawa <akiyks@gmail.com>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, =?UTF-8?B?0JjQstCw0L0g0JjQstCw0L3QvtCy0Lg=?=
 =?UTF-8?B?0Yc=?= <relect@bk.ru>
References: <20240323120204.155678-1-akiyks@gmail.com>
 <b6235333-5142-468f-9f59-4454ca8531e7@infradead.org>
 <8361afd6-ac80-4d56-9620-961a7a16cfa7@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <8361afd6-ac80-4d56-9620-961a7a16cfa7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


>>> ---
>>> Cc: linux-doc@vger.kernel.org
>>> ---
>>>  Documentation/Makefile          |  2 +-
>>>  MAINTAINERS                     |  1 +
>>>  scripts/check-variable-fonts.sh | 30 ++++++++++++++++++++++++++++++
>>>  3 files changed, 32 insertions(+), 1 deletion(-)
>>>  create mode 100755 scripts/check-variable-fonts.sh
>>>
>>
>> I don't have much to say about the patch except that it seems like a good idea...
>>
>> However, some of the terminology could be improved IMO.
>> E.g., "variable type" or "variable font" should be something like
>> variable-width font or proportionally-spaced font.
> 
> Good point.
> 
> I need to be more careful in using terms rarely found in kernel development.
> 
> In this case, "variable font" means "font file which employs the OpenType
> font variations technology".
> 
> There is a Wikipedia page at: https://en.wikipedia.org/wiki/Variable_font
> 

Ah, I see. Thank you.

>>
>> "static ones" should be something like fixed-space fonts or monospaced fonts.
>>
>> Unless I just completely don't understand the uses of "variable" and "static" here.
> 
> "static" here means "non-variable".
> 
> I'll expand the changelog a bit in v2 with your comments in mind.
> 
>         Thanks, Akira

-- 
#Randy
