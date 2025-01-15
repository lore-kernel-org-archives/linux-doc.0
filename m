Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA92144304;
	Wed, 15 Jan 2025 15:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736955900; cv=none; b=pheU5d6KUZmns/du0Gv2hsBCHrp3hxa9f0DgXAYXt7NU9VW84TYbuF+qG8QM7+jL2u8t91i+EirlqMsXFQpMNniVcCTgm5tHF1O/MXzWqC2pUYo1v4UuMLNE0JZWo831i+amVuG3qJQqZI1U5goHmpw3zoWWOkIV6AR5J8Nq2Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736955900; c=relaxed/simple;
	bh=zD71LAco+/Z47Vb/WSoHPQT02H9pWNHVJnv6vGbBwbk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W3zNPEbLWKu6d3bJqtCqknxpMxrHi7tPjua7iA01tZjvAwlIZdaIV+rDjiLnFu25sKq3u8uQ/F6mL1k2h6bg9ir9cr70bhhnlSQM63NfTHYlr2G7OqHscYH08TRpwQpDzJfpKr+MmMJQ6fCbx1eCLuxWg4jZVRp3jGTdrzAzl5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=U4mRCYXb; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="U4mRCYXb"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=v5OPE20xr2cNNtzLjj8vkzfiwNxZw2sNM/0QzBvbQmg=; b=U4mRCYXbVdH68cShbgJMgkk3vL
	64eg0Xug1wvq96raTekJDchxQtgcxSYDp3dwOfys5vGktP1mBZtUM6PkEY/v+usKkqGAq0c9aGPU7
	k69xlCMcQDAcRZ+FWQAxhqPnyqEn5VF7+zTl0uFBwlNzGfNwH/9K2FwgPdSR+2lVJslHeKfZG5K64
	MJDeXJvHA6AF83sjo3tQFyBcbOsOwz3yIgVGpW11EuHx/fTQ1QFZDgJU6jA27ISvxR2ts0RnURl3h
	NS6DJwkJe4+CM8FkH9hyIhYl6Frjq/XBLcHV9PtiwHEwQvRlleXSbetlr5y6y7Dg8Y4xHKCLsnQQz
	yp0tkXQQ==;
Received: from [50.53.2.24] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tY5Zb-0000000AtGu-2BZb;
	Wed, 15 Jan 2025 15:44:52 +0000
Message-ID: <fd5018d6-4f38-42c8-95ac-ee9945489c56@infradead.org>
Date: Wed, 15 Jan 2025 07:44:46 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/mm: Physical memory: Remove zone_t
To: I Hsin Cheng <richard120310@gmail.com>, corbet@lwn.net
Cc: akpm@linux-foundation.org, jserv@ccns.ncku.edu.tw,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250115070355.41769-1-richard120310@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250115070355.41769-1-richard120310@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 1/14/25 11:03 PM, I Hsin Cheng wrote:
> "zone_t" doesn't exist in current code base anymore, remove the
> description of it.
> 
> Signed-off-by: I Hsin Cheng <richard120310@gmail.com>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  Documentation/mm/physical_memory.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/mm/physical_memory.rst b/Documentation/mm/physical_memory.rst
> index 531e73b00..71fd4a6ac 100644
> --- a/Documentation/mm/physical_memory.rst
> +++ b/Documentation/mm/physical_memory.rst
> @@ -33,7 +33,7 @@ The entire physical address space is partitioned into one or more blocks
>  called zones which represent ranges within memory. These ranges are usually
>  determined by architectural constraints for accessing the physical memory.
>  The memory range within a node that corresponds to a particular zone is
> -described by a ``struct zone``, typedeffed to ``zone_t``. Each zone has
> +described by a ``struct zone``. Each zone has
>  one of the types described below.
>  
>  * ``ZONE_DMA`` and ``ZONE_DMA32`` historically represented memory suitable for

-- 
~Randy
