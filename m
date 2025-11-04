Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F41B267B90
	for <linux-doc@vger.kernel.org>; Tue,  4 Nov 2025 18:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762281918; cv=none; b=RgqEpRmy3F/WnDSmOb6XbdtDXZ8iFla+pBUEyZgB6D1jBgTIlkt2D49XqTkHnMJvJlMrOQoEHYJYHzRODLTzh6rPtNVv4nUdr5vOT90mxymeiS/7T2rPt4U7DD+SwkacAIY4HHhUfqAoJl1azlWsEJ76tWqqQncsVcz/Ddoavs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762281918; c=relaxed/simple;
	bh=7M7xNOlnC8jJWCxShzpADHKKEaml1o1kO9rdrU8GoIE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=slhICqjzgdI4WLj1i8cPw6BDEnKrC7l+wGH7CovvMK4UY//bdac1PgFDGJ5xwRovDMl8RZ+23MA8GgQ5wsDwnwGV+zInE6o4LoKCz/CG6C/LK10GrpJwhwgkGnST+mRMHv5I7/VWWIL6Gc0V030oUSpcW96nT5ObWYhAe/nQc6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=jRA4aERR; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="jRA4aERR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=c/EAd0JHcXRfP/phy8Qqr0XXqOgVxBT1BK1xYOQXyk8=; b=jRA4aERR53RAZzp2OGYj0XGi32
	PqIzgbmqcApku/VEFZOxAMjhcaZYh6GaBWft3g2CCN9BTTYz/R2NzoBLq0iQ8KQQWlHq7zOUQBRS/
	+CDROk2KnVuvjPoIe17yxA6KJeT5e3/BofaST9xipcSSYdeZimfGl14gLtw4VvXdsLhDL+9MqfrEH
	lIAQdUfh+sOGL8FufVv13ZUPHy4PI3xx+bX73gZf/xdDMWPPLJoSZxmjbFNJmEQz5tLloI3gw0SS4
	AgObMvf2WwaPKVVeL2b3tQFurYfxdhAVOszz54HHPPUpmmh5AFAXB8Jvhnzc2ze6Roz+chmsWFkTH
	48BU8/aQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGM1r-0000000CRJV-3E5s;
	Tue, 04 Nov 2025 18:45:15 +0000
Message-ID: <69f62fe0-072f-41c4-824b-c7a5ef591e40@infradead.org>
Date: Tue, 4 Nov 2025 10:45:15 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: W1 bad URL
To: Eugene Pol <zbr@ioremap.net>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>
References: <5eb4fa80-7591-422a-9e23-c6661318b705@infradead.org>
 <f1914b48-eb9d-400d-aaa1-1346fdaed54e@infradead.org>
 <I1L_HoQJ5jb8-Y4wUqxp8oWCaqPl2e2bQPG1og65C9eZqD8yl5dfKsA7xm703xM7SrjTvgt0JTVnKxG-qGNKvHnqFgAtXlcH450k9Jl80DQ=@ioremap.net>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <I1L_HoQJ5jb8-Y4wUqxp8oWCaqPl2e2bQPG1og65C9eZqD8yl5dfKsA7xm703xM7SrjTvgt0JTVnKxG-qGNKvHnqFgAtXlcH450k9Jl80DQ=@ioremap.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/4/25 6:02 AM, Eugene Pol wrote:
> Hi Randy
> 
> Thanks for CCing me
> ioremap.net URL is no longer valid, the code was moved to https://github.com/bioothod/w1
> 

Thanks. I'll update the kernel documentation with that URL.

> 
> 
> On Tuesday, November 4th, 2025 at 3:33 AM, Randy Dunlap <rdunlap@infradead.org> wrote:
> 
>>
>>
>> [adding Evgeniy Polyakov zbr@ioremap.net if that works]
>>
>>
>>
>> On 11/3/25 6:45 PM, Randy Dunlap wrote:
>>
>>> Hi Krzysztof,
>>>
>>> This URL in w1/w1-netlink.rst seems to have disappeared:
>>>
>>> 2. http://www.ioremap.net/archive/w1
>>>
>>> This archive includes userspace application w1d.c which uses
>>> read/write/search commands for all master/slave devices found on the bus.
>>>
>>> Are there any other sources of this application for the documentation?
>>>
>>> Thanks.
>>
>>
>> --
>> ~Randy

-- 
~Randy

