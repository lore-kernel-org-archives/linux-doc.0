Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8E6192B90;
	Sat, 21 Mar 2026 19:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774120677; cv=none; b=Xs/bGd1HQZNiCtm3hs3fMLikS0CXLzNBkF21MHEWDU//OrA8m6zZkfvfgtLfdGYa+640+ceB3fGdr1xjunzQIdSOAU5e6dFit5mzX/hXbErCwEXiSuyy5YCEwxOLVgJRW260Fv3TVCCDvCqZ8Jy7GJ29GePG4+ECUZubNPfn2Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774120677; c=relaxed/simple;
	bh=+li0E4b/1na3oQmvEiHVJb5FVSo9ROmx6Bi/3fu0r+s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a9Vji6hnSOqbdIqtXSi/oaJONTEvh59Cve2IZvhv3Vgf0HAIOC+zkBwhY6023Y6tiCO/Op04P/NQjpxaaSJHS1ugFDSWNJIJlXwTU1lWJGATOipEUZlFILpcKQl0kDg4HQKqijnMrs8it0qlTBx5GS0YDZgJO4ACywb5R/pVxLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=dBtYrV7M; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="dBtYrV7M"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=TQAG6FBmUHODvPPC7X+nTbQ8ibEbqxJtsVDahrkQqwE=; b=dBtYrV7MIcMOEkYYpnz/mlkIWl
	webjpqnTThBSpVGxCoX0KVk13QmFWJ41dapEcwHOilg/fsTdrcn8+je6j7Tmt+K9kbd0KdCyV8+oe
	U8SNR6x6QJAsKtfhK8i4ywAy/reNHynBQiiFiG926KqaucxKipxB5QCQESo2myEUt13gIsAAyo2VS
	CdgV7076bfaVFtZ5ZKExoV6qyH7BrzMdkcUQPxA7GY5RG3oHK4KgySw/9aFJypKB7y6FywgfQCQQx
	uf8kgg7V+MPVPbJYJzi/303CBY9DUFzl8exMqpCfdCDyyt7jEhnnTniAi5RBAYSIMRWgrwjtT7zPo
	8BNO9iVA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w41pS-0000000EjzH-1kvj;
	Sat, 21 Mar 2026 19:17:46 +0000
Message-ID: <2d4ab39f-53a1-4bbc-888a-53c9f72670c5@infradead.org>
Date: Sat, 21 Mar 2026 12:17:45 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] docs: wrap generated tables to contain small-screen
 overflow
To: Rito Rhymes <rito@ritovision.com>, Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org
References: <20260321133811.17854-1-rito@ritovision.com>
 <20260321133811.17854-2-rito@ritovision.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260321133811.17854-2-rito@ritovision.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/21/26 6:38 AM, Rito Rhymes wrote:
> Some documentation tables exceed the fixed-width main content column.
> On desktop this is usually acceptable because they can overflow the
> 800px body without harming readability, but on smaller screens the
> same tables create page-wide horizontal scroll overflow that breaks the
> layout.
> 
> Wrap generated HTML tables in a dedicated container. Above
> Alabaster's existing 65em breakpoint, the wrapper uses
> `display: contents` to preserve current desktop rendering. At and
> below that width, it becomes a horizontal scroll container so table
> overflow is contained locally instead of breaking page layout.

Yes, I can (did) observe that happening (horizontal slider bar).
Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> Signed-off-by: Rito Rhymes <rito@ritovision.com>
> ---
>  Documentation/conf.py                  |  1 +
>  Documentation/sphinx-static/custom.css | 16 ++++++++++++++
>  Documentation/sphinx/table_wrapper.py  | 30 ++++++++++++++++++++++++++
>  3 files changed, 47 insertions(+)
>  create mode 100644 Documentation/sphinx/table_wrapper.py

-- 
~Randy
