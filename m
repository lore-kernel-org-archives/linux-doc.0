Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA2CEAC7;
	Sat, 11 Apr 2026 19:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775937137; cv=none; b=BKkYW5G9fx7kHDs/Kero2DYoD+b0SgpEIZ6vpG/nPmlAN6EKOUEIl0yAhuBihS9jgHJgeiJnceTETgBotOO25ylGzw93KDOrTbhgmGvaHltqxAtOsyqXQnsZfux5hgRqxLhHvBDvghAgTMXmHsmg3d7a82h4WCdfmRxXUg31oJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775937137; c=relaxed/simple;
	bh=kkGV3TCtg6y3yuvJfqrCz/3aQhkXtMetGHryb/KPTs0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EEPE+bhQ8+b4oexsjSI1iXuubByUhir96+wadxgXRVhxeAPoAtCg02DUFJZyQlw2FVASVUoifXt4Mpu4elYfjeGRqU27CXqe/Hqh761RwVzO2O2/DFcf1bLpPAITUv1534o2XCoNl4Q68V24Tg2arRYxoipLIwYbh7LRrlIPwGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=iC8lyb4V; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="iC8lyb4V"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=5KUE4HFTALwIzkA1tvOxTXRH7lfqaI3aF/vhsKrVhKU=; b=iC8lyb4VRzFrl77LSq/HCL/lNv
	67wf6aiB8wJxhh7ALh7QDdt9H/NXZemz7EmtzxLpwX/63wOCcpC/Dp/z/4smfpbhsjYcISdBTAhkE
	eZEi0zPQfBzMN4j2n9U0aLReHLHFQqfqy7qrKhzh1lmfErMVIbqsxFqhqGPRYAHsCsjCgkw8ZTdn2
	TNnwtZzBvLyoWR/DwlOxsUAQSFAWcFSyPFOoxfCe3q4A95N+rjIvlyr+CcHfp32tcJGrj5XvnTNCd
	qsoytelOh6c7Ykbz4u5fXXFTKU8Cq1f+DXkVCMXsUhtTJ3SzCss+P/vslS8tP8u3EqdADeiTtWhkU
	zEyQh+kQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBeNH-0000000DkyC-3awe;
	Sat, 11 Apr 2026 19:52:11 +0000
Message-ID: <c76374e7-3e61-4a97-bdd0-1b566632368c@infradead.org>
Date: Sat, 11 Apr 2026 12:52:11 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] docs: advanced search with benchmark harness
To: Rito Rhymes <rito@ritovision.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260321181511.11706-1-rito@ritovision.com>
 <DHK7FY79AOJW.AC6LHU703AIR@ritovision.com>
 <b3c87ef0-5faf-4bda-90e4-e6b24419e0c0@infradead.org>
 <DHOI5DYYBXEN.3MWP1RMB6ECES@ritovision.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <DHOI5DYYBXEN.3MWP1RMB6ECES@ritovision.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/9/26 2:04 AM, Rito Rhymes wrote:
>> I like it. I think it's useful -- the old search could give a bit too
>> much output. The search result tabs (groups) are helpful.
> 
> Thanks for taking the time to test it out again and give feedback.
> I'm glad you see potential utility for it.
> 
>> I mostly use 'grep' for searching Documentation/ and I expect lots
>> of other developers also do that (if they bother to look).
> 
> That's definitely what I expect kernel hackers to default to.
> 
> I'd like to get a clearer sense of your perspective, it may represent
> others too, and I can weigh it against my own assumptions here.
> 
> So my question framed for you is:
> 
> You know a particular concept you want to look up, but you do not know
> the exact file, and related words repeat a lot across the source.
> 
> Could you imagine yourself going through grep results, not quickly
> finding what you need, burning mental bandwidth and then deciding:
> "let me just go on docs.kernel.org real quick, hit the advanced search,
> and see what I find"?
> 
> Is that something you could actually see ever happening?

It would take a while for me to give up on grep, but eventually
I could see using Advanced Search - but not quickly.

> Maybe even, in that type of situation, eventually defaulting to that
> mode first to avoid spending time scanning through noisy grep results.

That would only come after several cases where Adv. Search proved to
be more useful than grep.

> Or is grep and staying in the terminal a comfortable enough place to
> remain even when the results are not very fruitful and the time spent
> there is not especially efficient?

Nice characterization :)
But yes, grep + terminal will remain the default for now.

> Or does that situation just not come up often enough to justify a
> separate mental workflow for it outside the grep norm?

For me it probably does not.

>> I do notice under the Pages tab that all of the pages listed say
>> "Summary unavailable." I don't know what should be there instead of
>> that message.
> 
> It's supposed to be populated with an excerpt from the page related
> to the search criterion; 2-3 lines of text or so.
> 
> I encountered that same issue after an incremental rebuild, doing a
> full rebuild fixed it.
> 
> Could you please confirm if it works after a full rebuild?

Same result for me - Summary unavailable.

-- 
~Randy

