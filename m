Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BAF18C31;
	Sun, 19 Jan 2025 18:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737309812; cv=none; b=hNqmq9CsGQNM+mbncPxth1Ei8teAhIqTysQ3edgwPhHAv/ddnU2GDlHPcNHv7QTPjU1cyWUhs8xQ2Ck8LzPSV6ato97VV3zkY32exgTRN2PCqb2XDRJVC8gE4nE/ILLIR4jKZ155oTN8C3+D4aYDGJb6S9PiGpm7gQFuAvpIplI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737309812; c=relaxed/simple;
	bh=UdZB8usjolNBm6Itcfw3wDOuddAuD86PL6jZuLSyXoM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HX8D1eiXnVhHFt6dpZzh5uQWEQurtq5X2jYOGrqmCvZomXMlwvuOf8FWhLt6Mt1QGAx3jwuEPLvXf+eI+InCagA475qKzEyYDqqUmRI0j0Jpb98xKniI0Kn035CW0X3lbPDyftr9NS+5ctaiAWLY0SPidVdyz1EERJHmHidGbYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=dexL6+Y3; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="dexL6+Y3"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 9D97440403
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1737309803; bh=rVIUzW1WSj4xcEHdyt5swGhYoFavsFhRy8lWu9FZmxQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=dexL6+Y3rxjMMFxY9htz9QcmmON6a+ZdQaG12jqBNTI5LrCuGa2ieJCkRzeLIXS7L
	 FdRI0FJiTgHG4L9COZjMOPgQFgAX5C1x+d0ycsUMFd2w4wg/TEF6txliiecgiQKTiq
	 2El9OTHMSjCRQtg/ZS3e4yW4eL6qkuAnEfP9AWhkrrEuRJ7aMqdbbCPL4w0qjjaK++
	 xYMS7MAl0COhESgBvaBYZUUziYFYnTpo+HUf09kGL/NvPl+Mv/5+mNYcEaRKmylDyn
	 hFQ5tGZVoffzOewYAQ8AwRUFLjmyX6/wT5MV2hHoPp6dsgs4vHuAn/P9sgSgryxmOd
	 13EucmpukqUow==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 9D97440403;
	Sun, 19 Jan 2025 18:03:23 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>, carlos.bilbao@kernel.org
Cc: avadhut.naik@amd.com, akpm@linux-foundation.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mailmap, docs: Update email to carlos.bilbao@kernel.org
In-Reply-To: <6c8457ca-c43c-4d93-8493-bf4e5b22f3df@gmail.com>
References: <20250111161110.862131-1-carlos.bilbao@kernel.org>
 <87ikqiboqp.fsf@trenco.lwn.net>
 <6c8457ca-c43c-4d93-8493-bf4e5b22f3df@gmail.com>
Date: Sun, 19 Jan 2025 11:03:22 -0700
Message-ID: <87jzaqvfyt.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Carlos Bilbao <carlos.bilbao.osdev@gmail.com> writes:

> Hello,
>
> On 1/13/25 11:35, Jonathan Corbet wrote:
>> carlos.bilbao@kernel.org writes:
>>
>>> From: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
>>>
>>> Update .mailmap to reflect my new (and final) primary email address,
>>> carlos.bilbao@kernel.org. This ensures consistent attribution in Git
>>> history. Also update my contact information in file
>>> Documentation/translations/sp_SP/index.rst to help contributors reach out
>>> for Spanish translations.
>>>
>>> Signed-off-by: Carlos Bilbao <carlos.bilbao@kernel.org>
>>> ---
>>>  .mailmap                                   | 3 +++
>>>  Documentation/translations/sp_SP/index.rst | 2 +-
>>>  2 files changed, 4 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/.mailmap b/.mailmap
>>> index 5ff0e5d681e7..83837191affb 100644
>>> --- a/.mailmap
>>> +++ b/.mailmap
>>> @@ -140,6 +140,9 @@ Cai Huoqing <cai.huoqing@linux.dev> <caihuoqing@baidu.com>
>>>  Can Guo <quic_cang@quicinc.com> <cang@codeaurora.org>
>>>  Carl Huang <quic_cjhuang@quicinc.com> <cjhuang@codeaurora.org>
>>>  Carlos Bilbao <carlos.bilbao.osdev@gmail.com> <carlos.bilbao@amd.com>
>> Is there a reason you didn't just delete the above line?
>
>
> My understanding was that .mailmap should keep older mappings for proper
> record keeping, but it may have had the same effect, yes.

I'm confused, which records are we keeping here?  It doesn't seem that
mapping the same old address to multiple new ones will lead to anything
good...?

jon
