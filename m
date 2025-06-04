Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8352F79D0
	for <linux-doc@vger.kernel.org>; Wed,  4 Jun 2025 20:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749070659; cv=none; b=aFYvCnw/nVzkKNSVn4d4RMBLbDNx1sNkjDknNNFz/FqcQMHLqN/AkhSZoT0i42zRxc2yKFrpdoYikRiTFzMQkvSNaRn79gSa3jpnSFuD7klnFPfnQEuLduiCfFzPjvObtO8PRjPjb/JyYIt9IEJKDE2Fj2dmjI+u+FKK5zvRehE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749070659; c=relaxed/simple;
	bh=1vST3d9J+9mW/eRenww622kSYS5wCzxY9RtthIWdeFs=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Kk1cO8zLLwqB03YeOyk3Szq7lqqLuPN8xUOzTeiDo10/mBCgaquQPI2atg+wGLkYah2NQqoyeYp8VNMd1pig0Kjh7sHbv90f3MzKLwE1w8pmij8f6WD5zJUyXQVic41C/1rVp9cSWoa64bWKUxijdaVWX3H/YhdAy36AJh2g8y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=i9gch/fW; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="i9gch/fW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ljwtLIuX0wIzcnsY7b7SPx0ajLhrnZjvPBoaqfAfTes=; b=i9gch/fW460X9ituX4jZFgbc/h
	wxctmLuuo8WxbWTPTS0EH4eT5H8dW39l4gCvX6eNnVqyniGqBnLsEfOFTD9/eGT/GaYKUk8pnbxbT
	McTsYaZDJ7xfvAHQUKniE2AArIyXlq53nys0eqa4rs2xfyhsXOGVWoc5U+GUA5t37dJ+NGVuhjX/f
	rFf2A1/x1dz/vjwEZrhexnc9ybKuXGYiHcHJs9FzlsueW3eJFJZqC/+qZRjhv/iBiCYZ9lbno9zId
	bcLoP7965Gf5GNsQSCFr7Ic9zb/f+jfHq7p40VKR1Ih76H6WNCdecjU63Z9fDV6xV8wb6yzFpeNKk
	W4/zr/Hw==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMvB0-000000010KF-0bgu;
	Wed, 04 Jun 2025 20:57:35 +0000
Message-ID: <3bc4e779-7a79-42c1-8867-024f643a22fc@infradead.org>
Date: Wed, 4 Jun 2025 13:57:31 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] doc: Include scatterlist APIs in htmldocs
From: Randy Dunlap <rdunlap@infradead.org>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, James.Bottomley@HansenPartnership.com
References: <20250604195753.823742-1-willy@infradead.org>
 <1449b983-fd49-4e88-9c4d-7b5b2205a16d@infradead.org>
Content-Language: en-US
In-Reply-To: <1449b983-fd49-4e88-9c4d-7b5b2205a16d@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

I missed one:

On 6/4/25 1:47 PM, Randy Dunlap wrote:
> 
> 
> On 6/4/25 12:57 PM, Matthew Wilcox (Oracle) wrote:
>> We have all this fine kernel-doc written, and it's not published
>> anywhere.  Expose it to public view.
> 
> Good idea.
> 
>>
>> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
>> ---
>>  Documentation/core-api/dma-api.rst | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/Documentation/core-api/dma-api.rst b/Documentation/core-api/dma-api.rst
>> index 2ad08517e626..190ed8fe55ba 100644
>> --- a/Documentation/core-api/dma-api.rst
>> +++ b/Documentation/core-api/dma-api.rst
>> @@ -915,3 +915,9 @@ the driver. When driver does unmap, debug_dma_unmap() checks the flag and if
>>  this flag is still set, prints warning message that includes call trace that
>>  leads up to the unmap. This interface can be called from dma_mapping_error()
>>  routines to enable DMA mapping error check debugging.
>> +
>> +Functions and structures
>> +========================
>> +
>> +.. kernel-doc:: include/linux/scatterlist.h
>> +.. kernel-doc:: lib/scatterlist.c
> 
> <linux/scatterlist.h> contains this line (#102):
> 
>  *   Usually the next entry will be @sg@ + 1, but if this sg element is part
> 
> Those @ signs make that line not render correctly:
> 
>   Usually the next entry will be sg**** + 1, but if this sg element is part of a
>   chained scatterlist, it could jump to the start of a new scatterlist array.
> 
> 
> Similarly for the sg_chain() function:
> 
>  *   Links @prv@ and @sgl@ together, to form a longer scatterlist.
> 
> and sg_last() in lib/scatterlist.c: (3 instances)
> 
>  *   Note that the @sgl@ pointer passed in need not be the first one,
>  *   the important bit is that @nents@ denotes the number of entries that
>  *   exist from @sgl@.
> 

In lib/scatterlist.c, function sg_alloc_table():

 *    Allocate and initialize an sg table. If @nents@ is larger than


> 
> Do you want to send a patch for these?  or I could do it...
> 

-- 
~Randy

