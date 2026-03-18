Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2680914AD20
	for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 23:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773875035; cv=none; b=Wn7mbwJMbPQBNGOkae42Ikx26eqeoGUAYfLoh0V3LaVRSfTCmhYYnXy5kcYaW/Wa72ciEsXj+qMvbIXva6KuuCfHCDBVTEDvBSWvGqB3Ryl5TjvYTSwEgUigkKqcH4N2Nf3JRWzVjond4fbHil7JBxCODZrWrnDg1f6sG2DA7h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773875035; c=relaxed/simple;
	bh=OBKmmfFtq4UOvAZNzjw60VTAVd5/374pQtP4p9Nixq8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ui0cDO07/y625kQw7YozR4l5+K1/GknWsmddT2i1SBQpxmkOtzBBytRx1JdhEhjzl+K+SPC85kwQ77a7u5kdXOm7+ohxJ0jTmEOSWryE7TyyARyglbvN3OSejIX5l5EH94ptQZtqKbi2qgeEJn0bxS7L2tnYyCCOk8/NWJFHYrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=wu6OjtiE; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="wu6OjtiE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description;
	bh=44dTjX+ylK0Ox7MGXpuUefEsq2rznGYoSvEZgz7aUds=; b=wu6OjtiEjZBWrVd1Q+1mVMrSBd
	agkgCJsHjnxWIl+ZVvn1fXWSR1RBCdgQu9biHRexa4cMDrAX2pb1ZRnEg/nmpQSBO1xldvPINWALY
	XV0E/xFHTLazFskHJjJuT6SyFz3qiRT/U+PvXUNvTiW9of1qp7v8oX59gKil4j7oo/Bz1VWS2U0w3
	QDQCMaWEk/J1GcLSkEL6vp7RL1PQ3W+MYammdGiJEsWviEHdU5vL2jfF0P9w5w4whcv7soVwQQptO
	38C79qy3nbpU7G6ujVrgLFusmmJGnLpKkRhPBB6iyCwy89x1bJirlTBLWPhrc5hOCBGVJmmjWWuxA
	+jNlOwDw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2zvd-00000009Sco-2LSz;
	Wed, 18 Mar 2026 23:03:53 +0000
Message-ID: <acba75e6-dc97-4654-9185-508e6f87e4db@infradead.org>
Date: Wed, 18 Mar 2026 16:03:53 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: docs build version warnings
To: Jonathan Corbet <corbet@lwn.net>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <c7f45144-7068-414f-86dc-3c9971cf6eec@infradead.org>
 <87bjgk69o6.fsf@trenco.lwn.net>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <87bjgk69o6.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/18/26 3:43 PM, Jonathan Corbet wrote:
> Randy Dunlap <rdunlap@infradead.org> writes:
> 
>> Hi,
>>
>> As of linux-next-20260318, I am getting these version warnings:
>>
>> /usr/lib/python3.13/site-packages/requests/__init__.py:113: RequestsDependencyWarning: urllib3 (2.6.3) or chardet (6.0.0dev0)/charset_normalizer (3.4.4) doesn't match a supported version!
>>   warnings.warn(
>>
>>
>> I have (from OpenSUSE Tumbleweed, rolling updates, updated earlier today):
>>
>> urllib3			2.6.3-1.2
>> chardet			6.0.0-1.1
>> charset_normailzer	3.4.4-1.2
>>
>> Is this related to docs or just a not-so-good software update?
> 
> It won't be anything we did.  I hope you haven't been hit by the
> weirdness around chardet...

oh, beautiful. Thanks for the hint.

-- 
~Randy

